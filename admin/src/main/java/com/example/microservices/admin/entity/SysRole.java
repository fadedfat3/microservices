package com.example.microservices.admin.entity;

import com.baomidou.mybatisplus.extension.activerecord.Model;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * 系统角色表(SysRole)表实体类
 *
 * @author makejava
 * @since 2020-08-05 16:10:19
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class SysRole extends Model<SysRole> {
    //角色主键
    private Integer id;
    //角色名称
    private String roleName;
    //角色标识
    private String roleCode;
    //角色描述
    private String roleDesc;
    //创建时间
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonIgnore
    private Date createdTime;
    //更新时间
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonIgnore
    private Date updatedTime;
    //删除标识（0-正常,1-删除）
    @JsonIgnore
    private Integer deleted;
    //数据权限类型
    private Integer dsType;
    //数据权限范围 1 全部 2 本级 3 本级以及子级 4 自定义
    private String dsScope;
    //租户id
    private Integer tenantId;

}