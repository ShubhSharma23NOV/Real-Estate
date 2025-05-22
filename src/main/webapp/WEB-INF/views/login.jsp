<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - LuxuryEstate</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/darktheme.css">
    <style>
        .error-message {
            background-color: #dc3545;
            color: white;
            padding: 1rem;
            border-radius: 4px;
            margin-bottom: 1rem;
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
        <section class="auth-section">
            <div class="auth-container">
                <h1 class="section-title">Welcome Back</h1>
                
                <% if(request.getAttribute("error") != null) { %>
                    <div class="error-message">
                        <%= request.getAttribute("error") %>
                    </div>
                <% } %>

                <div class="form-container">
                    <form action="${pageContext.request.contextPath}/log" method="post">
                        <div class="form-group">
                            <label for="email" class="form-label">Email Address</label>
                            <input type="email" id="email" name="email" class="form-input" 
                                   value="${email}" required>
                        </div>
                        
                        <div class="form-group">
                            <label for="password" class="form-label">Password</label>
                            <input type="password" id="password" name="password" class="form-input" required>
                        </div>
                        
                        <div class="form-group">
                            <label for="userType" class="form-label">I am a</label>
                            <select id="userType" name="userType" class="form-input" required>
                                <option value="">Select User Type</option>
                                <option value="USER" ${userType == 'USER' ? 'selected' : ''}>User</option>
                                <option value="AGENT" ${userType == 'AGENT' ? 'selected' : ''}>Agent</option>
                                <option value="ADMIN" ${userType == 'ADMIN' ? 'selected' : ''}>Admin</option>
                            </select>
                        </div>
                        
                        <div class="form-group">
                            <button type="submit" class="btn">Login</button>
                        </div>
                        
                        <p class="text-center">
                            Don't have an account? 
                            <a href="${pageContext.request.contextPath}/register" style="color: var(--accent-color);">Register here</a>
                        </p>
                    </form>
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