package com.example.microservices.admin.entity;

import com.baomidou.mybatisplus.extension.activerecord.Model;
import lombok.AllArgsConstructor;

import java.io.Serializable;
import java.util.Date;

/**
 * 菜单权限表(SysMenu)表实体类
 *
 * @author makejava
 * @since 2020-08-05 16:14:06
 */
@SuppressWarnings("serial")
@AllArgsConstructor
public class SysMenu extends Model<SysMenu> {
    //菜单ID
    private Integer menuId;
    //菜单名称
    private String name;
    //菜单权限标识
    private String perms;
    //前端跳转URL
    private String path;
    //菜单组件
    private String component;
    //父菜单ID
    private Integer parentId;
    //图标
    private String icon;
    //排序
    private Integer sort;
    //菜单类型 （类型   0：目录   1：菜单   2：按钮）
    private String type;
    //创建时间
    private Date createTime;
    //更新时间
    private Date updateTime;
    //逻辑删除标记(0--正常 1--删除)
    private String delFlag;
    //是否为外链
    private Object isFrame;


    public Integer getMenuId() {
        return menuId;
    }

    public void setMenuId(Integer menuId) {
        this.menuId = menuId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPerms() {
        return perms;
    }

    public void setPerms(String perms) {
        this.perms = perms;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public String getComponent() {
        return component;
    }

    public void setComponent(String component) {
        this.component = component;
    }

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public String getDelFlag() {
        return delFlag;
    }

    public void setDelFlag(String delFlag) {
        this.delFlag = delFlag;
    }

    public Object getIsFrame() {
        return isFrame;
    }

    public void setIsFrame(Object isFrame) {
        this.isFrame = isFrame;
    }

    /**
     * 获取主键值
     *
     * @return 主键值
     */
    @Override
    protected Serializable pkVal() {
        return this.menuId;
    }

    public SysMenu(SysMenu menu) {
        this.menuId = menu.getMenuId();
        this.component = menu.getComponent();
        this.name = menu.getName();
        this.createTime = menu.getCreateTime();
        this.delFlag = menu.getDelFlag();
        this.icon = menu.getIcon();
        this.isFrame = menu.getIsFrame();
        this.parentId = menu.getParentId();
        this.path = menu.getPath();
        this.perms = menu.getPerms();
        this.sort = menu.getSort();
        this.type = menu.getType();
        this.updateTime = menu.getUpdateTime();
    }

    public SysMenu() {

    }


}