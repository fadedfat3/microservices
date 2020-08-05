package com.example.microservices.admin.entity;

import com.baomidou.mybatisplus.extension.activerecord.Model;

import java.io.Serializable;
import java.util.Date;

/**
 * (SysPermission)表实体类
 *
 * @author makejava
 * @since 2020-08-05 16:13:40
 */
@SuppressWarnings("serial")
public class SysPermission extends Model<SysPermission> {

    private String id;
    //url正则表达式
    private String url;

    private Object isDeleted;

    private Date createdTime;

    private Date updatedTime;


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Object getIsDeleted() {
        return isDeleted;
    }

    public void setIsDeleted(Object isDeleted) {
        this.isDeleted = isDeleted;
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