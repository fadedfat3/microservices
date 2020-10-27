package com.example.microservices.admin.entity;

import com.baomidou.mybatisplus.extension.activerecord.Model;
import com.fasterxml.jackson.annotation.JsonIgnore;
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
    private Integer id;
    //部门名称
    private String name;
    //排序
    private Integer sort;
    //创建时间
    @JsonIgnore
    private Date createdTime;
    //修改时间
    @JsonIgnore
    private Date updatedTime;
    //是否删除  -1：已删除  0：正常
    private Integer deleted;
    //上级部门
    private Integer parentId;
    //租户id
    private Integer tenantId;


}