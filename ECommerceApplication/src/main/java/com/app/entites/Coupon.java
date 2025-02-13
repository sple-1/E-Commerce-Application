package com.app.entites;

import java.time.LocalDate;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "coupons")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Coupon {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long couponId;
	
	@Column(unique = true, nullable = false)
	private String code;
	
	private Double discountAmount;
	
    private LocalDate startDate;
    
	private LocalDate expiryDate;
	
	@Column(nullable = false)
	private Integer redeemQuota;

	@Column(nullable = false)
	private Integer redeemCount = 0;
}
