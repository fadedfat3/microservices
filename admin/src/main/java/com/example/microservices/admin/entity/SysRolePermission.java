package com.example.microservices.admin.entity;

import com.baomidou.mybatisplus.extension.activerecord.Model;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * (SysRolePermission)表实体类
 *
 * @author makejava
 * @since 2020-09-23 16:14:39
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class SysRolePermission extends Model<SysRolePermission> {

    private Integer id;

    private Integer roleId;

    private Integer permissionId;

    private Integer deleted;

    private Date createdTime;

    private Date updatedTime;

}