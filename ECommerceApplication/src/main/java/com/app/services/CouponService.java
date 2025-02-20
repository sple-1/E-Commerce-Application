package com.app.services;

import com.app.entites.Coupon;
import com.app.payloads.CouponDTO;
import com.app.payloads.UserDTO;

import java.util.List;

public interface CouponService {

    CouponDTO createCoupon(CouponDTO newCoupon);

    List<CouponDTO> getAllCoupons();

    CouponDTO getCouponByCode(String code);

    CouponDTO updateCoupon(CouponDTO couponDTO, Long couponId);

    String deleteCoupon(Long couponId);

    boolean canRedeem(String code);

    CouponDTO redeemCoupon(Coupon coupon);

    UserDTO assignCoupon(Long userId, String code);
}
