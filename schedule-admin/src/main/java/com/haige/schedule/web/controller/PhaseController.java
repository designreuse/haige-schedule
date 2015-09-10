package com.haige.schedule.web.controller;

import com.haige.schedule.entity.Phase;
import com.haige.schedule.service.PhaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping(value = "/phase")
public class PhaseController {

    @Autowired
    private PhaseService phaseService;

    //@RequiresRoles({"admin"})
    @RequestMapping(value = "/list")
    public ModelAndView getList() {
        ModelAndView mv = new ModelAndView("haige.phase-list");
        List<Phase> phases = phaseService.getAllPhases();
        mv.addObject("phases", phases);
        return mv;
    }

    @RequestMapping(value = "/add")
    public String showAddPage() {
        return "haige.phase-add";
    }


    @RequestMapping(value = "/edit/{id}")
    public String showEditPage(@PathVariable("id") Long id, ModelMap map) {
        Phase phase = phaseService.getPhase(id);
        map.addAttribute("phase", phase);
        return "haige.phase-edit";
    }


    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String saveClassType(Phase phase) {
        phaseService.save(phase);
        return "redirect:/phase/list";
    }

    @RequestMapping(value = "/delete/{id}")
    public String deleteStore(@PathVariable("id") long id) {
        phaseService.delete(id);
        return "redirect:/phase/list";
    }
}
