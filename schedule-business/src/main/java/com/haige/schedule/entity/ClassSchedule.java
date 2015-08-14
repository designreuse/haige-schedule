package com.haige.schedule.entity;

import com.fasterxml.jackson.annotation.JsonFormat;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "class_schedule")
public class ClassSchedule implements Serializable {
    @Id
    @Column(nullable = false, unique = true)
    @GeneratedValue
    private Long id;

    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm")
    private Date startTime;

    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm")
    private Date endTime;

    @ManyToOne(cascade = CascadeType.REFRESH)
    @JoinColumn(name = "classId", nullable = false)
    private ClassBase classBase;

    @ManyToOne(cascade = CascadeType.REFRESH)
    @JoinColumn(name = "teacherId", nullable = false)
    private User teacher;

    @OneToMany(fetch = FetchType.EAGER, cascade = {CascadeType.ALL}, mappedBy = "member")
    private List<ClassMember> members;

    @Column(length = 5000)
    private String comment;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }


    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
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

    public List<ClassMember> getMembers() {
        return members;
    }

    public void setMembers(List<ClassMember> members) {
        this.members = members;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }
}
