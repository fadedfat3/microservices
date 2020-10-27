package com.example.microservices.admin.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.microservices.admin.entity.SysUserRole;
import com.example.microservices.admin.mapper.SysUserRoleMapper;
import com.example.microservices.admin.service.SysUserRoleService;
import org.springframework.stereotype.Service;

/**
 * 用户角色表(SysUserRole)表服务实现类
 *
 * @author makejava
 * @since 2020-08-20 09:47:24
 */
@Service("sysUserRoleService")
public class SysUserRoleServiceImpl extends ServiceImpl<SysUserRoleMapper, SysUserRole> implements SysUserRoleService {

}