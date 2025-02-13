package com.app.services;

import com.app.entites.Coupon;
import com.app.payloads.CouponDTO;
import com.app.repositories.CouponRepo;
import jakarta.transaction.Transactional;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;

import java.util.List;

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

            Coupon savedCoupon = couponRepo.save(coupon);

            couponDTO = modelMapper.map(savedCoupon, CouponDTO.class);

            return couponDTO;
        } catch (DataIntegrityViolationException e) {
            throw new RuntimeException("Error creating coupon: " + e.getMessage());
        }
    }

    @Override
    public List<CouponDTO> getAllCoupons() {
        List<Coupon> coupons = couponRepo.findAll();

        return coupons.stream().map(coupon -> modelMapper.map(coupon, CouponDTO.class)).toList();
    }

    @Override
    public CouponDTO getCoupon(String couponCode) {
        Coupon coupon = couponRepo.findByCouponCode(couponCode);

        if (coupon == null) {
            throw new RuntimeException("Coupon not found");
        }

        return modelMapper.map(coupon, CouponDTO.class);
    }

    @Override
    public CouponDTO updateCoupon(CouponDTO couponDTO, Long couponId) {
        Coupon coupon = couponRepo.findById(couponId)
                .orElseThrow(() -> new RuntimeException("Coupon not found"));

        coupon.setCouponCode(couponDTO.getCouponCode());
        coupon.setDiscountAmount(couponDTO.getDiscountAmount());

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
}
