package com.example.microservices.admin.mapper;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Constants;
import com.example.microservices.admin.dto.SysMenuDTO;
import com.example.microservices.admin.entity.SysMenu;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 菜单权限表(SysMenu)表数据库访问层
 *
 * @author makejava
 * @since 2020-08-05 16:14:06
 */
@Repository
public interface SysMenuMapper extends BaseMapper<SysMenu> {
    IPage<SysMenuDTO> pageSysMenuDto(IPage<SysMenu> page, @Param(Constants.WRAPPER) Wrapper<SysMenu> wrapper);

    List<SysMenuDTO> listSysMenuDto(@Param(Constants.WRAPPER) Wrapper wrapper);

    SysMenuDTO getSysMenuDto(@Param(Constants.WRAPPER) Wrapper<SysMenu> wrapper);
}