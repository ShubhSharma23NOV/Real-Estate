<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LuxuryEstate - Your Dream Home Awaits</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/darktheme.css">
    <style>
        .hero {
            position: relative;
            height: 600px;
            background: url('https://images.unsplash.com/photo-1613490493576-7fde63acd811?ixlib=rb-4.0.3') no-repeat center center;
            background-size: cover;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            margin-bottom: 3rem;
            border-radius: 15px;
            overflow: hidden;
        }

        .hero::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: rgba(0, 0, 0, 0.5);
            z-index: 1;
        }

        .hero-content {
            position: relative;
            z-index: 2;
            color: white;
            padding: 2rem;
        }

        .hero h1 {
            font-size: 3.5rem;
            margin-bottom: 1rem;
            color: white;
        }

        .hero p {
            font-size: 1.5rem;
            margin-bottom: 2rem;
        }
    </style>
</head>
<body>
    <header class="header">
        <nav class="nav-menu">
            <a href="${pageContext.request.contextPath}/">Home</a>
            <a href="${pageContext.request.contextPath}/login">Login</a>
            <a href="${pageContext.request.contextPath}/register">Register</a>
        </nav>
    </header>

    <main class="container">
        <section class="hero">
            <div class="hero-content">
                <h1>Welcome to LuxuryEstate</h1>
                <p>Discover Your Perfect Dream Home</p>
                <a href="${pageContext.request.contextPath}/register" class="btn">Get Started</a>
            </div>
        </section>

        <section class="featured-properties">
            <h2 class="section-title">Featured Properties</h2>
            <div class="property-grid">
                <div class="property-card">
                    <img src="https://images.unsplash.com/photo-1613977257363-707ba9348227?ixlib=rb-4.0.3" alt="Modern Villa with Pool" class="property-image">
                    <div class="property-info">
                        <div class="property-price">$1,250,000</div>
                        <h3>Modern Villa with Pool</h3>
                        <p>4 Beds | 3 Baths | 3,500 sqft</p>
                    </div>
                </div>

                <div class="property-card">
                    <img src="https://images.unsplash.com/photo-1512917774080-9991f1c4c750?ixlib=rb-4.0.3" alt="Luxury Apartment" class="property-image">
                    <div class="property-info">
                        <div class="property-price">$850,000</div>
                        <h3>Downtown Penthouse</h3>
                        <p>3 Beds | 2 Baths | 2,200 sqft</p>
                    </div>
                </div>

                <div class="property-card">
                    <img src="https://images.unsplash.com/photo-1613490493576-7fde63acd811?ixlib=rb-4.0.3" alt="Luxury Estate" class="property-image">
                    <div class="property-info">
                        <div class="property-price">$2,100,000</div>
                        <h3>Waterfront Estate</h3>
                        <p>5 Beds | 4.5 Baths | 4,800 sqft</p>
                    </div>
                </div>
            </div>
            <div class="text-center mb-2">
                <a href="${pageContext.request.contextPath}/login" class="btn">Login to View More Properties</a>
            </div>
        </section>

        <section class="mb-2">
            <h2 class="section-title">Why Choose LuxuryEstate?</h2>
            <div class="property-grid">
                <div class="property-card">
                    <img src="https://images.unsplash.com/photo-1560518883-ce09059eeffa?ixlib=rb-4.0.3" alt="Premium Properties" class="property-image">
                    <div class="property-info">
                        <h3>Premium Properties</h3>
                        <p>Exclusive access to high-end real estate</p>
                    </div>
                </div>

                <div class="property-card">
                    <img src="https://images.unsplash.com/photo-1600596542815-ffad4c1539a9?ixlib=rb-4.0.3" alt="Expert Agents" class="property-image">
                    <div class="property-info">
                        <h3>Expert Agents</h3>
                        <p>Professional guidance throughout your journey</p>
                    </div>
                </div>

                <div class="property-card">
                    <img src="https://images.unsplash.com/photo-1600585154340-be6161a56a0c?ixlib=rb-4.0.3" alt="Prime Locations" class="property-image">
                    <div class="property-info">
                        <h3>Prime Locations</h3>
                        <p>Properties in the most sought-after areas</p>
                    </div>
                </div>
            </div>
        </section>
    </main>

    <footer class="footer">
        <div class="footer-content">
            <p>&copy; 2024 LuxuryEstate. All rights reserved.</p>
        </div>
    </footer>
</body>
</html> 