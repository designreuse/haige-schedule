package com.haige.schedule.rbac;

import com.haige.schedule.entity.User;
import com.haige.schedule.service.RBACService;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;

/**
 * Created by lcheng on 2014/5/2.
 */
public class ShiroDatabaseRealm extends AuthorizingRealm {

    private static final String HASH_ALGORITHM = "md5";
    private static final int HASH_ITERATION = 2;

    private RBACService rbacService;


    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        User user = (User) principals.getPrimaryPrincipal();
        String userName = user.getUserName();
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        String userRoleStr = rbacService.getUserRoleStr(userName);
        info.addRole(userRoleStr);
//        for (String roleName : userRoleStr) {
//            info.addStringPermissions(rbacService.getRolePermissionStr(roleName));
//        }

        return info;
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authcToken)
            throws AuthenticationException {
        UsernamePasswordToken token = (UsernamePasswordToken) authcToken;
        String userName = token.getUsername();

        token.setRememberMe(true);
        User user = rbacService.getUserByUserName(userName);

        if (user != null) {
            return new SimpleAuthenticationInfo(user.getUserName(), user.getPassword(), user.getRealName());
        } else {
            return null;
        }

//
//            String userName = token.getUsername();
//            if (users != null && users.size() > 0) {
//                User user = users.get(0);
//                List<String> userColleges = rbacService.getAdminUserCollege(user.getRoleId());
//                long collegeId = -1;
//                String collegeName = "";
//                if (userColleges != null && userColleges.size() > 0) {
//                    String college = userColleges.get(0);
//                    if (!college.equals("超级管理员")) {
//                        List<College> cs = collegeService.getCollegeByName(college);
//                        if (cs != null && cs.size() > 0) {
//                            College c = cs.get(0);
//                            collegeId = c.getId();
//                            collegeName = c.getName();
//                        }
//                    }
//                }
//                ShiroUser shiroUser = new ShiroUser(user.getId(), user.getUserName(), user.getRealName());
//                shiroUser.setCollegeId(collegeId);
//                shiroUser.setCollegeName(collegeName);
//                SimpleAuthenticationInfo authenInfo = new SimpleAuthenticationInfo(shiroUser, user.getPassword(),
//                        ByteSource.Util.bytes(user.getSalt()), getName());
//                return authenInfo;
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//            return null;
//        }
//        return null;
    }

//    @PostConstruct
//    public void initCredentialsMatcher() {
//        CredentialsMatcher matcher = new InternalCredentialMatcher();
//        setCredentialsMatcher(matcher);
//    }

    public RBACService getRbacService() {
        return rbacService;
    }

    public void setRbacService(RBACService rbacService) {
        this.rbacService = rbacService;
    }


}
