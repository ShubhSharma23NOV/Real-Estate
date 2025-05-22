<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.Real_Estate.entity.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Properties - LuxuryEstate</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/darktheme.css">
</head>
<body>
    <header class="header">
        <nav class="nav-menu">
            <a href="${pageContext.request.contextPath}/dashboard">Dashboard</a>
            <a href="${pageContext.request.contextPath}/dashboard/favorites">My Favorites</a>
            <a href="${pageContext.request.contextPath}/dashboard/profile">Profile</a>
            <a href="/dashboard/properties">Property</a>
            <a href="${pageContext.request.contextPath}/dashboard/logout">Logout</a>
        </nav>
    </header>

    <div class="container mt-4">
        <h1 class="section-title">Property Listings</h1>
        
        <!-- Search and Filter Section -->
        <div class="filter-section">
            <form action="/properties" method="GET" class="row g-3">
                <div class="col-md-3">
                    <label for="propertyType" class="form-label">Property Type</label>
                    <select class="form-select" id="propertyType" name="propertyType">
                        <option value="">All Types</option>
                        <option value="house">House</option>
                        <option value="apartment">Apartment</option>
                        <option value="condo">Condo</option>
                        <option value="townhouse">Townhouse</option>
                    </select>
                </div>
                <div class="col-md-3">
                    <label for="priceRange" class="form-label">Price Range</label>
                    <select class="form-select" id="priceRange" name="priceRange">
                        <option value="">Any Price</option>
                        <option value="0-100000">$0 - $100,000</option>
                        <option value="100000-300000">$100,000 - $300,000</option>
                        <option value="300000-500000">$300,000 - $500,000</option>
                        <option value="500000+">$500,000+</option>
                    </select>
                </div>
                <div class="col-md-3">
                    <label for="bedrooms" class="form-label">Bedrooms</label>
                    <select class="form-select" id="bedrooms" name="bedrooms">
                        <option value="">Any</option>
                        <option value="1">1+</option>
                        <option value="2">2+</option>
                        <option value="3">3+</option>
                        <option value="4">4+</option>
                    </select>
                </div>
                <div class="col-md-3">
                    <label for="bathrooms" class="form-label">Bathrooms</label>
                    <select class="form-select" id="bathrooms" name="bathrooms">
                        <option value="">Any</option>
                        <option value="1">1+</option>
                        <option value="2">2+</option>
                        <option value="3">3+</option>
                    </select>
                </div>
                <div class="col-md-6">
                    <label for="location" class="form-label">Location</label>
                    <input type="text" class="form-control" id="location" name="location" placeholder="Enter city, state, or zip">
                </div>
                <div class="col-md-3">
                    <label for="sortBy" class="form-label">Sort By</label>
                    <select class="form-select" id="sortBy" name="sortBy">
                        <option value="newest">Newest</option>
                        <option value="price_low">Price: Low to High</option>
                        <option value="price_high">Price: High to Low</option>
                    </select>
                </div>
                <div class="col-md-3 d-flex align-items-end">
                    <button type="submit" class="btn btn-primary w-100">
                        <i class="fas fa-search"></i> Search Properties
                    </button>
                </div>
            </form>
        </div>

        <!-- Property Listings -->
        <div class="row">
            
        </div>

        <!-- Pagination -->
        <nav aria-label="Property listings pagination" class="mt-4">
            <ul class="pagination justify-content-center">
                <li class="page-item disabled">
                    <a class="page-link" href="#" tabindex="-1">Previous</a>
                </li>
                <li class="page-item active"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item">
                    <a class="page-link" href="#">Next</a>
                </li>
            </ul>
        </nav>
    </div>

    <footer class="footer">
        <div class="footer-content">
            <div class="footer-section">
                <h3>About LuxuryEstate</h3>
                <p>Your premier destination for luxury real estate properties. We connect discerning buyers with exceptional properties.</p>
            </div>
            <div class="footer-section">
                <h3>Quick Links</h3>
                <a href="${pageContext.request.contextPath}/dashboard">Dashboard</a>
                <a href="${pageContext.request.contextPath}/dashboard/favorites">My Favorites</a>
                <a href="${pageContext.request.contextPath}/dashboard/profile">Profile</a>
                <a href="/dashboard/properties">Property</a>
            </div>
            <div class="footer-section">
                <h3>Contact Us</h3>
                <p>Email: info@luxuryestate.com</p>
                <p>Phone: (555) 123-4567</p>
                <p>Address: 123 Luxury Lane, Beverly Hills, CA 90210</p>
            </div>
        </div>
        <div class="footer-bottom">
            <p>&copy; 2024 LuxuryEstate. All rights reserved.</p>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html> 