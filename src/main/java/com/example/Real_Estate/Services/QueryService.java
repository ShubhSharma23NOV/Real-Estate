package com.example.Real_Estate.Services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.Real_Estate.entity.Notification;
	
@Service
public interface QueryService {
	public Notification register(Notification notify);
	public List<Notification> getAll();
}
