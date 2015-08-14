package com.haige.schedule.entity;

import com.fasterxml.jackson.annotation.JsonFormat;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Date;

@Entity
@Table(name = "member_payment")
public class MemberPayment {

    @Id
    @Column(nullable = false, unique = true)
    @GeneratedValue
    private Long id;


    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "memberId")
    private Member linkMember;

    @Column(length = 50)
    private Date payPerson;

    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
    private Date payDate;

    @Column(precision = 12, scale = 2)
    private BigDecimal payment;

    @Column()
    private int purchaseCount;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Date getPayDate() {
        return payDate;
    }

    public void setPayDate(Date payDate) {
        this.payDate = payDate;
    }

    public BigDecimal getPayment() {
        return payment;
    }

    public void setPayment(BigDecimal payment) {
        this.payment = payment;
    }

    public int getPurchaseCount() {
        return purchaseCount;
    }

    public void setPurchaseCount(int purchaseCount) {
        this.purchaseCount = purchaseCount;
    }

    public Member getLinkMember() {
        return linkMember;
    }

    public void setLinkMember(Member linkMember) {
        this.linkMember = linkMember;
    }

    public Date getPayPerson() {
        return payPerson;
    }

    public void setPayPerson(Date payPerson) {
        this.payPerson = payPerson;
    }
}
