package com.haige.schedule.repository;

import com.haige.schedule.entity.MemberEvent;
import org.springframework.data.jpa.repository.JpaRepository;


public interface MemberEventDao extends JpaRepository<MemberEvent, Long> {
}
