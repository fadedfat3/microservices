package com.example.microservices.oauth.entity;

import com.baomidou.mybatisplus.extension.activerecord.Model;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SysPermission extends Model<SysPermission> {

    private Integer id;
    //url正则表达式
    private String url;

    private Object isDeleted;

    private Date createdTime;

    private Date updatedTime;

}
