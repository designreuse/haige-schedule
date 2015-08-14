package com.haige.schedule.repository;

import com.haige.schedule.entity.User;

import java.util.List;

public interface UserDao extends CommonRepository<User, Long> {

    User findByUserName(String userName);

    List<User> findByRoleId(Long roleId);
}
