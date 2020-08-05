package com.example.microservices.oauth.provider;

import com.baomidou.mybatisplus.extension.api.R;
import com.example.microservices.oauth.provider.fallback.UserAdminServiceFallback;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

//@Component
@FeignClient(name = "user-admin", fallback = UserAdminServiceFallback.class)
public interface UserAdminService {

    @GetMapping("/auth")
    R auth(@RequestParam("username") String username);
}
