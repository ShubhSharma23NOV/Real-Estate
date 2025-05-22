package com.example.Real_Estate.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.Real_Estate.ServiceImpl.UServiceImpl;
import com.example.Real_Estate.entity.User;
import com.example.Real_Estate.entity.UserRole;

import jakarta.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private UServiceImpl userService;

    @GetMapping("/dashboard")
    public String adminDashboard(HttpSession session) {
        User admin = (User) session.getAttribute("user");
        if (admin == null || admin.getUr() != UserRole.ADMIN) {
            return "redirect:/login";
        }
        return "admin-dashboard";
    }

    @GetMapping("/users")
    public String manageUsers(Model model, HttpSession session) {
        User admin = (User) session.getAttribute("user");
        if (admin == null || admin.getUr() != UserRole.ADMIN) {
            return "redirect:/login";
        }
        
        // Get all users from the database
        List<User> users = userService.getAllUsers();
        model.addAttribute("users", users);
        
        return "admin-dashboard";
    }

    @GetMapping("/users/search")
    public String searchUsers(@RequestParam(required = false) String query,
                            @RequestParam(required = false) UserRole role,
                            Model model) {
        List<User> users = userService.searchUsers(query, role);
        model.addAttribute("users", users);
        return "admin-dashboard";
    }
} 