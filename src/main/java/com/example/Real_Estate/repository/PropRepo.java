package com.example.Real_Estate.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.Real_Estate.entity.Properties;

@Repository
public interface PropRepo extends JpaRepository<Properties,Long>{
	
}
