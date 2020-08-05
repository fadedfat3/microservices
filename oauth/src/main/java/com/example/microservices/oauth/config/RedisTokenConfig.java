package com.example.microservices.oauth.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.security.oauth2.provider.token.TokenStore;

@Configuration
public class RedisTokenConfig {

    @Autowired
    private RedisConnectionFactory redisConnectionFactory;

    @Bean
    TokenStore redisTokenStore() {
        return new CustomRedisTokenStore(redisConnectionFactory);
    }
}
