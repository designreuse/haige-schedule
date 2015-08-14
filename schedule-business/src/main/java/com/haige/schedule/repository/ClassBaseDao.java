package com.haige.schedule.repository;

import com.haige.schedule.entity.ClassBase;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;


public interface ClassBaseDao extends JpaRepository<ClassBase, Long> {
    public Page<ClassBase> findByNameLike(String name, Pageable pageable);
}
