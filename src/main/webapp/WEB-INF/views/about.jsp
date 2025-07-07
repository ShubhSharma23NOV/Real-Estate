<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - SthayiNivas.com</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/newcss.css">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/">
                <i class="fas fa-home me-2"></i>SthayiNivas.com
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                    aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/">
                            <i class="fas fa-home me-1"></i> Home
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="${pageContext.request.contextPath}/about">
                            <i class="fas fa-info-circle me-1"></i> About Us
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/contact">
                            <i class="fas fa-envelope me-1"></i> Contact Us
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/login">
                            <i class="fas fa-sign-in-alt me-1"></i> Login
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/register">
                            <i class="fas fa-user-plus me-1"></i> Register
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <section class="about-hero">
        <div class="container">
            <h1>About SthayiNivas.com</h1>
            <p>Your Trusted Partner in Luxury Real Estate</p>
        </div>
    </section>

    <section class="about-section">
        <div class="container">
            <div class="row align-items-center mb-5">
                <div class="col-lg-6">
                    <div class="about-content">
                        <h2>Our Story</h2>
                        <p>Founded in 2010, SthayiNivas.com has been at the forefront of luxury real estate, helping clients find their dream properties across the most prestigious locations. Our commitment to excellence and personalized service has made us a trusted name in the industry.</p>
                        <p>We believe that finding the perfect property is more than just a transaction – it's about creating lasting relationships and understanding our clients' unique needs and aspirations.</p>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="about-image">
                        <img src="https://images.unsplash.com/photo-1560518883-ce09059eeffa?ixlib=rb-4.0.3" alt="Luxury Estate" class="img-fluid rounded">
                    </div>
                </div>
            </div>

            <div class="row mb-5">
                <div class="col-12 text-center">
                    <h2 class="mb-4">Why Choose Us</h2>
                </div>
                <div class="col-md-4">
                    <div class="feature-card">
                        <i class="fas fa-medal feature-icon"></i>
                        <h3>Expertise</h3>
                        <p>Our team of experienced agents brings years of market knowledge and negotiation skills to every transaction.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="feature-card">
                        <i class="fas fa-handshake feature-icon"></i>
                        <h3>Trust</h3>
                        <p>We build lasting relationships with our clients based on transparency, integrity, and exceptional service.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="feature-card">
                        <i class="fas fa-chart-line feature-icon"></i>
                        <h3>Results</h3>
                        <p>Our track record of successful transactions and satisfied clients speaks to our commitment to excellence.</p>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-12 text-center mb-5">
                    <h2>Our Leadership Team</h2>
                </div>
                <div class="col-md-4">
                    <div class="team-card">
                        <div class="team-image">
                            <img src="https://images.unsplash.com/photo-1560250097-0b93528c311a?ixlib=rb-4.0.3" alt="John Smith">
                        </div>
                        <div class="team-info">
                            <h3>John Smith</h3>
                            <p class="team-title">CEO & Founder</p>
                            <p class="team-description">With over 20 years of experience in luxury real estate, John leads our company with vision and expertise.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="team-card">
                        <div class="team-image">
                            <img src="https://images.unsplash.com/photo-1573496359142-b8d87734a5a2?ixlib=rb-4.0.3" alt="Sarah Johnson">
                        </div>
                        <div class="team-info">
                            <h3>Sarah Johnson</h3>
                            <p class="team-title">Chief Operations Officer</p>
                            <p class="team-description">Sarah ensures that every aspect of our operations meets the highest standards of excellence.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="team-card">
                        <div class="team-image">
                            <img src="https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixlib=rb-4.0.3" alt="Michael Brown">
                        </div>
                        <div class="team-info">
                            <h3>Michael Brown</h3>
                            <p class="team-title">Head of Sales</p>
                            <p class="team-description">Michael leads our sales team with innovative strategies and a deep understanding of the market.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html> 