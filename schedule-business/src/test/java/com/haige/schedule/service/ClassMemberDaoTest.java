package com.haige.schedule.service;

import com.haige.schedule.entity.ClassSchedule;
import com.haige.schedule.entity.Member;
import com.haige.schedule.repository.ClassScheduleDao;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.util.Assert;

import java.util.Set;

/**
 * @author lcheng
 * @version 1.0
 *          ${tags}
 */
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
@RunWith(SpringJUnit4ClassRunner.class)
public class ClassMemberDaoTest {
    @Autowired
    private ClassScheduleDao csDao;

    @Test
    public void testSelect() {
        ClassSchedule cs = csDao.findOne(Long.valueOf(3));
        Set<Member> members = cs.getMembers();
        Assert.notEmpty(members);
    }

}
