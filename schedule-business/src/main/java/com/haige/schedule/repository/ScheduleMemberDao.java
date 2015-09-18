package com.haige.schedule.repository;

import com.haige.schedule.entity.ScheduleMember;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;


public interface ScheduleMemberDao extends JpaRepository<ScheduleMember, Long> {
    ScheduleMember findByScheduleIdAndMemberId(@Param("scheduleId") Long scheduleId, @Param("memberId") Long memberId);
}
