package com.example.Real_Estate.repository;

import com.example.Real_Estate.entity.Favorite;
import com.example.Real_Estate.entity.User;
import com.example.Real_Estate.entity.Properties;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;
import java.util.Optional;

public interface FavoriteRepo extends JpaRepository<Favorite, Long> {
    List<Favorite> findByUser(User user);
    Optional<Favorite> findByUserAndProperty(User user, Properties property);
    List<Favorite> findByProperty(Properties property);
    void deleteByUserAndProperty(User user, Properties property);
} 