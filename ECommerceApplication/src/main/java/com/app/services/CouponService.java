package com.app.services;

import com.app.entites.Coupon;
import com.app.payloads.CouponDTO;

import java.util.List;

public interface CouponService {

    CouponDTO createCoupon(CouponDTO newCoupon);

    List<CouponDTO> getAllCoupons();

    Coupon getCouponByCode(String code);

    CouponDTO updateCoupon(CouponDTO couponDTO, Long couponId);

    String deleteCoupon(Long couponId);

    boolean canRedeem(String code);

    CouponDTO redeemCoupon(String code);
}
