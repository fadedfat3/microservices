package com.example.microservices.oauth.service.impl;

import com.baomidou.mybatisplus.extension.api.R;
import com.example.microservices.oauth.UserInfo;
import com.example.microservices.oauth.provider.UserAdminService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import java.util.Collection;
import java.util.Map;

@Slf4j
@Configuration
public class CustomUserDetailsServiceImpl implements UserDetailsService {

    @Autowired
    private UserAdminService userAdminService;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        //log.debug("username={}", username);
        R result = userAdminService.auth(username);
        // log.info("result = {}", result);
        if (!result.ok()) {
            log.info("登录用户：" + username + " 不存在.");
            throw new UsernameNotFoundException("登录用户：" + username + " 不存在");
        }
        Map<String, Object> data = (Map<String, Object>) result.getData();
        String id = (String) data.get("id");
        String password = (String) data.get("password");
        Collection<String> authorities = (Collection<String>) data.get("authorities");
        return new UserInfo(id, username, password, AuthorityUtils.createAuthorityList(authorities.toArray(new String[0])));
    }
}
