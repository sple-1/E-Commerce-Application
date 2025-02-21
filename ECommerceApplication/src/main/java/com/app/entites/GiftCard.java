package com.app.entites;

import java.math.BigDecimal;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.PositiveOrZero;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "gift_cards")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class GiftCard {

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long giftCardId;

    @NotBlank
    @Column(unique = true, length = 12)
    private String giftCardCode;

    @NotNull
    @PositiveOrZero
    private BigDecimal balance;
    
}
