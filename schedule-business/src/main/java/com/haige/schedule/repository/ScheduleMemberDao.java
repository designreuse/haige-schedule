package com.haige.schedule.repository;

import com.haige.schedule.entity.ScheduleMember;
import org.springframework.data.jpa.repository.JpaRepository;


public interface ScheduleMemberDao extends JpaRepository<ScheduleMember, Long> {
}
