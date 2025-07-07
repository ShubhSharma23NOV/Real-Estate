<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.Real_Estate.entity.User" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.Real_Estate.entity.Properties" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Agent Dashboard - LuxuryEstate</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/newcss.css">
    <style>
        .dashboard-container {
            padding: 2rem 0;
            background: #f8fafc;
            min-height: 100vh;
        }
        
        .welcome-section {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            border-radius: 20px;
            padding: 2.5rem;
            margin-bottom: 2rem;
            color: white;
            box-shadow: 0 8px 24px rgba(0,0,0,0.12);
        }
        
        .welcome-section h1 {
            font-size: 2.5rem;
            font-weight: 700;
            margin-bottom: 0.5rem;
        }
        
        .welcome-section p {
            font-size: 1.1rem;
            opacity: 0.9;
            margin-bottom: 0;
        }
        
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
            gap: 1.5rem;
            margin-bottom: 2rem;
        }
        
        .stat-card {
            background: white;
            border-radius: 16px;
            padding: 1.5rem;
            box-shadow: 0 4px 12px rgba(0,0,0,0.08);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            border: 1px solid rgba(0,0,0,0.05);
            display: flex;
            align-items: center;
            gap: 1.5rem;
        }
        
        .stat-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 24px rgba(0,0,0,0.12);
        }
        
        .stat-icon {
            width: 60px;
            height: 60px;
            border-radius: 12px;
            background: var(--primary-color);
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.8rem;
        }
        
        .stat-content {
            flex: 1;
        }
        
        .stat-value {
            font-size: 2rem;
            font-weight: 700;
            color: var(--text-color);
            margin-bottom: 0.25rem;
            line-height: 1;
        }
        
        .stat-label {
            color: var(--text-color);
            opacity: 0.8;
            font-size: 0.95rem;
        }

        .quick-actions-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 1.5rem;
            margin-bottom: 2rem;
        }
        
        .quick-action-btn {
            display: flex;
            align-items: center;
            padding: 1.5rem;
            background: white;
            border-radius: 16px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.08);
            border: 1px solid rgba(0,0,0,0.05);
            text-decoration: none;
            color: var(--text-color);
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }
        
        .quick-action-btn::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            opacity: 0;
            transition: opacity 0.3s ease;
            z-index: 1;
        }
        
        .quick-action-btn:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 24px rgba(0,0,0,0.12);
            border-color: var(--primary-color);
        }
        
        .quick-action-btn:hover::before {
            opacity: 0.05;
        }
        
        .quick-action-btn i {
            font-size: 1.75rem;
            margin-right: 1.25rem;
            width: 32px;
            text-align: center;
            color: var(--primary-color);
            position: relative;
            z-index: 2;
            transition: all 0.3s ease;
        }
        
        .quick-action-btn:hover i {
            transform: scale(1.1);
            color: var(--secondary-color);
        }
        
        .quick-action-btn span {
            font-weight: 600;
            font-size: 1.1rem;
            position: relative;
            z-index: 2;
            transition: all 0.3s ease;
        }
        
        .quick-action-btn:hover span {
            color: var(--primary-color);
        }
        
        .quick-action-btn .badge {
            position: absolute;
            top: 1rem;
            right: 1rem;
            background: var(--accent-color);
            color: white;
            padding: 0.25rem 0.75rem;
            border-radius: 20px;
            font-size: 0.8rem;
            font-weight: 500;
            z-index: 2;
        }
        
        .property-section {
            background: white;
            border-radius: 16px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.08);
            border: 1px solid rgba(0,0,0,0.05);
            overflow: hidden;
        }
        
        .property-header {
            padding: 1.5rem;
            border-bottom: 2px solid #f1f5f9;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .property-header h2 {
            font-size: 1.5rem;
            font-weight: 600;
            color: var(--text-color);
            margin: 0;
        }
        
        .filter-container {
            padding: 1.5rem;
            background: #f8fafc;
            border-bottom: 1px solid #e2e8f0;
        }
        
        .filter-row {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 1rem;
            align-items: end;
        }
        
        .filter-group {
            display: flex;
            flex-direction: column;
            gap: 0.5rem;
        }
        
        .filter-group label {
            font-size: 0.9rem;
            font-weight: 500;
            color: #475569;
        }
        
        .filter-group select,
        .filter-group input {
            padding: 0.75rem 1rem;
            border: 1px solid #e2e8f0;
            border-radius: 8px;
            background: white;
            font-size: 0.95rem;
            color: #1e293b;
            transition: all 0.2s ease;
        }
        
        .filter-group select:focus,
        .filter-group input:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.1);
            outline: none;
        }
        
        .filter-actions {
            display: flex;
            gap: 1rem;
            align-items: flex-end;
        }
        
        .filter-btn {
            padding: 0.75rem 1.5rem;
            border-radius: 8px;
            font-weight: 500;
            transition: all 0.2s ease;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }
        
        .filter-btn-primary {
            background: var(--primary-color);
            color: white;
            border: none;
        }
        
        .filter-btn-primary:hover {
            background: var(--secondary-color);
            transform: translateY(-1px);
        }
        
        .filter-btn-secondary {
            background: white;
            color: #475569;
            border: 1px solid #e2e8f0;
        }
        
        .filter-btn-secondary:hover {
            background: #f8fafc;
            border-color: #cbd5e1;
        }
        
        .property-table {
            margin: 0;
            height: auto;
            min-height: 400px;
        }
        
        .property-table .table-responsive {
            height: auto;
        }
        
        .property-table table {
            margin: 0;
        }
        
        .property-table thead th {
            background: #f8fafc;
            padding: 1rem 1.5rem;
            font-weight: 600;
            font-size: 0.95rem;
            color: #1e293b;
            border-bottom: 2px solid #e2e8f0;
            white-space: nowrap;
        }
        
        .property-table tbody td {
            padding: 1rem 1.5rem;
            vertical-align: middle;
            border-bottom: 1px solid #e2e8f0;
            font-size: 0.95rem;
            color: #475569;
        }
        
        .property-table tbody tr:hover {
            background-color: #f8fafc;
        }
    </style>
