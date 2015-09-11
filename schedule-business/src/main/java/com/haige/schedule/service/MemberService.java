package com.haige.schedule.service;

import com.haige.schedule.entity.Member;
import com.haige.schedule.exception.RepositoryException;
import com.haige.schedule.repository.MemberDao;
import com.haige.schedule.utils.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class MemberService {

    @Autowired
    private MemberDao memberDao;


    public Page<Member> getAllMember(Pageable page) {
        return memberDao.findAll(page);
    }

//    public Page<Member> queryMembers(final String memberName, Long advisorId, Pageable page) {
//        return queryMembers(memberName, null, advisorId, page);
//    }

    public Page<Member> queryMembers(final String memberName, String birthYear, Long phaseId, Long advisorId, Pageable page) {
        List<Object> params = new ArrayList<>();
        List<String> items = new ArrayList<String>();

        String sql = "select * from members where 1=1 ";
        if (!StringUtil.isEmptyIncludeBlank(memberName)) {
            sql += " and realName like :realName ";
            items.add("realName");
            params.add("%" + memberName + "%");
        }
        if (!StringUtil.isEmptyIncludeBlank(birthYear)) {
            sql += " and year(birthday) = :birthYear ";
            items.add("birthYear");
            params.add(birthYear);
        }
        if (phaseId != null) {
            sql += " and phaseId = :phaseId ";
            items.add("phaseId");
            params.add(phaseId);
        }
        if (advisorId != null) {
            sql += " and advisorId = :advisorId ";
            items.add("advisorId");
            params.add(advisorId);
        }

        String[] strArr = new String[items.size()];
        return memberDao.queryNativeSqlPageEntity(sql, items.toArray(strArr), params.toArray(), page);
    }

    public Page<Member> queryValidMembers(Long cmScheduleId, final String memberName, Long phaseId, Long advisorId, Pageable page) {
        if (cmScheduleId == null) {
            throw new RepositoryException("查询课程之外的会员时课程编号不能为空");
        }

        List<Object> params = new ArrayList<>();
        List<String> items = new ArrayList<String>();

        String sql = "select * from members where id not in (select memberid from class_schedule_members where scheduleId = :scheduleId)" +
                " and leftTime > 0 ";
        items.add("scheduleId");
        params.add(cmScheduleId);
        if (!StringUtil.isEmptyIncludeBlank(memberName)) {
            sql += " and realName like :realName ";
            items.add("realName");
            params.add("%" + memberName + "%");
        }
        if (phaseId != null) {
            sql += " and phaseId = :phaseId ";
            items.add("phaseId");
            params.add(phaseId);
        }
        if (advisorId != null) {
            sql += " and advisorId = :advisorId ";
            items.add("advisorId");
            params.add(advisorId);
        }

        String[] strArr = new String[items.size()];
        return memberDao.queryNativeSqlPageEntity(sql, items.toArray(strArr), params.toArray(), page);

    }

    public Member getMemberByMemberName(String memberName) {
        return memberDao.findByMemberName(memberName);
    }

    public Member getMemberById(long id) {
        return memberDao.findOne(id);
    }

    public void saveMember(Member member) {
        memberDao.save(member);
    }

    public void deleteMember(Long id) {
        memberDao.delete(id);
    }


    public Long getCount() {
        return memberDao.count();
    }


    public void changeLeftTime(Long id, Integer changeTiems) {
        Member member = memberDao.findOne(id);
        member.setLeftTime(member.getLeftTime() + changeTiems);
    }

}
