package com.example.microservices.admin.controller;


import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.OrderItem;
import com.baomidou.mybatisplus.extension.api.ApiController;
import com.baomidou.mybatisplus.extension.api.R;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.microservices.admin.dto.SysUserDTO;
import com.example.microservices.admin.entity.SysMenu;
import com.example.microservices.admin.entity.SysUser;
import com.example.microservices.admin.entity.SysUserRole;
import com.example.microservices.admin.service.SysUserRoleService;
import com.example.microservices.admin.service.SysUserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * 用户表(SysUser)表控制层
 *
 * @author makejava
 * @since 2020-08-05 15:19:06
 */
@RestController
@RequestMapping("user")
@Slf4j
public class SysUserController extends ApiController {
    /**
     * 服务对象
     */
    @Resource
    private SysUserService sysUserService;

    private BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();

    @Autowired
    private SysUserRoleService sysUserRoleService;


    @GetMapping("/menu/{username}")
    public R listMenuByUsername(@PathVariable("username") String username) {
        QueryWrapper<SysUser> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("username", username);
        SysUser user = sysUserService.getOne(queryWrapper);
        //List<SysPermission> permissions = sysUserService.findPermissionListByUser(user);
        List<SysMenu> menus = sysUserService.findMenuListByUser(user);
        return R.ok(menus);
    }

//    private void treefy(SysMenuDTO sysMenuDTO, List<SysMenu> sysMenuList) {
//
//        sysMenuList.stream().forEach(menu -> {
//            if (menu.getParentId().equals(sysMenuDTO.getId())) {
//                SysMenuDTO child = new SysMenuDTO(menu);
//                sysMenuDTO.getChildren().add(child);
//                treefy(child, sysMenuList);
//
//            }
//        });
//        sysMenuDTO.getChildren().sort(Comparator.comparing(SysMenuDTO::getSort));
//    }

    /**
     * 分页查询所有数据
     *
     * @param page    分页对象
     * @param sysUser 查询实体
     * @return 所有数据
     */
    @PostMapping
    public R selectAll(Page<SysUser> page, SysUser sysUser, @RequestParam(required = false) String field, @RequestParam(required = false) Boolean order) {
        if (field != null) {
            field = StrUtil.toUnderlineCase(field);
            List<OrderItem> orderItems = (order == null || order) ? OrderItem.ascs(field) : OrderItem.descs(field);
            page.setOrders(orderItems);
        }
        page.setOptimizeCountSql(false);
        page.setSearchCount(false);
        LambdaQueryWrapper<SysUser> wrapper = new LambdaQueryWrapper<>();
        wrapper.like(StrUtil.isNotEmpty(sysUser.getUsername()), SysUser::getUsername, sysUser.getUsername());
        page.setTotal(sysUserService.count(wrapper));
        wrapper.eq(SysUser::getDeleted, 0);
        return success(sysUserService.pageUserDTO(page, wrapper));
        //      return success(this.sysUserService.page(page, new QueryWrapper<>(sysUser)));
    }

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("{id}")
    public R selectOne(@PathVariable Integer id) {
        LambdaQueryWrapper<SysUser> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(SysUser::getId, id);
        wrapper.eq(SysUser::getDeleted, 0);
        return success(this.sysUserService.getUserDTO(wrapper));
    }

    /**
     * 新增数据
     *
     * @param sysUser 实体对象
     * @return 新增结果
     */
    @PutMapping
    @Transactional(rollbackFor = Exception.class)
    public R insertOrUpdate(SysUser sysUser, Integer[] roleIds) {
        sysUser.setPassword(bCryptPasswordEncoder.encode(sysUser.getPassword()));
        sysUserService.saveOrUpdate(sysUser);
        Integer userId = sysUser.getId();
        List<SysUserRole> userRoles = new ArrayList<>();
        Arrays.stream(roleIds).forEach((id) -> {
            SysUserRole sysUserRole = new SysUserRole();
            sysUserRole.setUserId(userId);
            sysUserRole.setRoleId(id);
            userRoles.add(sysUserRole);
        });
        // log.info("userRoles={}", userRoles);
        //sysUserRoleService.saveOrUpdate()
        LambdaQueryWrapper<SysUserRole> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(SysUserRole::getUserId, userId);
        sysUserRoleService.remove(wrapper);
        sysUserRoleService.saveBatch(userRoles);

        return R.ok("success");
    }

    /**
     * 删除数据
     *
     * @param idList 主键结合
     * @return 删除结果
     */
    @DeleteMapping
    public R delete(Integer[] ids) {
        return success(this.sysUserService.removeByIds(Arrays.asList(ids)));
    }


    @PostMapping("/lastLogin")
    public R lastLogin(SysUser user) {
        user.setLastLoginTime(LocalDateTime.now());
        sysUserService.updateById(user);
        return R.ok(user);
    }

    @GetMapping("/info")
    public R currentUser() {
        ServletRequestAttributes servletRequestAttributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = servletRequestAttributes.getRequest();
        String uid = request.getHeader("uid");
        LambdaQueryWrapper<SysUser> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(SysUser::getId, Integer.parseInt(uid));
        wrapper.eq(SysUser::getDeleted, 0);
        SysUserDTO userDTO = sysUserService.getUserDTO(wrapper);
        return R.ok(userDTO);
    }

}