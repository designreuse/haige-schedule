package com.haige.schedule.repository;

import com.haige.schedule.entity.Phase;
import org.springframework.data.jpa.repository.JpaRepository;


public interface PhaseDao extends JpaRepository<Phase, Long> {
}
