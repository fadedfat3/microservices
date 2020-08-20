package com.example.microservices.admin.entity;

import com.baomidou.mybatisplus.extension.activerecord.Model;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * 部门管理(SysDept)表实体类
 *
 * @author makejava
 * @since 2020-08-05 16:14:58
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
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


    public SysDept(SysDept dept) {
        this.deptId = dept.getDeptId();
        this.name = dept.getName();
        this.sort = dept.getSort();
        this.parentId = dept.getParentId();
        this.createTime = dept.getCreateTime();
        this.updateTime = dept.getUpdateTime();
        this.delFlag = dept.getDelFlag();
    }
}