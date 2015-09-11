package com.haige.schedule.service;

import com.haige.schedule.entity.MemberLinkman;
import com.haige.schedule.repository.MemberLinkmanDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by lcheng on 2014/5/11.
 */
@Service
public class MemberLinkmanService {

    @Autowired
    private MemberLinkmanDao linkmanDao;

    public List<MemberLinkman> getAllMemberLinkmans() {
        return linkmanDao.findAll();
    }

    public MemberLinkman getMemberLinkman(Long id) {
        return linkmanDao.findOne(id);
    }

    public void save(MemberLinkman classBase) {
        linkmanDao.save(classBase);
    }

    public void delete(Long id) {
        linkmanDao.delete(id);
    }
}
