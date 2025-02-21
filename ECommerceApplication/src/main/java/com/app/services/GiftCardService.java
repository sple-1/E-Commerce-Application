package com.app.services;

import java.math.BigDecimal;
import java.util.List;

import com.app.payloads.GiftCardDTO;

public interface GiftCardService {
    
    GiftCardDTO generateGiftCard(BigDecimal balance);

    List<GiftCardDTO> getGiftCards();

    GiftCardDTO getGiftCard(String giftCardCode);

    GiftCardDTO reduceGiftCardBalance(String giftCardCode, BigDecimal balanceToReduce);

}
