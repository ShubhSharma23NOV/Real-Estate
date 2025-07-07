<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chatbot - LuxuryEstate</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/newcss.css">
    <style>
        body {
            background-color: var(--light-bg);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .chatbot-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 2rem 1rem;
            min-height: 100vh;
        }

        .welcome-section {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            border-radius: 25px;
            padding: 3rem;
            margin-bottom: 2.5rem;
            color: white;
            box-shadow: 0 10px 30px rgba(0,0,0,0.15);
            position: relative;
            overflow: hidden;
            animation: fadeIn 0.5s ease-out;
        }

        .welcome-section::before {
            content: '';
            position: absolute;
            top: 0;
            right: 0;
            width: 350px;
            height: 350px;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 50%;
            transform: translate(35%, -35%);
        }

        .welcome-section::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 200px;
            height: 200px;
            background: rgba(255, 255, 255, 0.05);
            border-radius: 50%;
            transform: translate(-30%, 30%);
        }

        .welcome-section h1 {
            font-size: 2.8rem;
            font-weight: 800;
            margin-bottom: 0.7rem;
            position: relative;
            display: flex;
            align-items: center;
        }

        .welcome-section h1::before {
            content: "\f086";
            font-family: "Font Awesome 5 Free";
            font-weight: 900;
            margin-right: 0.7rem;
            font-size: 2.2rem;
            animation: pulse 3s infinite ease-in-out;
        }

        .welcome-section p {
            font-size: 1.2rem;
            opacity: 0.9;
            margin-bottom: 0;
            position: relative;
            line-height: 1.6;
        }

        .chat-window {
            background: rgba(255, 255, 255, 0.2);
            box-shadow: 0 10px 35px 0 rgba(31, 38, 135, 0.2);
            backdrop-filter: blur(10px);
            -webkit-backdrop-filter: blur(10px);
            border-radius: 20px;
            border: 1px solid rgba(255, 255, 255, 0.2);
            height: 65vh;
            max-height: 65vh;
            display: flex;
            flex-direction: column;
            overflow: hidden;
            background: linear-gradient(to bottom, rgba(255, 255, 255, 0.15), rgba(255, 255, 255, 0.05));
        }

        .chat-messages {
            flex: 1;
            padding: 2rem;
            overflow-y: auto;
            display: flex;
            flex-direction: column;
        }

        .message {
            margin-bottom: 1.8rem;
            max-width: 85%;
            opacity: 0;
            transform: translateY(15px);
            animation: fadeInUp 0.4s forwards;
        }

        @keyframes fadeInUp {
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .message.received {
            background: #f1f3f6;
            align-self: flex-start;
            border-radius: 20px 20px 20px 6px;
            box-shadow: 0 3px 10px rgba(0, 0, 0, 0.1);
            position: relative;
        }

        .message.received::before {
            content: '';
            position: absolute;
            left: -10px;
            top: 50%;
            transform: translateY(-50%);
            width: 0;
            height: 0;
            border-style: solid;
            border-width: 10px 10px 10px 0;
            border-color: transparent #f1f3f6 transparent transparent;
        }

        .message.sent {
            background: linear-gradient(135deg, var(--primary-color), var(--primary-dark));
            color: white;
            align-self: flex-end;
            border-radius: 20px 20px 6px 20px;
            box-shadow: 0 3px 10px rgba(0, 0, 0, 0.15);
            position: relative;
        }

        .message.sent::before {
            content: '';
            position: absolute;
            right: -10px;
            top: 50%;
            transform: translateY(-50%);
            width: 0;
            height: 0;
            border-style: solid;
            border-width: 10px 0 10px 10px;
            border-color: transparent transparent transparent var(--primary-color);
        }

        .typing-indicator {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 24px;
        }

        .typing-indicator span {
            height: 8px;
            width: 8px;
            background-color: #bbb;
            border-radius: 50%;
            display: inline-block;
            margin: 0 3px;
            animation: typing 1.5s infinite;
        }

        .typing-indicator span:nth-child(1) {
            animation-delay: 0s;
        }

        .typing-indicator span:nth-child(2) {
            animation-delay: 0.2s;
        }

        .typing-indicator span:nth-child(3) {
            animation-delay: 0.4s;
        }

        @keyframes typing {
            0%, 100% {
                transform: translateY(0);
            }
            50% {
                transform: translateY(-5px);
            }
        }

        .message-content {
            padding: 1rem 1.5rem;
            line-height: 1.6;
        }

        .message-time {
            font-size: 0.8rem;
            opacity: 0.75;
            margin-top: 0.4rem;
            display: block;
            font-style: italic;
        }

        .chat-input {
            padding: 1.8rem;
            border-top: 1px solid rgba(255, 255, 255, 0.2);
            background: rgba(255, 255, 255, 0.1);
            box-shadow: 0 -3px 15px rgba(0, 0, 0, 0.05);
        }

        .input-group {
            display: flex;
            gap: 1.2rem;
            align-items: center;
        }

        .input-group textarea {
            flex: 1;
            border: 1px solid rgba(255, 255, 255, 0.25);
            border-radius: 15px;
            padding: 1rem 1.3rem;
            resize: none;
            min-height: 70px;
            background: rgba(255, 255, 255, 0.7);
            color: var(--secondary-color);
            font-size: 1rem;
            transition: all 0.2s ease;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.05);
        }

        .input-group textarea:focus {
            outline: none;
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgba(var(--primary-rgb), 0.2);
            background: rgba(255, 255, 255, 0.85);
        }

        .send-btn {
            background: var(--primary-color);
            border: none;
            border-radius: 50%;
            width: 60px;
            height: 60px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 4px 12px rgba(var(--primary-rgb), 0.3);
        }

        .send-btn:hover {
            background: var(--primary-dark);
            transform: translateY(-3px) rotate(10deg);
            box-shadow: 0 6px 18px rgba(var(--primary-rgb), 0.4);
        }

        .glass-navbar {
            background: rgba(255,255,255,0.7)!important;
            backdrop-filter: blur(8px);
            -webkit-backdrop-filter: blur(8px);
            border-radius: 0 0 18px 18px;
            border-bottom: 1px solid rgba(200,200,200,0.18);
        }

        .glass-navbar .navbar-brand {
            color: var(--primary-color);
            font-size: 1.4rem;
        }

        .glass-navbar .nav-link {
            color: var(--secondary-color);
            font-weight: 500;
            margin-left: 1rem;
            transition: color 0.2s;
        }

        .glass-navbar .nav-link.active, .glass-navbar .nav-link:hover {
            color: var(--primary-color);
        }

        .glass-navbar .nav-link.text-danger {
            color: #e74c3c !important;
        }

        @media (max-width: 768px) {
            .glass-navbar {
                border-radius: 0 0 12px 12px;
            }
            .glass-navbar .nav-link {
                margin-left: 0.5rem;
            }
            .chatbot-container {
                padding: 1rem 0.5rem;
            }
            .chat-window {
                height: 70vh;
            }
        }

        .footer {
            background: #f8f9fa;
            color: #6c757d;
            font-size: 1rem;
            border-radius: 12px 12px 0 0;
            box-shadow: 0 -2px 12px rgba(0,0,0,0.04);
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(10px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes pulse {
            0%, 100% { transform: scale(1); opacity: 1; }
            50% { transform: scale(1.1); opacity: 0.8; }
        }
    </style>
</head>
<body>
    <!-- Top Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark glass-navbar">
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

    <div class="chatbot-container">
        <!-- Welcome Section -->
        <div class="welcome-section">
            <h1>Chat with Us</h1>
            <p>Our virtual assistant is here to help you with any questions about properties or services.</p>
        </div>

        <!-- Chat Window -->
        <div class="chat-window">
            <div class="chat-messages" id="chatMessages">
                <!-- Sample messages -->
                <div class="message received">
                    <div class="message-content">
                        Hello! How can I assist you today?
                        <div class="message-time">Just now</div>
                    </div>
                </div>
            </div>
            <div class="chat-input">
                <div class="input-group">
                    <textarea id="chatInput" placeholder="Type your message here..."></textarea>
                    <button class="send-btn" onclick="sendMessage()">
                        <i class="fas fa-paper-plane"></i>
                    </button>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        async function sendMessage() {
            const input = document.getElementById('chatInput');
            const chatMessages = document.getElementById('chatMessages');
            const messageText = input.value.trim();

                if (messageText !== '') {
                    // Create sent message element
                    const sentMessage = document.createElement('div');
                    sentMessage.className = 'message sent';
                    const sentContentDiv = document.createElement('div');
                    sentContentDiv.className = 'message-content';
                    const sentTextNode = document.createTextNode(messageText);
                    const sentTimeDiv = document.createElement('div');
                    sentTimeDiv.className = 'message-time';
                    sentTimeDiv.textContent = 'Just now';
                    sentContentDiv.appendChild(sentTextNode);
                    sentContentDiv.appendChild(sentTimeDiv);
                    sentMessage.appendChild(sentContentDiv);
                    if (chatMessages) {
                        chatMessages.appendChild(sentMessage);
                        // Clear input
                        input.value = '';
                        // Auto-scroll to bottom with a small delay to ensure DOM update
                        setTimeout(() => {
                            chatMessages.scrollTop = chatMessages.scrollHeight;
                        }, 100);
                    } else {
                        console.error('Chat messages container not found');
                    }

                    // Show loading indicator
                    const loadingMessage = document.createElement('div');
                    loadingMessage.className = 'message received loading';
                    loadingMessage.innerHTML = `
                        <div class="message-content">
                            <div class="typing-indicator">
                                <span></span>
                                <span></span>
                                <span></span>
                            </div>
                            <div class="message-time">Just now</div>
                        </div>
                    `;
                    if (chatMessages) {
                        chatMessages.appendChild(loadingMessage);
                        setTimeout(() => {
                            chatMessages.scrollTop = chatMessages.scrollHeight;
                        }, 100);
                    }

                try {
                    const response = await fetch('/chat', {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/json'
                        },
                        body: JSON.stringify({ message: messageText })
                    });

                    let replyText;
                    console.log('Response status:', response.status);
                    console.log('Response headers:', [...response.headers.entries()]);
                    if (response.ok) {
                        replyText = await response.text();
                        console.log('Response text (success):', replyText);
                    } else {
                        replyText = await response.text();
                        console.error('Error response:', replyText);
                        replyText = "Sorry, there was an error processing your message. Status: " + response.status + ". Details: " + replyText;
                    }
                    // Remove loading indicator
                    const loadingElement = chatMessages.querySelector('.loading');
                    if (loadingElement) {
                        loadingElement.remove();
                    }

                    const receivedMessage = document.createElement('div');
                    receivedMessage.className = 'message received';
                    const receivedContentDiv = document.createElement('div');
                    receivedContentDiv.className = 'message-content';
                    const receivedTextNode = document.createTextNode(replyText);
                    const receivedTimeDiv = document.createElement('div');
                    receivedTimeDiv.className = 'message-time';
                    receivedTimeDiv.textContent = 'Just now';
                    receivedContentDiv.appendChild(receivedTextNode);
                    receivedContentDiv.appendChild(receivedTimeDiv);
                    receivedMessage.appendChild(receivedContentDiv);
                    if (chatMessages) {
                        chatMessages.appendChild(receivedMessage);
                        // Auto-scroll to bottom with a small delay to ensure DOM update
                        setTimeout(() => {
                            chatMessages.scrollTop = chatMessages.scrollHeight;
                        }, 100);
                    } else {
                        console.error('Chat messages container not found');
                    }

                } catch (error) {
                    console.error('Error:', error);
                    // Remove loading indicator
                    const loadingElement = chatMessages.querySelector('.loading');
                    if (loadingElement) {
                        loadingElement.remove();
                    }

                    const receivedMessage = document.createElement('div');
                    receivedMessage.className = 'message received';
                    const receivedContentDiv = document.createElement('div');
                    receivedContentDiv.className = 'message-content';
                    const receivedTextNode = document.createTextNode("Sorry, there was an error processing your message. Please try again. Error: " + error.message);
                    const receivedTimeDiv = document.createElement('div');
                    receivedTimeDiv.className = 'message-time';
                    receivedTimeDiv.textContent = 'Just now';
                    receivedContentDiv.appendChild(receivedTextNode);
                    receivedContentDiv.appendChild(receivedTimeDiv);
                    receivedMessage.appendChild(receivedContentDiv);
                    if (chatMessages) {
                        chatMessages.appendChild(receivedMessage);
                        // Auto-scroll to bottom with a small delay to ensure DOM update
                        setTimeout(() => {
                            chatMessages.scrollTop = chatMessages.scrollHeight;
                        }, 100);
                    } else {
                        console.error('Chat messages container not found');
                    }
                }
            }
        }

        // Allow sending message with Enter key
        document.addEventListener('DOMContentLoaded', function() {
            const chatInput = document.getElementById('chatInput');
            if (chatInput) {
                chatInput.addEventListener('keypress', function(e) {
                    if (e.key === 'Enter' && !e.shiftKey) {
                        e.preventDefault();
                        sendMessage();
                    }
                });
            }
        });
    </script>
</body>
</html>
