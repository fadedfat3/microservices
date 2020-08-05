package com.example.microservices.gateway.filter;

import org.springframework.cloud.gateway.filter.GatewayFilterChain;
import org.springframework.cloud.gateway.filter.GlobalFilter;
import org.springframework.core.Ordered;
import org.springframework.http.HttpHeaders;
import org.springframework.http.server.reactive.ServerHttpRequest;
import org.springframework.stereotype.Component;
import org.springframework.web.server.ServerWebExchange;
import reactor.core.publisher.Mono;

@Component
public class TokenFilter implements GlobalFilter, Ordered {
    //private static final String AUTHORIZATION = "Authorization";

    @Override
    public Mono<Void> filter(ServerWebExchange exchange, GatewayFilterChain chain) {

        ServerHttpRequest serverHttpRequest = exchange.getRequest();
        //String uri = serverHttpRequest.getURI().getPath();


        String token = serverHttpRequest.getHeaders().getFirst(HttpHeaders.AUTHORIZATION);
        if (token == null || token.isEmpty()) {
            return chain.filter(exchange);
        }
        ServerHttpRequest req = exchange.getRequest().mutate()
                .header(HttpHeaders.AUTHORIZATION, token).build();
        return chain.filter(exchange.mutate().request(req).build());
    }


    @Override
    public int getOrder() {
        return -100;
    }
}
