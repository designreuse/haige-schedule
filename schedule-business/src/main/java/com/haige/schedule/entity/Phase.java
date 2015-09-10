package com.haige.schedule.entity;

import javax.persistence.*;
import java.io.Serializable;

/**
 * 记录参考人员的一次
 *
 * @author lzheng
 * @version 1.0
 */
@Entity
@Table(name = "phase")
public class Phase implements Serializable {
    @Id
    @Column(nullable = false, unique = true)
    @GeneratedValue
    private Long id;

    @Column(length = 50, nullable = false)
    private String name;

    @Column(length = 5000)
    private String recommend;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getRecommend() {
        return recommend;
    }

    public void setRecommend(String recommend) {
        this.recommend = recommend;
    }
}
