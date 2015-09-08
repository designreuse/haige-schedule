package com.haige.schedule.service;

import com.haige.schedule.entity.ClassifClassType;
import com.haige.schedule.repository.ClassifClassTypeDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by lcheng on 2014/5/11.
 */
@Service
public class ClassifClassTypeService {

    @Autowired
    private ClassifClassTypeDao typeDao;

    public List<ClassifClassType> getAllClassTypes() {
        return typeDao.findAll();
    }

    public ClassifClassType getClassType(Long id) {
        return typeDao.findOne(id);
    }

    public void save(ClassifClassType classType) {
        typeDao.save(classType);
    }

    public void delete(Long id) {
        typeDao.delete(id);
    }
}
