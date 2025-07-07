<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="chatWidget" class="chat-widget">
    <div class="chat-widget-header">
        <h5>Chat with Us</h5>
        <button id="closeChatWidget" class="chat-widget-close-btn">
            <i class="fas fa-times"></i>
        </button>
    </div>
    <div class="chat-widget-body">
        <div class="chat-messages" id="chatMessages">
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

<style>
    .chat-widget {
        position: fixed;
        bottom: 80px;
        right: 20px;
        width: 400px;
        height: 580px;
        background: rgba(255, 255, 255, 0.95);
        box-shadow: 0 12px 45px 0 rgba(31, 38, 135, 0.4);
        backdrop-filter: blur(12px);
        -webkit-backdrop-filter: blur(12px);
        border-radius: 20px;
        border: 1px solid rgba(255, 255, 255, 0.25);
        display: none;
        flex-direction: column;
        z-index: 1000;
        overflow: hidden;
        animation: slideIn 0.3s ease-out;
    }

    @keyframes slideIn {
        from {
            transform: translateY(100px);
            opacity: 0;
        }
        to {
            transform: translateY(0);
            opacity: 1;
        }
    }

    .chat-widget-header {
        padding: 1.3rem 1.6rem;
        background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
        color: white;
        display: flex;
        justify-content: space-between;
        align-items: center;
        border-radius: 20px 20px 0 0;
        box-shadow: 0 3px 12px rgba(0, 0, 0, 0.15);
        position: relative;
    }

    .chat-widget-header::after {
        content: '';
        position: absolute;
        bottom: 0;
        left: 0;
        right: 0;
        height: 1px;
        background: linear-gradient(to right, transparent, rgba(255, 255, 255, 0.3), transparent);
    }

    .chat-widget-header h5 {
        margin: 0;
        font-size: 1.3rem;
        font-weight: 700;
        display: flex;
        align-items: center;
    }

    .chat-widget-header h5::before {
        content: "\f144";
        font-family: "Font Awesome 5 Free";
        font-weight: 900;
        margin-right: 0.5rem;
        font-size: 1.2rem;
        animation: pulse 3s infinite ease-in-out;
    }

    @keyframes pulse {
        0%, 100% { transform: scale(1); opacity: 1; }
        50% { transform: scale(1.1); opacity: 0.8; }
    }

    .chat-widget-close-btn {
        background: rgba(255, 255, 255, 0.2);
        border: none;
        color: white;
        cursor: pointer;
        width: 30px;
        height: 30px;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        transition: all 0.3s ease;
    }

    .chat-widget-close-btn:hover {
        background: rgba(255, 255, 255, 0.3);
        transform: scale(1.1);
    }

    .chat-widget-body {
        flex: 1;
        display: flex;
        flex-direction: column;
        height: calc(580px - 70px);
    }

    .chat-messages {
        flex: 1;
        padding: 1.5rem;
        overflow-y: auto;
        display: flex;
        flex-direction: column;
        background: linear-gradient(to bottom, rgba(255, 255, 255, 0.1), rgba(255, 255, 255, 0.05));
    }

    .message {
        margin-bottom: 1.5rem;
        max-width: 85%;
        opacity: 0;
        transform: translateY(10px);
        animation: fadeInUp 0.3s forwards;
    }

    @keyframes fadeInUp {
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }

    .message.received {
        background: #f0f2f5;
        align-self: flex-start;
        border-radius: 18px 18px 18px 6px;
        box-shadow: 0 3px 8px rgba(0, 0, 0, 0.1);
        position: relative;
    }

    .message.received::before {
        content: '';
        position: absolute;
        left: -8px;
        top: 50%;
        transform: translateY(-50%);
        width: 0;
        height: 0;
        border-style: solid;
        border-width: 8px 8px 8px 0;
        border-color: transparent #f0f2f5 transparent transparent;
    }

    .message.sent {
        background: linear-gradient(135deg, var(--primary-color), var(--primary-dark));
        color: white;
        align-self: flex-end;
        border-radius: 18px 18px 6px 18px;
        box-shadow: 0 3px 8px rgba(0, 0, 0, 0.15);
        position: relative;
    }

    .message.sent::before {
        content: '';
        position: absolute;
        right: -8px;
        top: 50%;
        transform: translateY(-50%);
        width: 0;
        height: 0;
        border-style: solid;
        border-width: 8px 0 8px 8px;
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
        padding: 0.9rem 1.4rem;
        font-size: 1rem;
        line-height: 1.5;
        word-wrap: break-word;
    }

    .message-time {
        font-size: 0.75rem;
        opacity: 0.8;
        margin-top: 0.3rem;
        display: block;
        font-style: italic;
    }

    .chat-input {
        padding: 1.3rem 1.5rem;
        border-top: 1px solid rgba(200, 200, 200, 0.15);
        background: rgba(255, 255, 255, 0.15);
        box-shadow: 0 -3px 15px rgba(0, 0, 0, 0.05);
    }

    .input-group {
        display: flex;
        gap: 1rem;
        align-items: center;
    }

    .input-group textarea {
        flex: 1;
        border: 1px solid rgba(200, 200, 200, 0.25);
        border-radius: 15px;
        padding: 0.9rem 1.3rem;
        resize: none;
        min-height: 65px;
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
        width: 58px;
        height: 58px;
        display: flex;
        align-items: center;
        justify-content: center;
        color: white;
        cursor: pointer;
        box-shadow: 0 4px 12px rgba(var(--primary-rgb), 0.3);
        transition: all 0.3s ease;
    }

    .send-btn:hover {
        background: var(--primary-dark);
        transform: translateY(-3px) rotate(10deg);
        box-shadow: 0 6px 18px rgba(var(--primary-rgb), 0.4);
    }

    .chat-widget-toggle {
        position: fixed;
        bottom: 25px;
        right: 25px;
        background: var(--primary-color);
        color: white;
        border: none;
        border-radius: 50%;
        width: 70px;
        height: 70px;
        display: flex;
        align-items: center;
        justify-content: center;
        box-shadow: 0 6px 18px rgba(var(--primary-rgb), 0.3);
        cursor: pointer;
        z-index: 999;
        transition: all 0.3s ease;
        animation: bounce 5s infinite ease-in-out;
    }

    .chat-widget-toggle:hover {
        background: var(--primary-dark);
        transform: scale(1.1);
        box-shadow: 0 8px 25px rgba(var(--primary-rgb), 0.4);
    }

    .chat-widget-toggle i {
        font-size: 1.6rem;
    }

    @keyframes bounce {
        0%, 100% { transform: translateY(0); }
        50% { transform: translateY(-8px); }
    }

    @media (max-width: 768px) {
        .chat-widget {
            width: calc(100% - 30px);
            height: calc(100vh - 90px);
            bottom: 75px;
            right: 15px;
        }
        .chat-widget-toggle {
            bottom: 20px;
            right: 20px;
            width: 65px;
            height: 65px;
        }
    }
