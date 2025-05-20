package com.example.Real_Estate.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.Real_Estate.ServiceImpl.UServiceImpl;
import com.example.Real_Estate.entity.User;
import com.example.Real_Estate.entity.UserRole;
import com.example.Real_Estate.exception.UserNotFoundException;

import jakarta.servlet.http.HttpSession;


@Controller
public class ViewController {

	@Autowired
	private UServiceImpl u1;
	@RequestMapping("/")
	public String index() {
		return "index";
	}
	@RequestMapping("/login")
	public String login() {
		return "login";
	}
	@RequestMapping("/log")
	public String log(@RequestParam String email,@RequestParam String password,@RequestParam UserRole userType,HttpSession session) {
		User u=u1.login(email,password,userType);
		session.setAttribute("user", u);
		if(u!=null) return "dashboard";
		throw new UserNotFoundException("User not found");
	}
	@PostMapping("/regis")
	public String regis(@ModelAttribute User user) {
		System.out.println("User Object: " + user);
		u1.save(user);
		return "login";
	}
	@RequestMapping("/register")
	public String register() {
		return "register";
	}
	@RequestMapping("/dashboard")
	public String dashb() {
		return "dashboard";
	}
	@GetMapping("/dashboard/profile")
	public String profile() {
		return "profile";
	}
	@RequestMapping("/dashboard/logout")
	public String logout() {
		return "login";
	}
}
