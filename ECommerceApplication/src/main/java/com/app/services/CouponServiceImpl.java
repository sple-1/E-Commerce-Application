package com.app.services;

import com.app.entites.Coupon;
import com.app.exceptions.APIException;
import com.app.exceptions.ResourceNotFoundException;
import com.app.payloads.CouponDTO;
import com.app.repositories.CouponRepo;
import jakarta.transaction.Transactional;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

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

        if (coupons.size() == 0) {
            throw new APIException("No coupon exists");
        }
        List<CouponDTO> couponDTOs = coupons.stream().map(coupon -> modelMapper.map(coupon, CouponDTO.class))
                .collect(Collectors.toList());

        return couponDTOs;
    }

    @Override
    public Coupon getCouponByCode(String code) {
        Coupon coupon = couponRepo.findByCode(code);

        if (coupon == null) {
            throw new ResourceNotFoundException("Coupon", "code", code);
        }

        return coupon;
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
