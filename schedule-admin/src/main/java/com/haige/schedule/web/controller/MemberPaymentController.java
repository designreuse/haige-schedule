package com.haige.schedule.web.controller;

import com.haige.schedule.entity.Member;
import com.haige.schedule.entity.MemberPayment;
import com.haige.schedule.service.MemberPaymentService;
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
@RequestMapping(value = "/member_payment")
public class MemberPaymentController {

    @Autowired
    private MemberPaymentService paymentService;
    @Autowired
    private MemberService memberService;

    @RequestMapping(value = "/add")
    public String showAddPage(@RequestParam(value = "memberId", required = true) Long memberId, ModelMap map) {
        map.addAttribute("memberId", memberId);
        map.addAttribute("sex", Constants.Sex.values());

        return "haige.memberpayment-add";
    }


    @RequestMapping(value = "/edit/{id}")
    public String showEditPage(@PathVariable("id") Long id, ModelMap map) {
        map.addAttribute("sex", Constants.Sex.values());

        MemberPayment payment = paymentService.getMemberPayment(id);
        map.addAttribute("payment", payment);
        map.addAttribute("memberId", payment.getLinkMember().getId());

        return "haige.memberpayment-edit";
    }


    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String save(@RequestParam(value = "memberId", required = true) Long memberId,
                       MemberPayment payment) {
        int changeTime = 0;
        //新建  直接加次数
        if (payment.getId() == null)
            changeTime = payment.getPurchaseCount();
        else {
            MemberPayment oriPayment = paymentService.getMemberPayment(payment.getId());
            int oriPurchase = oriPayment.getPurchaseCount();
            changeTime = payment.getPurchaseCount() - oriPurchase;
        }
        Member member = memberService.getMemberById(memberId);
        payment.setLinkMember(member);
        paymentService.save(payment);

        member.setLeftTime(member.getLeftTime() + changeTime);
        memberService.saveMember(member);
        return "redirect:/member/edit/" + Long.toString(memberId);
    }

    @RequestMapping(value = "/delete/{id}")
    public String delete(@PathVariable("id") long id) {
        MemberPayment payment = paymentService.getMemberPayment(id);
        Long memberId = payment.getLinkMember().getId();

        Member member = payment.getLinkMember();
        member.getPayment().remove(payment);
        memberService.saveMember(member);

        return "redirect:/member/edit/" + Long.toString(memberId);
    }
}
