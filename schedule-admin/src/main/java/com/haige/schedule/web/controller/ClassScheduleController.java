package com.haige.schedule.web.controller;

import com.haige.schedule.entity.*;
import com.haige.schedule.service.ClassBaseService;
import com.haige.schedule.service.ClassScheduleService;
import com.haige.schedule.service.RBACService;
import com.haige.schedule.service.ScheduleMemberService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Set;

/**
 * @author lzheng
 * @version 1.0
 *          ${tags}
 */
@Controller
@RequestMapping(value = "/schedule/{scheduleType}")
public class ClassScheduleController {

    @Autowired
    private ClassScheduleService scheduleService;
    @Autowired
    private RBACService rbacService;
    @Autowired
    private ClassBaseService classService;
    @Autowired
    private ScheduleMemberService smService;

    @RequestMapping(value = "/list")
    public ModelAndView list(@PathVariable("scheduleType") long scheduleType,
                             @RequestParam(value = "queryName", required = false) String queryName,
                             @RequestParam(value = "queryTeacherId", required = false) Long queryTeacherId,
                             @RequestParam(value = "queryDate", required = false) Date queryScheduleDate,
                             @PageableDefault Pageable page) {
        ModelAndView mv = new ModelAndView("haige.classschedule-list");
        Page<ClassSchedule> schedules = new PageImpl<ClassSchedule>(new ArrayList<ClassSchedule>());
        Subject currentUser = SecurityUtils.getSubject();
//        if (currentUser.hasRole("root") || currentUser.hasRole("admin")
//                || currentUser.hasRole("advisor") || currentUser.hasRole("cashier")) {
//            schedules = scheduleService.queryClassSchedules(queryName, queryTeacherId, queryScheduleDate, page);
//        } else if (currentUser.hasRole("coach")) {
//            schedules = scheduleService.queryClassSchedules(queryName, rbacService.getCurrentUser().getId(), queryScheduleDate, page);
//        }
        User user = rbacService.getCurrentUser();
        mv.addObject("currUserId", user.getId());

        schedules = scheduleService.queryClassSchedules(scheduleType, queryName, null, queryScheduleDate, page);
        mv.addObject("scheduleType", scheduleType);
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
    public String showAddPage(@PathVariable("scheduleType") long scheduleType,
                              ModelMap map) {
        User user = rbacService.getCurrentUser();
        map.addAttribute("currUserId", user.getId());
        map.addAttribute("teachers", rbacService.getAllTeacher());
        map.addAttribute("classes", classService.getAllClassBases());
        map.addAttribute("scheduleType", scheduleType);
        return "haige.classschedule-add";
    }


    @RequestMapping(value = "/edit/{id}")
    public String showEditPage(@PathVariable("scheduleType") long scheduleType,
                               @PathVariable("id") Long id, ModelMap map) {
        map.addAttribute("teachers", rbacService.getAllTeacher());
        map.addAttribute("classes", classService.getAllClassBases());
        map.addAttribute("scheduleType", scheduleType);

        ClassSchedule schedule = null;
        if (id != null) {
            schedule = scheduleService.getClassScheduleById(id);
        }
        map.addAttribute("schedule", schedule);

        return "haige.classschedule-edit";
    }


    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String save(ClassSchedule schedule,
                       @PathVariable("scheduleType") long scheduleType,
                       @RequestParam(value = "classId", required = false) Long classId,
                       @RequestParam(value = "creatorId", required = false) Long creatorId,
                       @RequestParam(value = "teacherId", required = false) Long teacherId) {
        schedule.setClassBase(classService.getClassBase(classId));
        schedule.setTeacher(rbacService.getUserById(teacherId));
        schedule.setCreator(rbacService.getUserById(creatorId));
        if (schedule.getId() != null) {
            ClassSchedule cs = scheduleService.getClassScheduleById(schedule.getId());
            schedule.setMembers(cs.getMembers());
        }
        for (ScheduleMember sm : schedule.getScheduleMembers()) {
            smService.updateComment(sm.getId(), sm.getComment());
        }
        scheduleService.saveClassSchedule(schedule);
        return "redirect:/schedule/" + scheduleType + "/list";
    }

    @RequestMapping(value = "/finish", method = RequestMethod.POST)
    public String finish(@PathVariable("scheduleType") long scheduleType,
                         @RequestParam(value = "ev_scheduleid", required = true) Long evScheduleid,
                         @RequestParam(value = "memberIds", required = false) String[] memberIds,
                         @RequestParam(value = "evaluations", required = false) String[] evaluations) {
        if (memberIds == null) {
            scheduleService.deleteClassSchedule(evScheduleid);
            return "redirect:/schedule/" + scheduleType + "/list";
        }

        for (int i = 0; i < memberIds.length; i++) {
            Long memberId = Long.parseLong(memberIds[i]);
            ScheduleMember sm = smService.getScheduleMember(evScheduleid, memberId);
            sm.setEvaluation(evaluations[i]);
            smService.save(sm);
        }

        scheduleService.finishClassSchedule(evScheduleid);
        return "redirect:/schedule/" + scheduleType + "/list";
    }

    @RequestMapping(value = "/saveNew", method = RequestMethod.POST)
    public String saveNew(ClassSchedule schedule,
                          @PathVariable("scheduleType") long scheduleType,
                          @RequestParam(value = "classId", required = false) Long classId,
                          @RequestParam(value = "creatorId", required = false) Long creatorId,
                          @RequestParam(value = "teacherId", required = false) Long teacherId) {
        if (classId != null)
            schedule.setClassBase(classService.getClassBase(classId));
        if (teacherId != null)
            schedule.setTeacher(rbacService.getUserById(teacherId));
        if (creatorId != null)
            schedule.setCreator(rbacService.getUserById(creatorId));
        scheduleService.saveClassSchedule(schedule);
        return "redirect:/schedule/" + scheduleType + "/edit/" + schedule.getId();
    }

    @RequestMapping(value = "/delete/{id}")
    public String delete(@PathVariable("scheduleType") long scheduleType, @PathVariable("id") long id) {
        scheduleService.deleteClassSchedule(id);
        return "redirect:/schedule/" + scheduleType + "/list";
    }


    @RequestMapping(value = "/mc/save", method = RequestMethod.POST)
    @ResponseBody
    public Result saveScheduleMember(String params) {
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

    @RequestMapping(value = "/mc/deleteMember", method = RequestMethod.POST)
    @ResponseBody
    public Result deleteCSMember(String scheduleId, String memberId) {
        Result result = null;
        try {
            scheduleService.deleteCSMember(Long.parseLong(scheduleId), Long.parseLong(memberId));

            result = new Result(true, "删除课程学员成功！");
        } catch (Exception e) {
            e.printStackTrace();
            result = new Result(false, "删除课程学员失败！");
        }
        return result;
    }

    @RequestMapping(value = "/batchGenerateByMonth", method = RequestMethod.GET)
    public String batchGenerateByMonth(@PathVariable("scheduleType") long scheduleType,
                                       @RequestParam(value = "baseScheduleid", required = true) Long baseScheduleid) {

        ClassSchedule baseSchedule = scheduleService.getClassScheduleById(baseScheduleid);
        Calendar baseCal = Calendar.getInstance();
        baseCal.setTime(baseSchedule.getScheduleDate());
        Calendar cal = Calendar.getInstance();
        cal.setTime(baseSchedule.getScheduleDate());
        for (int i = 0; i < 6; i++) {
            cal.add(Calendar.DATE, 7);
            if (cal.get(Calendar.MONTH) == baseCal.get(Calendar.MONTH)) {
                ClassSchedule newSchedule = new ClassSchedule();
                User user = rbacService.getCurrentUser();
                newSchedule.setCreator(user);
                newSchedule.setTeacher(baseSchedule.getTeacher());
                newSchedule.setClassBase(baseSchedule.getClassBase());
                java.sql.Date newDate = new java.sql.Date(cal.getTime().getTime());
                newSchedule.setScheduleDate(newDate);
                newSchedule.setStartTime(baseSchedule.getStartTime());
                newSchedule.setEndTime(baseSchedule.getEndTime());
                newSchedule.setCostTimes(baseSchedule.getCostTimes());
                scheduleService.saveClassSchedule(newSchedule);
            }
        }
        return "redirect:/schedule/" + scheduleType + "/list";
    }


    @RequestMapping(value = "/batchFillStudentsByMonth", method = RequestMethod.GET)
    public String batchFillStudentsByMonth(@PathVariable("scheduleType") long scheduleType,
                                           @RequestParam(value = "baseScheduleid", required = true) Long baseScheduleid) {
        ClassSchedule baseSchedule = scheduleService.getClassScheduleById(baseScheduleid);
        Set<Member> baseMembers = baseSchedule.getMembers();

        Calendar baseCal = Calendar.getInstance();
        baseCal.setTime(baseSchedule.getScheduleDate());
        Calendar cal = Calendar.getInstance();
        cal.setTime(baseSchedule.getScheduleDate());
        for (int i = 0; i < 6; i++) {
            cal.add(Calendar.DATE, 7);
            if (cal.get(Calendar.MONTH) == baseCal.get(Calendar.MONTH)) {
                java.sql.Date cuDate = new java.sql.Date(cal.getTime().getTime());
                List<ClassSchedule> desSchedules = scheduleService.getScheduleByDateTime(cuDate, baseSchedule.getStartTime(), baseSchedule.getEndTime());
                for (ClassSchedule dcs : desSchedules) {
                    Boolean modified = false;
                    Set<Member> members = dcs.getMembers();
                    for (Member bm : baseMembers) {
                        if (!memberExists(bm, members)) {
                            members.add(bm);
                            modified = true;
                        }
                    }
                    if (modified) {
                        scheduleService.saveClassSchedule(dcs);
                    }
                }
            }
        }
        return "redirect:/schedule/" + scheduleType + "/list";
    }

    private boolean memberExists(Member srcMember, Set<Member> desMembers) {
        for (Member m : desMembers) {
            if (m.getId() == srcMember.getId()) {
                return true;
            }
        }
        return false;
    }
}
