package com.example.Real_Estate.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.Real_Estate.ServiceImpl.PropServiceImpl;
import com.example.Real_Estate.ServiceImpl.UServiceImpl;
import com.example.Real_Estate.Services.FavoriteService;
import com.example.Real_Estate.dto.PropertyDto;
import com.example.Real_Estate.entity.Favorite;
import com.example.Real_Estate.entity.Properties;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/user")
public class UserController {
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	@Autowired
	private UServiceImpl us;
	@Autowired
	private PropServiceImpl ps;
	@Autowired
	private FavoriteService favoriteService;

	@RequestMapping("/dashboard")
	public String dashboard(HttpSession session, Model model) {
		List<Properties> properties = ps.findAllProperties();
		session.setAttribute("Properties", properties);
		model.addAttribute("Properties", properties);
		return "dashboard";
	}

	@GetMapping("/property")
	@ResponseBody
	public String propertyDetail() {
		return "go"; // for ajax function
	}

	@RequestMapping("/property-details/{id}")
	public String showPropertyDetails(@PathVariable Long id, HttpSession session, Model model) {
		Properties p1 = ps.findById(id);
		model.addAttribute("prop", p1);
		return "property-details";
	}

	@GetMapping("/dashboard/filter")
	public String filter(@ModelAttribute PropertyDto propertyDto, Model model, HttpSession session, HttpServletRequest request) {
		List<Properties> filteredProperties = ps.findByFilter(propertyDto);
		model.addAttribute("Properties", filteredProperties);
		return "dashboard";
	}

	@PostMapping("/dashboard/clear-filters")
	@ResponseBody
	public String clearFilters(HttpSession session) {
		// Clear any filter-related attributes from the session
		session.removeAttribute("filteredProperties");
		return "success";
	}

	@PostMapping("/property/{id}/favorite")
	@ResponseBody
	public ResponseEntity<String> updateFavorite(@PathVariable Long id, @RequestBody java.util.Map<String, Object> payload, HttpSession session) {
		com.example.Real_Estate.entity.User user = (com.example.Real_Estate.entity.User) session.getAttribute("user");
		logger.info("/property/{}/favorite called", id);
		if (user == null) {
			logger.warn("No user in session");
			return ResponseEntity.status(401).body("Not logged in");
		}
		logger.info("User ID: {}", user.getId());
		Properties property = ps.findById(id);
		if (property == null) {
			logger.warn("Property not found: {}", id);
			return ResponseEntity.badRequest().body("Property not found");
		}
		logger.info("Property ID: {}", property.getId());
		Object favObj = payload.get("fav");
		if (favObj == null) {
			logger.warn("Missing 'fav' value");
			return ResponseEntity.badRequest().body("Missing 'fav' value");
		}
		boolean fav = Boolean.parseBoolean(favObj.toString());
		logger.info("Favorite value: {}", fav);
		if (fav) {
			favoriteService.addFavorite(user, property);
			logger.info("Favorite added for user {} and property {}", user.getId(), property.getId());
		} else {
			favoriteService.removeFavorite(user, property);
			logger.info("Favorite removed for user {} and property {}", user.getId(), property.getId());
		}
		return ResponseEntity.ok("Favorite status updated");
	}

	@GetMapping("/dashboard/favorites")
	public String favorites(HttpSession session, Model model) {
		com.example.Real_Estate.entity.User user = (com.example.Real_Estate.entity.User) session.getAttribute("user");
		if (user == null) {
			model.addAttribute("Properties", java.util.Collections.emptyList());
			return "favorites";
		}
		List<Favorite> favs = favoriteService.getFavoritesByUser(user);
		List<Properties> properties = new java.util.ArrayList<>();
		for (Favorite f : favs) {
			properties.add(f.getProperty());
		}
		model.addAttribute("Properties", properties);
		return "favorites";
	}
	
	@GetMapping("/appointment-form/{propertyId}")
	public String showAppointmentForm(@PathVariable("propertyId") Long propertyId, Model model, HttpSession session) {
		com.example.Real_Estate.entity.User user = (com.example.Real_Estate.entity.User) session.getAttribute("user");
		if (user == null) {
			return "redirect:/login";
		}
		
		Properties property = ps.findById(propertyId);
		model.addAttribute("prop", property);
		return "appointment-form";
	}
	
	@GetMapping("/property/{id}/favorite/status")
	@ResponseBody
	public ResponseEntity<java.util.Map<String, Boolean>> getFavoriteStatus(@PathVariable Long id, HttpSession session) {
		com.example.Real_Estate.entity.User user = (com.example.Real_Estate.entity.User) session.getAttribute("user");
		if (user == null) {
			return ResponseEntity.status(401).body(java.util.Collections.singletonMap("isFavorite", false));
		}
		
		Properties property = ps.findById(id);
		if (property == null) {
			return ResponseEntity.badRequest().body(java.util.Collections.singletonMap("isFavorite", false));
		}
		
		boolean isFavorite = favoriteService.isFavorite(user, property);
		return ResponseEntity.ok(java.util.Collections.singletonMap("isFavorite", isFavorite));
	}
}
