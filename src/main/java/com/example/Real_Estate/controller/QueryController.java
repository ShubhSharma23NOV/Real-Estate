package com.example.Real_Estate.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.Real_Estate.ServiceImpl.PropServiceImpl;
import com.example.Real_Estate.ServiceImpl.QueryServiceImpl;
import com.example.Real_Estate.entity.Notification;
import com.example.Real_Estate.entity.Properties;
import com.example.Real_Estate.entity.User;

import jakarta.servlet.http.HttpSession;
import java.time.LocalDateTime;

@Controller
@RequestMapping("/query-form")
public class QueryController {

    @Autowired
    private PropServiceImpl propertyService;
    @Autowired
    private QueryServiceImpl queryService;
    
    @GetMapping("/{propertyId}")
    public String showQueryForm(@PathVariable Long propertyId, Model model,HttpSession session) {
        Properties property = propertyService.getPropertyById(propertyId);
        if (property != null) {
        	session.setAttribute("prop", property);
            model.addAttribute("property", property);
            return "query-form";
        }
        return "redirect:/user/dashboard";
    }

    @PostMapping("/send-query")
    	public String sendQuery(@ModelAttribute Notification notification,HttpSession session)
    {
        
    	User user = (User) session.getAttribute("user");
        Properties Property=(Properties)session.getAttribute("prop");
        if (user == null) {
            return "redirect:/login";
        }
        notification.setBuyer(user);
        Notification notification1=queryService.register(notification);
        return "redirect:/user/dashboard";
    }
} 