package com.example.microservices.admin.mapper;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Constants;
import com.example.microservices.admin.dto.SysPermissionDTO;
import com.example.microservices.admin.entity.SysPermission;
import org.apache.ibatis.annotations.Param;

/**
 * (SysPermission)表数据库访问层
 *
 * @author makejava
 * @since 2020-08-05 16:13:40
 */
public interface SysPermissionMapper extends BaseMapper<SysPermission> {

    IPage<SysPermissionDTO> pagePermissionDTO(IPage<SysPermission> page, @Param(Constants.WRAPPER) Wrapper<SysPermission> wrapper);

    SysPermissionDTO getPermissionDTO(@Param(Constants.WRAPPER) Wrapper<SysPermission> wrapper);
}