package com.haige.schedule.dao;

import com.haige.schedule.entity.ClassMember;
import com.haige.schedule.entity.ClassSchedule;
import com.haige.schedule.entity.Member;
import com.haige.schedule.repository.ClassMemberDao;
import com.haige.schedule.repository.ClassScheduleDao;
import com.haige.schedule.repository.MemberDao;
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

    @Autowired
    private MemberDao memberDao;
    @Autowired
    private ClassMemberDao cmDao;

    public Page<ClassSchedule> getAllClassSchedule(Pageable page) {
        return classScheduleDao.findAll(page);
    }


    public Page<ClassSchedule> queryClassSchedules(String classBasename, Long queryTeacherId, Date queryScheduleDate, Pageable page) {
        List<Object> params = new ArrayList<>();
        List<String> items = new ArrayList<String>();

        String sql = "select * from class_schedule cs \n" +
                "left join classes c on cs.classId = c.id where 1=1 ";
        if (!StringUtils.isEmpty(classBasename)) {
            sql += " and ( c.name like :classBasename or c.type like :classBasename)";
            items.add("classBasename");
            params.add("%" + classBasename + "%");
        }
        if (queryTeacherId != null) {
            sql += " and cs.teacherId = :teacherId ";
            items.add("teacherId");
            params.add(queryTeacherId);
        }

        if (queryScheduleDate != null) {
            sql += " and cs.scheduleDate = :scheduleDate ";
            items.add("scheduleDate");
            params.add(queryScheduleDate);
        }
        String[] strArr = new String[items.size()];
        return classScheduleDao.queryNativeSqlPageEntity(sql, items.toArray(strArr), params.toArray(), page);
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

    public void addCSMembers(Long id, List<Long> memberIds) {
        ClassSchedule cs = classScheduleDao.findOne(id);
        for (Long memberId : memberIds) {
            ClassMember cm = new ClassMember();
            cm.setSchedule(cs);
            cm.setMember(memberDao.findOne(memberId));
            cmDao.save(cm);
        }
    }

    public void deleteCSMember(Long id, Long memberId) {
        ClassSchedule cs = classScheduleDao.findOne(id);
        List<Member> members = cs.getMembers();

    }
}
