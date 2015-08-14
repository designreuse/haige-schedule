package com.haige.schedule.entity;

import javax.persistence.*;

@Entity
@Table(name = "users")
public class User {

    @Id
    @Column(nullable = false, unique = true)
    @GeneratedValue
    private Long id;

    @Column(length = 50, nullable = false, unique = true)
    private String userName;

    @Column(length = 80, nullable = false)
    private String password;

    @Column(length = 50, nullable = false)
    private String realName;


    @ManyToOne(cascade = CascadeType.REFRESH)
    @JoinColumn(name = "roleId", nullable = false)
    private Role role;

    @Column(length = 50)
    private String weChat;

    @Column(length = 50)
    private String tel;

    @Column(length = 50)
    private String tel1;

    @Column(length = 50)
    private String tel2;

    @Column(length = 50)
    private byte[] pic;

    @Column(length = 5000)
    private String comment;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
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

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public String getWeChat() {
        return weChat;
    }

    public void setWeChat(String weChat) {
        this.weChat = weChat;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
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
}
