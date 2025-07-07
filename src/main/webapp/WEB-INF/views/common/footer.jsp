<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<footer class="footer">
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <h4>SthayiNivas.com</h4>
                <p>Your trusted partner in finding the perfect property. We specialize in luxury real estate and provide exceptional service to our clients.</p>
            </div>
            <div class="col-md-4">
                <h4>Quick Links</h4>
                <ul class="footer-links">
                    <li><a href="${pageContext.request.contextPath}/about">About Us</a></li>
                    <li><a href="${pageContext.request.contextPath}/contact">Contact Us</a></li>
                    <li><a href="${pageContext.request.contextPath}/privacy">Privacy Policy</a></li>
                    <li><a href="${pageContext.request.contextPath}/terms">Terms & Conditions</a></li>
                </ul>
            </div>
            <div class="col-md-4">
                <h4>Contact Info</h4>
                <ul class="footer-contact">
                    <li><i class="fas fa-map-marker-alt me-2"></i>123 Luxury Street, Beverly Hills, CA 90210</li>
                    <li><i class="fas fa-phone me-2"></i>+1 (234) 567-8900</li>
                    <li><i class="fas fa-envelope me-2"></i>info@sthayinivas.com</li>
                </ul>
                <div class="social-links mt-3">
                    <a href="#" class="social-link"><i class="fab fa-facebook-f"></i></a>
                    <a href="#" class="social-link"><i class="fab fa-twitter"></i></a>
                    <a href="#" class="social-link"><i class="fab fa-instagram"></i></a>
                    <a href="#" class="social-link"><i class="fab fa-linkedin-in"></i></a>
                </div>
            </div>
        </div>
        <div class="footer-bottom">
            <p>&copy; 2024 SthayiNivas.com. All rights reserved.</p>
        </div>
    </div>
    <button id="chatWidgetToggle" class="chat-widget-toggle">
        <i class="fas fa-comment-alt"></i>
    </button>
    <jsp:include page="chat-widget.jsp" />
</footer>
