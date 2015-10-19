package com.haige.schedule.service;

import com.haige.schedule.repository.ClassScheduleDao;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

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
    public void testSelect() throws ParseException {
        SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd");
        java.util.Date baseDate = format.parse("2015/10/01");
        Calendar baseCal = Calendar.getInstance();
        baseCal.setTime(baseDate);
        Calendar cal = Calendar.getInstance();
        cal.setTime(baseDate);
        for (int i = 0; i < 6; i++) {
            cal.add(Calendar.DATE, 7);
            if (cal.get(Calendar.MONTH) == baseCal.get(Calendar.MONTH)) {
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                java.util.Date date = cal.getTime();
                System.out.println(sdf.format(date));
            }
        }

    }

}
