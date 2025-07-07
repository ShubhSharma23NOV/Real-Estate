package com.example.Real_Estate.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.Real_Estate.entity.Notification;

@Repository
public interface QueryRepo extends JpaRepository<Notification,Long>{

}
