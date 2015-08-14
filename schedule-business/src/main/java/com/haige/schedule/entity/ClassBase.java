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
@Table(name = "classes")
public class ClassBase implements Serializable {
    @Id
    @Column(nullable = false, unique = true)
    @GeneratedValue
    private Long id;

    @Column(length = 50)
    private String name;

    @Column(length = 50)
    private String type;

    @Column(length = 5000)
    private String recommend;

    @Column(length = 5000)
    private String comment;

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

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getRecommend() {
        return recommend;
    }

    public void setRecommend(String recommend) {
        this.recommend = recommend;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }
}
