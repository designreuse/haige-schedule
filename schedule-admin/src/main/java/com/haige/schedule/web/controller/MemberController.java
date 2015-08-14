package com.haige.schedule.web.controller;

import com.haige.schedule.entity.Member;
import com.haige.schedule.service.MemberService;
import com.haige.schedule.service.RBACService;
import com.haige.schedule.utils.Types;
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
    private RBACService rbacService;


    @RequestMapping(value = "/list")
    public ModelAndView memberList(@RequestParam(value = "queryName", required = false) String queryName,
                                   @RequestParam(value = "queryBirthYear", required = false) String queryBirthYear,
                                   @RequestParam(value = "queryAdvisorId", required = false) Long queryAdvisorId,
                                   @PageableDefault Pageable page) {
        ModelAndView mv = new ModelAndView("haige.member-list");
        Page<Member> members = memberService.queryMembers(queryName, queryBirthYear, queryAdvisorId, page);
        mv.addObject("members", members.getContent());

        mv.addObject("advisors", rbacService.getAllAdvisor());
        mv.addObject("queryName", queryName);
        mv.addObject("queryBirthYear", queryBirthYear);
        mv.addObject("queryAdvisorId", queryAdvisorId);


        mv.addObject("page", members.getNumber() + 1);
        mv.addObject("totalPage", members.getTotalPages());
        mv.addObject("totalCount", members.getTotalElements());
        return mv;
    }

    @RequestMapping(value = "/add")
    public String showAddPage(ModelMap map) {

        map.addAttribute("advisors", rbacService.getAllAdvisor());
        map.addAttribute("sex", Types.Sex.values());
        return "haige.member-add";
    }


    @RequestMapping(value = "/edit/{id}")
    public String showEditPage(@PathVariable("id") Long id, ModelMap map) {
        map.addAttribute("advisors", rbacService.getAllAdvisor());
        map.addAttribute("sex", Types.Sex.values());

        Member member = null;
        if (id != null) {
            member = memberService.getMemberById(id);
        }
        map.addAttribute("member", member);

        return "haige.member-edit";
    }


    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String saveMember(Member member,
                             @RequestParam(value = "advisorId", required = false) Long advisorId) {
        member.setAdvisor(rbacService.getUserById(advisorId));
        memberService.saveMember(member);
        return "redirect:/member/list";
    }

    @RequestMapping(value = "/delete/{id}")
    public String deleteStore(@PathVariable("id") long id) {
        memberService.deleteMember(id);
        return "redirect:/member/list";
    }
}
