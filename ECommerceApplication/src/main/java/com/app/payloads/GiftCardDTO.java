package com.app.payloads;

import java.math.BigDecimal;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class GiftCardDTO {

    private String giftCardCode;
    private BigDecimal balance;
    
}
