package com.app.services;

import com.app.entites.Coupon;
import com.app.payloads.CouponDTO;

import java.util.List;

public interface CouponService {
    List<CouponDTO> getAllCoupons();

    Coupon getCouponByCode(String code);

    boolean canRedeem(String code);

    CouponDTO redeemCoupon(String code);

	void resetCouponRedemptions(String code);

	// TODO: CUD coupon for admin management
}
