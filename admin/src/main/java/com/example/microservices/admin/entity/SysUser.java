package com.example.microservices.admin.entity;

import com.baomidou.mybatisplus.extension.activerecord.Model;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Date;

/**
 * 用户表(SysUser)表实体类
 *
 * @author makejava
 * @since 2020-08-17 16:21:38
 */
@SuppressWarnings("serial")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class SysUser extends Model<SysUser> {
    //主键ID
    private String id;
    //用户名
    private String username;
    //密码
    private String password;
    //部门ID
    private Integer deptId;
    //邮箱
    private String email;
    //手机号
    private String phone;
    //头像
    private String avatar;
    //创建时间
    private Date createdTime;
    //修改时间
    private Date updatedTime;
    //0-正常，1-停用
    private Integer status;
    //0-保密，1-男，2-女
    private Integer sex;
    //上次登陆时间
    private LocalDateTime lastLoginTime;



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