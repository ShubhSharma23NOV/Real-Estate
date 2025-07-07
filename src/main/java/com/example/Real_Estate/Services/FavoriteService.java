package com.example.Real_Estate.Services;

import com.example.Real_Estate.entity.Favorite;
import com.example.Real_Estate.entity.User;
import com.example.Real_Estate.entity.Properties;
import java.util.List;
import java.util.Optional;

public interface FavoriteService {
    Favorite addFavorite(User user, Properties property);
    void removeFavorite(User user, Properties property);
    boolean isFavorite(User user, Properties property);
    List<Favorite> getFavoritesByUser(User user);
} 