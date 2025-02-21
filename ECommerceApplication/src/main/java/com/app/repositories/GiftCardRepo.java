package com.app.repositories;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.app.entites.GiftCard;

@Repository
public interface GiftCardRepo extends JpaRepository<GiftCard, Long> {

    Optional<GiftCard> findByGiftCardCode(String giftCardCode);

    boolean existsByGiftCardCode(String giftCardCode);
    
}
