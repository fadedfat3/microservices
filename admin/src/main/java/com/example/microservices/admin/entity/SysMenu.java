package com.example.microservices.admin.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 菜单权限表(SysMenu)表实体类
 *
 * @author makejava
 * @since 2020-08-05 16:14:06
 */
@SuppressWarnings("serial")
@NoArgsConstructor
@Data
@TableName("sys_route")
public class SysMenu extends SysRoute {

}