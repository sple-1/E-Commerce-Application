package com.app.controllers;

import com.app.entites.Coupon;
import com.app.payloads.CouponDTO;
import com.app.payloads.UserDTO;
import com.app.services.CouponService;
import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api")
@SecurityRequirement(name = "E-Commerce Application")
public class CouponController {

    @Autowired
    private CouponService couponService;

    @PostMapping("/admin/coupon")
    public ResponseEntity<CouponDTO> createCoupon(@Valid @RequestBody CouponDTO couponDTO) {
        CouponDTO savedCouponDTO = couponService.createCoupon(couponDTO);

        return new ResponseEntity<CouponDTO>(savedCouponDTO, HttpStatus.CREATED);
    }

    @PostMapping("/admin/coupon/{userId}/{code}")
    public ResponseEntity<UserDTO> assignCoupon(@PathVariable Long userId, @PathVariable String code) {
        UserDTO userCouponDTO = couponService.assignCoupon(userId, code);

        return new ResponseEntity<UserDTO>(userCouponDTO, HttpStatus.CREATED);
    }

    @GetMapping("/public/coupons")
    public ResponseEntity<CouponDTO> getCoupon() {
        List<CouponDTO> couponDTO = couponService.getAllCoupons();

        return new ResponseEntity(couponDTO, HttpStatus.FOUND);
    }

    @GetMapping("/public/coupon/{couponCode}")
    public ResponseEntity<CouponDTO> getCoupon(@PathVariable String couponCode) {
        CouponDTO couponDTO = couponService.getCouponByCode(couponCode);

        return new ResponseEntity<CouponDTO>(couponDTO, HttpStatus.FOUND);
    }

    @PutMapping("/admin/coupon/{couponId}")
    public ResponseEntity<CouponDTO> updateCoupon(@RequestBody CouponDTO couponDTO, @PathVariable Long couponId) {
        CouponDTO updatedCouponDTO = couponService.updateCoupon(couponDTO, couponId);

        return new ResponseEntity<CouponDTO>(updatedCouponDTO, HttpStatus.OK);
    }

    @DeleteMapping("/admin/coupon/{couponId}")
    public ResponseEntity<String> deleteCoupon(@PathVariable Long couponId) {
        String response = couponService.deleteCoupon(couponId);

        return new ResponseEntity<String>(response, HttpStatus.OK);
    }

}
