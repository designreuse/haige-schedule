package com.haige.schedule.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/report")
public class ReportController {

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
}
