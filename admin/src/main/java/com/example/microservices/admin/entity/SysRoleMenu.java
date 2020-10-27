package com.example.microservices.admin.entity;

import com.baomidou.mybatisplus.extension.activerecord.Model;

import java.io.Serializable;

/**
 * 角色菜单表(SysRoleMenu)表实体类
 *
 * @author makejava
 * @since 2020-09-11 16:11:05
 */
@SuppressWarnings("serial")
public class SysRoleMenu extends Model<SysRoleMenu> {
    //主键ID
    private Integer id;
    //角色ID
    private Integer roleId;
    //菜单ID
    private Integer menuId;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

    public Integer getMenuId() {
        return menuId;
    }

    public void setMenuId(Integer menuId) {
        this.menuId = menuId;
    }

    /**
     * 获取主键值
     *
     * @return 主键值
     */
    @Override
    protected Serializable pkVal() {
        return this.id;
    }
}