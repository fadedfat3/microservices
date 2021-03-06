package com.example.microservices.oauth.config;

import lombok.Data;

import java.io.Serializable;


@Data
public class ApiResult implements Serializable {
    private static final Long serialVersionUID = 1L;
    private Integer code;
    private String message;
    private Object data;

    public ApiResult(int code, String message, Object data) {
        this.code = code;
        this.message = message;
        this.data = data;
    }


}
