package com.example.microservices.admin.dto;

import com.example.microservices.admin.entity.SysRole;
import com.example.microservices.admin.entity.SysUser;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SysUserDTO extends SysUser {
    //    //主键ID
//    private String id;
//    //用户名
//    private String username;
//    //密码
//    private String password;
//    //部门ID
//    private Integer deptId;
//    //邮箱
//    private String email;
//    //手机号
//    private String phone;
//    //头像
//    private String avatar;
//    //创建时间
//    private Date createdTime;
//    //修改时间
//    private Date updatedTime;
//    //0-正常，1-停用
//    private Integer status;
//    //0-正常，1-删除
//    private Integer isDeleted;
//    //租户id
//    private Integer tenantId;
//    //0-保密，1-男，2-女
//    private Integer sex;
//    //上次登陆时间
//    private LocalDateTime lastLoginTime;
    private List<SysRole> roles;
    // private SysDept dept;
}
