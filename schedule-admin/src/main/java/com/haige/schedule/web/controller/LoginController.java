package com.haige.schedule.web.controller;

import com.haige.schedule.entity.User;
import com.haige.schedule.service.RBACService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
@RequestMapping(value = "/")
public class LoginController {
    @Autowired
    private RBACService rbacService;

    @RequestMapping(value = "/login", method = {RequestMethod.POST, RequestMethod.GET})
    public ModelAndView login() {
        ModelAndView mav = new ModelAndView("/login");
        return mav;
    }

    @RequestMapping(value = "/executeLogin", method = {RequestMethod.POST, RequestMethod.GET})
    public ModelAndView executeLogin(@RequestParam("username") String username, @RequestParam("password") String password) {
        Subject subject = SecurityUtils.getSubject();
//        String cipherPassword = password.length() > 0 ? CipherUtil.generatePassword(password) : "";

        UsernamePasswordToken token = new UsernamePasswordToken(username, password);
        token.setRememberMe(true);
        try {
            subject.login(token);
        } catch (UnknownAccountException e) {
            ModelAndView mav = new ModelAndView("/login");
            mav.addObject("checkMessage", "用户名不存在 或 密码错误!");
            return mav;
        } catch (IncorrectCredentialsException e) {
            ModelAndView mav = new ModelAndView("/login");
            mav.addObject("checkMessage", "用户名不存在 或 密码错误!");
            return mav;
        } catch (Exception e) {
            ModelAndView mav = new ModelAndView("/login");
            e.printStackTrace();
            mav.addObject("checkMessage", "登陆错误");
            return mav;
        }


        ModelAndView mav = new ModelAndView("redirect:/index");
        User user = rbacService.getCurrentUser();
        mav.addObject("user", user);
        return mav;
    }

    @RequestMapping("/logout")
    public ModelAndView logout() {
        Subject subject = SecurityUtils.getSubject();
        subject.logout();
        ModelAndView mav = new ModelAndView("redirect:/login");
        return mav;
    }


}
