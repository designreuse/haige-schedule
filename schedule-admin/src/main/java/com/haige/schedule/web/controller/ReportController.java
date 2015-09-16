package com.haige.schedule.web.controller;

import com.haige.schedule.entity.User;
import com.haige.schedule.service.RBACService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/report")
public class ReportController {

    @Autowired
    RBACService rbacService;

    @RequestMapping(value = "/schedule")
    public ModelAndView schedule() {
        ModelAndView mv = new ModelAndView("report.haige.report-schedule");
        return mv;
    }

    @RequestMapping(value = "/his_schedule")
    public ModelAndView his_schedule() {
        ModelAndView mv = new ModelAndView("report.haige.report-his-schedule");
        return mv;
    }

    @RequestMapping(value = "/member")
    public ModelAndView member() {
        ModelAndView mv = new ModelAndView("report.haige.report-member");
        return mv;
    }


    @RequestMapping(value = "/coach_member")
    public ModelAndView coach_member() {
        User user = rbacService.getCurrentUser();
        ModelAndView mv = new ModelAndView("report.haige.report-coach-member");
        mv.addObject("currUserId", user.getId());
        return mv;
    }
}