</head>
<body>
    <!-- Top Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/agent/dashboard">
                <i class="fas fa-home me-2"></i>LuxuryEstate
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link active" href="${pageContext.request.contextPath}/agent/dashboard">
                            <i class="fas fa-tachometer-alt me-1"></i>Dashboard
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/agent/properties/my">
                            <i class="fas fa-building me-1"></i>My Properties
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/agent/notifications">
                            <i class="fas fa-users me-1"></i>Clients
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/agent/appointments">
                            <i class="fas fa-calendar-alt me-1"></i>Appointments
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
        <div class="container">
            <!-- Welcome Section -->
            <div class="welcome-section">
                <h1>Welcome back, ${user.firstName}!</h1>
                <p>Here's what's happening with your properties today.</p>
        </div>

            <!-- Stats Grid -->
            <div class="stats-grid">
                <div class="stat-card">
                    <div class="stat-icon">
                        <i class="fas fa-building"></i>
                    </div>
                    <div class="stat-content">
                    <div class="stat-value">24</div>
                    <div class="stat-label">Total Properties</div>
                </div>
            </div>
                <div class="stat-card">
                    <div class="stat-icon">
                        <i class="fas fa-home"></i>
                    </div>
                    <div class="stat-content">
                    <div class="stat-value">12</div>
                    <div class="stat-label">Active Listings</div>
                </div>
            </div>
                <div class="stat-card">
                    <div class="stat-icon">
                        <i class="fas fa-users"></i>
                    </div>
                    <div class="stat-content">
                    <div class="stat-value">45</div>
                    <div class="stat-label">Total Clients</div>
                </div>
            </div>
                <div class="stat-card">
                    <div class="stat-icon">
                        <i class="fas fa-calendar-check"></i>
                    </div>
                    <div class="stat-content">
                    <div class="stat-value">8</div>
                    <div class="stat-label">Appointments Today</div>
                </div>
            </div>
        </div>

            <!-- Quick Actions Grid -->
            <div class="quick-actions-grid">
                <a href="#" class="quick-action-btn" data-bs-toggle="modal" data-bs-target="#addPropertyModal">
                    <i class="fas fa-plus-circle"></i>
                    <span>Add New Property</span>
                </a>
                <a href="#" class="quick-action-btn">
                    <i class="fas fa-calendar-check"></i>
                    <span>Schedule Viewing</span>
                    <span class="badge">3 New</span>
                </a>
                <a href="#" class="quick-action-btn">
                    <i class="fas fa-chart-line"></i>
                    <span>Generate Report</span>
                </a>
                <a href="${pageContext.request.contextPath}/agent/notifications" class="quick-action-btn">
                    <i class="fas fa-bell"></i>
                    <span>View Notifications</span>
                    <span class="badge">${unreadCount}</span>
                </a>
            </div>

            <!-- Property Management Section -->
            <div class="property-section">
                <div class="property-header">
                    <h2>Property Management</h2>
                    
                        </div>
                
                <div class="filter-container">
                    <form class="filter-form" action="${pageContext.request.contextPath}/agent/dashboard/filter" method="GET">
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
                                    <option value="250000">Under $250,000</option>
                                    <option value="500000">Under $500,000</option>
                                    <option value="1000000">Under $1,000,000</option>
                                    <option value="2000000">Under $2,000,000</option>
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
                        </div>
                    </form>
        </div>

                <div class="property-table">
                        <div class="table-responsive">
                        <table class="table mb-0">
                                <thead>
                                    <tr>
                                    <th style="min-width: 160px;">Property Type</th>
                                    <th style="min-width: 120px;">Price</th>
                                    <th style="min-width: 120px;">Status</th>
                                    <th style="min-width: 200px;">Address</th>
                                    <th style="min-width: 140px;">City</th>
                                    <th style="min-width: 120px;">Area</th>
                                    <th style="min-width: 140px;">Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                    List<Properties> p = (List<Properties>) request.getAttribute("AllProperties");
                                    User u1 = (User) request.getAttribute("user");
                                for(Properties p1:p){%>
                                        <tr>
                                            <td><%= p1.getPropertyType() %></td>
                                        <td>$<%= p1.getPrice() %></td>
                                        <td>
                                            <span class="badge 
                                                <% if (p1.getStatus().toString().equals("AVAILABLE")) { %> bg-success-subtle text-success
                                                <% } else if (p1.getStatus().toString().equals("SOLD")) { %> bg-danger-subtle text-danger
                                                <% } else if (p1.getStatus().toString().equals("RENT")) { %> bg-info-subtle text-info
                                                <% } else if (p1.getStatus().toString().equals("PRE_LAUNCH")) { %> bg-warning-subtle text-warning
                                                <% } else { %> bg-secondary-subtle text-secondary <% } %>">
                                                <%= p1.getStatus() %>
                                            </span>
                                        </td>
                                            <td><%= p1.getAddress() %></td>
                                            <td><%= p1.getCity() %></td>
                                        <td><%= p1.getArea()%> <%=p1.getAreaUnit()%></td>
                                            <td>
                                                <div class="btn-group">
                                                <button class="btn btn-outline-primary" title="Edit" onclick="editProperty(<%= p1.getId() %>)">
                                                    <i class="fas fa-edit"></i>
                                                    </button>
                                                <button class="btn btn-outline-info" title="View" onclick="viewProperty(<%= p1.getId() %>)">
                                                    <i class="fas fa-eye"></i>
                                                    </button>
                                                <button class="btn btn-outline-danger" title="Delete" onclick="deleteProperty(<%= p1.getId() %>)">
                                                    <i class="fas fa-trash"></i>
                                                    </button>
                                                </div>
                                            </td>
                                        </tr>
                                    <% } %>
                                </tbody>
                            </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Add Property Modal -->
    <div class="modal fade" id="addPropertyModal" tabindex="-1">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Add New Property</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <form id="addPropertyForm" action="${pageContext.request.contextPath}/agent/properties/add" method="post">
                        <div class="row">
                            <!-- Property Type -->
                            <div class="col-md-6 mb-3">
                                <label class="form-label">Property Type</label>
                                <select name="propertyType" class="form-select" required>
                                    <option value="">Select Type</option>
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
                            <div class="col-md-6 mb-3">
                                <label class="form-label">Status</label>
                                <select name="status" class="form-select" required>
                                    <option value="">Select Status</option>
                                    <option value="AVAILABLE">Available</option>
                                    <option value="RENT">Rent</option>
                                    <option value="PRE_LAUNCH">Pre-launch</option>
                                    <option value="SOLD">Sold</option>
                                </select>
                            </div>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Address</label>
                            <input type="text" name="address" class="form-control" required>
                        </div>

                        <div class="row">
                            <div class="col-md-4 mb-3">
                                <label class="form-label">City</label>
                                <input type="text" class="form-control" placeholder="Enter City" name="city" list="cityList" required>
                                    <datalist id="cityList">
                                        <option value="Indore, Madhya Pradesh">
                                        <option value="Bhopal, Madhya Pradesh">
                                        <option value="Jabalpur, Madhya Pradesh">
                                        <option value="Gwalior, Madhya Pradesh">
                                        <option value="Ujjain, Madhya Pradesh">
                                    </datalist>
                            </div>
                            <div class="col-md-4 mb-3">
                                <label class="form-label">State</label>
                                <input type="text" name="state" class="form-control" required>
                            </div>
                            <div class="col-md-4 mb-3">
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
                            <div class="input-group">
                                <span class="input-group-text">$</span>
                                <input type="text" name="price" class="form-control" required>
                            </div>
                        </div>

                        <div class="mb-3">
                        <label class="form-label">Size</label>
							<div class="input-group">
                                <input type="number" class="form-control" placeholder="Area" name="area" min="0" step="0.01" required>
                        <select class="form-select" name="areaUnit" style="max-width: 100px;">
                            <option value="sqft">sq ft</option>
                            <option value="sqm">sq m</option>
                            <option value="acres">acres</option>
                            <option value="hectares">hectares</option>
                        </select>
                    		</div>
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

    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Property actions
        function editProperty(id) {
            // Implement edit functionality
            console.log('Edit property:', id);
        }

        function viewProperty(id) {
            window.location.href = '${pageContext.request.contextPath}/user/property-details/' + id;
        }

        function deleteProperty(id) {
            if(confirm('Are you sure you want to delete this property?')) {
                // Implement delete functionality
                console.log('Delete property:', id);
            }
        }

        // Search functionality
        document.querySelector('.search-box input').addEventListener('input', function(e) {
            const searchTerm = e.target.value.toLowerCase();
            const rows = document.querySelectorAll('.property-table tbody tr');
            
            rows.forEach(row => {
                const text = row.textContent.toLowerCase();
                row.style.display = text.includes(searchTerm) ? '' : 'none';
            });
        });

        // Filter form reset
        document.querySelector('button[type="reset"]').addEventListener('click', function() {
            setTimeout(() => {
                document.querySelectorAll('.property-table tbody tr').forEach(row => {
                    row.style.display = '';
                });
            }, 100);
        });

        function clearFilters() {
            // Clear all form inputs
            document.querySelector('.filter-form').reset();
            
            // Redirect to dashboard to reset the view
            window.location.href = '${pageContext.request.contextPath}/agent/dashboard';
        }
    </script>
</body>
</html>
