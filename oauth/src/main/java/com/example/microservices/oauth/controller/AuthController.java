package com.example.microservices.oauth.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.security.Principal;

@RestController
public class AuthController {

    @RequestMapping(value = "/user-info", method = RequestMethod.GET)
    public Principal getUser(Principal principal) {
        return principal;
    }
}
