package com.example.microservices.admin.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.microservices.admin.dao.SysPermissionDao;
import com.example.microservices.admin.entity.SysPermission;
import com.example.microservices.admin.service.SysPermissionService;
import org.springframework.stereotype.Service;

/**
 * (SysPermission)表服务实现类
 *
 * @author makejava
 * @since 2020-08-05 16:13:40
 */
@Service("sysPermissionService")
public class SysPermissionServiceImpl extends ServiceImpl<SysPermissionDao, SysPermission> implements SysPermissionService {

}