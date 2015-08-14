package com.haige.schedule.service;

import com.haige.schedule.entity.Member;
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

    public Page<Member> queryMembers(final String memberName, String birthYear, Long advisorId, Pageable page) {
        List<Object> params = new ArrayList<>();
        String sql = "select * from members where 1=1 ";
        if (!StringUtil.isEmptyIncludeBlank(memberName)) {
            sql += " and realName like ? ";
            params.add("%" + memberName + "%");
        }
        if (!StringUtil.isEmptyIncludeBlank(birthYear)) {
            sql += " and year(birthday) = ? ";
            params.add(birthYear);
        }
        if (advisorId != null) {
            sql += " and advisorId = ? ";
            params.add(advisorId);
        }
//        SqlQueryModelBuilder builder = new SqlQueryModelBuilder();
//        List<SqlQueryItem> itemList = builder.builder(map);

        return memberDao.queryNativeSqlListEntity(sql, params.toArray(), page);
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

}
