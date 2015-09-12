package com.haige.schedule.web.controller;

import com.haige.schedule.entity.Member;
import com.haige.schedule.entity.MemberEvent;
import com.haige.schedule.service.MemberEventService;
import com.haige.schedule.service.MemberService;
import com.haige.schedule.service.RBACService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(value = "/member_event")
public class MemberEventController {

    @Autowired
    private MemberEventService eventService;
    @Autowired
    private MemberService memberService;
    @Autowired
    private RBACService rbacService;

    @RequestMapping(value = "/add")
    public String showAddPage(@RequestParam(value = "memberId", required = true) Long memberId, ModelMap map) {
        map.addAttribute("currUserName", rbacService.getCurrentUser().getRealName());

        map.addAttribute("memberId", memberId);

        return "haige.memberevent-add";
    }


    @RequestMapping(value = "/edit/{id}")
    public String showEditPage(@PathVariable("id") Long id, ModelMap map) {

        MemberEvent event = eventService.getMemberEvent(id);
        map.addAttribute("event", event);
        map.addAttribute("memberId", event.getLinkMember().getId());

        return "haige.memberevent-edit";
    }


    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String save(@RequestParam(value = "memberId", required = true) Long memberId,
                       MemberEvent event) {
        int changeTime = 0;
        //新建  直接加次数
        if (event.getId() == null)
            changeTime = event.getCostTimes();
        else {
            MemberEvent oriEvent = eventService.getMemberEvent(event.getId());
            int oriCost = oriEvent.getCostTimes();
            changeTime = event.getCostTimes() - oriCost;
        }
        Member member = memberService.getMemberById(memberId);
        event.setLinkMember(member);
        eventService.save(event);

        member.setLeftTime(member.getLeftTime() - changeTime);
        memberService.saveMember(member);
        return "redirect:/member/edit/" + Long.toString(memberId);
    }

    @RequestMapping(value = "/delete/{id}")
    public String delete(@PathVariable("id") long id) {
        MemberEvent event = eventService.getMemberEvent(id);
        Long memberId = event.getLinkMember().getId();

        Member member = event.getLinkMember();
        member.getEvent().remove(event);
        memberService.saveMember(member);

        return "redirect:/member/edit/" + Long.toString(memberId);
    }
}
