package com.haige.schedule.service;

import com.haige.schedule.entity.ClassSchedule;
import com.haige.schedule.repository.ClassScheduleDao;
import com.haige.schedule.sql.builder.SqlQueryModelBuilder;
import com.haige.schedule.sql.model.SqlQueryItem;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ClassScheduleService {

    @Autowired
    private ClassScheduleDao classScheduleDao;


    public Page<ClassSchedule> getAllClassSchedule(Pageable page) {
        return classScheduleDao.findAll(page);
    }

    public Page<ClassSchedule> queryClassSchedules(final String classScheduleName, Long roleId, Pageable page) {
        Map<String, Object> map = new HashMap<String, Object>();
        if (!StringUtils.isEmpty(classScheduleName)) {
            map.put("classScheduleName", classScheduleName);
        }
        if (roleId != null) {
            map.put("role.id", roleId);
        }
        SqlQueryModelBuilder builder = new SqlQueryModelBuilder();
        List<SqlQueryItem> itemList = builder.builder(map);

        return classScheduleDao.queryResult(itemList, null, page);
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
