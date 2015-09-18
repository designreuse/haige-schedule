package com.haige.schedule.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.haige.schedule.utils.AgeUtil;
import com.haige.schedule.utils.Constants;

import javax.persistence.*;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "members")
public class Member {

    @Id
    @Column(nullable = false, unique = true)
    @GeneratedValue
    private Long id;

    @Column(length = 50, nullable = false, unique = true)
    private String memberName;

    @Column(length = 80)
    private String password;

    @Column(length = 50)
    private String nickName;

    @Enumerated
    @Column(nullable = false)
    private Constants.Sex sex;

    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
    @Column(nullable = false)
    private Date birthday;

    private Integer age;

    @Column(nullable = false)
    private Integer leftTime = 0;

    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
    private Date startDate;

    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
    @Column(nullable = false)
    private Date endDate;

    @Column(length = 50, nullable = false)
    private String realName;

    @Column(length = 50)
    private byte[] pic;

    @Column(length = 500)
    private String address;

    @Column(length = 500)
    private String registrationChannel;

    @Column(length = 5000)
    private String comment;

    @Column(length = 500)
    private String proType;

    @OneToMany(cascade = {CascadeType.ALL}, mappedBy = "linkMember")
    @JsonManagedReference
    private List<MemberLinkman> linkman = new ArrayList<MemberLinkman>();

    @OneToMany(cascade = {CascadeType.ALL}, mappedBy = "linkMember")
    @JsonManagedReference
    private List<MemberPayment> payment = new ArrayList<MemberPayment>();

    @ManyToOne(cascade = {CascadeType.MERGE, CascadeType.REFRESH})
    @JoinColumn(name = "advisorId", nullable = false)
    private User advisor;

    @ManyToOne(cascade = {CascadeType.MERGE, CascadeType.REFRESH})
    @JoinColumn(name = "phaseId", nullable = false)
    private Phase phase;


    //    @ManyToMany(cascade = CascadeType.PERSIST, fetch = FetchType.LAZY)
//    @org.hibernate.annotations.Fetch(FetchMode.SELECT)
//    @JoinTable(name = "class_members",
//            joinColumns = {@JoinColumn(name = "memberId", referencedColumnName = "id")},
//            inverseJoinColumns = {@JoinColumn(name = "scheduleId", referencedColumnName = "id")})
//    @ManyToMany(mappedBy = "members", cascade = CascadeType.REFRESH, fetch = FetchType.LAZY)
//    @OrderBy("id")
//    private Set<ClassSchedule> schedules = new HashSet<ClassSchedule>(0);


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getMemberName() {
        return memberName;
    }

    public void setMemberName(String memberName) {
        this.memberName = memberName;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public Constants.Sex getSex() {
        return sex;
    }

    public void setSex(Constants.Sex sex) {
        this.sex = sex;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public Integer getAge() {
        return AgeUtil.getAge(this.birthday);
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public Integer getLeftTime() {
        return leftTime;
    }

    public void setLeftTime(Integer leftTime) {
        this.leftTime = leftTime;
    }

    public byte[] getPic() {
        return pic;
    }

    public void setPic(byte[] pic) {
        this.pic = pic;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public List<MemberPayment> getPayment() {
        return payment;
    }

    public void setPayment(List<MemberPayment> payment) {
        this.payment = payment;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getRegistrationChannel() {
        return registrationChannel;
    }

    public void setRegistrationChannel(String registrationChannel) {
        this.registrationChannel = registrationChannel;
    }

    public User getAdvisor() {
        return advisor;
    }

    public void setAdvisor(User advisor) {
        this.advisor = advisor;
    }

    public List<MemberLinkman> getLinkman() {
        return linkman;
    }

    public void setLinkman(List<MemberLinkman> linkman) {
        this.linkman = linkman;
    }


    public String getProType() {
        return proType;
    }

    public void setProType(String proType) {
        this.proType = proType;
    }

    public Phase getPhase() {
        return phase;
    }

    public void setPhase(Phase phase) {
        this.phase = phase;
    }

    //    public Set<ClassSchedule> getSchedules() {
//        return schedules;
//    }
//
//    public void setSchedules(Set<ClassSchedule> schedules) {
//        this.schedules = schedules;
//    }
}
