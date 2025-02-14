package com.app.entites;

import java.time.LocalDate;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Positive;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@Entity
@Data
@Table(name = "coupons")
@NoArgsConstructor
@AllArgsConstructor
public class Coupon {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long couponId;

    @NotBlank
    @Size(min = 3, message = "Coupon code must contain atleast 3 characters")
    @Column(unique = true, nullable = false)
    private String code;

    @NotNull
    @Positive
    private Double discountAmount;

    private LocalDate startDate;

	private LocalDate expiryDate;

	@Column(nullable = false)
	private Integer redeemQuota;

	@Column(nullable = false)
	private Integer redeemCount = 0;
}
