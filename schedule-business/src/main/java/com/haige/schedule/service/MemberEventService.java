package com.haige.schedule.service;

import com.haige.schedule.entity.MemberEvent;
import com.haige.schedule.repository.MemberEventDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by lcheng on 2014/5/11.
 */
@Service
public class MemberEventService {

    @Autowired
    private MemberEventDao eventDao;

    public List<MemberEvent> getAllMemberEvents() {
        return eventDao.findAll();
    }

    public MemberEvent getMemberEvent(Long id) {
        return eventDao.findOne(id);
    }

    public void save(MemberEvent classBase) {
        eventDao.save(classBase);
    }

    public void delete(Long id) {
        eventDao.delete(id);
    }

}
