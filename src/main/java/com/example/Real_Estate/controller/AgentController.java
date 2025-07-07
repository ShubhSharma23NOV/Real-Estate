package com.example.Real_Estate.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.Real_Estate.ServiceImpl.PropServiceImpl;
import com.example.Real_Estate.ServiceImpl.QueryServiceImpl;
import com.example.Real_Estate.ServiceImpl.UServiceImpl;
import com.example.Real_Estate.dto.PropertyDto;
import com.example.Real_Estate.entity.Notification;
import com.example.Real_Estate.entity.Properties;
import com.example.Real_Estate.entity.User;
import com.example.Real_Estate.entity.UserRole;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/agent")
public class AgentController {
	@Autowired
	private UServiceImpl u1;
	@Autowired
	private PropServiceImpl p1;
	@Autowired 
	private QueryServiceImpl q1;
//	@GetMapping("/properties/my")
//	public String agentMyProperties(HttpSession session,Model model) {
//		User user = (User) session.getAttribute("user");
//		if (user == null || user.getUr() != UserRole.AGENT) {
//			return "redirect:/login";
//		}
//		
//		List<Properties> properties = p1.findAllProperties();
//		model.addAttribute("AllProperties", properties);
//		model.addAttribute("user", user);
//		return "myproperties";
//	}
	@RequestMapping("/dashboard")
	public String agentDashboard(Model model, HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (user == null || user.getUr() != UserRole.AGENT) {
			return "redirect:/login";
		}
		
		List<Properties> properties = p1.findAllProperties();
		List<Notification> notifications = q1.getAll();
		long unreadCount = notifications.stream().filter(n -> !n.isRead()).count();
		model.addAttribute("AllProperties", properties);
		model.addAttribute("user", user);
		model.addAttribute("unreadCount", unreadCount);
		return "agent";
	}

	@GetMapping("/dashboard/filter")
	public String filterProperties(@ModelAttribute PropertyDto propertyDto, Model model, HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (user == null || user.getUr() != UserRole.AGENT) {
			return "redirect:/login";
		}
		
		List<Properties> filteredProperties = p1.findByFilter(propertyDto);
		model.addAttribute("AllProperties", filteredProperties);
		model.addAttribute("user", user);
		return "agent";
	}

	@PostMapping("/properties/add")
	public String addProperty(@ModelAttribute Properties p, HttpSession session) {
		User loggedInUser = (User) session.getAttribute("user");
		
		if (loggedInUser == null || loggedInUser.getUr() != UserRole.AGENT) {
			return "redirect:/login";
		}
		
		p.setUser_id(loggedInUser);
		p1.add(p);
		return "redirect:/agent/dashboard";
	}
	@RequestMapping("/notifications")
	public String notification(HttpSession session, Model model) {
		List<Notification> notification = q1.getAll();
		Properties property = (Properties) session.getAttribute("prop");
		model.addAttribute("prop", property);
		model.addAttribute("Notifications", notification);
		return "client";
	}
	
	@PostMapping("/notifications/updateReadStatus")
	public ResponseEntity<String> updateReadStatus(@RequestParam Long id, @RequestParam boolean isRead) {
		// TODO: Implement actual database update for notification read status
		// This should call a method in QueryServiceImpl to update the isRead field of the Notification entity
		// For now, returning success as a placeholder
		// q1.updateReadStatus(id, isRead);
		return ResponseEntity.ok("Status updated");
	}
}
