package com.example.Real_Estate.entity;

import java.time.LocalDateTime;

import jakarta.persistence.*;

@Entity
public class Notification {
    @Id 
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Long id;
    
    @Column
    private String message;
    @Column
    private LocalDateTime timestamp;
    @Column(nullable = false)
    private Boolean isRead;
    @Column 
    private String phoneNumber;
    @Column 
    private String time;
    @ManyToOne
    @JoinColumn(name = "agent_id", nullable = false)
    private User agent;
    
    @ManyToOne
    @JoinColumn(name = "buyer_id", nullable = false)
    private User buyer;
    
    // Default constructor
    public Notification() {
        this.isRead = false;
        this.timestamp = LocalDateTime.now();
    }
    
	
	@Override
	public String toString() {
		return "Notification [id=" + id + ", message=" + message + ", timestamp=" + timestamp + ", isRead=" + isRead
				+ ", phoneNumber=" + phoneNumber + ", time=" + time + ", agent=" + agent + ", buyer=" + buyer + "]";
	}


	public Notification(Long id, String message, LocalDateTime timestamp, Boolean isRead, String phoneNumber,
			String time, User agent, User buyer) {
		super();
		this.id = id;
		this.message = message;
		this.timestamp = timestamp;
		this.isRead = isRead;
		this.phoneNumber = phoneNumber;
		this.time = time;
		this.agent = agent;
		this.buyer = buyer;
	}


	public User getBuyer() {
		return buyer;
	}


	public void setBuyer(User buyer) {
		this.buyer = buyer;
	}


	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public LocalDateTime getTimestamp() {
		return timestamp;
	}

	public void setTimestamp(LocalDateTime timestamp) {
		this.timestamp = timestamp;
	}

	public boolean isRead() {
		return isRead;
	}

	public void setRead(boolean isRead) {
		this.isRead = isRead;
	}

	public User getAgent() {
		return agent;
	}

	public void setAgent(User agent) {
		this.agent = agent;
	}
    
    
}
