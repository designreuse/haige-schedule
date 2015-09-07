package com.haige.schedule.rbac;

import com.haige.schedule.dao.RBACService;
import com.haige.schedule.entity.User;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by lzheng on 2014/7/21.
 */
@SuppressWarnings("ALL")

public class ShiroDbRealm extends AuthorizingRealm {
    @Autowired
    private RBACService rbacService;


    @Override

    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        String name = principalCollection.getRealmNames().iterator().next();
        String userSn = (String) principalCollection.fromRealm(name).iterator().next();
        if (userSn != null) {
            SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
            String userRoleStr = rbacService.getUserRoleStr(userSn);
            info.addRole(userRoleStr);

            return info;
        }
        return null;
    }


    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) {
        UsernamePasswordToken token = (UsernamePasswordToken) authenticationToken;
        token.setRememberMe(true);
        String userName = token.getUsername();
        User user = rbacService.getUserByUserName(userName);

        if (user != null) {
            return new SimpleAuthenticationInfo(userName, user.getPassword(), user.getRealName());
        } else {
            return null;
        }
    }
}
