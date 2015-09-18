package com.haige.schedule.web.controller;

import com.haige.schedule.entity.ClassSchedule;
import com.haige.schedule.entity.Member;
import com.haige.schedule.service.ClassScheduleService;
import com.haige.schedule.service.MemberService;
import com.haige.schedule.service.PhaseService;
import com.haige.schedule.service.RBACService;
import com.haige.schedule.utils.Constants;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import sun.misc.BASE64Decoder;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/**
 * @author lzheng
 * @version 1.0
 *          ${tags}
 */
@Controller
@RequestMapping(value = "/member")
public class MemberController {

    @Autowired
    private MemberService memberService;

    @Autowired
    private PhaseService phaseService;

    @Autowired
    private RBACService rbacService;

    @Autowired
    private ClassScheduleService scheduleService;

    @RequestMapping(value = "/list")
    public ModelAndView list(@RequestParam(value = "queryName", required = false) String queryName,
                             @RequestParam(value = "queryBirthYear", required = false) String queryBirthYear,
                             @RequestParam(value = "queryPhaseId", required = false) Long queryPhaseId,
                             @RequestParam(value = "queryAdvisorId", required = false) Long queryAdvisorId,
                             @PageableDefault Pageable page) {
        ModelAndView mv = new ModelAndView("haige.member-list");
        Page<Member> members = new PageImpl<Member>(new ArrayList<Member>());
        Subject currentUser = SecurityUtils.getSubject();
        if (currentUser.hasRole("root") || currentUser.hasRole("admin") || currentUser.hasRole("cashier")) {
            members = memberService.queryMembers(queryName, queryBirthYear, queryPhaseId, queryAdvisorId, page);
        } else if (currentUser.hasRole("advisor")) {
            members = memberService.queryMembers(queryName, queryBirthYear, queryPhaseId, rbacService.getCurrentUser().getId(), page);
        }

        mv.addObject("members", members.getContent());

        mv.addObject("advisors", rbacService.getAllAdvisor());
        mv.addObject("phases", phaseService.getAllPhases());

        mv.addObject("queryName", queryName);
        mv.addObject("queryBirthYear", queryBirthYear);
        mv.addObject("queryPhaseId", queryPhaseId);
        mv.addObject("queryAdvisorId", queryAdvisorId);


        mv.addObject("page", members.getNumber() + 1);
        mv.addObject("totalPage", members.getTotalPages());
        mv.addObject("totalCount", members.getTotalElements());
        return mv;
    }

