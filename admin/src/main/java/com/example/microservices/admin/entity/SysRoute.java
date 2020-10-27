package com.example.microservices.admin.entity;

import com.baomidou.mybatisplus.extension.activerecord.Model;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

/**
 * 菜单权限表(SysRoute)表实体类
 *
 * @author makejava
 * @since 2020-08-27 09:38:19
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode
public class SysRoute extends Model<SysRoute> {
    //路由ID
    private Integer id;
    //路由名称
    private String name;
    //菜单权限标识
    private String perms;
    //前端跳转URL
    private String path;
    //路由组件
    private String component;
    //父路由ID
    private Integer parentId;

    //排序
    private Integer sort;
    //路由类型 （类型   0：目录   1：菜单   2：按钮）
    private Integer type;
    //创建时间
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonIgnore
    private Date createdTime;
    //更新时间
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonIgnore
    private Date updatedTime;
    //逻辑删除标记(0--正常 1--删除)
    @JsonIgnore
    private Integer deleted;
    //是否为外链


    private String title;
    private Integer hidden;
    private Integer hideChildren;
    private Integer hideHeaderContent;
    private String target;
    private String icon;

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