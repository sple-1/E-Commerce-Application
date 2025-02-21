package com.app.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.app.entites.Payment;
import java.util.Optional;


@Repository
public interface PaymentRepo extends JpaRepository<Payment, Long>{

    Optional<Payment> findByPaymentMethod(String paymentMethod);

}
