package com.haige.schedule.dao;

import com.haige.schedule.repository.ClassMemberDao;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * @author lcheng
 * @version 1.0
 *          ${tags}
 */
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
@RunWith(SpringJUnit4ClassRunner.class)
public class ClassMemberDaoTest {
    @Autowired
    private ClassMemberDao cmDao;

    @Test
    public void testDeleteCM() {
        cmDao.delete((long) 10);
    }

}
