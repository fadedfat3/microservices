package com.example.microservices.admin.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.example.microservices.admin.entity.SysPermission;
import com.example.microservices.admin.entity.SysUser;

import java.util.List;

/**
 * 用户表(SysUser)表服务接口
 *
 * @author makejava
 * @since 2020-08-05 15:19:04
 */
public interface SysUserService extends IService<SysUser> {

    List<SysPermission> findPermissionListByUser(SysUser user);
}