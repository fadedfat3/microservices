package com.example.microservices.admin.entity;

import com.baomidou.mybatisplus.extension.activerecord.Model;

import java.io.Serializable;
import java.util.Date;

/**
 * 部门管理(SysDept)表实体类
 *
 * @author makejava
 * @since 2020-08-05 16:14:58
 */
@SuppressWarnings("serial")
public class SysDept extends Model<SysDept> {
    //部门主键ID
    private Integer deptId;
    //部门名称
    private String name;
    //排序
    private Integer sort;
    //创建时间
    private Date createTime;
    //修改时间
    private Date updateTime;
    //是否删除  -1：已删除  0：正常
    private String delFlag;
    //上级部门
    private Integer parentId;
    //租户id
    private Integer tenantId;


    public Integer getDeptId() {
        return deptId;
    }

    public void setDeptId(Integer deptId) {
        this.deptId = deptId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
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

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
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
        return this.deptId;
    }
}