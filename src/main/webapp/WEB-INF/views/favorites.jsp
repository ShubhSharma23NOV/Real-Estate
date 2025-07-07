<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.Real_Estate.entity.User,java.util.List,com.example.Real_Estate.entity.Properties" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Favorites - LuxuryEstate</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/newcss.css">
    <style>
        .favorites-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 2rem 1rem;
        }

        .favorites-header {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            border-radius: 20px;
            padding: 2.5rem;
            margin-bottom: 2rem;
            color: white;
            box-shadow: 0 8px 24px rgba(0,0,0,0.12);
            position: relative;
            overflow: hidden;
        }

        .favorites-header::before {
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

        .favorites-header h1 {
            font-size: 2.5rem;
            font-weight: 700;
            margin-bottom: 0.5rem;
            position: relative;
        }

        .favorites-header p {
            font-size: 1.1rem;
            opacity: 0.9;
            margin-bottom: 0;
            position: relative;
        }

        .favorites-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(320px, 1fr));
            gap: 2rem;
            margin-top: 2rem;
        }

        .favorite-card {
            background: white;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            position: relative;
        }

        .favorite-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.1);
        }

        .favorite-image {
            position: relative;
            height: 200px;
            overflow: hidden;
        }

        .favorite-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .favorite-remove {
            position: absolute;
            top: 10px;
            right: 10px;
            background: rgba(255, 255, 255, 0.9);
            border: none;
            border-radius: 50%;
            width: 35px;
            height: 35px;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            transition: all 0.3s ease;
            z-index: 2;
        }

        .favorite-remove:hover {
            background: #ff4444;
            color: white;
        }

        .favorite-info {
            padding: 1.5rem;
        }

        .favorite-info h3 {
            font-size: 1.25rem;
            margin-bottom: 0.5rem;
            color: var(--secondary-color);
        }

        .favorite-info p {
            color: #666;
            margin-bottom: 1rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .favorite-features {
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

        .favorite-actions {
            display: flex;
            gap: 1rem;
        }

        .favorite-actions .btn {
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

        .no-favorites {
            text-align: center;
            padding: 4rem 2rem;
            background: white;
            border-radius: 15px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .no-favorites i {
            font-size: 4rem;
            color: var(--primary-color);
            margin-bottom: 1.5rem;
            opacity: 0.5;
        }

        .no-favorites h3 {
            font-size: 1.5rem;
            color: var(--secondary-color);
            margin-bottom: 1rem;
        }

        .no-favorites p {
            color: #666;
            margin-bottom: 2rem;
        }

        .browse-btn {
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            padding: 0.75rem 1.5rem;
            background: var(--primary-color);
            color: white;
            border: none;
            border-radius: 8px;
            font-weight: 500;
            text-decoration: none;
            transition: all 0.3s ease;
        }

        .browse-btn:hover {
            background: var(--primary-dark);
            transform: translateY(-2px);
            color: white;
        }
    </style>
</head>
<body>
    <!-- Top Navbar -->
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
                        <a class="nav-link active" href="${pageContext.request.contextPath}/user/dashboard/favorites">
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

    <div class="favorites-container">
        <!-- Header Section -->
        <div class="favorites-header">
            <h1>My Favorite Properties</h1>
            <p>Your saved properties for quick access</p>
        </div>

        <!-- Favorites Grid -->
        <div class="favorites-grid" id="favoritesGrid">
            <% List<Properties> properties = (List<Properties>)request.getAttribute("Properties"); %>
            <% if (properties != null && !properties.isEmpty()) { %>
                <% for (Properties p : properties) { %>
                    <div class="favorite-card">
                        <div class="favorite-image">
                            <img src="https://images.unsplash.com/photo-1600585154340-be6161a56a0c?ixlib=rb-4.0.3" alt="<%= p.getPropertyType() %>">
                        </div>
                        <div class="favorite-info">
                            <h3><%= p.getPropertyType() %></h3>
                            <p>
                                <i class="fas fa-map-marker-alt"></i>
                                <%= p.getAddress() %>, <%= p.getCity() %>
                            </p>
                            <div class="favorite-features">
                                <% if (p.getArea() != null && p.getArea() > 0) { %>
                                    <span class="feature">
                                        <i class="fas fa-ruler-combined"></i>
                                        <%= p.getArea() %> <%= p.getAreaUnit() %>
                                    </span>
                                <% } %>
                                <span class="feature">
                                    <i class="fas fa-tag"></i>
                                    $<%= p.getPrice() %>
                                </span>
                                <span class="feature">
                                    <i class="fas fa-info-circle"></i>
                                    <%= p.getStatus() %>
                                </span>
                            </div>
                            <div class="favorite-actions">
                                <a href="${pageContext.request.contextPath}/user/property-details/<%= p.getId() %>" class="btn btn-primary">
                                    <i class="fas fa-eye"></i>
                                    View Details
                                </a>
                                <button class="btn btn-outline">
                                    <i class="fas fa-phone"></i>
                                    Contact Agent
                                </button>
                            </div>
                        </div>
                    </div>
                <% } %>
            <% } else { %>
                <div class="no-favorites">
                    <i class="fas fa-heart"></i>
                    <h3>No Favorite Properties Yet</h3>
                    <p>Start exploring properties and add them to your favorites!</p>
                    <a href="${pageContext.request.contextPath}/user/dashboard" class="browse-btn">
                        <i class="fas fa-search"></i>
                        Browse Properties
                    </a>
                </div>
            <% } %>
        </div>
    </div>

    <!-- Footer -->
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html> 