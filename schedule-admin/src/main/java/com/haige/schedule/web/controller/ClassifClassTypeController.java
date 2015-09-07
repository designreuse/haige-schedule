package com.haige.schedule.web.controller;

import com.haige.schedule.dao.ClassifClassTypeService;
import com.haige.schedule.dao.RBACService;
import com.haige.schedule.entity.ClassifClassType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping(value = "/classtype")
public class ClassifClassTypeController {

    @Autowired
    private ClassifClassTypeService typeService;
    @Autowired
    private RBACService rbacService;

    //    @RequiresRoles({"admin"})
    @RequestMapping(value = "/list")
    public ModelAndView getClassTypeList() {
        ModelAndView mv = new ModelAndView("haige.classtype-list");
        List<ClassifClassType> allTypes = typeService.getAllClassTypes();
        mv.addObject("allTypes", allTypes);
        return mv;
    }

    @RequestMapping(value = "/add")
    public String showAddPage() {

        return "haige.classtype-add";
    }


    @RequestMapping(value = "/edit/{id}")
    public String showEditPage(@PathVariable("id") Long id, ModelMap map) {
        ClassifClassType type = null;
        if (id != null) {
            type = typeService.getClassType(id);
        }

        map.addAttribute("type", type);

        return "haige.classtype-edit";
    }


    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String saveClassType(ClassifClassType type) {
        typeService.save(type);
        return "redirect:/classtype/list";
    }

    @RequestMapping(value = "/delete/{id}")
    public String deleteStore(@PathVariable("id") long id) {
        typeService.delete(id);
        return "redirect:/classtype/list";
    }
}
