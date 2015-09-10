package com.haige.schedule.web.controller;

import com.haige.schedule.entity.ClassBase;
import com.haige.schedule.service.ClassBaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping(value = "/classbase")
public class ClassBaseController {

    @Autowired
    private ClassBaseService classBaseService;

    //@RequiresRoles({"admin"})
    @RequestMapping(value = "/list")
    public ModelAndView getClassTypeList() {
        ModelAndView mv = new ModelAndView("haige.classbase-list");
        List<ClassBase> allClasses = classBaseService.getAllClassBases();
        mv.addObject("allClasses", allClasses);
        return mv;
    }

    @RequestMapping(value = "/add")
    public String showAddPage() {
        return "haige.classbase-add";
    }


    @RequestMapping(value = "/edit/{id}")
    public String showEditPage(@PathVariable("id") Long id, ModelMap map) {
        ClassBase classbase = classBaseService.getClassBase(id);
        map.addAttribute("classbase", classbase);
        return "haige.classbase-edit";
    }


    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String saveClassType(ClassBase classBase) {
        classBaseService.save(classBase);
        return "redirect:/classbase/list";
    }

    @RequestMapping(value = "/delete/{id}")
    public String deleteStore(@PathVariable("id") long id) {
        classBaseService.delete(id);
        return "redirect:/classbase/list";
    }
}
