package com.app.services;

import java.time.LocalDate;
import java.util.List;
import java.util.stream.Collectors;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.entites.Coupon;
import com.app.enums.DiscountType;
import com.app.exceptions.APIException;
import com.app.exceptions.ResourceNotFoundException;
import com.app.payloads.CouponDTO;
import com.app.repositories.CouponRepo;

import jakarta.transaction.Transactional;
import org.springframework.dao.DataIntegrityViolationException;

@Transactional
@Service
public class CouponServiceImpl implements CouponService {

	@Autowired
	private CouponRepo couponRepo;

	@Autowired
	private ModelMapper modelMapper;

    @Override
    public CouponDTO createCoupon(CouponDTO couponDTO) {
        try {
            Coupon coupon = modelMapper.map(couponDTO, Coupon.class);

            if (couponDTO.getStartDate() != null) {
                coupon.setStartDate(LocalDate.parse(couponDTO.getStartDate()));
            }
            if (couponDTO.getExpiryDate() != null) {
                coupon.setExpiryDate(LocalDate.parse(couponDTO.getExpiryDate()));
            }

            Coupon savedCoupon = couponRepo.findByCode(coupon.getCode());

            if (savedCoupon != null) {
                throw new APIException("Coupon with the code '" + couponDTO.getCode() + "' already exists !!!");
            }

            if (coupon.getStartDate() == null) {
                throw new APIException("Start date cannot be null");
            }

            if (coupon.getStartDate().isAfter(coupon.getExpiryDate())) {
                throw new APIException("Start date should be before expiry date");
            }

            if (coupon.getStartDate().isBefore(java.time.LocalDate.now())) {
                throw new APIException("Start date should be in the future");
            }

            validateDiscount(coupon.getDiscountType(), coupon.getDiscountAmount());

            savedCoupon = couponRepo.save(coupon);

            couponDTO = modelMapper.map(savedCoupon, CouponDTO.class);

            return couponDTO;
        } catch (DataIntegrityViolationException e) {
            throw new RuntimeException("Error creating coupon: " + e.getMessage());
        }
    }



    @Override
    public List<CouponDTO> getAllCoupons() {
        List<Coupon> coupons = couponRepo.findAll();

        if (coupons.size() == 0) {
            throw new APIException("No coupon exists");
        }
        List<CouponDTO> couponDTOs = coupons.stream().map(coupon -> modelMapper.map(coupon, CouponDTO.class))
                .collect(Collectors.toList());

        return couponDTOs;
    }

    @Override
    public CouponDTO getCouponByCode(String code) {
        Coupon coupon = couponRepo.findByCode(code);

        if (coupon == null) {
            throw new ResourceNotFoundException("Coupon", "code", code);
        }

        return modelMapper.map(coupon, CouponDTO.class);
    }

    @Override
    public CouponDTO updateCoupon(CouponDTO couponDTO, Long couponId) {
        Coupon coupon = couponRepo.findById(couponId)
                .orElseThrow(() -> new RuntimeException("Coupon not found"));

        if (coupon.getStartDate().isAfter(coupon.getExpiryDate())) {
            throw new APIException("Start date should be before expiry date");
        }

        if (coupon.getStartDate().isBefore(java.time.LocalDate.now())) {
            throw new APIException("Start date should be in the future");
        }
        validateDiscount(couponDTO.getDiscountType(), couponDTO.getDiscountAmount());

        coupon.setDiscountType(couponDTO.getDiscountType());
        coupon.setCode(couponDTO.getCode());
        coupon.setDiscountAmount(couponDTO.getDiscountAmount());
        coupon.setStartDate(LocalDate.parse(couponDTO.getStartDate()));
        coupon.setExpiryDate(LocalDate.parse(couponDTO.getExpiryDate()));
        coupon.setRedeemQuota(couponDTO.getRedeemQuota());


        Coupon updatedCoupon = couponRepo.save(coupon);

        couponDTO = modelMapper.map(updatedCoupon, CouponDTO.class);

        return couponDTO;
    }

    @Override
    public String deleteCoupon(Long couponId) {
        Coupon coupon = couponRepo.findById(couponId)
                .orElseThrow(() -> new RuntimeException("Coupon not found"));

        couponRepo.delete(coupon);

        return "Coupon deleted successfully";
    }

    @Override
    public boolean canRedeem(String code) {
        Coupon coupon = couponRepo.findByCode(code);
        if (coupon == null) {
            throw new ResourceNotFoundException("Coupon", "code", code);
        }

        if (coupon.getStartDate().isAfter(java.time.LocalDate.now()) || coupon.getExpiryDate().isBefore(java.time.LocalDate.now())) {
            throw new APIException("The coupon is not active and can't be redeemed.");
        }

        return coupon.getRedeemCount() < coupon.getRedeemQuota();
    }

    @Override
    public CouponDTO redeemCoupon(Coupon coupon) {
        if (canRedeem(coupon.getCode())) {
            coupon.setRedeemCount(coupon.getRedeemCount() + 1);
        } else {
            throw new APIException("The coupon has run out of quota and can't be redeemed.");
        }
        couponRepo.save(coupon);

        return modelMapper.map(coupon, CouponDTO.class);
    }

    @Override
    private void validateDiscount(DiscountType discountType, Double discountAmount) {
        if (discountType == DiscountType.PERCENTAGE) {
            if (discountAmount < 0 || discountAmount > 100) {
                throw new APIException("Percentage discount must be between 0 and 100.");
            }
        } else if (discountType == DiscountType.FLAT) {
            if (discountAmount < 0) {
                throw new APIException("Flat discount must be a positive number.");
            }
        }
    }    
}
