package com.example.microservices.admin.controller;


import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.OrderItem;
import com.baomidou.mybatisplus.extension.api.ApiController;
import com.baomidou.mybatisplus.extension.api.R;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.microservices.admin.entity.SysMenu;
import com.example.microservices.admin.entity.SysRoleMenu;
import com.example.microservices.admin.service.SysMenuService;
import com.example.microservices.admin.service.SysRoleMenuService;
import com.example.microservices.admin.service.SysUserService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * 菜单权限表(SysMenu)表控制层
 *
 * @author makejava
 * @since 2020-08-05 16:14:06
 */
@RestController
@RequestMapping("sysMenu")
@Slf4j
public class SysMenuController extends ApiController {
    /**
     * 服务对象
     */
    @Resource
    private SysMenuService sysMenuService;
    @Autowired
    private SysRoleMenuService sysRoleMenuService;
    @Autowired
    private SysUserService sysUserService;



    /**
     * 分页查询所有一级菜单
     * 自定义wrapper，不支持entity wrapper，删除逻辑也需要自定义
     * @param page    分页对象
     * @param sysMenu 查询实体
     * @return 所有数据
     */
    @PostMapping
    public R pageParent(Page<SysMenu> page, SysMenu sysMenu, @RequestParam(required = false) String field, @RequestParam(required = false) Boolean order) {
        if (field != null) {
            field = StrUtil.toUnderlineCase(field);
            List<OrderItem> orderItems = (order == null || order) ? OrderItem.ascs(field) : OrderItem.descs(field);
            page.setOrders(orderItems);
        }
        page.setOptimizeCountSql(false);
        page.setSearchCount(false);

        QueryWrapper<SysMenu> wrapper = new QueryWrapper<>();
        wrapper.eq("type", 1);
        wrapper.eq("parent_id", 0);
        wrapper.like(StringUtils.isNotEmpty(sysMenu.getTitle()), "title", sysMenu.getTitle());
        page.setTotal(sysMenuService.count(wrapper));
        wrapper.eq("deleted", 0);
        return success(sysMenuService.pageMenuDTO(page, wrapper));
    }

    @PostMapping("children")
    public R listChildren(SysMenu sysMenu) {
        QueryWrapper<SysMenu> wrapper = new QueryWrapper<>();
        wrapper.eq("parent_id", sysMenu.getId());
        wrapper.eq("type", 1);
        wrapper.eq("deleted", 0);
        return success(sysMenuService.listMenuDTO(wrapper));
    }

    @PostMapping("list")
    public R list(SysMenu sysMenu) {
        QueryWrapper<SysMenu> wrapper = new QueryWrapper<>();
        Integer id = sysMenu.getId() == null ? 0 : sysMenu.getId();
        wrapper.eq("parent_id", id);
        wrapper.eq("type", 1);
        wrapper.eq("deleted", 0);
        return success(sysMenuService.listMenuDTO(wrapper));
    }

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("{id}")
    public R selectOne(@PathVariable Integer id) {
        QueryWrapper<SysMenu> wrapper = new QueryWrapper<>();
        wrapper.eq("id", id).eq("deleted", 0);
        return success(this.sysMenuService.getMenuDTO(wrapper));
    }

    /**
     * 新增数据
     *
     * @param sysMenu 实体对象
     * @return 新增结果
     */
    @PutMapping
    public R insertOrUpdate(SysMenu sysMenu, Integer[] roleIds) {
        this.sysMenuService.saveOrUpdate(sysMenu);
        sysRoleMenuService.remove(new QueryWrapper<SysRoleMenu>().eq("menu_id", sysMenu.getId()));
        List<SysRoleMenu> sysRoleMenuList = new ArrayList<>();
        Arrays.stream(roleIds).forEach((id) -> {
            SysRoleMenu sysRoleMenu = new SysRoleMenu();
            sysRoleMenu.setMenuId(sysMenu.getId());
            sysRoleMenu.setRoleId(id);
            sysRoleMenuList.add(sysRoleMenu);
        });
        sysRoleMenuService.saveBatch(sysRoleMenuList);
        return R.ok("success");
    }


    /**
     * 删除数据
     *
     * @param ids 主键结合
     * @return 删除结果
     */
    @DeleteMapping
    public R delete(Integer[] ids) {
        logger.info("ids={}", ids);
        List<Integer> idList = Arrays.asList(ids);
        logger.info("idList={}", idList);
        return success(this.sysMenuService.removeByIds(idList));
    }
}