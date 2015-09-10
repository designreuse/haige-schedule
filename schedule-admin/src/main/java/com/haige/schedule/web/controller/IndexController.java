package com.haige.schedule.web.controller;

import com.haige.schedule.service.ClassScheduleService;
import com.haige.schedule.service.MemberService;
import com.haige.schedule.vo.ScheduleDateVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * @author lzheng
 * @version 1.0
 *          ${tags}
 */
@Controller
@RequestMapping(value = "/")
public class IndexController {

    @Autowired
    private ClassScheduleService csService;
    @Autowired
    private MemberService mService;

    @RequestMapping(value = "index")
    public ModelAndView index() {
//        Date now = new Date();
//        Calendar calendar = Calendar.getInstance();
//        calendar.setTime(now);
//        calendar.add(Calendar.MONTH, 1);
//        Date monthAfter = calendar.getTime();
        Date start = getFirstOfMonth();
        Date end = getLastDayOfMonth();

//        List<ScheduleDateVO> scheduleList = getScheduleByDate(start,end);
        ModelAndView mv = new ModelAndView("haige.home");
//        mv.addObject("store_count", storeService.getStoreCount());
//        mv.addObject("question_count", questionService.getQuestionCount());
        mv.addObject("csCount", csService.getCSCount());
        mv.addObject("mCount", mService.getCount());

//        mv.addObject("paper_count", paperService.getPaperCount());
//        mv.addObject("average_passrate", examinationService.getAveragePassRate());
        return mv;
    }


    private String getServerDate() {
        String dateStr = "";
        Date dt = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        dateStr = sdf.format(dt);
        return dateStr;
    }

    public String transferMicroseconds2DateStr(Long millSecond) {
        Date date = new Date(millSecond);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        return sdf.format(date);
    }

    private Date getFirstOfMonth() {
        Calendar c = Calendar.getInstance();
        c.add(Calendar.MONTH, 0);
        c.set(Calendar.DAY_OF_MONTH, 1);
        return c.getTime();
    }

    private Date getLastDayOfMonth() {
        Calendar c = Calendar.getInstance();
        c.set(Calendar.DAY_OF_MONTH, c.getActualMaximum(Calendar.DAY_OF_MONTH));
        return c.getTime();
    }

    @RequestMapping(value = "getCalendarDate", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public List<ScheduleDateVO> getCurrentDate(@RequestParam("start") String start, @RequestParam("end") String end) {
        start = start + "000";
        end = end + "000";
        Date beginDate = new Date(Long.valueOf(start));
        Date endDate = new Date(Long.valueOf(end));
        return getScheduleByDate(beginDate, endDate);
    }


    private List<ScheduleDateVO> getScheduleByDate(java.util.Date beginDate, java.util.Date endDate) {
//        User user = rbacService.getCurrentUser();
//        if (user != null) {
//            Long collegeId = user.getCollegeId();
//            if (collegeId != null && collegeId != -1) {
//                return scheduleService.getCollegeScheduleByDate(collegeId, beginDate, endDate);
//            } else {
//                return scheduleService.getScheduleDataByData(beginDate, endDate);
//            }
//        } else {
        return csService.getScheduleDataByData(beginDate, endDate);
//        }
    }
}
