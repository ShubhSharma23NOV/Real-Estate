package com.example.Real_Estate.ServiceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.Real_Estate.Services.UserService;
import com.example.Real_Estate.entity.User;
import com.example.Real_Estate.entity.UserRole;
import com.example.Real_Estate.repository.UserRepo;

@Service
public class UServiceImpl implements UserService{

	@Autowired 
	private UserRepo u1;
	@Override
	public User save(User user) {
		return u1.save(user);
	}
	public User login(String email, String pass,UserRole role) {
		User u=u1.findByEmail(email);
		if(u!=null && u.getPassword().equals(pass) && u.getUr()==role) return u;
		return null;
	}
	@Override
	public List<User> getAllUsers() {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List<User> searchUsers(String query, UserRole role) {
		// TODO Auto-generated method stub
		return null;
	}
}
