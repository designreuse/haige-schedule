package com.haige.schedule.service;

import com.haige.schedule.repository.MemberDao;
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
public class MemberDaoTest {
    @Autowired
    private MemberDao mDao;

    @Test
    public void testSelect() {
        mDao.delete((long) 17);
    }

}
