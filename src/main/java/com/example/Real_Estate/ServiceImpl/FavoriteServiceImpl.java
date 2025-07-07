package com.example.Real_Estate.ServiceImpl;

import com.example.Real_Estate.Services.FavoriteService;
import com.example.Real_Estate.entity.Favorite;
import com.example.Real_Estate.entity.User;
import com.example.Real_Estate.entity.Properties;
import com.example.Real_Estate.repository.FavoriteRepo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Optional;

@Service
public class FavoriteServiceImpl implements FavoriteService {
    @Autowired
    private FavoriteRepo favoriteRepo;

    private static final Logger logger = LoggerFactory.getLogger(FavoriteServiceImpl.class);

    @Override
    public Favorite addFavorite(User user, Properties property) {
        logger.info("addFavorite called for user {} and property {}", user.getId(), property.getId());
        Optional<Favorite> existing = favoriteRepo.findByUserAndProperty(user, property);
        if (existing.isPresent()) {
            logger.info("Favorite already exists for user {} and property {}", user.getId(), property.getId());
            return existing.get();
        }
        try {
            Favorite fav = new Favorite(user, property);
            Favorite saved = favoriteRepo.save(fav);
            logger.info("Favorite saved: id={}, user={}, property={}", saved.getId(), user.getId(), property.getId());
            return saved;
        } catch (Exception e) {
            logger.error("Error saving favorite for user {} and property {}: {}", user.getId(), property.getId(), e.getMessage(), e);
            throw e;
        }
    }

    @Override
    public void removeFavorite(User user, Properties property) {
        logger.info("removeFavorite called for user {} and property {}", user.getId(), property.getId());
        try {
            favoriteRepo.deleteByUserAndProperty(user, property);
            logger.info("Favorite removed for user {} and property {}", user.getId(), property.getId());
        } catch (Exception e) {
            logger.error("Error removing favorite for user {} and property {}: {}", user.getId(), property.getId(), e.getMessage(), e);
            throw e;
        }
    }

    @Override
    public boolean isFavorite(User user, Properties property) {
        return favoriteRepo.findByUserAndProperty(user, property).isPresent();
    }

    @Override
    public List<Favorite> getFavoritesByUser(User user) {
        return favoriteRepo.findByUser(user);
    }
} 