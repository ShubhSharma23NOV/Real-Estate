<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - LuxuryEstate</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/darktheme.css">
    <style>
        .dashboard-container {
            padding: 2rem;
        }

        .stats-cards {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 1.5rem;
            margin-bottom: 2rem;
        }

        .stat-card {
            background: var(--card-bg);
            padding: 1.5rem;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        .stat-card h3 {
            color: var(--text-color);
            margin-bottom: 0.5rem;
        }

        .stat-card .number {
            font-size: 2rem;
            font-weight: bold;
            color: var(--accent-color);
        }

        .user-table {
            width: 100%;
            background: var(--card-bg);
            border-radius: 8px;
            overflow: hidden;
            margin-top: 2rem;
        }

        .user-table th {
            background: var(--accent-color);
            color: white;
            padding: 1rem;
            text-align: left;
        }

        .user-table td {
            padding: 1rem;
            border-bottom: 1px solid var(--border-color);
        }

        .user-table tr:hover {
            background: var(--hover-color);
        }

        .action-buttons {
            display: flex;
            gap: 0.5rem;
        }

        .action-btn {
            padding: 0.5rem 1rem;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .edit-btn {
            background: var(--accent-color);
            color: white;
        }

        .delete-btn {
            background: #dc3545;
            color: white;
        }

        .search-bar {
            margin-bottom: 2rem;
            display: flex;
            gap: 1rem;
        }

        .search-input {
            flex: 1;
            padding: 0.5rem;
            border: 1px solid var(--border-color);
            border-radius: 4px;
            background: var(--input-bg);
            color: var(--text-color);
        }

        .filter-select {
            padding: 0.5rem;
            border: 1px solid var(--border-color);
            border-radius: 4px;
            background: var(--input-bg);
            color: var(--text-color);
        }

        .status-badge {
            padding: 0.25rem 0.5rem;
            border-radius: 4px;
            font-size: 0.875rem;
        }

        .status-active {
            background: #28a745;
            color: white;
        }

        .status-inactive {
            background: #dc3545;
            color: white;
        }
    </style>
</head>
<body>
    <header class="header">
        <nav class="nav-menu">
            <a href="${pageContext.request.contextPath}/admin/dashboard" class="active">Dashboard</a>
            <a href="${pageContext.request.contextPath}/admin/users">User Management</a>
            <a href="${pageContext.request.contextPath}/admin/properties">Property Management</a>
            <a href="${pageContext.request.contextPath}/admin/settings">Settings</a>
            <a href="${pageContext.request.contextPath}/login">Logout</a>
        </nav>
    </header>

    <main class="dashboard-container">
        <h1 class="section-title">Admin Dashboard</h1>
        
        <!-- Statistics Cards -->
        <div class="stats-cards">
            <div class="stat-card">
                <h3>Total Users</h3>
                <div class="number">1,234</div>
            </div>
            <div class="stat-card">
                <h3>Active Properties</h3>
                <div class="number">567</div>
            </div>
            <div class="stat-card">
                <h3>Total Agents</h3>
                <div class="number">89</div>
            </div>
            <div class="stat-card">
                <h3>New Registrations</h3>
                <div class="number">45</div>
            </div>
        </div>

        <!-- User Management Section -->
        <section>
            <h2 class="section-title">User Management</h2>
            
            <div class="search-bar">
                <input type="text" class="search-input" placeholder="Search users...">
                <select class="filter-select">
                    <option value="">All Roles</option>
                    <option value="USER">Users</option>
                    <option value="AGENT">Agents</option>
                    <option value="ADMIN">Admins</option>
                </select>
                <button class="btn btn-primary">
                    <i class="fas fa-plus"></i> Add New User
                </button>
            </div>

            <table class="user-table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Role</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td>John Doe</td>
                        <td>john@example.com</td>
                        <td>+1 234-567-8900</td>
                        <td>USER</td>
                        <td><span class="status-badge status-active">Active</span></td>
                        <td class="action-buttons">
                            <button class="action-btn edit-btn">
                                <i class="fas fa-edit"></i> Edit
                            </button>
                            <button class="action-btn delete-btn">
                                <i class="fas fa-trash"></i> Delete
                            </button>
                        </td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>Jane Smith</td>
                        <td>jane@example.com</td>
                        <td>+1 234-567-8901</td>
                        <td>AGENT</td>
                        <td><span class="status-badge status-active">Active</span></td>
                        <td class="action-buttons">
                            <button class="action-btn edit-btn">
                                <i class="fas fa-edit"></i> Edit
                            </button>
                            <button class="action-btn delete-btn">
                                <i class="fas fa-trash"></i> Delete
                            </button>
                        </td>
                    </tr>
                </tbody>
            </table>
        </section>
    </main>

    <footer class="footer">
        <div class="footer-content">
            <p>&copy; 2024 LuxuryEstate. All rights reserved.</p>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html> 