package com.haige.schedule.web.controller;

import com.haige.schedule.entity.Member;
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
}
