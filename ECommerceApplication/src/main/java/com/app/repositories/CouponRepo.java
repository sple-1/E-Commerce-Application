package com.app.repositories;

import com.app.entites.Coupon;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CouponRepo extends JpaRepository<Coupon, Long> {

    List<Coupon> findAll();

    Coupon findByCouponCode(String couponCode);

}
