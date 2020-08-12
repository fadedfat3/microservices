package com.example.microservices.admin.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.api.ApiController;
import com.baomidou.mybatisplus.extension.api.R;
import com.example.microservices.admin.entity.SysPermission;
import com.example.microservices.admin.entity.SysUser;
import com.example.microservices.admin.service.SysUserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;

@Slf4j
@RestController
public class AuthController extends ApiController {

    @Autowired
    private SysUserService userService;

    @PostMapping("/register")
    public R register(SysUser user) {
        log.debug("username={}", user.getUsername());
        String password = new BCryptPasswordEncoder().encode(user.getPassword());
        user.setPassword(password);
        return R.ok(userService.save(user));
    }

    /**
     * 登录
     *
     * @param
     * @param
     * @return
     */

    @RequestMapping("/logoutSuccess")
    public R logout(HttpSession session) {
        session.invalidate();
        return R.ok("退出成功");
    }

    @RequestMapping("auth")
    public R auth(String username) {
        SysUser sysUser = new SysUser();
        sysUser.setUsername(username);

        QueryWrapper<SysUser> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("username", username);
        SysUser user = userService.getOne(queryWrapper);
        if (null == user) {
            log.info("登录用户：" + username + " 不存在.");
            return R.failed("登录用户：" + username + " 不存在");
        }
        Collection<String> authorities = getUserAuthorities(user);
        Map<String, Object> result = new HashMap<>();
        result.put("username", user.getUsername());
        result.put("password", user.getPassword());
        result.put("authorities", authorities);
        result.put("id", user.getId());
        return R.ok(result);
    }

    @GetMapping("currentUser")
    public R currentUser() {
        ServletRequestAttributes servletRequestAttributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = servletRequestAttributes.getRequest();
        String uid = request.getHeader("uid");
        return R.ok(userService.getById(uid));
    }


    /**
     * 封装 根据user获取权限
     *
     * @param user
     * @return
     */
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
