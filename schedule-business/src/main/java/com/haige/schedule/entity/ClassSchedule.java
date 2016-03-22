package com.haige.schedule.entity;

import com.fasterxml.jackson.annotation.JsonFormat;

import javax.persistence.*;
import java.io.Serializable;
import java.sql.Date;
import java.sql.Time;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Entity
@Table(name = "class_schedule")
public class ClassSchedule implements Serializable {
    @Id
    @Column(nullable = false, unique = true)
    @GeneratedValue
    private Long id;

    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
    @Column(nullable = false)
    private Date scheduleDate;

    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "HH:mm")
    @Column(nullable = false)
    private Time startTime;

    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "HH:mm")
    @Column(nullable = false)
    private Time endTime;

    @ManyToOne(cascade = CascadeType.REFRESH)
    @JoinColumn(name = "classId", nullable = false)
    private ClassBase classBase;

    @ManyToOne(cascade = CascadeType.REFRESH)
    @JoinColumn(name = "creatorId", nullable = false)
    private User creator;

    @ManyToOne(cascade = CascadeType.REFRESH)
    @JoinColumn(name = "teacherId")
    private User teacher;

    @Column(nullable = false)
    private int costTimes;

    @Column(length = 5000)
    private String comment;

    @OneToMany(cascade = {CascadeType.REFRESH})
    @JoinColumn(name = "scheduleId")
    private List<ScheduleMember> scheduleMembers = new ArrayList<ScheduleMember>();

    @ManyToMany(cascade = CascadeType.REFRESH)
//    @org.hibernate.annotations.Fetch(FetchMode.SELECT)
    @JoinTable(name = "schedule_member",
            joinColumns = {@JoinColumn(name = "scheduleId")},
            inverseJoinColumns = {@JoinColumn(name = "memberId")})
    @OrderBy("id")
    private Set<Member> members = new HashSet<Member>(0);


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Date getScheduleDate() {
        return scheduleDate;
    }

    public void setScheduleDate(Date scheduleDate) {
        this.scheduleDate = scheduleDate;
    }

    public Time getStartTime() {
        return startTime;
    }

    public void setStartTime(Time startTime) {
        this.startTime = startTime;
    }

    public Time getEndTime() {
        return endTime;
    }

    public void setEndTime(Time endTime) {
        this.endTime = endTime;
    }

    public ClassBase getClassBase() {
        return classBase;
    }

    public void setClassBase(ClassBase classBase) {
        this.classBase = classBase;
    }

    public User getTeacher() {
        return teacher;
    }

    public void setTeacher(User teacher) {
        this.teacher = teacher;
    }

    public User getCreator() {
        return creator;
    }

    public void setCreator(User creator) {
        this.creator = creator;
    }

    public Set<Member> getMembers() {
        return members;
    }

    public void setMembers(Set<Member> members) {
        this.members = members;
    }

    public int getCostTimes() {
        return costTimes;
    }

    public void setCostTimes(int costTimes) {
        this.costTimes = costTimes;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public List<ScheduleMember> getScheduleMembers() {
        return scheduleMembers;
    }

    public void setScheduleMembers(List<ScheduleMember> scheduleMembers) {
        this.scheduleMembers = scheduleMembers;
    }
}
