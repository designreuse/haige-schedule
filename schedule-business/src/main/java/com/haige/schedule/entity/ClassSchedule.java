package com.haige.schedule.entity;

import com.fasterxml.jackson.annotation.JsonFormat;

import javax.persistence.*;
import java.io.Serializable;
import java.sql.Date;
import java.sql.Time;
import java.util.List;

@Entity
@Table(name = "class_schedule")
public class ClassSchedule implements Serializable {
    @Id
    @Column(nullable = false, unique = true)
    @GeneratedValue
    private Long id;

    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
    private Date scheduleDate;

    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "HH:mm")
    private Time startTime;

    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "HH:mm")
    private Time endTime;

    @ManyToOne(cascade = CascadeType.REFRESH)
    @JoinColumn(name = "classId", nullable = false)
    private ClassBase classBase;

    @ManyToOne(cascade = CascadeType.REFRESH)
    @JoinColumn(name = "teacherId", nullable = false)
    private User teacher;

    @Column(length = 5000)
    private String comment;


    @ManyToMany(cascade = CascadeType.PERSIST, fetch = FetchType.LAZY)
    @JoinTable(name = "class_memberes",
            joinColumns = {@JoinColumn(name = "scheduleId", referencedColumnName = "scheduleId")},
            inverseJoinColumns = {@JoinColumn(name = "memberId", referencedColumnName = "memberId")})
    private List<Member> members;


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

    public List<Member> getMembers() {
        return members;
    }

    public void setMembers(List<Member> members) {
        this.members = members;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }
}
