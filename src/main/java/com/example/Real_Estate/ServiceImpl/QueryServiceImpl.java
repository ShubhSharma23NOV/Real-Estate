package com.example.Real_Estate.ServiceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.Real_Estate.Services.QueryService;
import com.example.Real_Estate.entity.Notification;
import com.example.Real_Estate.repository.QueryRepo;

@Service
public class QueryServiceImpl implements QueryService{
	
	@Autowired
	private QueryRepo q1;
	@Override
	public Notification register(Notification notify) {
		return q1.save(notify);
	}
	@Override
	public List<Notification> getAll(){
		return q1.findAll();
	}

}
