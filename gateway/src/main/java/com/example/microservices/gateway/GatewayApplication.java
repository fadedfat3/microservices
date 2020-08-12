package com.example.microservices.gateway;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

@SpringBootApplication
@EnableDiscoveryClient
public class GatewayApplication {

    public static void main(String[] args) {
        SpringApplication.run(GatewayApplication.class, args);
    }


//    @Bean
//    public SecurityWebFilterChain springSecurityFilterChain(ServerHttpSecurity http) {
//////        http.authorizeExchange()
//////                .pathMatchers("/**").permitAll()
//////                .pathMatchers("/uua/**").permitAll()
//////                .pathMatchers("/system-admin-service/**").permitAll()
//////                .anyExchange().authenticated();
////
//        http.csrf().disable();
//
//        return http.build();
//    }
}
