package com.example.microservices.oauth.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.microservices.oauth.UserInfo;
import com.example.microservices.oauth.entity.SysPermission;
import com.example.microservices.oauth.entity.SysUser;
import com.example.microservices.oauth.service.SysUserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Slf4j
@Configuration
public class CustomUserDetailsServiceImpl implements UserDetailsService {

    //    @Autowired
//    private UserAdminService userAdminService;
    @Autowired
    private SysUserService userService;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        // log.debug("username={}", username);
        // R result = userAdminService.auth(username);
        // log.info("result = {}", result);


        SysUser sysUser = new SysUser();
        sysUser.setUsername(username);

        QueryWrapper<SysUser> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("username", username);
        SysUser user = userService.getOne(queryWrapper);
        if (null == user) {
            log.info("登录用户：" + username + " 获取失败.");
            throw new UsernameNotFoundException("登录用户：" + username + " 获取失败");
        }
        Collection<String> authorities = getUserAuthorities(user);

        return new UserInfo(user.getId(), username, user.getPassword(), AuthorityUtils.createAuthorityList(authorities.toArray(new String[0])));
    }

    private Collection<String> getUserAuthorities(SysUser user) {
        // 获取用户拥有的角色
        // 用户权限列表，根据用户拥有的权限标识与如 @PreAuthorize("hasAuthority('sys:menu:view')") 标注的接口对比，决定是否可以调用接口
        // 权限集合
        List<SysPermission> permissions = userService.findPermissionListByUser(user);
        Set<String> urls = new HashSet<>();
        for (SysPermission permission : permissions) {
            urls.add(permission.getUrl());
        }
        return urls;
    }
}
