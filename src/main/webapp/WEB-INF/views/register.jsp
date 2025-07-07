<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - LuxuryEstate</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/newcss.css">
    <style>
        .register-container {
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 2rem;
        }

        .register-card {
            background: var(--card-bg);
            padding: 2rem;
            border-radius: 15px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            width: 100%;
            max-width: 500px;
        }

        .register-header {
            text-align: center;
            margin-bottom: 2rem;
        }

        .register-header h1 {
            color: var(--primary-color);
            font-weight: 600;
        }

        .form-control {
            border-radius: 8px;
            padding: 0.75rem 1rem;
            border: 1px solid rgba(0,0,0,0.1);
        }

        .form-control:focus {
            border-color: var(--secondary-color);
            box-shadow: 0 0 0 0.2rem rgba(52, 152, 219, 0.25);
        }

        .btn-register {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            border: none;
            padding: 0.75rem;
            border-radius: 8px;
            font-weight: 500;
            width: 100%;
            margin-top: 1rem;
        }

        .btn-register:hover {
            background: linear-gradient(135deg, var(--secondary-color), var(--primary-color));
            transform: translateY(-1px);
        }

        .login-link {
            text-align: center;
            margin-top: 1.5rem;
        }

        .login-link a {
            color: var(--secondary-color);
            text-decoration: none;
            font-weight: 500;
        }

        .login-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/">
                <i class="fas fa-home me-2"></i>LuxuryEstate
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
                        <a class="nav-link" href="${pageContext.request.contextPath}/login">
                            <i class="fas fa-sign-in-alt me-1"></i> Login
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="register-container">
        <div class="register-card">
            <div class="register-header">
                <h1>Create Account</h1>
                <p class="text-muted">Join our real estate community</p>
            </div>
            <form action="${pageContext.request.contextPath}/regis" method="post">
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="firstName" class="form-label">First Name</label>
                        <input type="text" class="form-control" id="firstName" name="firstName" required>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="lastName" class="form-label">Last Name</label>
                        <input type="text" class="form-control" id="lastName" name="lastName" required>
                    </div>
                </div>
                <div class="mb-3">
                    <label for="email" class="form-label">Email address</label>
                    <input type="email" class="form-control" id="email" name="email" required>
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Password</label>
                    <input type="password" class="form-control" id="password" name="password" required>
                </div>
                <div class="mb-3">
                    <label for="confirmPassword" class="form-label">Confirm Password</label>
                    <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required>
                </div>
                <div class="mb-3">
                    <label  class="form-label">Phone Number</label>
                    <input type="tel" class="form-control" id="confirmPassword" name="Password" required>
                </div>
                <div class="mb-3">
                    <label for="userType" class="form-label">I am a</label>
                    <select class="form-select" id="userType" name="ur" required>
                        <option value="">Select User Type</option>
                        <option value="USER">User</option>
                        <option value="ADMIN">Admin</option>
                        <option value="AGENT">Agent</option>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="otp" class="form-label">OTP Verification</label>
                    <div class="input-group">
                        <input type="text" class="form-control" id="otp" name="otp" placeholder="Enter OTP" required>
                        <button type="button" class="btn btn-outline-primary" id="sendOtpBtn" onclick="sendOtp()">
                            <i class="fas fa-paper-plane me-1"></i>Send OTP
                        </button>
                    </div>
                    <small class="text-muted">Enter the OTP sent to your email</small>
                </div>
                
                <button type="submit" class="btn btn-primary btn-register">
                    <i class="fas fa-user-plus me-2"></i>Register
                </button>
            </form>
            <div class="login-link">
                <p>Already have an account? <a href="${pageContext.request.contextPath}/login">Login here</a></p>
            </div>
        </div>
    </div>

    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
    function sendOtp() {
        const email = document.getElementById("email").value;
        if (!email) {
            alert("Please enter your email address.");
            return;
        }

        // Disable the button while sending
        const sendOtpBtn = document.getElementById("sendOtpBtn");
        sendOtpBtn.disabled = true;
        sendOtpBtn.innerHTML = '<i class="fas fa-spinner fa-spin me-1"></i>Sending...';

        fetch('${pageContext.request.contextPath}/api/otp/send?email=' + encodeURIComponent(email), {
            method: 'POST'
        })
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            return response.text();
        })
        .then(data => {
            document.getElementById("otp-status").innerText = data;
            document.getElementById("otp-status").classList.add("text-success");
            document.getElementById("otp-status").classList.remove("text-danger");
        })
        .catch(error => {
            console.error('Error:', error);
            document.getElementById("otp-status").innerText = "Failed to send OTP. Please try again.";
            document.getElementById("otp-status").classList.add("text-danger");
            document.getElementById("otp-status").classList.remove("text-success");
        })
        .finally(() => {
            // Re-enable the button
            sendOtpBtn.disabled = false;
            sendOtpBtn.innerHTML = '<i class="fas fa-paper-plane me-1"></i>Send OTP';
        });
    }

    function validateForm() {
        const email = document.getElementById('email').value;
        const password = document.getElementById('password').value;
        const otp = document.getElementById('otp').value;
        
        if (!email || !password || !otp) {
            alert('Please fill in all required fields');
            return false;
        }
        return true;
    }
    </script>
</body>
</html> 