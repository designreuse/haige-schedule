package com.haige.schedule.dao;

import com.haige.schedule.entity.Role;
import com.haige.schedule.entity.User;
import com.haige.schedule.repository.RoleDao;
import com.haige.schedule.repository.UserDao;
import com.haige.schedule.sql.builder.SqlQueryModelBuilder;
import com.haige.schedule.sql.model.SqlQueryItem;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author lzheng
 * @version 1.0
 *          ${tags}
 */
@Service("rbacService")
public class RBACService {

    @Autowired
    private UserDao userDao;
    @Autowired
    private RoleDao roleDao;


    public User getCurrentUser() {
        String userName = (String) SecurityUtils.getSubject().getPrincipal();

        return userDao.findByUserName(userName);
    }

    public Page<User> getAllUser(Pageable page) {
        return userDao.findAll(page);
    }

    public List<User> getAllAdvisor() {
        return userDao.findByRoleId((long) 3);
    }

    public List<User> getAllTeacher() {
        return userDao.findByRoleId((long) 2);
    }

    public Page<User> queryUsers(final String userName, Long roleId, Pageable page) {
        Map<String, Object> map = new HashMap<String, Object>();
        if (!StringUtils.isEmpty(userName)) {
            map.put("userName-li", userName);
        }
        if (roleId != null) {
            map.put("role.id", roleId);
        }
        SqlQueryModelBuilder builder = new SqlQueryModelBuilder();
        List<SqlQueryItem> itemList = builder.builder(map);

        return userDao.queryResult(itemList, null, page);


    }

    public User getUserByUserName(String userName) {
        return userDao.findByUserName(userName);
    }

    public User getUserById(long id) {
        return userDao.findOne(id);
    }

    public String getUserRoleStr(String userName) {
        User user = userDao.findByUserName(userName);
        return user.getRole().getRoleName();
    }

    public List<Role> getAllRoles() {
        return roleDao.findAll();
    }


    public void saveUser(User user) {
        userDao.save(user);
    }

    public void addRole(Role role) {
        roleDao.save(role);
    }


    public void deleteUser(Long id) {
        userDao.delete(id);
    }

    public void deleteRole(Long id) {
        roleDao.delete(id);
    }

}
