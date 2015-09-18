package com.haige.schedule.web.controller;

import com.haige.schedule.entity.User;
import com.haige.schedule.service.RBACService;
import com.haige.schedule.utils.Constants;
import com.mysql.jdbc.StringUtils;
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
@RequestMapping(value = "/rbac")
public class RBACController {

    @Autowired
    private RBACService rbacService;

    @RequestMapping(value = "/userList")
    public ModelAndView userList(@RequestParam(value = "queryName", required = false) String queryName,
                                 @RequestParam(value = "queryRoleId", required = false) Long queryRoleId,
                                 @PageableDefault Pageable page) {
        ModelAndView mv = new ModelAndView("haige.user-list");
        Page<User> users = rbacService.queryUsers(queryName, queryRoleId, page);
        mv.addObject("users", users.getContent());
        mv.addObject("roles", rbacService.getAllRoles());

        mv.addObject("queryName", queryName);
        mv.addObject("queryRoleId", queryRoleId);

        mv.addObject("page", users.getNumber() + 1);
        mv.addObject("totalPage", users.getTotalPages());
        mv.addObject("totalCount", users.getTotalElements());
        return mv;
    }

    @RequestMapping(value = "/addUser")
    public String showAddPage(ModelMap map) {
        map.addAttribute("roles", rbacService.getAllRoles());
        return "haige.user-add";
    }


    @RequestMapping(value = "/editUser/{id}")
    public String showEditPage(@PathVariable("id") Long id, ModelMap map) {
        User user = null;
        if (id != null) {
            user = rbacService.getUserById(id);
        }
        map.addAttribute("roles", rbacService.getAllRoles());
        map.addAttribute("user", user);

        return "haige.user-edit";
    }


    @RequestMapping(value = "/saveUser", method = RequestMethod.POST)
    public String saveUser(User user) {
        if (user.getId() == null)
            user.setPassword(Constants.DEFAULT_PASSWORD);
        rbacService.saveUser(user);
        return "redirect:/rbac/userList";
    }

    @RequestMapping(value = "/deleteUser/{id}")
    public String deleteUser(@PathVariable("id") long id) {
        rbacService.deleteUser(id);
        return "redirect:/rbac/userList";
    }

    @RequestMapping(value = "/toChangePassword")
    public String toChangePassword() {
        return "change-password";
    }


    @RequestMapping(value = "/changePassword", method = RequestMethod.POST)
    public ModelAndView changePassword(@RequestParam(value = "newPassword", required = true) String newPassword,
                                       @RequestParam(value = "confirmPassword", required = true) String confirmPassword) {

        if (StringUtils.isNullOrEmpty(newPassword) || StringUtils.isNullOrEmpty(confirmPassword)) {
            ModelAndView mav = new ModelAndView("/change-password");
            mav.addObject("checkMessage", "密码不可为空");
            return mav;
        }
        if (!newPassword.equals(confirmPassword)) {
            ModelAndView mav = new ModelAndView("/change-password");
            mav.addObject("checkMessage", "两次密码输入不一致");
            return mav;
        }
        User user = rbacService.getCurrentUser();
        user.setPassword(newPassword);
        rbacService.saveUser(user);
        ModelAndView mav = new ModelAndView("redirect:/index");
        return mav;
    }

    @RequestMapping(value = "/resetPassword/{id}", method = RequestMethod.GET)
    public String resetPassword(@PathVariable("id") long userId) {
        User user = rbacService.getUserById(userId);
        user.setPassword(Constants.DEFAULT_PASSWORD);
        rbacService.saveUser(user);
        return "redirect:/rbac/userList";
    }
}
