package com.example.Real_Estate.ServiceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.Real_Estate.Services.PropService;
import com.example.Real_Estate.entity.Properties;
import com.example.Real_Estate.repository.PropRepo;

@Service
public class PropServiceImpl implements PropService{
	@Autowired
	private PropRepo p1;

	@Override
	public Properties add(Properties p) {
		return p1.save(p);
	}
	
	

}
