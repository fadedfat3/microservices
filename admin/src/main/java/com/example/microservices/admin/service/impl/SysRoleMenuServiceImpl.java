package com.example.microservices.admin.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.microservices.admin.entity.SysRoleMenu;
import com.example.microservices.admin.mapper.SysRoleMenuMapper;
import com.example.microservices.admin.service.SysRoleMenuService;
import org.springframework.stereotype.Service;

/**
 * 角色菜单表(SysRoleMenu)表服务实现类
 *
 * @author makejava
 * @since 2020-09-11 16:11:10
 */
@Service("sysRoleMenuService")
public class SysRoleMenuServiceImpl extends ServiceImpl<SysRoleMenuMapper, SysRoleMenu> implements SysRoleMenuService {

}