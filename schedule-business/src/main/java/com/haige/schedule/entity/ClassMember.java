package com.haige.schedule.entity;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "class_members")
public class ClassMember implements Serializable {
    @Id
    @Column(nullable = false, unique = true)
    @GeneratedValue
    private Long id;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "scheduleId", nullable = false)
    private ClassSchedule schedule;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "memberId", nullable = false)
    private Member member;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public ClassSchedule getSchedule() {
        return schedule;
    }

    public void setSchedule(ClassSchedule schedule) {
        this.schedule = schedule;
    }

    public Member getMember() {
        return member;
    }

    public void setMember(Member member) {
        this.member = member;
    }
}
