package com.example.microservices.admin.service;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Constants;
import com.baomidou.mybatisplus.extension.service.IService;
import com.example.microservices.admin.dto.SysUserDTO;
import com.example.microservices.admin.entity.SysMenu;
import com.example.microservices.admin.entity.SysPermission;
import com.example.microservices.admin.entity.SysUser;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 用户表(SysUser)表服务接口
 *
 * @author makejava
 * @since 2020-08-05 15:19:04
 */
public interface SysUserService extends IService<SysUser> {

    List<SysPermission> findPermissionListByUser(SysUser user);

    List<SysMenu> findMenuListByUser(SysUser user);

    IPage<SysUserDTO> pageUserDTO(IPage<SysUser> page, @Param(Constants.WRAPPER) Wrapper<SysUser> queryWrapper);

    SysUserDTO getUserDTOById(String uid);

    SysUserDTO getUserDTO(Wrapper<SysUser> wrapper);
}