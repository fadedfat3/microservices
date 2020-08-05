package com.example.microservices.admin.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.microservices.admin.entity.SysPermission;
import com.example.microservices.admin.entity.SysUser;

import java.util.List;

/**
 * 用户表(SysUser)表数据库访问层
 *
 * @author makejava
 * @since 2020-08-05 15:19:03
 */
public interface SysUserDao extends BaseMapper<SysUser> {
    List<SysPermission> findPermissionListByUser(SysUser user);
}