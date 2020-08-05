package com.example.microservices.oauth.provider.fallback;

import com.baomidou.mybatisplus.extension.api.R;
import com.example.microservices.oauth.provider.UserAdminService;
import org.springframework.stereotype.Component;

@Component
public class UserAdminServiceFallback implements UserAdminService {

    public R auth(String username) {
        return R.failed("登陆失败");
    }
}
