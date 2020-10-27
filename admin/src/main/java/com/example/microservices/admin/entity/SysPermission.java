package com.example.microservices.admin.entity;

import com.baomidou.mybatisplus.extension.activerecord.Model;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * (SysPermission)表实体类
 *
 * @author makejava
 * @since 2020-08-05 16:13:40
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class SysPermission extends Model<SysPermission> {

    private Integer id;
    //url正则表达式
    private String url;
    @JsonIgnore
    private Integer deleted;
    @JsonIgnore
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createdTime;
    @JsonIgnore
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date updatedTime;

}