package com.example.microservices.admin.service.impl;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.microservices.admin.dao.SysUserDao;
import com.example.microservices.admin.dto.SysUserDTO;
import com.example.microservices.admin.entity.SysMenu;
import com.example.microservices.admin.entity.SysPermission;
import com.example.microservices.admin.entity.SysUser;
import com.example.microservices.admin.service.SysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 用户表(SysUser)表服务实现类
 *
 * @author makejava
 * @since 2020-08-05 15:19:05
 */
@Service("sysUserService")
public class SysUserServiceImpl extends ServiceImpl<SysUserDao, SysUser> implements SysUserService {
    @Autowired
    private SysUserDao sysUserDao;

    @Override
    public List<SysPermission> findPermissionListByUser(SysUser user) {
        return sysUserDao.findPermissionListByUser(user);
    }

    @Override
    public List<SysMenu> findMenuListByUser(SysUser user) {
        return sysUserDao.findMenuListByUser(user);
    }

    @Override
    public IPage<SysUserDTO> listUserDTO(IPage<SysUser> page, Wrapper<SysUser> queryWrapper) {
        return sysUserDao.listUserDTO(page, queryWrapper);
    }

    @Override
    public SysUserDTO getUserDTOById(String uid) {
        return sysUserDao.getUserDTOById(uid);
    }
}