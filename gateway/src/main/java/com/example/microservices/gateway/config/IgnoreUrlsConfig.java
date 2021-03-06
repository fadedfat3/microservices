package com.example.microservices.gateway.config;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

import java.util.ArrayList;
import java.util.List;

@Data
@Configuration
@ConfigurationProperties("spring.security.ignore")
public class IgnoreUrlsConfig {
    private List<String> urls = new ArrayList<>();
}
