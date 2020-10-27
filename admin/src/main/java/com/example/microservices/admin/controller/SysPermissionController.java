package com.example.microservices.admin.controller;


import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.OrderItem;
import com.baomidou.mybatisplus.extension.api.ApiController;
import com.baomidou.mybatisplus.extension.api.R;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.microservices.admin.dto.SysPermissionDTO;
import com.example.microservices.admin.entity.SysPermission;
import com.example.microservices.admin.entity.SysRolePermission;
import com.example.microservices.admin.service.SysPermissionService;
import com.example.microservices.admin.service.SysRolePermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

/**
 * (SysPermission)表控制层
 *
 * @author makejava
 * @since 2020-08-05 16:13:40
 */
@RestController
@RequestMapping("sysPermission")
public class SysPermissionController extends ApiController {
    /**
     * 服务对象
     */
    @Resource
    private SysPermissionService sysPermissionService;

    @Autowired
    private SysRolePermissionService sysRolePermissionService;

    /**
     * 分页查询所有数据
     *
     * @param page          分页对象
     * @param sysPermission 查询实体
     * @return 所有数据
     */
    @PostMapping
    public R selectAll(Page<SysPermission> page, SysPermission sysPermission, @RequestParam(required = false) String field, @RequestParam(required = false) Boolean order) {
        if (field != null) {
            field = StrUtil.toUnderlineCase(field);
            List<OrderItem> orderItems = (order == null || order) ? OrderItem.ascs(field) : OrderItem.descs(field);
            page.setOrders(orderItems);
        }
        page.setOptimizeCountSql(false);
        page.setSearchCount(false);
        LambdaQueryWrapper<SysPermission> wrapper = new LambdaQueryWrapper<>();
        wrapper.like(StrUtil.isNotEmpty(sysPermission.getUrl()), SysPermission::getUrl, sysPermission.getUrl());
        page.setTotal(sysPermissionService.count(wrapper));
        wrapper.eq(SysPermission::getDeleted, 0);
        return success(this.sysPermissionService.pagePermissionDTO(page, wrapper));
    }

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("{id}")
    public R selectOne(@PathVariable Integer id) {
        LambdaQueryWrapper<SysPermission> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(SysPermission::getId, id).eq(SysPermission::getDeleted, 0);
        SysPermissionDTO permission = this.sysPermissionService.getPermissionDTO(wrapper);
        return success(permission);
    }

    /**
     * 新增数据
     *
     * @param sysPermission 实体对象
     * @return 新增结果
     */
    @PutMapping
    public R save(SysPermission sysPermission, Integer[] roleIds) {
        this.sysPermissionService.saveOrUpdate(sysPermission);
        Integer id = sysPermission.getId();

        List<SysRolePermission> rolePermissions = Arrays.stream(roleIds).map(role -> {
            SysRolePermission rolePermission = new SysRolePermission();
            rolePermission.setRoleId(role);
            rolePermission.setPermissionId(id);
            return rolePermission;
        }).collect(Collectors.toList());
        LambdaQueryWrapper<SysRolePermission> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(SysRolePermission::getPermissionId, id);
        sysRolePermissionService.remove(wrapper);
        sysRolePermissionService.saveBatch(rolePermissions);
        return success("success");
    }

    /**
     * 修改数据
     *
     * @param sysPermission 实体对象
     * @return 修改结果
     */
    @GetMapping
    public R list(SysPermission sysPermission) {

        return success(this.sysPermissionService.list(new QueryWrapper<>(sysPermission)));
    }

    /**
     * 删除数据
     *
     * @param idList 主键结合
     * @return 删除结果
     */
    @DeleteMapping
    public R delete(@RequestParam("ids") Integer[] idList) {
        return success(this.sysPermissionService.removeByIds(Arrays.asList(idList)));
    }
}