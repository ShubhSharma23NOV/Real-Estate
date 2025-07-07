<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.Real_Estate.entity.User,java.util.List,com.example.Real_Estate.entity.Properties" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Advanced Property Search - LuxuryEstate</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/newcss.css">
    <style>
        body {
            background-color: var(--light-bg);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .filter-page-container {
            padding: 2rem 0;
            min-height: 100vh;
        }

        .filter-header {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            border-radius: 20px;
            padding: 2.5rem;
            margin-bottom: 2rem;
            color: white;
            box-shadow: 0 8px 24px rgba(0,0,0,0.12);
        }

        .filter-header h1 {
            font-size: 2.5rem;
            font-weight: 700;
            margin-bottom: 0.5rem;
        }

        .filter-header p {
            font-size: 1.1rem;
            opacity: 0.9;
            margin-bottom: 0;
        }

        .filter-section {
            background: white;
            border-radius: 15px;
            padding: 2rem;
            margin-bottom: 2rem;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
        }

        .filter-section h2 {
            color: var(--primary-color);
            font-size: 1.5rem;
            font-weight: 600;
            margin-bottom: 1.5rem;
            padding-bottom: 0.5rem;
            border-bottom: 2px solid var(--light-bg);
        }

        .filter-group {
            margin-bottom: 1.5rem;
        }

        .filter-group label {
            font-weight: 500;
            color: var(--secondary-color);
            margin-bottom: 0.5rem;
        }

        .filter-group .form-control,
        .filter-group .form-select {
            border: 1px solid #e2e8f0;
            border-radius: 8px;
            padding: 0.75rem 1rem;
            transition: all 0.3s ease;
        }

        .filter-group .form-control:focus,
        .filter-group .form-select:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgba(var(--primary-rgb), 0.1);
        }

        .price-range {
            display: flex;
            gap: 1rem;
            align-items: center;
        }

        .price-range .form-control {
            flex: 1;
        }

        .price-range .separator {
            color: var(--secondary-color);
            font-weight: 500;
        }

        .filter-actions {
            display: flex;
            gap: 1rem;
            margin-top: 2rem;
            padding-top: 1.5rem;
            border-top: 1px solid var(--light-bg);
        }

        .filter-actions .btn {
            padding: 0.75rem 1.5rem;
            font-weight: 500;
            border-radius: 8px;
            transition: all 0.3s ease;
        }

        .filter-actions .btn-primary {
            background: var(--primary-color);
            border: none;
        }

        .filter-actions .btn-primary:hover {
            background: var(--primary-dark);
            transform: translateY(-2px);
        }

        .filter-actions .btn-outline {
            border: 1px solid var(--primary-color);
            color: var(--primary-color);
        }

        .filter-actions .btn-outline:hover {
            background: var(--primary-color);
            color: white;
            transform: translateY(-2px);
        }

        .additional-features {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
            gap: 1rem;
            margin-top: 1rem;
        }

        .feature-checkbox {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            padding: 0.5rem;
            border: 1px solid #e2e8f0;
            border-radius: 6px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .feature-checkbox:hover {
            background: var(--light-bg);
        }

        .feature-checkbox input[type="checkbox"] {
            width: 18px;
            height: 18px;
            border-radius: 4px;
            border: 2px solid var(--primary-color);
            cursor: pointer;
        }

        .feature-checkbox label {
            margin: 0;
            cursor: pointer;
            font-size: 0.9rem;
            color: var(--secondary-color);
        }

        @media (max-width: 768px) {
            .filter-header {
                padding: 1.5rem;
            }

            .filter-header h1 {
                font-size: 2rem;
            }

            .filter-section {
                padding: 1.5rem;
            }

            .price-range {
                flex-direction: column;
                gap: 0.5rem;
            }

            .filter-actions {
                flex-direction: column;
            }

            .filter-actions .btn {
                width: 100%;
            }
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

    <div class="filter-page-container">
        <div class="container">
            <!-- Header Section -->
            <div class="filter-header">
                <h1>Advanced Property Search</h1>
                <p>Find your perfect property with our advanced search filters</p>
            </div>

            <!-- Filter Form -->
            <form action="${pageContext.request.contextPath}/user/dashboard/filter" method="GET" class="filter-section">
                <!-- Basic Information -->
                <h2>Basic Information</h2>
                <div class="row">
                    <div class="col-md-6">
                        <div class="filter-group">
                            <label for="propertyType">Property Type</label>
                            <select class="form-select" id="propertyType" name="propertyType">
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
                    </div>
                    <div class="col-md-6">
                        <div class="filter-group">
                            <label for="status">Status</label>
                            <select class="form-select" id="status" name="status">
                                <option value="">All Status</option>
                                <option value="AVAILABLE">Available</option>
                                <option value="RENT">Rent</option>
                                <option value="PRE_LAUNCH">Pre-launch</option>
                                <option value="SOLD">Sold</option>
                            </select>
                        </div>
                    </div>
                </div>

                <!-- Location -->
                <h2>Location</h2>
                <div class="row">
                    <div class="col-md-6">
                        <div class="filter-group">
                            <label for="city">City</label>
                            <input type="text" class="form-control" id="city" name="city" placeholder="Enter city" list="cityList">
                            <datalist id="cityList">
                                <option value="Indore, Madhya Pradesh">
                                <option value="Bhopal, Madhya Pradesh">
                                <option value="Jabalpur, Madhya Pradesh">
                                <option value="Gwalior, Madhya Pradesh">
                                <option value="Ujjain, Madhya Pradesh">
                                <option value="Sagar, Madhya Pradesh">
                                <option value="Dewas, Madhya Pradesh">
                                <option value="Satna, Madhya Pradesh">
                                <option value="Ratlam, Madhya Pradesh">
                                <option value="Rewa, Madhya Pradesh">
                                <option value="Murwara, Madhya Pradesh">
                                <option value="Singrauli, Madhya Pradesh">
                                <option value="Burhanpur, Madhya Pradesh">
                                <option value="Khandwa, Madhya Pradesh">
                                <option value="Morena, Madhya Pradesh">
                                <option value="Bhind, Madhya Pradesh">
                                <option value="Chhindwara, Madhya Pradesh">
                                <option value="Guna, Madhya Pradesh">
                                <option value="Shivpuri, Madhya Pradesh">
                                <option value="Vidisha, Madhya Pradesh">
                            </datalist>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="filter-group">
                            <label for="address">Address</label>
                            <input type="text" class="form-control" id="address" name="address" placeholder="Enter address">
                        </div>
                    </div>
                </div>

                <!-- Price Range -->
                <h2>Price Range</h2>
                <div class="row">
                    <div class="col-md-12">
                        <div class="filter-group">
                            <div class="price-range">
                                <input type="number" class="form-control" name="minPrice" placeholder="Min Price">
                                <span class="separator">to</span>
                                <input type="number" class="form-control" name="maxPrice" placeholder="Max Price">
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Area -->
                <h2>Area</h2>
                <div class="row">
                    <div class="col-md-12">
                        <div class="filter-group">
                            <div class="price-range">
                                <input type="number" class="form-control" name="minArea" placeholder="Min Area">
                                <span class="separator">to</span>
                                <input type="number" class="form-control" name="maxArea" placeholder="Max Area">
                                <select class="form-select" name="areaUnit" style="max-width: 120px;">
                                    <option value="sqft">sq ft</option>
                                    <option value="sqm">sq m</option>
                                    <option value="acres">acres</option>
                                    <option value="hectares">hectares</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Additional Features -->
                <h2>Additional Features</h2>
                <div class="additional-features">
                    <div class="feature-checkbox">
                        <input type="checkbox" id="parking" name="features" value="parking">
                        <label for="parking">Parking</label>
                    </div>
                    <div class="feature-checkbox">
                        <input type="checkbox" id="garden" name="features" value="garden">
                        <label for="garden">Garden</label>
                    </div>
                    <div class="feature-checkbox">
                        <input type="checkbox" id="pool" name="features" value="pool">
                        <label for="pool">Swimming Pool</label>
                    </div>
                    <div class="feature-checkbox">
                        <input type="checkbox" id="security" name="features" value="security">
                        <label for="security">Security</label>
                    </div>
                    <div class="feature-checkbox">
                        <input type="checkbox" id="elevator" name="features" value="elevator">
                        <label for="elevator">Elevator</label>
                    </div>
                    <div class="feature-checkbox">
                        <input type="checkbox" id="furnished" name="features" value="furnished">
                        <label for="furnished">Furnished</label>
                    </div>
                </div>

                <!-- Action Buttons -->
                <div class="filter-actions">
                    <button type="submit" class="btn btn-primary">
                        <i class="fas fa-search me-2"></i>Search Properties
                    </button>
                    <button type="button" class="btn btn-outline" onclick="clearFilters()">
                        <i class="fas fa-times me-2"></i>Clear Filters
                    </button>
                </div>
            </form>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function clearFilters() {
            // Clear all form inputs
            document.querySelector('form').reset();
            
            // Redirect to dashboard to reset the view
            window.location.href = '${pageContext.request.contextPath}/user/dashboard';
        }
    </script>
</body>
</html> 