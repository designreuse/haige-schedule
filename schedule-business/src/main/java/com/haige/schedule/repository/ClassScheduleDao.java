package com.haige.schedule.repository;

import com.haige.schedule.entity.ClassSchedule;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.Date;
import java.util.List;

public interface ClassScheduleDao extends CommonRepository<ClassSchedule, Long> {
    @Modifying
    @Query(nativeQuery = true, value = "" +
            "INSERT INTO his_schedule(cs_id,\n" +
            " cs_date,\n" +
            " cs_comment,\n" +
            " cs_startTime,\n" +
            " cs_endTime,\n" +
            " u_id,\n" +
            " u_userName,\n" +
            " u_realName,\n" +
            " u_tel,\n" +
            " u_tel1,\n" +
            " u_weChat,\n" +
            " u_comment,\n" +
            " c_id,\n" +
            " c_name,\n" +
            " c_recommend,\n" +
            " c_comment,\n" +
            " m_id,\n" +
            " m_memberName,\n" +
            " m_age,\n" +
            " m_birthday,\n" +
            " m_realName,\n" +
            " m_sex,\n" +
            " m_address,\n" +
            " cs_evaluation)\n" +
            "SELECT \n" +
            " cs_id,\n" +
            " cs_date,\n" +
            " cs_comment,\n" +
            " cs_startTime,\n" +
            " cs_endTime,\n" +
            " u_id,\n" +
            " u_userName,\n" +
            " u_realName,\n" +
            " u_tel,\n" +
            " u_tel1,\n" +
            " u_weChat,\n" +
            " u_comment,\n" +
            " c_id,\n" +
            " c_name,\n" +
            " c_recommend,\n" +
            " c_comment,\n" +
            " m_id,\n" +
            " m_memberName,\n" +
            " m_age,\n" +
            " m_birthday,\n" +
            " m_realName,\n" +
            " m_sex,\n" +
            " m_address\n," +
            " :evaluation\n" +
            "FROM view_all_schedule\n" +
            "WHERE cs_id =:evScheduleid ")
    public void recordHisSchedule(@Param("evScheduleid") Long evScheduleid, @Param("evaluation") String evaluation);


    @Query(nativeQuery = true, value = "SELECT * FROM class_schedule WHERE scheduleDate >= :beginDate AND scheduleDate <= :endDate")
    public List<ClassSchedule> findScheduleByDateFilter(@Param("beginDate") Date beginDate, @Param("endDate") Date endDate);

}
