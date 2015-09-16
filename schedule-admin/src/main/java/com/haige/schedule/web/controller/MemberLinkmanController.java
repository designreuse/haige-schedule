package com.haige.schedule.web.controller;

import com.haige.schedule.entity.Member;
import com.haige.schedule.entity.MemberLinkman;
import com.haige.schedule.service.MemberLinkmanService;
import com.haige.schedule.service.MemberService;
import com.haige.schedule.utils.Constants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(value = "/member_linkman")
public class MemberLinkmanController {

    @Autowired
    private MemberLinkmanService linkmanService;
    @Autowired
    private MemberService memberService;

    @RequestMapping(value = "/add")
    public String showAddPage(@RequestParam(value = "memberId", required = true) Long memberId, ModelMap map) {
        map.addAttribute("memberId", memberId);
        map.addAttribute("sex", Constants.Sex.values());

        return "haige.memberlinkman-add";
    }


    @RequestMapping(value = "/edit/{id}")
    public String showEditPage(@PathVariable("id") Long id, ModelMap map) {
        map.addAttribute("sex", Constants.Sex.values());

        MemberLinkman linkman = linkmanService.getMemberLinkman(id);
        map.addAttribute("linkman", linkman);
        map.addAttribute("memberId", linkman.getLinkMember().getId());

        return "haige.memberlinkman-edit";
    }


    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String save(@RequestParam(value = "memberId", required = true) Long memberId,
                       MemberLinkman linkman) {
        Member member = memberService.getMemberById(memberId);
        linkman.setLinkMember(member);
        linkmanService.save(linkman);
        return "redirect:/member/edit/" + Long.toString(memberId);
    }

    @RequestMapping(value = "/delete/{id}")
    public String delete(@PathVariable("id") long id) {
        MemberLinkman linkman = linkmanService.getMemberLinkman(id);
        Long memberId = linkman.getLinkMember().getId();

        linkmanService.delete(id);

        return "redirect:/member/edit/" + Long.toString(memberId);
    }
}
