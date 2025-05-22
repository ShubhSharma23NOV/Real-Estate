package com.example.Real_Estate.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.Real_Estate.ServiceImpl.PropServiceImpl;
import com.example.Real_Estate.ServiceImpl.UServiceImpl;
import com.example.Real_Estate.entity.Properties;
import com.example.Real_Estate.entity.User;
import com.example.Real_Estate.entity.UserRole;

import jakarta.servlet.http.HttpSession;


@Controller
public class ViewController {

	@Autowired
	private UServiceImpl u1;
	
	
	@Autowired
	private PropServiceImpl p1;
	
	@RequestMapping("/")
	public String index() {
		return "index";
	}
	@GetMapping("/login")
	public String login(Model model) {
		return "login";
	}
	@PostMapping("/log")
	public String log(@RequestParam String email,
					 @RequestParam String password,
					 @RequestParam UserRole userType,
					 HttpSession session,
					 Model model) {
		User u = u1.login(email, password, userType);
		
		if(u != null) {
			session.setAttribute("user", u);
			if(userType.USER == u.getUr()) return "dashboard";
			else if(userType.ADMIN == u.getUr()) return "admin-dashboard";
			else return "agent";
		}
		
		model.addAttribute("error", "Invalid email or password. Please try again.");
		model.addAttribute("email", email);
		model.addAttribute("userType", userType);
		return "login";
	}
	@PostMapping("/regis")
	public String regis(@ModelAttribute User user) {
		u1.save(user);
		return "redirect:/login";
	}
	@RequestMapping("/register")
	public String register() {
		return "register";
	}
	@RequestMapping("/dashboard/properties")
	public String Property() {
		return "properties";
	}
	@GetMapping("/dashboard/profile")
	public String profile() {
		return "profile";
	}
	@RequestMapping("/dashboard/logout")
	public String logout() {
		return "login";
	}
	@RequestMapping("/agent")
	public String agent_dash() {
		return "agent";
	}
	@PostMapping("/agent/properties/add")
	public String addProperty(@ModelAttribute Properties p, HttpSession session) {
		User loggedInUser = (User) session.getAttribute("user");
		
		System.out.println(loggedInUser);
		
		p.setUser_id(loggedInUser);
		p1.add(p);
		return "redirect:/agent";
	}
}
