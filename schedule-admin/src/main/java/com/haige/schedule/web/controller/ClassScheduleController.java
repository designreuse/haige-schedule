package com.haige.schedule.web.controller;

import com.haige.schedule.entity.ClassSchedule;
import com.haige.schedule.entity.Result;
import com.haige.schedule.service.ClassBaseService;
import com.haige.schedule.service.ClassScheduleService;
import com.haige.schedule.service.RBACService;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

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


        mv.addObject("page", schedules.getNumber());
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

    @RequestMapping(value = "/mc/save", method = RequestMethod.POST)
    @ResponseBody
    public Result saveClassMember(String params) {
        Result result = null;
        try {
            JSONObject json = new JSONObject(params);
            Long schedleId = json.getLong("scheduleId");

            List<Long> memberIds = new ArrayList<>();
            JSONArray jarr = json.getJSONArray("mcIds");
            for (int i = 0; i < jarr.length(); i++) {
                Long memberId = Long.parseLong(jarr.get(i).toString());
                memberIds.add(memberId);
            }
            scheduleService.addCSMembers(schedleId, memberIds);

            result = new Result(true, "保存课程学员成功！");
        } catch (Exception e) {
            e.printStackTrace();
            result = new Result(false, "保存课程学员失败！");
        }
        return result;
    }
}
