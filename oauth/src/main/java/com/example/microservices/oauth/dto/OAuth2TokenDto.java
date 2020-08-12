package com.example.microservices.oauth.dto;

import lombok.Data;

import java.io.Serializable;

@Data
public class OAuth2TokenDto implements Serializable {
    private static final Long serialVersionId = 1L;

    private String accessToken;
    private String refreshToken;
    private Integer expiration;
    private String tokenType = "bearer";
}
