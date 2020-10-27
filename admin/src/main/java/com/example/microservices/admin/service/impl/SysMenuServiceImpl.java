package com.example.microservices.admin.service.impl;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.microservices.admin.dto.SysMenuDTO;
import com.example.microservices.admin.entity.SysMenu;
import com.example.microservices.admin.mapper.SysMenuMapper;
import com.example.microservices.admin.service.SysMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 菜单权限表(SysMenu)表服务实现类
 *
 * @author makejava
 * @since 2020-08-05 16:14:06
 */
@Service("sysMenuService")
public class SysMenuServiceImpl extends ServiceImpl<SysMenuMapper, SysMenu> implements SysMenuService {
    @Autowired
    private SysMenuMapper sysMenuMapper;

    @Override
    public IPage<SysMenuDTO> pageMenuDTO(IPage<SysMenu> page, Wrapper<SysMenu> queryWrapper) {
        return sysMenuMapper.pageSysMenuDto(page, queryWrapper);
    }

    @Override
    public List<SysMenuDTO> listMenuDTO(Wrapper wrapper) {
        return sysMenuMapper.listSysMenuDto(wrapper);
    }

    @Override
    public SysMenuDTO getMenuDTO(Wrapper<SysMenu> wrapper) {
        return sysMenuMapper.getSysMenuDto(wrapper);
    }
}