package com.example.microservices.admin.entity;

import com.baomidou.mybatisplus.extension.activerecord.Model;

import java.io.Serializable;
import java.util.Date;

/**
 * 用户表(SysUser)表实体类
 *
 * @author makejava
 * @since 2020-08-05 15:19:01
 */
@SuppressWarnings("serial")
public class SysUser extends Model<SysUser> {
    //主键ID
    private String id;
    //用户名
    private String username;
    //密码
    private String password;
    //部门ID
    private Integer deptId;
    //岗位ID
    private Integer jobId;
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
    //0-正常，1-锁定
    private String lockFlag;
    //0-正常，1-删除
    private Object isDeleted;
    //租户id
    private Integer tenantId;


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getDeptId() {
        return deptId;
    }

    public void setDeptId(Integer deptId) {
        this.deptId = deptId;
    }

    public Integer getJobId() {
        return jobId;
    }

    public void setJobId(Integer jobId) {
        this.jobId = jobId;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public Date getCreatedTime() {
        return createdTime;
    }

    public void setCreatedTime(Date createdTime) {
        this.createdTime = createdTime;
    }

    public Date getUpdatedTime() {
        return updatedTime;
    }

    public void setUpdatedTime(Date updatedTime) {
        this.updatedTime = updatedTime;
    }

    public String getLockFlag() {
        return lockFlag;
    }

    public void setLockFlag(String lockFlag) {
        this.lockFlag = lockFlag;
    }

    public Object getIsDeleted() {
        return isDeleted;
    }

    public void setIsDeleted(Object isDeleted) {
        this.isDeleted = isDeleted;
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