    @RequestMapping(value = "/cmQuery", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public Map<String, Object> cmQuery(Long cmScheduleId, String cmQueryName, Long cmQueryPhaseId, Long cmQueryAdvisorId, Pageable page) {
        try {
            Map<String, Object> result = new HashMap<>();
            Page<Member> members = null;
            Subject currentUser = SecurityUtils.getSubject();
            if (currentUser.hasRole("root") || currentUser.hasRole("admin")) {
                members = memberService.queryValidMembers(cmScheduleId, cmQueryName, cmQueryPhaseId, cmQueryAdvisorId, page);
            } else if (currentUser.hasRole("advisor")) {
                members = memberService.queryValidMembers(cmScheduleId, cmQueryName, cmQueryPhaseId, rbacService.getCurrentUser().getId(), page);
            }

            result.put("members", members.getContent());

            result.put("advisors", rbacService.getAllAdvisor());
            result.put("phases", phaseService.getAllPhases());
            result.put("cmQueryName", cmQueryName);
            result.put("cmQueryPhaseId", cmQueryPhaseId);
            result.put("cmQueryAdvisorId", cmQueryAdvisorId);

            result.put("page", members.getNumber() + 1);
            result.put("totalPage", members.getTotalPages());
            result.put("totalCount", members.getTotalElements());
            return result;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }


    @RequestMapping(value = "/cm/memberList", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public Map<String, Object> memberList(Long cmScheduleId) {
        try {
            Map<String, Object> result = new HashMap<>();
            ClassSchedule cs = scheduleService.getClassScheduleById(cmScheduleId);

            result.put("members", cs.getMembers());

            result.put("cmScheduleId", cmScheduleId);

            return result;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @RequestMapping(value = "/add")
    public String showAddPage(ModelMap map) {
        map.addAttribute("advisors", rbacService.getAllAdvisor());
        map.addAttribute("phases", phaseService.getAllPhases());
        map.addAttribute("sex", Constants.Sex.values());

        return "haige.member-add";
    }


    @RequestMapping(value = "/edit/{id}")
    public String showEditPage(@PathVariable("id") Long id, ModelMap map) {
        map.addAttribute("advisors", rbacService.getAllAdvisor());
        map.addAttribute("phases", phaseService.getAllPhases());
        map.addAttribute("sex", Constants.Sex.values());
        map.addAttribute("memberId", id);

        Member member = null;
        if (id != null) {
            member = memberService.getMemberById(id);
        }
        map.addAttribute("member", member);

        return "haige.member-edit";
    }

    @RequestMapping(value = "/saveNew", method = RequestMethod.POST)
    public String saveNew(Member member,
                          @RequestParam(value = "phaseId", required = true) Long phaseId,
                          @RequestParam(value = "advisorId", required = false) Long advisorId) {

        Subject currentUser = SecurityUtils.getSubject();
        if (currentUser.hasRole("root") || currentUser.hasRole("admin")) {
            member.setAdvisor(rbacService.getUserById(advisorId));
        } else if (currentUser.hasRole("advisor")) {
            member.setAdvisor(rbacService.getUserById(rbacService.getCurrentUser().getId()));
        }

        member.setPhase(phaseService.getPhase(phaseId));

        memberService.saveMember(member);
        return "redirect:/member/edit/" + member.getId();
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String save(Member member,
                       @RequestParam(value = "phaseId", required = true) Long phaseId,
                       @RequestParam(value = "advisorId", required = false) Long advisorId) {

        Subject currentUser = SecurityUtils.getSubject();
        if (currentUser.hasRole("root") || currentUser.hasRole("admin")) {
            member.setAdvisor(rbacService.getUserById(advisorId));
        } else if (currentUser.hasRole("advisor")) {
            member.setAdvisor(rbacService.getUserById(rbacService.getCurrentUser().getId()));
        }

        member.setPhase(phaseService.getPhase(phaseId));

        memberService.saveMember(member);
        return "redirect:/member/list";
    }

    @RequestMapping(value = "/delete/{id}")
    public String delete(@PathVariable("id") long id) {
        memberService.deleteMember(id);
        return "redirect:/member/list";
    }


    @RequestMapping(value = "/pic/{memberId}")
    public String pic(@PathVariable("memberId") long memberId, ModelMap map) {
        map.addAttribute("memberId", memberId);
        return "member-pic";
    }

    @RequestMapping(value = "/savePic/{memberId}")
    public String savePic(@PathVariable("memberId") long memberId,
                          HttpServletRequest request, HttpServletResponse response) {


        String pic = request.getParameter("pic");
        String pic1 = request.getParameter("pic1");
        String pic2 = request.getParameter("pic2");
        String pic3 = request.getParameter("pic3");

        String path = request.getSession().getServletContext().getRealPath("/") + "member_pic/";

        try {
            if (!pic.equals("") && pic != null) {

                //原图
                File file = new File(path + "src.png");
                FileOutputStream fout = null;
                fout = new FileOutputStream(file);
                fout.write(new BASE64Decoder().decodeBuffer(pic));
                fout.close();
            }
            Member member = memberService.getMemberById(memberId);
            member.setPic(new BASE64Decoder().decodeBuffer(pic1));
            memberService.saveMember(member);


            File file1 = new File(path + memberId + "_1.png");
            FileOutputStream fout1 = null;
            fout1 = new FileOutputStream(file1);
            fout1.write(new BASE64Decoder().decodeBuffer(pic1));
            fout1.close();


            File file2 = new File(path + memberId + "_2.png");
            FileOutputStream fout2 = null;
            fout2 = new FileOutputStream(file2);
            fout2.write(new BASE64Decoder().decodeBuffer(pic2));
            fout2.close();


            File file3 = new File(path + memberId + "_3.png");
            FileOutputStream fout3 = null;
            fout3 = new FileOutputStream(file3);
            fout3.write(new BASE64Decoder().decodeBuffer(pic3));
            fout3.close();

            return "redirect:/member/list";
        } catch (Exception e) {
            e.printStackTrace();
            return "member-pic";

        }

//        out.println("{\"status\":1}");
    }


    @RequestMapping("getImg")
    public void getImg(HttpServletRequest request, HttpServletResponse response) {
//        String imgId = request.getParameter("imgId");
        Member member = memberService.getMemberById(1);

        BASE64Decoder decoder = new BASE64Decoder();
        try {
            byte[] bytes = member.getPic();
            for (int i = 0; i < bytes.length; ++i) {
                if (bytes[i] < 0) {// 调整异常数据
                    bytes[i] += 256;
                }
            }
            ServletOutputStream out = response.getOutputStream();
            out.write(bytes);
            out.flush();
            out.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
