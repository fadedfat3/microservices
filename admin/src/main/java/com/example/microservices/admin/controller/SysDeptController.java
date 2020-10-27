package com.example.microservices.admin.controller;


import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.OrderItem;
import com.baomidou.mybatisplus.extension.api.ApiController;
import com.baomidou.mybatisplus.extension.api.R;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.microservices.admin.entity.SysDept;
import com.example.microservices.admin.service.SysDeptService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.Arrays;
import java.util.List;

/**
 * 部门管理(SysDept)表控制层
 *
 * @author makejava
 * @since 2020-08-05 16:14:58
 */
@RestController
@RequestMapping("sysDept")
public class SysDeptController extends ApiController {
    /**
     * 服务对象
     */
    @Resource
    private SysDeptService sysDeptService;

    /**
     * 分页查询所有数据
     *
     * @param page    分页对象
     * @param sysDept 查询实体
     * @return 所有数据
     */
    @PostMapping
    public R selectAll(Page<SysDept> page, SysDept sysDept, @RequestParam(required = false) String field, @RequestParam(required = false) Boolean order) {
        if (field != null) {
            field = StrUtil.toUnderlineCase(field);
            List<OrderItem> orderItems = (order == null || order) ? OrderItem.ascs(field) : OrderItem.descs(field);
            page.setOrders(orderItems);
        }
        page.setOptimizeCountSql(false);
        page.setSearchCount(false);
        LambdaQueryWrapper<SysDept> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(SysDept::getParentId, 0);
        wrapper.like(StrUtil.isNotEmpty(sysDept.getName()), SysDept::getName, sysDept.getName());
        page.setTotal(sysDeptService.count(wrapper));
        return success(this.sysDeptService.pageDeptDTO(page, wrapper));
    }

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("{id}")
    public R selectOne(@PathVariable Integer id) {
        return success(this.sysDeptService.getById(id));
    }

    @GetMapping
    public R list(SysDept sysDept) {
        LambdaQueryWrapper<SysDept> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(sysDept.getParentId() != null, SysDept::getParentId, sysDept.getParentId());
        return success(this.sysDeptService.listDeptDTO(wrapper));
    }

    /**
     * 修改数据
     *
     * @param sysDept 实体对象
     * @return 修改结果
     */
    @PutMapping
    public R save(SysDept sysDept) {
        return success(this.sysDeptService.saveOrUpdate(sysDept));
    }

    /**
     * 删除数据
     *
     * @param idList 主键结合
     * @return 删除结果
     */
    @DeleteMapping
    public R delete(@RequestParam("ids") Integer[] idList) {
        return success(this.sysDeptService.removeByIds(Arrays.asList(idList)));
    }

}