<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.Real_Estate.entity.Properties" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book Appointment - LuxuryEstate</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/newcss.css">
    <style>
        .property-header {
            background: linear-gradient(rgba(0,0,0,0.7), rgba(0,0,0,0.7)), url('https://images.unsplash.com/photo-1560518883-ce09059eeffa?ixlib=rb-4.0.3') center/cover;
            color: white;
            padding: 4rem 0;
            margin-bottom: 2rem;
        }
        
        .property-status {
            padding: 0.5rem 1rem;
            border-radius: 20px;
            font-size: 0.9rem;
            font-weight: 500;
            display: inline-block;
            margin-bottom: 1rem;
        }
        
        .status-available { background-color: #e8f5e9; color: #2e7d32; }
        .status-sold { background-color: #ffebee; color: #c62828; }
        .status-rent { background-color: #e3f2fd; color: #1565c0; }
        .status-pre_launch { background-color: #fff3e0; color: #ef6c00; }
        
        .property-price {
            font-size: 2rem;
            font-weight: 700;
            color: var(--primary-color);
            margin-bottom: 1rem;
        }
        
        .appointment-form-card {
            background: white;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            padding: 2rem;
            margin-bottom: 2rem;
        }
        
        .form-group {
            margin-bottom: 1.5rem;
        }
        
        .form-group label {
            font-size: 0.9rem;
            color: #666;
            margin-bottom: 0.5rem;
            display: block;
        }
        
        .form-group input, .form-group textarea, .form-group select {
            font-size: 1rem;
            padding: 0.75rem;
            border: 1px solid #ddd;
            border-radius: 5px;
            width: 100%;
        }
        
        .form-group input:focus, .form-group textarea:focus, .form-group select:focus {
            outline: none;
            border-color: var(--primary-color);
            box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
        }
        
        .btn-submit {
            background-color: var(--primary-color);
            color: white;
            font-weight: 500;
            padding: 0.75rem 1.5rem;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        
        .btn-submit:hover {
            background-color: #0069d9;
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
                        <a class="nav-link" href="${pageContext.request.contextPath}/user/dashboard"><i class="fas fa-tachometer-alt me-1"></i>Dashboard</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/user/dashboard/favorites"><i class="fas fa-heart me-1"></i>My Favorites</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="${pageContext.request.contextPath}/profile"><i class="fas fa-user me-1"></i>Profile</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/logout"><i class="fas fa-sign-out-alt me-1"></i>Logout</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <%
    Properties property = (Properties) request.getAttribute("prop");
    if (property != null)  {
    %>
    <!-- Property Header -->
    <div class="property-header">
        <div class="container">
            <span class="property-status status-<%= property.getStatus().toString().toLowerCase() %>">
                <%= property.getStatus() %> 
            </span>
            <h1 class="mb-3">Book Appointment for <%= property.getPropertyType() %></h1>
            <p class="mb-0">
                <i class="fas fa-map-marker-alt me-2"></i>
                <%= property.getAddress() %>, <%= property.getCity() %>, <%= property.getState() %> <%= property.getZipCode() %> 
            </p>
        </div>
    </div>

    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="appointment-form-card">
                    <h3 class="mb-4">Appointment Details</h3>
                    <form action="${pageContext.request.contextPath}/appointment-submit/<%= property.getId() %>" method="POST">
                        <div class="form-group">
                            <label for="appointmentDate">Preferred Date</label>
                            <input type="date" id="appointmentDate" name="appointmentDate" required>
                        </div>
                        <div class="form-group">
                            <label for="appointmentTime">Preferred Time</label>
                            <input type="time" id="appointmentTime" name="appointmentTime" required>
                        </div>
                        <div class="form-group">
                            <label for="visitorName">Your Name</label>
                            <input type="text" id="visitorName" name="visitorName" placeholder="Enter your full name" required>
                        </div>
                        <div class="form-group">
                            <label for="visitorEmail">Your Email</label>
                            <input type="email" id="visitorEmail" name="visitorEmail" placeholder="Enter your email" required>
                        </div>
                        <div class="form-group">
                            <label for="visitorPhone">Your Phone Number</label>
                            <input type="tel" id="visitorPhone" name="visitorPhone" placeholder="Enter your phone number" required>
                        </div>
                        <div class="form-group">
                            <label for="message">Additional Message (Optional)</label>
                            <textarea id="message" name="message" rows="3" placeholder="Any additional information or questions"></textarea>
                        </div>
                        <div class="form-group">
                            <label for="paymentMethod">Payment Method</label>
                            <select id="paymentMethod" name="paymentMethod" required>
                                <option value="">Select Payment Method</option>
                                <option value="creditCard">Credit Card</option>
                                <option value="debitCard">Debit Card</option>
                                <option value="paypal">PayPal</option>
                                <option value="bankTransfer">Bank Transfer</option>
                            </select>
                        </div>
                        <button type="submit" class="btn-submit"><i class="fas fa-calendar-check me-2"></i>Confirm Appointment</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <% } else { %> 
    <div class="container mt-5">
        <div class="alert alert-danger">
            Property not found or has been removed.
        </div>
    </div>
    <% } %>

    <!-- Footer -->
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script> 
</body>
</html>
