package com.example.microservices.gateway.handler;

import org.springframework.web.bind.annotation.RestControllerAdvice;

@RestControllerAdvice
public class GlobalExceptionHandler {
    //@ResponseBody
    // @ExceptionHandler(OAuth2Exception.class)
//    public ApiResult handleOAuth2Exception (OAuth2Exception e) {
//        return new ApiResult(1403, e.getMessage(), null);
//    }
}
