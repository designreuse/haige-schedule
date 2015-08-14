package com.haige.schedule.repository;

import com.haige.schedule.entity.Member;

public interface MemberDao extends CommonRepository<Member, Long> {

    Member findByMemberName(String memberName);
}
