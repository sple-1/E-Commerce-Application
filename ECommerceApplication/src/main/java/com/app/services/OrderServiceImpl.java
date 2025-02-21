package com.app.services;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.app.config.AppConstants;
import com.app.entites.Cart;
import com.app.entites.CartItem;
import com.app.entites.Coupon;
import com.app.entites.Order;
import com.app.entites.OrderItem;
import com.app.entites.Payment;
import com.app.entites.Product;
import com.app.enums.DiscountType;
import com.app.exceptions.APIException;
import com.app.exceptions.ResourceNotFoundException;
import com.app.payloads.CouponDTO;
import com.app.payloads.GiftCardDTO;
import com.app.payloads.GiftCardOrderRequestDTO;
import com.app.payloads.OrderDTO;
import com.app.payloads.OrderItemDTO;
import com.app.payloads.OrderResponse;
import com.app.repositories.CartItemRepo;
import com.app.repositories.CartRepo;
import com.app.repositories.CouponRepo;
import com.app.repositories.OrderItemRepo;
import com.app.repositories.OrderRepo;
import com.app.repositories.PaymentRepo;
import com.app.repositories.UserRepo;

import jakarta.transaction.Transactional;

@Transactional
@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	public UserRepo userRepo;

	@Autowired
	public CartRepo cartRepo;

	@Autowired
	public OrderRepo orderRepo;

	@Autowired
	private PaymentRepo paymentRepo;

	@Autowired
	public OrderItemRepo orderItemRepo;

	@Autowired
	public CartItemRepo cartItemRepo;

	@Autowired
	public CouponRepo couponRepo;

	@Autowired
	public UserService userService;

	@Autowired
	public CartService cartService;

	@Autowired
	public CouponService couponService;

	@Autowired
	public GiftCardService giftCardService;

	@Autowired
	public ModelMapper modelMapper;

	@Override
	public OrderDTO placeOrder(String email, Long cartId, String paymentMethod, String couponCode) {
		Cart cart = cartRepo.findCartByEmailAndCartId(email, cartId);

		if (cart == null) {
			throw new ResourceNotFoundException("Cart", "cartId", cartId);
		}

		Payment payment = paymentRepo.findByPaymentMethod(paymentMethod)
				.orElseGet(() -> {
					Payment newPayment = new Payment();
					newPayment.setPaymentMethod(paymentMethod);
					return paymentRepo.save(newPayment);
				});

		return processOrder(email, cart, payment, couponCode);
	}

	@Override
	public OrderDTO placeOrderWithGiftCards(String email, Long cartId, GiftCardOrderRequestDTO giftCardOrderRequestDTO) {
		// Rule: can't be combined with other payment methods

		Cart cart = cartRepo.findCartByEmailAndCartId(email, cartId);

		if (cart == null) {
			throw new ResourceNotFoundException("Cart", "cartId", cartId);
		}

		processGiftCardOrderRequest(cart.getTotalPrice(), giftCardOrderRequestDTO);

		return processOrder(email, cart, paymentRepo.findById(AppConstants.GIFT_CARD_PAYMENT_ID).orElse(null), null);
	}

	@Override
	public List<OrderDTO> getOrdersByUser(String email) {
		List<Order> orders = orderRepo.findAllByEmail(email);

		List<OrderDTO> orderDTOs = orders.stream().map(order -> modelMapper.map(order, OrderDTO.class))
				.collect(Collectors.toList());

		if (orderDTOs.size() == 0) {
			throw new APIException("No orders placed yet by the user with email: " + email);
		}

		return orderDTOs;
	}

	@Override
	public OrderDTO getOrder(String email, Long orderId) {

		Order order = orderRepo.findOrderByEmailAndOrderId(email, orderId);

		if (order == null) {
			throw new ResourceNotFoundException("Order", "orderId", orderId);
		}

		return modelMapper.map(order, OrderDTO.class);
	}

	@Override
	public OrderResponse getAllOrders(Integer pageNumber, Integer pageSize, String sortBy, String sortOrder) {

		Sort sortByAndOrder = sortOrder.equalsIgnoreCase("asc") ? Sort.by(sortBy).ascending()
				: Sort.by(sortBy).descending();

		Pageable pageDetails = PageRequest.of(pageNumber, pageSize, sortByAndOrder);

		Page<Order> pageOrders = orderRepo.findAll(pageDetails);

		List<Order> orders = pageOrders.getContent();

		List<OrderDTO> orderDTOs = orders.stream().map(order -> modelMapper.map(order, OrderDTO.class))
				.collect(Collectors.toList());
		
		if (orderDTOs.size() == 0) {
			throw new APIException("No orders placed yet by the users");
		}

		OrderResponse orderResponse = new OrderResponse();
		
		orderResponse.setContent(orderDTOs);
		orderResponse.setPageNumber(pageOrders.getNumber());
		orderResponse.setPageSize(pageOrders.getSize());
		orderResponse.setTotalElements(pageOrders.getTotalElements());
		orderResponse.setTotalPages(pageOrders.getTotalPages());
		orderResponse.setLastPage(pageOrders.isLast());
		
		return orderResponse;
	}

	@Override
	public OrderDTO updateOrder(String email, Long orderId, String orderStatus) {

		Order order = orderRepo.findOrderByEmailAndOrderId(email, orderId);

		if (order == null) {
			throw new ResourceNotFoundException("Order", "orderId", orderId);
		}

		order.setOrderStatus(orderStatus);

		return modelMapper.map(order, OrderDTO.class);
	}

	private OrderDTO processOrder(String email, Cart cart, Payment payment, String couponCode) {
		Long cartId = cart.getCartId();

		Order order = new Order();
		order.setEmail(email);
		order.setOrderDate(LocalDate.now());
		order.setTotalAmount(cart.getTotalPrice());

		if (couponCode != null && !couponCode.isEmpty()) {
			Coupon coupon = couponRepo.findByCode(couponCode);
			if (coupon == null) {
				throw new ResourceNotFoundException("Coupon", "code", couponCode);
			}
			CouponDTO couponDTO = couponService.redeemCoupon(coupon);
			order.setCoupon(coupon);

			double discount = 0.0;
			if (coupon.getDiscountType() == DiscountType.FLAT) {
				discount = coupon.getDiscountAmount();
			} else if (coupon.getDiscountType() == DiscountType.PERCENTAGE) {
				discount = (coupon.getDiscountAmount() / 100) * cart.getTotalPrice();
			}

			double finalAmount = Math.max(cart.getTotalPrice() - discount, 0); // Min 0
			order.setFinalAmount(finalAmount);
		} else {
			order.setFinalAmount(cart.getTotalPrice());
		}
	
		order.setOrderStatus("Order Accepted !");

		order.setPayment(payment);

		Order savedOrder = orderRepo.save(order);

		List<CartItem> cartItems = cart.getCartItems();

		if (cartItems.size() == 0) {
			throw new APIException("Cart is empty");
		}

		List<OrderItem> orderItems = new ArrayList<>();

		for (CartItem cartItem : cartItems) {
			OrderItem orderItem = new OrderItem();

			orderItem.setProduct(cartItem.getProduct());
			orderItem.setQuantity(cartItem.getQuantity());
			orderItem.setDiscount(cartItem.getDiscount());
			orderItem.setOrderedProductPrice(cartItem.getProductPrice());
			orderItem.setOrder(savedOrder);

			orderItems.add(orderItem);
		}

		orderItems = orderItemRepo.saveAll(orderItems);

		cart.getCartItems().forEach(item -> {
			int quantity = item.getQuantity();

			Product product = item.getProduct();

			cartService.deleteProductFromCart(cartId, item.getProduct().getProductId());

			product.setQuantity(product.getQuantity() - quantity);
		});

		OrderDTO orderDTO = modelMapper.map(savedOrder, OrderDTO.class);
		
		orderItems.forEach(item -> orderDTO.getOrderItems().add(modelMapper.map(item, OrderItemDTO.class)));

		return orderDTO;
	}

	private void processGiftCardOrderRequest(Double totalPrice, GiftCardOrderRequestDTO giftCardOrderRequestDTO) {
		BigDecimal remainingAmount = BigDecimal.valueOf(totalPrice);

		List<GiftCardDTO> giftCards = giftCardOrderRequestDTO.getGiftCardCodes().stream()
				.map(giftCardService::getGiftCard)
				.sorted(Comparator.comparing(GiftCardDTO::getBalance)) // Smallest balance first
				.toList();

		BigDecimal totalBalance = giftCards.stream()
				.map(GiftCardDTO::getBalance)
				.reduce(BigDecimal.ZERO, BigDecimal::add);

		if (totalBalance.compareTo(remainingAmount) < 0) {
			throw new APIException("Gift Cards total balance insufficient");
		}

		for (GiftCardDTO giftCardDTO : giftCards) {
			BigDecimal currentBalance = giftCardDTO.getBalance();

			if (remainingAmount.compareTo(BigDecimal.ZERO) <= 0) {
				break; // Amount is covered
			}

			BigDecimal deduction = currentBalance.min(remainingAmount);
			giftCardService.reduceGiftCardBalance(giftCardDTO.getGiftCardCode(), deduction);

			remainingAmount = remainingAmount.subtract(deduction);
		}
	}

}
