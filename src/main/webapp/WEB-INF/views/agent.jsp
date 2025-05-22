<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.Real_Estate.entity.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Agent Dashboard - LuxuryEstate</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/darktheme.css">
</head>
<body>
    <header class="header">
        <nav class="nav-menu">
            <a href="${pageContext.request.contextPath}/agent/dashboard">Dashboard</a>
            <a href="${pageContext.request.contextPath}/agent/properties">My Properties</a>
            <a href="${pageContext.request.contextPath}/agent/clients">Clients</a>
            <a href="${pageContext.request.contextPath}/agent/appointments">Appointments</a>
            <a href="${pageContext.request.contextPath}/agent/profile">Profile</a>
            <a href="${pageContext.request.contextPath}/login">Logout</a>
        </nav>
    </header>

    <div class="container mt-4">
        <div class="row mb-4">
            <div class="col-md-12">
                <h1 class="section-title">Agent Dashboard</h1>
                <div class="d-flex justify-content-end mb-3">
                    <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addPropertyModal">
                        <i class="fas fa-plus"></i> Add New Property
                    </button>
                </div>
            </div>
        </div>

        
        <!-- Property List -->
        <div class="row">
            <div class="col-md-12">
                <div class="card bg-dark">
                    <div class="card-header">
                        <h5 class="mb-0">My Properties</h5>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-dark table-hover">
                                <thead>
                                    <tr>
                                        <th>Property_type</th>
                                        <th>Price</th>
                                        <th>Status</th>
                                        <th>Address</th>
                                        <th>City</th>th>
                                        <>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        
                                        <td>House</td>
                                        <td>$450,000</td>
                                        <td><span class="badge bg-success">Active</span></td>
                                        <td>156</td>
                                        <td>2024-03-15</td>
                                        <td>
                                            <button class="btn btn-sm btn-outline-primary me-1" title="Edit">
                                                <i class="fas fa-edit"></i>
                                            </button>
                                            <button class="btn btn-sm btn-outline-info me-1" title="View">
                                                <i class="fas fa-eye"></i>
                                            </button>
                                            <button class="btn btn-sm btn-outline-danger" title="Delete">
                                                <i class="fas fa-trash"></i>
                                            </button>
                                        </td>
                                    </tr>
                                    <!-- Add more property rows here -->
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Add Property Modal -->
    <div class="modal fade" id="addPropertyModal" tabindex="-1">
        <div class="modal-dialog modal-lg">
            <div class="modal-content bg-dark text-white">
                <div class="modal-header">
                    <h5 class="modal-title">Add New Property</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <form id="addPropertyForm" action="${pageContext.request.contextPath}/agent/properties/add" method="POST" >
                        <!-- Property Type -->
                        <div class="mb-3">
                            <label class="form-label">Property Type</label>
                            <select name="propertyType" class="form-select" required>
                                <option value="">Select Type</option>
                                <option value="HOUSE">House</option>
                                <option value="APARTMENT">Apartment</option>
                            </select>
                        </div>

                        <!-- Property Status -->
                        <div class="mb-3">
                            <label class="form-label">Property Status</label>
                            <select name="status" class="form-select" required>
                                <option value="">Select Status</option>
                                <option value="AVAILABLE">Available</option>
                                <option value="PENDING">Pending</option>
                                <option value="SOLD">Sold</option>
                            </select>
                        </div>

                        <!-- Location Details -->
                        <div class="row mb-3">
                            <div class="col-md-12">
                                <label class="form-label">Address</label>
                                <input type="text" name="address" class="form-control" required>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-md-4">
                                <label class="form-label">City</label>
                                <input type="text" name="city" class="form-control" required>
                            </div>
                            <div class="col-md-4">
                                <label class="form-label">State</label>
                                <input type="text" name="state" class="form-control" required>
                            </div>
                            <div class="col-md-4">
                                <label class="form-label">Zip Code</label>
                                <input type="text" name="zipCode" class="form-control" required>
                            </div>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Country</label>
                            <input type="text" name="country" class="form-control" required>
                        </div>

                     	<div class="mb-3">
                            <label class="form-label">Price</label>
                            <input type="text" name="price" class="form-control" required>
                        </div>

                        <div class="text-end">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                            <button type="submit" class="btn btn-primary">Add Property</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <footer class="footer">
        <div class="footer-content">
            <div class="footer-section">
                <h3>About LuxuryEstate</h3>
                <p>Your premier destination for luxury real estate properties. We connect discerning buyers with exceptional properties.</p>
            </div>
            <div class="footer-section">
                <h3>Quick Links</h3>
                <a href="${pageContext.request.contextPath}/agent/dashboard">Dashboard</a>
                <a href="${pageContext.request.contextPath}/agent/properties">My Properties</a>
                <a href="${pageContext.request.contextPath}/agent/clients">Clients</a>
                <a href="${pageContext.request.contextPath}/agent/appointments">Appointments</a>
            </div>
            <div class="footer-section">
                <h3>Contact Us</h3>
                <p>Email: agents@luxuryestate.com</p>
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