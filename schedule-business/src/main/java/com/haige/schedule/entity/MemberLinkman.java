package com.haige.schedule.entity;

import com.haige.schedule.utils.Types;

import javax.persistence.*;

@Entity
@Table(name = "member_linkman")
public class MemberLinkman {
    @Id
    @Column(nullable = false, unique = true)
    @GeneratedValue
    private Long id;


    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "memberId", nullable = false)
    private Member linkMember;

    @Enumerated
    @Column(nullable = false)
    private Types.Sex sex;


    @Column(length = 50)
    private String name;

    @Column(length = 50)
    private String tel;

    @Column(length = 50)
    private String tel1;

    @Column(length = 50)
    private String tel2;

    @Column(length = 50)
    private String weChat;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Types.Sex getSex() {
        return sex;
    }

    public void setSex(Types.Sex sex) {
        this.sex = sex;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getWeChat() {
        return weChat;
    }

    public void setWeChat(String weChat) {
        this.weChat = weChat;
    }

    public Member getLinkMember() {
        return linkMember;
    }

    public void setLinkMember(Member linkMember) {
        this.linkMember = linkMember;
    }

    public String getTel1() {
        return tel1;
    }

    public void setTel1(String tel1) {
        this.tel1 = tel1;
    }

    public String getTel2() {
        return tel2;
    }

    public void setTel2(String tel2) {
        this.tel2 = tel2;
    }
}
