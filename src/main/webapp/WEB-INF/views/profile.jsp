<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.Real_Estate.entity.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile - LuxuryEstate</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/darktheme.css">
</head>
<body>
    <header class="header">
        <nav class="nav-menu">
            <a href="${pageContext.request.contextPath}/dashboard">Dashboard</a>
            <a href="${pageContext.request.contextPath}/dashboard/favorites">My Favorites</a>
            <a href="${pageContext.request.contextPath}/dashboard/profile">Profile</a>
            <a href="${pageContext.request.contextPath}/login">Logout</a>
        </nav>
    </header>

    <main class="container">
        <div class="profile-container">
            <div class="profile-header">
                <div class="profile-avatar">
                    ${user.firstName.charAt(0)}${user.lastName.charAt(0)}
                </div>
                <h1>${user.firstName} ${user.lastName}</h1>
            </div>

            <div class="profile-info">
                <div class="info-group">
                    <div class="info-label">Email</div>
                    <div class="info-value">${user.email}</div>
                </div>

                <div class="info-group">
                    <div class="info-label">Phone</div>
                    <div class="info-value">${user.phoneNumber}</div>
                </div>

               

                <div class="info-group">
                    <div class="info-label">Account Type</div>
                    <div class="info-value">${user.ur}</div>
                </div>
            </div>

            <div class="text-center" style="margin-top: 2rem;">
                <button class="edit-button">Edit Profile</button>
            </div>
        </div>
    </main>

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
</body>
</html> 