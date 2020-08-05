package com.example.microservices.admin.entity;

import com.baomidou.mybatisplus.extension.activerecord.Model;

import java.io.Serializable;
import java.util.Date;

/**
 * 系统角色表(SysRole)表实体类
 *
 * @author makejava
 * @since 2020-08-05 16:10:19
 */
@SuppressWarnings("serial")
public class SysRole extends Model<SysRole> {
    //角色主键
    private String id;
    //角色名称
    private String roleName;
    //角色标识
    private String roleCode;
    //角色描述
    private String roleDesc;
    //创建时间
    private Date createTime;
    //更新时间
    private Date updateTime;
    //删除标识（0-正常,1-删除）
    private Object isDeleted;
    //数据权限类型
    private Integer dsType;
    //数据权限范围 1 全部 2 本级 3 本级以及子级 4 自定义
    private String dsScope;
    //租户id
    private Integer tenantId;


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public String getRoleCode() {
        return roleCode;
    }

    public void setRoleCode(String roleCode) {
        this.roleCode = roleCode;
    }

    public String getRoleDesc() {
        return roleDesc;
    }

    public void setRoleDesc(String roleDesc) {
        this.roleDesc = roleDesc;
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

    public Object getIsDeleted() {
        return isDeleted;
    }

    public void setIsDeleted(Object isDeleted) {
        this.isDeleted = isDeleted;
    }

    public Integer getDsType() {
        return dsType;
    }

    public void setDsType(Integer dsType) {
        this.dsType = dsType;
    }

    public String getDsScope() {
        return dsScope;
    }

    public void setDsScope(String dsScope) {
        this.dsScope = dsScope;
    }

    public Integer getTenantId() {
        return tenantId;
    }

    public void setTenantId(Integer tenantId) {
        this.tenantId = tenantId;
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