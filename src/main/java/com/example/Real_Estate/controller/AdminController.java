package com.example.Real_Estate.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.Real_Estate.ServiceImpl.PropServiceImpl;
import com.example.Real_Estate.ServiceImpl.UServiceImpl;
import com.example.Real_Estate.entity.Properties;
import com.example.Real_Estate.entity.User;
import com.example.Real_Estate.entity.UserRole;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	private UServiceImpl u1;
	
	
	@Autowired
	private PropServiceImpl p1;
	@RequestMapping("/dashboard")
	public String adminDashboard(Model model, HttpSession session) {
	User user = (User) session.getAttribute("user");
	if (user == null || user.getUr() != UserRole.ADMIN) {
		return "redirect:/login";
	}
	List<Properties> properties = p1.findAllProperties();
	List<Integer> UserList=u1.countUsers();
	int Total_User = UserList.get(0);
	int Total_Agent = UserList.get(1);
	int Total_Admin = UserList.get(2);
	
	
	model.addAttribute("total_users", Total_User);
	model.addAttribute("total_agent", Total_Agent);
	model.addAttribute("total_admin", Total_Admin);
	model.addAttribute("AllProperties", properties);
	model.addAttribute("user", user);
	return "admin-dashboard";
}
}
