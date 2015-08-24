package com.haige.schedule.service;

import com.haige.schedule.entity.ClassSchedule;
import com.haige.schedule.repository.ClassScheduleDao;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

@Service
public class ClassScheduleService {

    @Autowired
    private ClassScheduleDao classScheduleDao;


    public Page<ClassSchedule> getAllClassSchedule(Pageable page) {
        return classScheduleDao.findAll(page);
    }


    public Page<ClassSchedule> queryClassSchedules(String classBasename, Long queryTeacherId, Date queryScheduleDate, Pageable page) {
        List<Object> params = new ArrayList<>();
        String sql = "select * from class_schedule cs \n" +
                "left join classes c on cs.classId = c.id where 1=1 ";
        if (!StringUtils.isEmpty(classBasename)) {
            sql += " and ( c.name like ?1 or c.type like ?1)";
            params.add("%" + classBasename + "%");
        }
        if (queryScheduleDate != null) {
            sql += " and cs.scheduleDate = ?2 ";
            params.add(queryScheduleDate);
        }
        if (queryTeacherId != null) {
            sql += " and cs.teacherId = ?3 ";
            params.add(queryTeacherId);
        }

        return classScheduleDao.queryNativeSqlListEntity(sql, params.toArray(), page);
    }


    public ClassSchedule getClassScheduleById(long id) {
        return classScheduleDao.findOne(id);
    }

    public void saveClassSchedule(ClassSchedule classSchedule) {
        classScheduleDao.save(classSchedule);
    }

    public void deleteClassSchedule(Long id) {
        classScheduleDao.delete(id);
    }

}
