package com.haige.schedule.service;

import com.haige.schedule.utils.Constants;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.io.UnsupportedEncodingException;

@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
@RunWith(SpringJUnit4ClassRunner.class)
public class EncodingTest {


    @Test
    public void testSelect() throws UnsupportedEncodingException {
        String val = Constants.Sex.Female.getTitle();
        System.out.println(val);
    }

}
