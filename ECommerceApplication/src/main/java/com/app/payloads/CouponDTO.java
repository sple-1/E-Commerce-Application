package com.app.payloads;

import com.app.enums.DiscountType;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CouponDTO {

    private String code;
    private DiscountType discountType;
    private Double discountAmount;
    private String startDate;
    private String expiryDate;
    private Integer redeemQuota;
}
