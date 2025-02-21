package com.app.services;

import java.math.BigDecimal;
import java.util.List;
import java.util.stream.Collectors;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.config.AppConstants;
import com.app.entites.GiftCard;
import com.app.exceptions.APIException;
import com.app.exceptions.ResourceNotFoundException;
import com.app.payloads.GiftCardDTO;
import com.app.repositories.GiftCardRepo;
import com.app.utils.RandomCodeUtil;

import jakarta.transaction.Transactional;

@Transactional
@Service
public class GiftCardServiceImpl implements GiftCardService {

    @Autowired
    private GiftCardRepo giftCardRepo;

    @Autowired
    private ModelMapper modelMapper;

    @Override
    public GiftCardDTO generateGiftCard(BigDecimal balance) {
        GiftCard giftCard = new GiftCard();
        giftCard.setGiftCardCode(generateUniqueGiftCardCode());
        giftCard.setBalance(balance);

        GiftCard savedGiftCard = giftCardRepo.save(giftCard);

        return modelMapper.map(savedGiftCard, GiftCardDTO.class);
    }

    @Override
    public List<GiftCardDTO> getGiftCards() {
        List<GiftCard> giftCards = giftCardRepo.findAll();

        if (giftCards.size() == 0) {
			throw new APIException("No gift card is created till now");
		}

        return giftCards.stream()
                .map(giftCard -> modelMapper.map(giftCard, GiftCardDTO.class))
                .collect(Collectors.toList());
    }

    @Override
    public GiftCardDTO getGiftCard(String giftCardCode) {
        GiftCard savedGiftCard = giftCardRepo.findByGiftCardCode(giftCardCode)
                    .orElseThrow(() -> new ResourceNotFoundException("Gift Card", "giftCardCode", giftCardCode));

        return modelMapper.map(savedGiftCard, GiftCardDTO.class);
    }

    @Override
    public GiftCardDTO reduceGiftCardBalance(String giftCardCode, BigDecimal balanceToReduce) {
        GiftCard giftCard = giftCardRepo.findByGiftCardCode(giftCardCode)
                    .orElseThrow(() -> new ResourceNotFoundException("Gift Card", "giftCardCode", giftCardCode));

        if (giftCard.getBalance().compareTo(balanceToReduce) < 0) {
            throw new APIException("Insufficient balance on the gift card.");
        }

        giftCard.setBalance(giftCard.getBalance().subtract(balanceToReduce));
        GiftCard savedGiftCard = giftCardRepo.save(giftCard);

        return modelMapper.map(savedGiftCard, GiftCardDTO.class);
    }

    private String generateUniqueGiftCardCode() {
        String code;
        do {
            code = RandomCodeUtil.generateRandomCode(AppConstants.GIFT_CARD_CODE_LENGTH);
        } while (giftCardRepo.existsByGiftCardCode(code));
        return code;
    }
    
}
