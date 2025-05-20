<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - LuxuryEstate</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/darktheme.css">
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
        <section class="mb-2">
            <h1 class="section-title">Create Your Account</h1>
            
            <div class="form-container">
                <form action="${pageContext.request.contextPath}/regis" method="post">
                    <div class="form-group">
                        <label for="firstName" class="form-label">First Name</label>
                        <input type="text" id="firstName" name="firstName" class="form-input" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="lastName" class="form-label">Last Name</label>
                        <input type="text" id="lastName" name="lastName" class="form-input" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="email" class="form-label">Email Address</label>
                        <input type="email" id="email" name="email" class="form-input" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="password" class="form-label">Password</label>
                        <input type="password" id="password" name="password" class="form-input" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="confirmPassword" class="form-label">Confirm Password</label>
                        <input type="password" id="confirmPassword" name="confirmPassword" class="form-input" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="phoneNumber" class="form-label">Phone Number</label>
                        <input type="tel" id="phoneNumber" name="phoneNumber" class="form-input" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="ur" class="form-label">I am a</label>
                        <select id="ur" name="ur" class="form-input" required>
                            <option value="">Select User Type</option>
                            <option value="BUYER">Buyer</option>
                            <option value="SELLER">Seller</option>
                            <option value="AGENT">Agent</option>
                            <option value="ADMIN">Admin</option>
                        </select>
                    </div>
                    
                    <div class="form-group">
                        <button type="submit" class="btn">Register</button>
                    </div>
                    
                    <p class="text-center">
                        Already have an account? 
                        <a href="${pageContext.request.contextPath}/login" style="color: var(--accent-color);">Login here</a>
                    </p>
                </form>
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