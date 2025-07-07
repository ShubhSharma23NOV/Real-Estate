<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.Real_Estate.entity.User,java.util.List,com.example.Real_Estate.entity.Properties" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Dashboard - LuxuryEstate</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/newcss.css">
    <style>
        body {
            background-color: var(--light-bg);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .dashboard-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 2rem 1rem;
            min-height: 100vh;
        }

        .welcome-section {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            border-radius: 20px;
            padding: 2.5rem;
            margin-bottom: 2rem;
            color: white;
            box-shadow: 0 8px 24px rgba(0,0,0,0.12);
            position: relative;
            overflow: hidden;
        }

        .welcome-section::before {
            content: '';
            position: absolute;
            top: 0;
            right: 0;
            width: 300px;
            height: 300px;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 50%;
            transform: translate(30%, -30%);
        }

        .welcome-section h1 {
            font-size: 2.5rem;
            font-weight: 700;
            margin-bottom: 0.5rem;
            position: relative;
        }

        .welcome-section p {
            font-size: 1.1rem;
            opacity: 0.9;
            margin-bottom: 0;
            position: relative;
        }

        .filter-section {
            width: 100%;
            margin-bottom: 2rem;
            display: flex;
            justify-content: center;
        }

        .filter-section .card {
            max-width: 900px;
            width: 100%;
            margin: 0 auto;
        }

        .filter-section .card-body {
            padding: 1.2rem 1.2rem 0.8rem 1.2rem;
        }

        .filter-row {
            display: flex;
            flex-wrap: wrap;
            gap: 1rem;
            margin-bottom: 1rem;
        }

        .filter-group {
            flex: 1 1 28%;
            min-width: 220px;
            background: var(--light-bg);
            padding: 0.8rem 1rem;
            border-radius: 10px;
            transition: all 0.3s ease;
            box-sizing: border-box;
        }

        .filter-group:hover {
            box-shadow: 0 4px 12px rgba(0,0,0,0.05);
        }

        .filter-group label {
            display: block;
            margin-bottom: 0.75rem;
            font-weight: 500;
            color: var(--secondary-color);
            font-size: 0.95rem;
        }

        .filter-group .form-select,
        .filter-group .form-control {
            width: 100%;
            padding: 0.75rem 1rem;
            border: 1px solid #e2e8f0;
            border-radius: 8px;
            transition: all 0.3s ease;
            font-size: 0.95rem;
        }

        .filter-group .form-select:focus,
        .filter-group .form-control:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgba(var(--primary-rgb), 0.1);
        }

        .filter-group .input-group {
            display: flex;
            align-items: stretch;
        }

        .filter-group .input-group .form-control {
            flex: 1;
            border-top-right-radius: 0;
            border-bottom-right-radius: 0;
        }

        .filter-group .input-group .form-select {
            border-top-left-radius: 0;
            border-bottom-left-radius: 0;
            max-width: 120px;
        }

        .filter-actions {
            display: flex;
            gap: 1rem;
            justify-content: flex-end;
            margin-top: 1rem;
            padding-top: 1rem;
            border-top: 1px solid var(--light-bg);
        }

        .filter-btn {
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            padding: 0.75rem 1.5rem;
            border-radius: 8px;
            font-weight: 500;
            transition: all 0.3s ease;
            border: none;
            cursor: pointer;
            font-size: 0.95rem;
        }

        .filter-btn i {
            font-size: 1rem;
        }

        .filter-btn-primary {
            background: var(--primary-color);
            color: white;
        }

        .filter-btn-primary:hover {
            background: var(--primary-dark);
            transform: translateY(-2px);
        }

        .filter-btn-secondary {
            background: white;
            color: var(--primary-color);
            border: 1px solid var(--primary-color);
        }

        .filter-btn-secondary:hover {
            background: var(--primary-color);
            color: white;
            transform: translateY(-2px);
        }

        .property-cards-section {
            width: 100%;
            margin-top: 0;
        }

        .property-grid {
            width: 100%;
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(320px, 1fr));
            gap: 2rem;
            padding: 0;
            margin: 0;
        }

        .property-card {
            background: rgba(255, 255, 255, 0.25);
            box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.18);
            backdrop-filter: blur(8px);
            -webkit-backdrop-filter: blur(8px);
            border-radius: 15px;
            border: 1px solid rgba(255, 255, 255, 0.25);
            transition: box-shadow 0.3s, transform 0.3s, background 0.3s;
            position: relative;
            opacity: 0;
            transform: translateY(40px);
            animation: fadeInUp 0.8s forwards;
        }

        .property-card.hot {
            border: 2px solid #ff6a00;
            box-shadow: 0 0 24px 0 rgba(255, 106, 0, 0.15);
        }

        .property-card .hot-badge {
            position: absolute;
            top: 18px;
            left: 18px;
            background: linear-gradient(90deg, #ff6a00, #ffb347);
            color: #fff;
            font-size: 0.85rem;
            font-weight: 600;
            padding: 0.35em 1em;
            border-radius: 20px;
            z-index: 2;
            box-shadow: 0 2px 8px rgba(255,106,0,0.12);
            letter-spacing: 1px;
        }

        .property-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.2);
        }

        .property-image {
            position: relative;
            height: 220px;
            overflow: hidden;
        }

        .property-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.3s ease;
        }

        .property-card:hover .property-image img {
            transform: scale(1.05);
        }

        .property-fav {
            position: absolute;
            top: 1rem;
            right: 1rem;
            background: white;
            width: 35px;
            height: 35px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            z-index: 2;
            transition: all 0.3s ease;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }

        .property-fav:hover {
            transform: scale(1.1);
            box-shadow: 0 4px 12px rgba(0,0,0,0.15);
        }

        .property-fav.favorited i {
            color: #ff4d4d;
        }

        .property-overlay {
            position: absolute;
            bottom: 0;
            left: 0;
            right: 0;
            padding: 1.5rem;
            background: linear-gradient(to top, rgba(0,0,0,0.8), transparent);
            color: white;
        }

        .property-overlay-top {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 0.5rem;
        }

        .property-price {
            font-size: 1.5rem;
            font-weight: 600;
        }

        .property-status {
            padding: 0.35rem 1rem;
            border-radius: 20px;
            font-size: 0.875rem;
            font-weight: 500;
        }

        .status-available {
            background: #4CAF50;
        }

        .status-rent {
            background: #2196F3;
        }

        .status-sold {
            background: #f44336;
        }

        .property-info {
            padding: 1.5rem;
        }

        .property-info h3 {
            font-size: 1.25rem;
            font-weight: 600;
            margin-bottom: 0.75rem;
            color: var(--secondary-color);
        }

        .property-info p {
            color: #666;
            margin-bottom: 1rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .property-features {
            display: flex;
            gap: 1rem;
            margin-bottom: 1.5rem;
            flex-wrap: wrap;
        }

        .feature {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            color: #666;
            font-size: 0.875rem;
            background: var(--light-bg);
            padding: 0.5rem 0.75rem;
            border-radius: 6px;
        }

        .property-actions {
            display: flex;
            gap: 1rem;
        }

        .property-actions .btn {
            flex: 1;
            padding: 0.75rem;
            border-radius: 8px;
            font-weight: 500;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
        }

        .property-actions .btn-primary {
            background: var(--primary-color);
            border: none;
        }

        .property-actions .btn-primary:hover {
            background: var(--primary-dark);
            transform: translateY(-2px);
        }

        .property-actions .btn-outline {
            border: 1px solid var(--primary-color);
            color: var(--primary-color);
        }

        .property-actions .btn-outline:hover {
            background: var(--primary-color);
            color: white;
            transform: translateY(-2px);
        }

        .no-properties {
            text-align: center;
            padding: 4rem 2rem;
            background: white;
            border-radius: 15px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .no-properties i {
            color: var(--primary-color);
            margin-bottom: 1.5rem;
            opacity: 0.5;
        }

        .no-properties h3 {
            color: var(--secondary-color);
            margin-bottom: 0.75rem;
            font-size: 1.5rem;
        }

        .no-properties p {
            color: #666;
            margin-bottom: 0;
            font-size: 1.1rem;
        }

        @media (max-width: 1280px) {
            .dashboard-container {
                max-width: 98vw;
            }
        }

        @media (max-width: 1100px) {
            .filter-group {
                flex: 1 1 45%;
                min-width: 200px;
            }
        }

        @media (max-width: 768px) {
            .dashboard-container {
                padding: 1rem 0.5rem;
            }
            .card-body {
                padding: 1.2rem 0.7rem 1rem 0.7rem;
            }
            .property-grid {
                grid-template-columns: 1fr;
                gap: 1.5rem;
            }
            .filter-row {
                flex-direction: column;
                gap: 1rem;
            }
            .filter-group {
                width: 100%;
                min-width: 0;
            }
        }

        @media (max-width: 950px) {
            .filter-section .card {
                max-width: 100%;
            }
        }

        @keyframes fadeInUp {
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Stagger animation for cards */
        .property-card.animated {
            animation-delay: var(--delay, 0s);
        }

        /* Heatmap container */
        .heatmap-section {
            width: 100%;
            max-width: 900px;
            margin: 0 auto 2rem auto;
            background: rgba(255,255,255,0.7);
            border-radius: 16px;
            box-shadow: 0 4px 24px rgba(0,0,0,0.08);
            padding: 1.5rem 2rem;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .heatmap-title {
            font-size: 1.2rem;
            font-weight: 600;
            color: var(--secondary-color);
            margin-bottom: 1rem;
        }

        /* Common Navbar */
        .glass-navbar {
            background: rgba(255,255,255,0.7)!important;
            backdrop-filter: blur(8px);
            -webkit-backdrop-filter: blur(8px);
            border-radius: 0 0 18px 18px;
            border-bottom: 1px solid rgba(200,200,200,0.18);
        }
        .glass-navbar .navbar-brand {
            color: var(--primary-color);
            font-size: 1.4rem;
        }
        .glass-navbar .nav-link {
            color: var(--secondary-color);
            font-weight: 500;
            margin-left: 1rem;
            transition: color 0.2s;
        }
        .glass-navbar .nav-link.active, .glass-navbar .nav-link:hover {
            color: var(--primary-color);
        }
        .glass-navbar .nav-link.text-danger {
            color: #e74c3c !important;
        }
        @media (max-width: 768px) {
            .glass-navbar {
                border-radius: 0 0 12px 12px;
            }
            .glass-navbar .nav-link {
                margin-left: 0.5rem;
            }
        }

        .footer {
            background: #f8f9fa;
            color: #6c757d;
            font-size: 1rem;
            border-radius: 12px 12px 0 0;
            box-shadow: 0 -2px 12px rgba(0,0,0,0.04);
        }
    </style>
</head>
<body>
    <!-- Revert to original Top Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/user/dashboard">
                <i class="fas fa-home me-2"></i>LuxuryEstate
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/user/dashboard">
                            <i class="fas fa-tachometer-alt me-1"></i>Dashboard
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/user/dashboard/favorites">
                            <i class="fas fa-heart me-1"></i>My Favorites
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/profile">
                            <i class="fas fa-user me-1"></i>Profile
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/logout">
                            <i class="fas fa-sign-out-alt me-1"></i>Logout
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="dashboard-container">
        <!-- Welcome Section -->
        <div class="welcome-section">
            <h1>Welcome Back, <span>${user.firstName}</span></h1>
            <p>Find your dream property from our extensive collection.</p>
        </div>

        <%
            java.util.Map<String, String> propertyTypeDisplay = new java.util.HashMap<>();
            propertyTypeDisplay.put("APARTMENT_FLAT", "Apartment / Flat");
            propertyTypeDisplay.put("INDEPENDENT_HOUSE_VILLA", "Independent House / Villa");
            propertyTypeDisplay.put("BUILDER_FLOOR_APARTMENT", "Builder Floor Apartment");
            propertyTypeDisplay.put("STUDIO_APARTMENT", "Studio Apartment");
            propertyTypeDisplay.put("PENTHOUSE", "Penthouse");
            propertyTypeDisplay.put("ROW_HOUSE_TOWNHOUSE", "Row House / Townhouse");
            propertyTypeDisplay.put("RESIDENTIAL_PLOT_LAND", "Residential Plot / Land");
            propertyTypeDisplay.put("COMMERCIAL_OFFICE_SPACE", "Commercial Office Space");
            propertyTypeDisplay.put("SHOP_SHOWROOM", "Shop / Showroom");
            propertyTypeDisplay.put("WAREHOUSE_GODOWN", "Warehouse / Godown");
            propertyTypeDisplay.put("INDUSTRIAL_LAND_FACTORY", "Industrial Land / Factory");
            propertyTypeDisplay.put("AGRICULTURAL_LAND_FARMLAND", "Agricultural Land / Farmland");
            propertyTypeDisplay.put("MIXED_USE_PROPERTY", "Mixed-Use Property");
            propertyTypeDisplay.put("CO_WORKING_SPACE", "Co-working Space");
            propertyTypeDisplay.put("VACANT_LAND_NON_AGRICULTURAL", "Vacant Land (Non-agricultural)");
            %>

            <!-- Search and Filters -->
        <div class="filter-section">
            <div class="card">
                <div class="card-body">
                    <form id="propertyFilter" action="${pageContext.request.contextPath}/user/dashboard/filter" method="GET">
                        <div class="filter-row">
                            <div class="filter-group">
                                <label for="propertyType">Property Type</label>
                                <select id="propertyType" name="propertyType" class="form-select">
                                <option value="">All Types</option>
                                <option value="APARTMENT_FLAT">Apartment / Flat</option>
                                <option value="INDEPENDENT_HOUSE_VILLA">Independent House / Villa</option>
                                <option value="BUILDER_FLOOR_APARTMENT">Builder Floor Apartment</option>
                                <option value="STUDIO_APARTMENT">Studio Apartment</option>
                                <option value="PENTHOUSE">Penthouse</option>
                                <option value="ROW_HOUSE_TOWNHOUSE">Row House / Townhouse</option>
                                <option value="RESIDENTIAL_PLOT_LAND">Residential Plot / Land</option>
                                <option value="COMMERCIAL_OFFICE_SPACE">Commercial Office Space</option>
                                <option value="SHOP_SHOWROOM">Shop / Showroom</option>
                                <option value="WAREHOUSE_GODOWN">Warehouse / Godown</option>
                                <option value="INDUSTRIAL_LAND_FACTORY">Industrial Land / Factory</option>
                                <option value="AGRICULTURAL_LAND_FARMLAND">Agricultural Land / Farmland</option>
                                <option value="MIXED_USE_PROPERTY">Mixed-Use Property</option>
                                <option value="CO_WORKING_SPACE">Co-working Space</option>
                                <option value="VACANT_LAND_NON_AGRICULTURAL">Vacant Land (Non-agricultural)</option>
                            </select>
                        </div>
                            
                            <div class="filter-group">
                                <label for="status">Status</label>
                                <select id="status" name="status" class="form-select">
                                <option value="">All Status</option>
                                <option value="AVAILABLE">Available</option>
                                    <option value="SOLD">Sold</option>
                                <option value="RENT">Rent</option>
                                <option value="PRE_LAUNCH">Pre-launch</option>
                            </select>
                        </div>
                            
                            <div class="filter-group">
                                <label for="city">City</label>
                                <input type="text" id="city" name="city" class="form-control" placeholder="Enter city" list="cityList">
                            <datalist id="cityList">
                                <option value="Indore, Madhya Pradesh">
                                <option value="Bhopal, Madhya Pradesh">
                                <option value="Jabalpur, Madhya Pradesh">
                                <option value="Gwalior, Madhya Pradesh">
                                <option value="Ujjain, Madhya Pradesh">
                            </datalist>
                        </div>
                            
                            <div class="filter-group">
                                <label for="address">Address</label>
                                <input type="text" id="address" name="address" class="form-control" placeholder="Enter address">
                            </div>
                            
                            <div class="filter-group">
                                <label for="price">Price Range</label>
                                <select id="price" name="price" class="form-select">
                                    <option value="">Any Price</option>
                                    <option value="100000">Under $100,000</option>
                                    <option value="200000">Under $200,000</option>
                                    <option value="300000">Under $300,000</option>
                                    <option value="400000">Under $400,000</option>
                                    <option value="500000">Under $500,000</option>
                                    <option value="750000">Under $750,000</option>
                                    <option value="1000000">Under $1,000,000</option>
                                    <option value="2000000">Under $2,000,000</option>
                                    <option value="3000000">Under $3,000,000</option>
                                    <option value="4000000">Under $4,000,000</option>
                                    <option value="5000000">Under $5,000,000</option>
                                </select>
                        </div>
                            
                            <div class="filter-group">
                                <label for="area">Area</label>
                            <div class="input-group">
                                    <input type="number" id="area" name="area" class="form-control" placeholder="Enter area" min="0" step="0.01">
                                    <select class="form-select" id="areaUnit" name="areaUnit" style="max-width: 100px;">
                                    <option value="sqft">sq ft</option>
                                    <option value="sqm">sq m</option>
                                    <option value="acres">acres</option>
                                    <option value="hectares">hectares</option>
                                </select>
                            </div>
                        </div>
                        </div>
                        
                        <div class="filter-actions">
                            <button type="submit" class="filter-btn filter-btn-primary">
                                <i class="fas fa-search"></i>
                                Apply Filters
                            </button>
                            <button type="button" class="filter-btn filter-btn-secondary" onclick="clearFilters()">
                                <i class="fas fa-times"></i>
                                Clear
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!-- Heatmap Section (Chart.js) -->
        <div class="heatmap-section">
            <div class="heatmap-title">Demand by City (Sample Data)</div>
            <canvas id="heatmapChart" height="60"></canvas>
        </div>

        <!-- Property Cards -->
            <div class="property-cards-section">
            <div class="property-grid">
                    <% List<Properties> properties = (List<Properties>)request.getAttribute("Properties"); %>
                    <% if(properties != null && !properties.isEmpty()) { %>
                        <% for(Properties p1 : properties) { %>
                            <div class="property-card" data-property-id="<%= p1.getId() %>">
                                <div class="property-image">
                                <span class="property-fav" data-property-id="<%= p1.getId() %>">
                                    <i class="far fa-heart"></i>
                                    </span>
                                    <img src="https://images.unsplash.com/photo-1600585154340-be6161a56a0c?ixlib=rb-4.0.3" alt="<%= p1.getPropertyType() %>">
                                    <div class="property-overlay">
                                        <div class="property-overlay-top">
                                            <span class="property-price">$<%= p1.getPrice() %></span>
                                            <span class="property-status status-<%= p1.getStatus().toString().toLowerCase() %>">
                                                <%= p1.getStatus() %>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="property-info">
                                    <h3><%= propertyTypeDisplay.getOrDefault(p1.getPropertyType().toString(), p1.getPropertyType().toString()) %></h3>
                                    <p>
                                        <i class="fas fa-map-marker-alt"></i>
                                        <%= p1.getAddress() %>, <%= p1.getCity() %>
                                    </p>
                                    <div class="property-features">
                                        <% if (p1.getArea() != null && p1.getArea() > 0) { %>
                                            <span class="feature">
                                                <i class="fas fa-ruler-combined"></i>
                                                <%= p1.getArea() %> <%= p1.getAreaUnit() %>
                                            </span>
                                        <% } %>
                                    </div>
                                    <div class="property-actions">
                                    <a href="${pageContext.request.contextPath}/user/property-details/<%= p1.getId() %>" class="btn btn-primary">
                                        <i class="fas fa-eye me-2"></i>View Details
                                    </a>
                                        <button class="btn btn-outline">Contact Agent</button>
                                    </div>
                                </div>
                            </div>
                        <% } %>
                    <% } else { %>
                        <div class="no-properties">
                            <i class="fas fa-home fa-3x"></i>
                            <h3>No Properties Found</h3>
                            <p>There are no properties available matching your criteria.</p>
                        </div>
                    <% } %>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
        function clearFilters() {
            document.getElementById('propertyFilter').reset();
            window.location.href = '${pageContext.request.contextPath}/user/dashboard';
        }

        // Handle property details click
        document.addEventListener('DOMContentLoaded', function() {
            const viewDetailsButtons = document.querySelectorAll('.property-actions .btn-primary');
            viewDetailsButtons.forEach(button => {
                button.addEventListener('click', function(e) {
                    e.preventDefault();
                    const propertyCard = this.closest('.property-card');
                    const propertyId = propertyCard.getAttribute('data-property-id');
            if (propertyId) {
                        window.location.href = '${pageContext.request.contextPath}/user/property-details/' + propertyId;
                    }
                });
            });
        });

        // Sample data for heatmap
        const heatmapLabels = ["Indore", "Bhopal", "Jabalpur", "Gwalior", "Ujjain"];
        const heatmapData = [120, 90, 60, 40, 30]; // Example: demand or price
        const ctx = document.getElementById('heatmapChart').getContext('2d');
        new Chart(ctx, {
            type: 'bar',
            data: {
                labels: heatmapLabels,
                datasets: [{
                    label: 'Demand',
                    data: heatmapData,
                    backgroundColor: [
                        'rgba(255,106,0,0.7)',
                        'rgba(255,180,71,0.7)',
                        'rgba(0,168,255,0.7)',
                        'rgba(0,212,255,0.7)',
                        'rgba(0,255,168,0.7)'
                    ],
                    borderRadius: 8,
                    borderWidth: 1
                }]
            },
            options: {
                plugins: { legend: { display: false } },
                scales: {
                    y: { beginAtZero: true, grid: { display: false } },
                    x: { grid: { display: false } }
                }
            }
        });

        // Add .hot class and badge to cards with high demand/price (example logic)
        document.addEventListener('DOMContentLoaded', function() {
            const cards = document.querySelectorAll('.property-card');
            cards.forEach((card, i) => {
                // Example: mark every 2nd card as hot
                if (i % 2 === 0) {
                    card.classList.add('hot');
                    if (!card.querySelector('.hot-badge')) {
                        const badge = document.createElement('div');
                        badge.className = 'hot-badge';
                        badge.innerText = 'HOT';
                        card.appendChild(badge);
                    }
                }
                // Add staggered animation delay
                card.classList.add('animated');
                card.style.setProperty('--delay', `${i * 0.08}s`);
            });
        });

        // Initialize favorite buttons
        document.addEventListener('DOMContentLoaded', function() {
            const favoriteButtons = document.querySelectorAll('.property-fav');
            favoriteButtons.forEach(button => {
                button.addEventListener('click', function() {
                    const propertyCard = this.closest('.property-card');
                    const propertyId = propertyCard.getAttribute('data-property-id');
                    const isFavorited = this.classList.contains('favorited');
                    const newFavStatus = !isFavorited;

                    const fetchUrl = `/user/property/${propertyId}/favorite`;
                    console.log('Favorite AJAX:', { propertyId, fetchUrl, newFavStatus });
                    console.log('propertyId raw:', propertyId, typeof propertyId, propertyId.length, JSON.stringify(propertyId));

                    fetch(fetchUrl, {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/json',
                            'X-Requested-With': 'XMLHttpRequest'
                        },
                        body: JSON.stringify({ fav: newFavStatus })
                    })
                    .then(response => {
                        if (response.ok) {
                            // Toggle the heart icon visually
                            this.classList.toggle('favorited', newFavStatus);
                            const icon = this.querySelector('i');
                            if (newFavStatus) {
                                icon.classList.remove('far');
                                icon.classList.add('fas');
                            } else {
                                icon.classList.remove('fas');
                                icon.classList.add('far');
                            }
                        } else {
                            alert('Failed to update favorite status.');
                        }
                    })
                    .catch(() => alert('Failed to update favorite status.'));
                });
            });
        });
    </script>
</body>
</html> 