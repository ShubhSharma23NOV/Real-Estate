<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.Real_Estate.entity.User" %>
<%@ page import="com.example.Real_Estate.entity.Properties" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Agent - LuxuryEstate</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/newcss.css">
    <style>
        .query-form-container {
            background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
            min-height: calc(100vh - 76px);
            padding: 3rem 0;
        }
        
        .query-card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            overflow: hidden;
        }
        
        .query-card .card-header {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            padding: 1.5rem;
            border: none;
        }
        
        .query-card .card-header h4 {
            margin: 0;
            font-weight: 600;
            font-size: 1.5rem;
        }
        
        .query-card .card-body {
            padding: 2rem;
        }
        
        .agent-info {
            background: #f8f9fa;
            border-radius: 12px;
            padding: 2rem;
            margin-bottom: 2rem;
            text-align: center;
            border: 1px solid rgba(0,0,0,0.05);
        }
        
        .agent-image {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            margin: 0 auto 1.5rem;
            border: 4px solid var(--primary-color);
            padding: 4px;
            background: white;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }
        
        .agent-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            border-radius: 50%;
        }
        
        .agent-name {
            color: var(--primary-color);
            font-size: 1.4rem;
            font-weight: 600;
            margin-bottom: 0.5rem;
        }
        
        .agent-title {
            color: var(--secondary-color);
            font-weight: 500;
            margin-bottom: 1rem;
        }
        
        .form-label {
            color: var(--primary-color);
            font-weight: 500;
            margin-bottom: 0.5rem;
        }
        
        .form-control, .form-select {
            border: 1px solid rgba(0,0,0,0.1);
            border-radius: 8px;
            padding: 0.8rem 1rem;
            transition: all 0.3s ease;
        }
        
        .form-control:focus, .form-select:focus {
            border-color: var(--secondary-color);
            box-shadow: 0 0 0 0.2rem rgba(52, 152, 219, 0.15);
        }
        
        .btn-primary {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            border: none;
            padding: 0.8rem 1.5rem;
            font-weight: 500;
            transition: all 0.3s ease;
        }
        
        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
        }
        
        .btn-secondary {
            background: #f8f9fa;
            color: var(--primary-color);
            border: 1px solid rgba(0,0,0,0.1);
            padding: 0.8rem 1.5rem;
            font-weight: 500;
            transition: all 0.3s ease;
        }
        
        .btn-secondary:hover {
            background: #e9ecef;
            transform: translateY(-2px);
        }
        
        .property-details {
            background: #f8f9fa;
            border-radius: 8px;
            padding: 1rem;
            margin-bottom: 1.5rem;
            border: 1px solid rgba(0,0,0,0.05);
        }
        
        .property-details p {
            margin-bottom: 0.5rem;
            color: var(--text-color);
        }
        
        .property-details strong {
            color: var(--primary-color);
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

    <div class="query-form-container">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-8">
                    <div class="query-card">
                        <div class="card-header text-white">
                            <h4><i class="fas fa-envelope me-2"></i>Contact Agent</h4>
                        </div>
                        <div class="card-body">
                            <%
                            Properties property = (Properties) request.getAttribute("property");
                            User agent = property.getUser_id();
                            %>
                            <div class="agent-info">
                                <div class="agent-image">
                                    <img src="https://images.unsplash.com/photo-1573496359142-b8d87734a5a2?ixlib=rb-4.0.3" alt="Agent">
                                </div>
                                <h5 class="agent-name"><%= agent.getFirstName() %> <%= agent.getLastName() %></h5>
                                <p class="agent-title">Property Agent</p>
                                <div class="property-details">
                                    <p><strong>Property Type:</strong> <%= property.getPropertyType() %></p>
                                    <p><strong>Location:</strong> <%= property.getAddress() %>, <%= property.getCity() %></p>
                                    <p><strong>Price:</strong> $<%= property.getPrice() %></p>
                                </div>
                            </div>

                            <form action="${pageContext.request.contextPath}/query-form/send-query" method="POST">
                                <input type="hidden" name="agent" value="<%= agent.getId() %>">
                                <input type="hidden" name="propertyId" value="<%= property.getId() %>">
                                
                                <div class="mb-4">
                                    <label for="subject" class="form-label">Subject</label>
                                    <input type="text" class="form-control" id="subject" name="subject" required 
                                           value="Inquiry about <%= property.getPropertyType() %> at <%= property.getAddress() %>">
                                </div>

                                <div class="mb-4">
                                    <label for="message" class="form-label">Your Message</label>
                                    <textarea class="form-control" id="message" name="message" rows="6" required 
                                              placeholder="Please provide details about your inquiry..."></textarea>
                                </div>

                                <div class="row">
                                    <div class="col-md-6 mb-4">
                                        <label for="phoneNumber" class="form-label">Your Contact Number</label>
                                        <input type="tel" class="form-control" id="phoneNumber" name="phoneNumber" required>
                                    </div>

                                    <div class="col-md-6 mb-4">
                                        <label for="time" class="form-label">Preferred Contact Time</label>
                                        <select class="form-select" id="time" name="time" required>
                                            <option value="">Select preferred time</option>
                                            <option value="morning">Morning (9 AM - 12 PM)</option>
                                            <option value="afternoon">Afternoon (12 PM - 5 PM)</option>
                                            <option value="evening">Evening (5 PM - 8 PM)</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="d-grid gap-3">
                                    <button type="submit" class="btn btn-primary">
                                        <i class="fas fa-paper-plane me-2"></i>Send Message
                                    </button>
                                    <a href="javascript:history.back()" class="btn btn-secondary">
                                        <i class="fas fa-arrow-left me-2"></i>Go Back
                                    </a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html> 