package com.example.microservices.admin.provider;

import com.example.microservices.admin.provider.fallback.TestServiceFallback;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;

@FeignClient(name = "test", fallback = TestServiceFallback.class)
public interface TestService {
    @GetMapping("/hello")
    Object test();
}