</style>

<script>
async function sendMessage() {
    const input = document.getElementById('chatInput');
    const chatMessages = document.getElementById('chatMessages');

    if (!input || !chatMessages) {
        console.error('Missing input or chat message container');
        return;
    }

    const messageText = input.value.trim();

    // Stop if the message is empty or just spaces
    if (!messageText || messageText.replace(/\s/g, '').length === 0) {
        return;
    }

    // Append user message
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
    chatMessages.appendChild(sentMessage);
    input.value = '';

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
    chatMessages.appendChild(loadingMessage);

    setTimeout(() => {
        chatMessages.scrollTop = chatMessages.scrollHeight;
    }, 100);

    try {
        const response = await fetch('/chat', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ message: messageText })
        });

        let replyText = await response.text();
        if (!response.ok || !replyText.trim()) {
            replyText = "Sorry, there was a problem. Status: " + response.status;
        }

        // Remove loading indicator
        const loadingElement = chatMessages.querySelector('.loading');
        if (loadingElement) {
            loadingElement.remove();
        }

        // Append response message
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
        chatMessages.appendChild(receivedMessage);
        setTimeout(() => {
            chatMessages.scrollTop = chatMessages.scrollHeight;
        }, 100);
    } catch (error) {
        console.error('Fetch error:', error);
        // Remove loading indicator
        const loadingElement = chatMessages.querySelector('.loading');
        if (loadingElement) {
            loadingElement.remove();
        }

        const receivedMessage = document.createElement('div');
        receivedMessage.className = 'message received';
        const receivedContentDiv = document.createElement('div');
        receivedContentDiv.className = 'message-content';
        const receivedTextNode = document.createTextNode("Sorry, there was a problem sending your message. Error: " + error.message);
        const receivedTimeDiv = document.createElement('div');
        receivedTimeDiv.className = 'message-time';
        receivedTimeDiv.textContent = 'Just now';
        receivedContentDiv.appendChild(receivedTextNode);
        receivedContentDiv.appendChild(receivedTimeDiv);
        receivedMessage.appendChild(receivedContentDiv);
        chatMessages.appendChild(receivedMessage);
        setTimeout(() => {
            chatMessages.scrollTop = chatMessages.scrollHeight;
        }, 100);
    }
}

// Enter key sends message
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

    // Widget show/hide logic
    const toggleButton = document.getElementById('chatWidgetToggle');
    const chatWidget = document.getElementById('chatWidget');
    const closeButton = document.getElementById('closeChatWidget');

    if (toggleButton && chatWidget) {
        toggleButton.addEventListener('click', function() {
            chatWidget.style.display = (chatWidget.style.display === 'none' || chatWidget.style.display === '') ? 'flex' : 'none';
        });
    }

    if (closeButton && chatWidget) {
        closeButton.addEventListener('click', function() {
            chatWidget.style.display = 'none';
        });
    }
});
</script>
</script>
