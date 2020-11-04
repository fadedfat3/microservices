package com.example.microservices.admin.provider.fallback;

import com.example.microservices.admin.provider.TestService;
import org.springframework.stereotype.Component;

@Component
public class TestServiceFallback implements TestService {

    @Override
    public Object test() {
        return "调用Test失败";
    }
}
