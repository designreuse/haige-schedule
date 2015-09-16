package com.haige.schedule.web.controller;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @author lzheng
 * @version 1.0
 *          ${tags}
 */
@Controller
@RequestMapping(value = "/login")
public class LoginController {
    @RequestMapping(method = {RequestMethod.GET, RequestMethod.POST})
    public String login() {
        Subject currentUser = SecurityUtils.getSubject();

        return "login";
    }
}
