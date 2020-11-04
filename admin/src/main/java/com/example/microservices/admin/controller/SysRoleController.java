package com.example.microservices.admin.controller;


import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.OrderItem;
import com.baomidou.mybatisplus.extension.api.ApiController;
import com.baomidou.mybatisplus.extension.api.R;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.microservices.admin.entity.SysRole;
import com.example.microservices.admin.service.SysRoleService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.Arrays;
import java.util.List;

/**
 * 系统角色表(SysRole)表控制层
 *
 * @author makejava
 * @since 2020-08-05 16:10:19
 */
@RestController
@RequestMapping("sysRole")
public class SysRoleController extends ApiController {
    /**
     * 服务对象
     */
    @Resource
    private SysRoleService sysRoleService;

    /**
     * 分页查询所有数据
     *
     * @param page    分页对象
     * @param sysRole 查询实体
     * @return 所有数据
     */
    @PostMapping
    public R selectAll(Page<SysRole> page, SysRole sysRole, @RequestParam(required = false) String field, @RequestParam(required = false) Boolean order) {
        if (field != null) {
            field = StrUtil.toUnderlineCase(field);
            List<OrderItem> orderItems = (order == null || order) ? OrderItem.ascs(field) : OrderItem.descs(field);
            page.setOrders(orderItems);
        }
        page.setOptimizeCountSql(false);
        page.setSearchCount(false);
        LambdaQueryWrapper<SysRole> wrapper = new LambdaQueryWrapper<>();
        wrapper.like(StringUtils.isNotEmpty(sysRole.getRoleName()), SysRole::getRoleName, sysRole.getRoleName());
        page.setTotal(sysRoleService.count(wrapper));
        return success(this.sysRoleService.page(page, wrapper));
    }

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("{id}")
    public R selectOne(@PathVariable Integer id) {
        return success(this.sysRoleService.getById(id));
    }

    @GetMapping
    public R list(SysRole sysRole) {
        QueryWrapper<SysRole> wrapper = new QueryWrapper<>(sysRole);

        return success(sysRoleService.list(wrapper));
        //return success("list of role");
    }

    /**
     * 修改数据
     *
     * @param sysRole 实体对象
     * @return 修改结果
     */
    @PutMapping
    public R update(SysRole sysRole) {

        return success(this.sysRoleService.saveOrUpdate(sysRole));
    }

    @DeleteMapping
    public R delete(Integer[] ids) {
        return success(this.sysRoleService.removeByIds(Arrays.asList(ids)));
    }
}