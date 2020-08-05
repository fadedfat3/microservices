package com.example.microservices.admin.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.api.ApiController;
import com.baomidou.mybatisplus.extension.api.R;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.microservices.admin.entity.SysDict;
import com.example.microservices.admin.service.SysDictService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.io.Serializable;
import java.util.List;

/**
 * 字典表(SysDict)表控制层
 *
 * @author makejava
 * @since 2020-08-05 16:14:58
 */
@RestController
@RequestMapping("sysDict")
public class SysDictController extends ApiController {
    /**
     * 服务对象
     */
    @Resource
    private SysDictService sysDictService;

    /**
     * 分页查询所有数据
     *
     * @param page    分页对象
     * @param sysDict 查询实体
     * @return 所有数据
     */
    @GetMapping
    public R selectAll(Page<SysDict> page, SysDict sysDict) {
        return success(this.sysDictService.page(page, new QueryWrapper<>(sysDict)));
    }

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("{id}")
    public R selectOne(@PathVariable Serializable id) {
        return success(this.sysDictService.getById(id));
    }

    /**
     * 新增数据
     *
     * @param sysDict 实体对象
     * @return 新增结果
     */
    @PostMapping
    public R insert(@RequestBody SysDict sysDict) {
        return success(this.sysDictService.save(sysDict));
    }

    /**
     * 修改数据
     *
     * @param sysDict 实体对象
     * @return 修改结果
     */
    @PutMapping
    public R update(@RequestBody SysDict sysDict) {
        return success(this.sysDictService.updateById(sysDict));
    }

    /**
     * 删除数据
     *
     * @param idList 主键结合
     * @return 删除结果
     */
    @DeleteMapping
    public R delete(@RequestParam("idList") List<Long> idList) {
        return success(this.sysDictService.removeByIds(idList));
    }
}