<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.Real_Estate.entity.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - LuxuryEstate</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/darktheme.css">
    <style>
        .footer {
            background: #333;
            color: white;
            padding: 2rem 0;
            margin-top: 3rem;
        }

        .footer-content {
            max-width: 1200px;
            margin: 0 auto;
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 2rem;
            padding: 0 1rem;
        }

        .footer-section h3 {
            margin-bottom: 1rem;
            color: #fff;
        }

        .footer-section p {
            color: #ccc;
            line-height: 1.6;
        }

        .footer-section a {
            color: #ccc;
            text-decoration: none;
            display: block;
            margin-bottom: 0.5rem;
        }

        .footer-section a:hover {
            color: #fff;
        }

        .footer-bottom {
            text-align: center;
            padding-top: 2rem;
            margin-top: 2rem;
            border-top: 1px solid #444;
        }
    </style>
</head>
<body>

    <header class="header">
        <nav class="nav-menu">
            <a href="${pageContext.request.contextPath}/dashboard">Dashboard</a>
            <a href="${pageContext.request.contextPath}/dashboard/favorites">My Favorites</a>
            <a href="${pageContext.request.contextPath}/dashboard/profile">Profile</a>
            <a href="${pageContext.request.contextPath}/dashboard/logout">Logout</a>
        </nav>
    </header>

    <main class="container">
        <section class="mb-2">
            <h1 class="section-title">Welcome Back, <span>${user.firstName}</span></h1>
            
            <div class="property-grid">
                <!-- Featured Properties -->
                <div class="property-card">
                    <img src="https://images.unsplash.com/photo-1600585154340-be6161a56a0c?ixlib=rb-4.0.3" alt="Luxury Villa" class="property-image">
                    <div class="property-info">
                        <div class="property-price">$2,250,000</div>
                        <h3>Modern Luxury Villa</h3>
                        <p>6 Beds | 5 Baths | 5,500 sqft</p>
                        <p>Location: Beverly Hills, CA</p>
                        <button class="btn">Contact Agent</button>
                    </div>
                </div>

                <div class="property-card">
                    <img src="https://images.unsplash.com/photo-1600607687939-ce8a6c25118c?ixlib=rb-4.0.3" alt="Penthouse" class="property-image">
                    <div class="property-info">
                        <div class="property-price">$3,500,000</div>
                        <h3>Luxury Penthouse Suite</h3>
                        <p>4 Beds | 4.5 Baths | 4,800 sqft</p>
                        <p>Location: Downtown LA</p>
                        <button class="btn">Contact Agent</button>
                    </div>
                </div>

                <div class="property-card">
                    <img src="https://images.unsplash.com/photo-1600566753086-00f18fb6b3ea?ixlib=rb-4.0.3" alt="Beach House" class="property-image">
                    <div class="property-info">
                        <div class="property-price">$4,750,000</div>
                        <h3>Oceanfront Estate</h3>
                        <p>5 Beds | 6 Baths | 6,200 sqft</p>
                        <p>Location: Malibu, CA</p>
                        <button class="btn">Contact Agent</button>
                    </div>
                </div>

                <div class="property-card">
                    <img src="https://images.unsplash.com/photo-1600585154526-990dced4db0d?ixlib=rb-4.0.3" alt="Modern Home" class="property-image">
                    <div class="property-info">
                        <div class="property-price">$1,850,000</div>
                        <h3>Contemporary Family Home</h3>
                        <p>4 Beds | 3.5 Baths | 3,800 sqft</p>
                        <p>Location: Brentwood, CA</p>
                        <button class="btn">Contact Agent</button>
                    </div>
                </div>
            </div>
        </section>

        <section class="mb-2">
            <h2 class="section-title">Featured Listings</h2>
            <div class="property-grid">
                <div class="property-card">
                    <img src="https://images.unsplash.com/photo-1600607687920-4e2a09cf159d?ixlib=rb-4.0.3" alt="Luxury Apartment" class="property-image">
                    <div class="property-info">
                        <div class="property-price">$1,250,000</div>
                        <h3>Luxury Apartment</h3>
                        <p>2 Beds | 2.5 Baths | 2,200 sqft</p>
                        <p>Location: West Hollywood</p>
                        <button class="btn">Contact Agent</button>
                    </div>
                </div>

                <div class="property-card">
                    <img src="https://images.unsplash.com/photo-1600566753190-17f0baa2a6c3?ixlib=rb-4.0.3" alt="Mountain View Estate" class="property-image">
                    <div class="property-info">
                        <div class="property-price">$3,250,000</div>
                        <h3>Mountain View Estate</h3>
                        <p>5 Beds | 5.5 Baths | 5,000 sqft</p>
                        <p>Location: Bel Air, CA</p>
                        <button class="btn">Contact Agent</button>
                    </div>
                </div>
            </div>
        </section>

        <section class="mb-2">
            <h2 class="section-title">Recent Searches</h2>
            <div class="form-container">
                <div class="property-info">
                    <p>Beverly Hills Mansions</p>
                    <p>Downtown Penthouses</p>
                    <p>Beachfront Properties</p>
                </div>
            </div>
        </section>

        <section class="mb-2">
            <h2 class="section-title">Saved Searches</h2>
            <div class="form-container">
                <div class="property-info">
                    <p>Price Range: $1M - $2M</p>
                    <p>Location: Malibu</p>
                    <p>Features: Pool, Ocean View</p>
                </div>
            </div>
        </section>
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