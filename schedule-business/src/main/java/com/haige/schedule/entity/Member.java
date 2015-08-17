package com.haige.schedule.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.haige.schedule.utils.AgeUtil;
import com.haige.schedule.utils.Constants;

import javax.persistence.*;
import java.util.Date;
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

    @Temporal(TemporalType.DATE)
    @Column(length = 10)
    private Date birthday;

    private Integer age;

    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date startDate;

    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date endDate;

    @Column(length = 50)
    private String realName;

    @Column(length = 50)
    private byte[] pic;

    @Column(length = 500)
    private String address;

    @Column(length = 500)
    private String registrationChannel;

    @Column(length = 5000)
    private String comment;

    @OneToMany(fetch = FetchType.EAGER, cascade = {CascadeType.ALL}, mappedBy = "linkMember")
    private List<MemberLinkman> linkman;

    @OneToMany(fetch = FetchType.EAGER, cascade = {CascadeType.ALL}, mappedBy = "linkMember")
    private List<MemberPayment> payment;

    @ManyToOne(cascade = {CascadeType.MERGE, CascadeType.REFRESH})
    @JoinColumn(name = "advisorId")
    private User advisor;

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
}
