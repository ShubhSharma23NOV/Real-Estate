package com.example.Real_Estate.entity;

import jakarta.persistence.*;

@Entity
public class Favorite {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    @ManyToOne
    @JoinColumn(name = "property_id", nullable = false)
    private Properties property;

    public Favorite() {}
    public Favorite(User user, Properties property) {
        this.user = user;
        this.property = property;
    }
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public User getUser() { return user; }
    public void setUser(User user) { this.user = user; }
    public Properties getProperty() { return property; }
    public void setProperty(Properties property) { this.property = property; }
} 