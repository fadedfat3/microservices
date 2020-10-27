package com.example.microservices.oauth.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.microservices.oauth.dao.SysUserDao;
import com.example.microservices.oauth.entity.SysPermission;
import com.example.microservices.oauth.entity.SysUser;
import com.example.microservices.oauth.service.SysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 用户表(SysUser)表服务实现类
 *
 * @author makejava
 * @since 2020-09-22 16:01:08
 */
@Service
public class SysUserServiceImpl extends ServiceImpl<SysUserDao, SysUser> implements SysUserService {
    @Autowired
    private SysUserDao sysUserDao;

    @Override
    public List<SysPermission> findPermissionListByUser(SysUser user) {
        return sysUserDao.findPermissionListByUser(user);
    }
}