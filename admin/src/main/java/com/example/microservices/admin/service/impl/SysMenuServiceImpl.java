package com.example.microservices.admin.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.microservices.admin.dao.SysMenuDao;
import com.example.microservices.admin.entity.SysMenu;
import com.example.microservices.admin.service.SysMenuService;
import org.springframework.stereotype.Service;

/**
 * 菜单权限表(SysMenu)表服务实现类
 *
 * @author makejava
 * @since 2020-08-05 16:14:06
 */
@Service("sysMenuService")
public class SysMenuServiceImpl extends ServiceImpl<SysMenuDao, SysMenu> implements SysMenuService {

}