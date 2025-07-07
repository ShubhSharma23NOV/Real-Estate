<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.Real_Estate.entity.Notification,java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Client Messages - LuxuryEstate</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/newcss.css">
    <style>
        :root {
            --primary-color: #2c3e50;
            --secondary-color: #3498db;
            --accent-color: #e74c3c;
            --text-color: #2c3e50;
            --light-bg: #f8f9fa;
            --card-bg: #ffffff;
            --hover-color: #2980b9;
        }

        body {
            background-color: var(--light-bg);
            color: var(--text-color);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .navbar {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color)) !important;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        .navbar-brand {
            font-size: 1.5rem;
            font-weight: 600;
            color: white !important;
        }

        .section-title {
            color: var(--primary-color);
            font-size: 2.5rem;
            font-weight: 700;
            margin-bottom: 2rem;
            letter-spacing: -0.5px;
        }

        .message-card {
            margin-bottom: 25px;
            border-radius: 20px;
            box-shadow: 0 10px 20px rgba(0,0,0,0.1);
            background: var(--card-bg);
            transition: all 0.4s ease;
            border: 1px solid rgba(0,0,0,0.1);
        }

        .message-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 15px rgba(0,0,0,0.2);
            border-color: var(--secondary-color);
        }

        .message-header {
            background: linear-gradient(135deg, var(--light-bg), var(--card-bg));
            padding: 20px;
            border-radius: 20px 20px 0 0;
            border-bottom: 1px solid rgba(0,0,0,0.1);
        }

        .message-body {
            padding: 25px;
            background-color: var(--card-bg);
        }

        .message-footer {
            background: var(--light-bg);
            padding: 15px 20px;
            border-radius: 0 0 20px 20px;
            border-top: 1px solid rgba(0,0,0,0.1);
        }

        .status-badge {
            padding: 8px 15px;
            border-radius: 20px;
            font-size: 0.85em;
            font-weight: 500;
            letter-spacing: 0.5px;
        }

        .status-new {
            background-color: var(--accent-color);
            color: white;
        }

        .status-read {
            background-color: var(--primary-color);
            color: white;
        }

        .btn {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            color: white;
            border: none;
            padding: 0.75rem 1.5rem;
            border-radius: 8px;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .btn:hover {
            background: linear-gradient(135deg, var(--secondary-color), var(--primary-color));
            transform: translateY(-2px);
            box-shadow: 0 4px 10px rgba(0,0,0,0.2);
        }

        .btn-outline-secondary {
            background: transparent;
            border: 2px solid var(--primary-color);
            color: var(--primary-color);
        }

        .btn-outline-secondary:hover {
            background: var(--primary-color);
            color: white;
        }

        .search-section {
            background: var(--card-bg);
            border-radius: 20px;
            box-shadow: 0 10px 20px rgba(0,0,0,0.1);
            padding: 25px;
            margin-bottom: 30px;
            border: 1px solid rgba(0,0,0,0.1);
        }

        .form-control, .form-select {
            border-radius: 8px;
            padding: 10px 15px;
            border: 1px solid rgba(0,0,0,0.1);
            transition: all 0.3s ease;
        }

        .form-control:focus, .form-select:focus {
            border-color: var(--secondary-color);
            box-shadow: 0 0 0 0.2rem rgba(52, 152, 219, 0.25);
        }

        .input-group .btn {
            border-radius: 0 8px 8px 0;
        }

        .modal-content {
            border-radius: 20px;
            border: none;
            box-shadow: 0 10px 20px rgba(0,0,0,0.1);
        }

        .modal-header {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            color: white;
            border-radius: 20px 20px 0 0;
        }

        .modal-footer {
            border-top: 1px solid rgba(0, 0, 0, 0.05);
        }

        .client-name {
            font-size: 1.2rem;
            font-weight: 600;
            color: var(--primary-color);
        }

        .client-email {
            color: var(--text-color);
            opacity: 0.8;
            font-size: 0.9rem;
        }

        .message-time {
            color: var(--text-color);
            opacity: 0.8;
            font-size: 0.9rem;
            font-weight: 500;
        }

        .message-content {
            color: var(--text-color);
            line-height: 1.6;
        }

        .message-subject {
            color: var(--primary-color);
            font-weight: 600;
            margin-bottom: 10px;
        }

        .action-buttons {
            display: flex;
            gap: 10px;
        }

        .no-messages {
            text-align: center;
            padding: 50px 20px;
            background: var(--card-bg);
            border-radius: 20px;
            box-shadow: 0 10px 20px rgba(0,0,0,0.1);
            border: 1px solid rgba(0,0,0,0.1);
        }

        .no-messages i {
            font-size: 3rem;
            color: var(--primary-color);
            margin-bottom: 20px;
        }

        .no-messages h3 {
            color: var(--primary-color);
            margin-bottom: 10px;
        }

        .no-messages p {
            color: var(--text-color);
            opacity: 0.8;
        }
    </style>
</head>
<body>
    <!-- Top Navbar (Bootstrap) -->
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/agent/dashboard">
                <i class="fas fa-home me-2"></i>LuxuryEstate
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/agent/dashboard">
                            <i class="fas fa-tachometer-alt me-1"></i>Dashboard
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/agent/properties/my">
                            <i class="fas fa-building me-1"></i>My Properties
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="${pageContext.request.contextPath}/agent/notifications">
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

    <div class="container mt-4">
        <div class="row align-items-center mb-4">
            <div class="col-md-6">
                <h1 class="section-title">Client Messages</h1>
            </div>
            <div class="col-md-6 text-end">
                <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#composeMessageModal">
                    <i class="fas fa-pen me-2"></i>Compose Message
                </button>
            </div>
        </div>

        <!-- Search and Filter Section -->
        <div class="search-section">
            <form class="row g-3">
                <div class="col-md-4">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Search messages...">
                        <button class="btn btn-outline-secondary" type="button">
                            <i class="fas fa-search"></i>
                        </button>
                    </div>
                </div>
                <div class="col-md-3">
                    <select class="form-select">
                        <option value="all">All Messages</option>
                        <option value="new">New Messages</option>
                        <option value="read">Read Messages</option>
                    </select>
                </div>
                <div class="col-md-3">
                    <select class="form-select">
                        <option value="all">All Clients</option>
                        <option value="buyers">Buyers</option>
                        <option value="sellers">Sellers</option>
                    </select>
                </div>
                <div class="col-md-2">
                    <button type="reset" class="btn btn-secondary w-100">
                        <i class="fas fa-undo me-2"></i>Reset
                    </button>
                </div>
            </form>
        </div>

        <!-- Messages List -->
        <div class="messages-container">
            <% List<Notification> notify=(List<Notification>)request.getAttribute("Notifications");
            if(notify!=null && !notify.isEmpty()){
                for(Notification n:notify){	
            %>
                <div class="card message-card" data-id="<%= n.getId() %>">
                    <div class="message-header d-flex justify-content-between align-items-center">
                        <div>
                            <h5 class="client-name mb-1"><%= n.getBuyer().getFirstName()%> <%= n.getBuyer().getLastName()%></h5>
                            <small class="client-email"><%= n.getBuyer().getEmail() %></small>
                        </div>
                        <span class="status-badge <%= n.isRead() ? "status-read" : "status-new" %>"><%= n.isRead() ? "Read" : "New" %></span>
                    </div>
                    <div class="message-body">
                        <h4 class="message-subject">Property Inquiry</h4>
                        <p class="message-content"><%= n.getMessage() %></p>
                    </div>
                    <div class="message-footer d-flex justify-content-between align-items-center">
                        <div class="message-time">
                            <i class="far fa-clock me-1"></i>
                            Appointment Requested: <%= n.getTime() %>
                        </div>
                        <div class="action-buttons">
                            <button class="btn btn-primary">
                                <i class="fas fa-reply me-1"></i>Reply
                            </button>
                            <button class="btn btn-outline-secondary" data-isread="<%= n.isRead() ? "true" : "false" %>">
                                <i class="fas fa-<%= n.isRead() ? "undo" : "check" %> me-1"></i>Mark as <%= n.isRead() ? "Unread" : "Read" %>
                            </button>
                        </div>
                    </div>
                </div>
            <%}
            } else { %>
                <div class="no-messages">
                    <i class="fas fa-inbox"></i>
                    <h3>No Messages Yet</h3>
                    <p>You don't have any client messages at the moment.</p>
                </div>
            <%} %>
        </div>
    </div>

    <!-- Compose Message Modal -->
    <div class="modal fade" id="composeMessageModal" tabindex="-1" aria-labelledby="composeMessageModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="composeMessageModalLabel">
                        <i class="fas fa-pen me-2"></i>Compose Message
                    </h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="mb-3">
                            <label class="form-label">To</label>
                            <select class="form-select">
                                <option value="">Select Client</option>
                                <option value="1">John Doe (john.doe@email.com)</option>
                                <option value="2">Jane Smith (jane.smith@email.com)</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Subject</label>
                            <input type="text" class="form-control" placeholder="Enter subject">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Message</label>
                            <textarea class="form-control" rows="6" placeholder="Type your message here..."></textarea>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-primary">Send Message</button>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Add click handlers for buttons
            const replyButtons = document.querySelectorAll('.btn-primary');
            replyButtons.forEach(button => {
                button.addEventListener('click', function() {
                    // Implement reply functionality
                    alert('Reply functionality to be implemented');
                });
            });

            const markAsReadButtons = document.querySelectorAll('.btn-outline-secondary');
            markAsReadButtons.forEach(button => {
                button.addEventListener('click', function() {
                    // Implement mark as read/unread functionality
                    const isRead = this.getAttribute('data-isread') === 'true';
                    const statusBadge = this.closest('.message-card').querySelector('.status-badge');
                    const notificationId = this.closest('.message-card').getAttribute('data-id') || 0; // Assuming each card has a data-id attribute
                    if (!isRead) {
                        // Mark as Read
                        statusBadge.classList.remove('status-new');
                        statusBadge.classList.add('status-read');
                        statusBadge.textContent = 'Read';
                        this.innerHTML = '<i class="fas fa-undo me-1"></i>Mark as Unread';
                        this.setAttribute('data-isread', 'true');
                        updateReadStatus(notificationId, true);
                    } else {
                        // Mark as Unread
                        statusBadge.classList.remove('status-read');
                        statusBadge.classList.add('status-new');
                        statusBadge.textContent = 'New';
                        this.innerHTML = '<i class="fas fa-check me-1"></i>Mark as Read';
                        this.setAttribute('data-isread', 'false');
                        updateReadStatus(notificationId, false);
                    }
                });
            });

            function updateReadStatus(notificationId, isRead) {
                fetch('${pageContext.request.contextPath}/agent/notifications/updateReadStatus', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded',
                    },
                    body: 'id=' + encodeURIComponent(notificationId) + '&isRead=' + encodeURIComponent(isRead)
                })
                .then(response => response.text())
                .then(data => {
                    console.log('Status updated:', data);
                })
                .catch(error => {
                    console.error('Error updating status:', error);
                });
            }
        });
    </script>
</body>
</html>
