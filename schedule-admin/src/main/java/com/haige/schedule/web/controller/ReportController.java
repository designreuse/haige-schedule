package com.haige.schedule.web.controller;

import com.haige.schedule.entity.User;
import com.haige.schedule.service.RBACService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
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

    @RequestMapping(value = "/member_payment")
    public ModelAndView member_payment() {
        ModelAndView mv = new ModelAndView("report.haige.report-member-payment");
        return mv;
    }


    @RequestMapping(value = "/member_full")
    public ModelAndView member_full() {
        ModelAndView mv = new ModelAndView("report.haige.report-member-full");
        return mv;
    }

    @RequestMapping(value = "/member")
    public ModelAndView member() {
        ModelAndView mv = new ModelAndView("report.haige.report-member");
        Subject currentUser = SecurityUtils.getSubject();
        if (currentUser.hasRole("advisor")) {
            User user = rbacService.getCurrentUser();
            mv.addObject("currUserId", user.getId());
        }
        return mv;
    }


    @RequestMapping(value = "/coach_member")
    public ModelAndView coach_member() {
        ModelAndView mv = new ModelAndView("report.haige.report-coach-member");
        return mv;
    }
}
