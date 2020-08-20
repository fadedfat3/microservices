package com.example.microservices.admin.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import lombok.*;

import java.util.Date;

/**
 * 用户角色表(SysUserRole)表实体类
 *
 * @author makejava
 * @since 2020-08-20 09:47:24
 */

@NoArgsConstructor
@AllArgsConstructor
@Data
@ToString
@EqualsAndHashCode
public class SysUserRole extends Model<SysUserRole> {
    //主键ID
    @TableId(type = IdType.AUTO)
    private Integer id;
    //用户ID
    private String userId;
    //角色ID
    private String roleId;

    private Integer isDeleted;

    private Date createdTime;

    private Date updatedTime;


    public SysUserRole(String userId, String roleId) {
        this.userId = userId;
        this.roleId = roleId;
    }
}