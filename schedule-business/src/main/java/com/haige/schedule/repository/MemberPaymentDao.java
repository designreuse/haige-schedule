package com.haige.schedule.repository;

import com.haige.schedule.entity.MemberPayment;
import org.springframework.data.jpa.repository.JpaRepository;


public interface MemberPaymentDao extends JpaRepository<MemberPayment, Long> {
}
