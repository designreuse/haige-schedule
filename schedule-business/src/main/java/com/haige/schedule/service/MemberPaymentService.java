package com.haige.schedule.service;

import com.haige.schedule.entity.MemberPayment;
import com.haige.schedule.repository.MemberPaymentDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by lcheng on 2014/5/11.
 */
@Service
public class MemberPaymentService {

    @Autowired
    private MemberPaymentDao paymentDao;

    public List<MemberPayment> getAllMemberPayments() {
        return paymentDao.findAll();
    }

    public MemberPayment getMemberPayment(Long id) {
        return paymentDao.findOne(id);
    }

    public void save(MemberPayment classBase) {
        paymentDao.save(classBase);
    }

    public void delete(Long id) {
        paymentDao.delete(id);
    }

}
