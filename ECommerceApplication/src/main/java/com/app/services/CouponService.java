package com.app.services;

import com.app.payloads.CouponDTO;

import java.util.List;

public interface CouponService {

    CouponDTO createCoupon(CouponDTO newCoupon);

    List<CouponDTO> getAllCoupons();

    CouponDTO getCoupon(String couponCode);

    CouponDTO updateCoupon(CouponDTO couponDTO, Long couponId);

    String deleteCoupon(Long couponId);
}
