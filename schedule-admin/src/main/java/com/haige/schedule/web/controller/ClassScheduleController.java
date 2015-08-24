package com.haige.schedule.web.controller;

import com.haige.schedule.entity.ClassSchedule;
import com.haige.schedule.service.ClassBaseService;
import com.haige.schedule.service.ClassScheduleService;
import com.haige.schedule.service.RBACService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.sql.Date;

/**
 * @author lzheng
 * @version 1.0
 *          ${tags}
 */
@Controller
@RequestMapping(value = "/schedule")
public class ClassScheduleController {

    @Autowired
    private ClassScheduleService scheduleService;
    @Autowired
    private RBACService rbacService;
    @Autowired
    private ClassBaseService classService;


    @RequestMapping(value = "/list")
    public ModelAndView scheduleList(@RequestParam(value = "queryName", required = false) String queryName,
                                     @RequestParam(value = "queryTeacherId", required = false) Long queryTeacherId, @RequestParam(value = "queryDate", required = false) Date queryDate,
                                     @RequestParam(value = "queryDate", required = false) Date queryScheduleDate,
                                     @PageableDefault Pageable page) {
        ModelAndView mv = new ModelAndView("haige.classschedule-list");
        Page<ClassSchedule> schedules = scheduleService.queryClassSchedules(queryName, queryTeacherId, queryScheduleDate, page);
        mv.addObject("schedules", schedules.getContent());

        mv.addObject("teachers", rbacService.getAllTeacher());
        mv.addObject("queryName", queryName);
        mv.addObject("queryScheduleDate", queryScheduleDate);
        mv.addObject("queryTeacherId", queryTeacherId);


        mv.addObject("page", schedules.getNumber() + 1);
        mv.addObject("totalPage", schedules.getTotalPages());
        mv.addObject("totalCount", schedules.getTotalElements());
        return mv;
    }

    @RequestMapping(value = "/add")
    public String showAddPage(ModelMap map) {
        map.addAttribute("teachers", rbacService.getAllTeacher());
        map.addAttribute("classes", classService.getAllClassBases());
        return "haige.classschedule-add";
    }


    @RequestMapping(value = "/edit/{id}")
    public String showEditPage(@PathVariable("id") Long id, ModelMap map) {
        map.addAttribute("teachers", rbacService.getAllTeacher());
        map.addAttribute("classes", classService.getAllClassBases());

        ClassSchedule schedule = null;
        if (id != null) {
            schedule = scheduleService.getClassScheduleById(id);
        }
        map.addAttribute("schedule", schedule);

        return "haige.classschedule-edit";
    }


    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String saveClassSchedule(ClassSchedule schedule,
                                    @RequestParam(value = "classId", required = false) Long classId,
                                    @RequestParam(value = "teacherId", required = false) Long teacherId) {
        schedule.setClassBase(classService.getClassBase(classId));
        schedule.setTeacher(rbacService.getUserById(teacherId));
        scheduleService.saveClassSchedule(schedule);
        return "redirect:/schedule/list";
    }

    @RequestMapping(value = "/delete/{id}")
    public String deleteStore(@PathVariable("id") long id) {
        scheduleService.deleteClassSchedule(id);
        return "redirect:/schedule/list";
    }
}
