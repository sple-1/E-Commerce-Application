package com.app.controllers;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.app.payloads.GiftCardDTO;
import com.app.services.GiftCardService;

import io.swagger.v3.oas.annotations.security.SecurityRequirement;

@RestController
@RequestMapping("/api/admin")
@SecurityRequirement(name = "E-Commerce Application")
public class GiftCardController {

    @Autowired
    private GiftCardService giftCardService;

    @PostMapping("/gift-card")
	public ResponseEntity<GiftCardDTO> generateGiftCard(@RequestParam(name = "balance", required = true) BigDecimal balance) {
		GiftCardDTO savedGiftCardDTO = giftCardService.generateGiftCard(balance);
		
		return new ResponseEntity<GiftCardDTO>(savedGiftCardDTO, HttpStatus.CREATED);
	}
	
	@GetMapping("/gift-cards")
	public ResponseEntity<List<GiftCardDTO>> getGiftCards() {
		List<GiftCardDTO> giftCardDTOs = giftCardService.getGiftCards();
		
		return new ResponseEntity<List<GiftCardDTO>>(giftCardDTOs, HttpStatus.FOUND);
	}
	
	@GetMapping("/gift-cards/{giftCardCode}")
	public ResponseEntity<GiftCardDTO> getGiftCard(@PathVariable String giftCardCode) {
		GiftCardDTO GiftCardDTO = giftCardService.getGiftCard(giftCardCode);
		
		return new ResponseEntity<GiftCardDTO>(GiftCardDTO, HttpStatus.FOUND);
	}
    
}
