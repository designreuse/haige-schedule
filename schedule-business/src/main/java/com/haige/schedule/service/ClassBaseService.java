package com.haige.schedule.service;

import com.haige.schedule.entity.ClassBase;
import com.haige.schedule.repository.ClassBaseDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by lcheng on 2014/5/11.
 */
@Service
public class ClassBaseService {

    @Autowired
    private ClassBaseDao classDao;

    public List<ClassBase> getAllClassBases() {
        return classDao.findAll();
    }

    public Page<ClassBase> getScheduleByName(String name, Pageable pageable) {
        return classDao.findByNameLike(name, pageable);
    }

    public ClassBase getClassBase(Long id) {
        return classDao.findOne(id);
    }

    public void save(ClassBase classBase) {
        classDao.save(classBase);
    }

    public void delete(Long id) {
        classDao.delete(id);
    }
}
