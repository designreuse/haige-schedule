package com.haige.schedule.service;

import com.haige.schedule.entity.Phase;
import com.haige.schedule.repository.PhaseDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by lcheng on 2014/5/11.
 */
@Service
public class PhaseService {

    @Autowired
    private PhaseDao phaseDao;

    public List<Phase> getAllPhases() {
        return phaseDao.findAll();
    }

    public Phase getPhase(Long id) {
        return phaseDao.findOne(id);
    }

    public void save(Phase phaseBase) {
        phaseDao.save(phaseBase);
    }

    public void delete(Long id) {
        phaseDao.delete(id);
    }
}
