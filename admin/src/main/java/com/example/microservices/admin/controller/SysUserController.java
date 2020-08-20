package com.example.microservices.admin.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.api.ApiController;
import com.baomidou.mybatisplus.extension.api.R;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.microservices.admin.dto.SysMenuDTO;
import com.example.microservices.admin.entity.SysMenu;
import com.example.microservices.admin.entity.SysPermission;
import com.example.microservices.admin.entity.SysUser;
import com.example.microservices.admin.entity.SysUserRole;
import com.example.microservices.admin.service.SysUserRoleService;
import com.example.microservices.admin.service.SysUserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.*;

/**
 * 用户表(SysUser)表控制层
 *
 * @author makejava
 * @since 2020-08-05 15:19:06
 */
@RestController
@RequestMapping("sysUser")
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
        List<SysPermission> permissions = sysUserService.findPermissionListByUser(user);
        List<SysMenu> menus = sysUserService.findMenuListByUser(queryWrapper);
        SysMenuDTO sysMenuDTO = new SysMenuDTO();
        sysMenuDTO.setMenuId(0);
        treefy(sysMenuDTO, menus);
        Map<String, Object> result = new HashMap<>();
        result.put("permissions", permissions);
        result.put("routes", sysMenuDTO.getChildren());
        return R.ok(result);
    }

    private void treefy(SysMenuDTO sysMenuDTO, List<SysMenu> sysMenuList) {

        sysMenuList.stream().forEach(menu -> {
            if (menu.getParentId().equals(sysMenuDTO.getMenuId())) {
                SysMenuDTO child = new SysMenuDTO(menu);
                sysMenuDTO.getChildren().add(child);
                treefy(child, sysMenuList);

            }
        });
        sysMenuDTO.getChildren().sort(Comparator.comparing(SysMenuDTO::getSort));
    }

    /**
     * 分页查询所有数据
     *
     * @param page    分页对象
     * @param sysUser 查询实体
     * @return 所有数据
     */
    @GetMapping
    public R selectAll(Page<SysUser> page, SysUser sysUser) {
        page.setOptimizeCountSql(false);
        page.setTotal(sysUserService.count(new QueryWrapper<>(sysUser)));
        return success(sysUserService.listUserDTO(page, new QueryWrapper<>(sysUser)));
        //      return success(this.sysUserService.page(page, new QueryWrapper<>(sysUser)));
    }

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("{id}")
    public R selectOne(@PathVariable Serializable id) {
        return success(this.sysUserService.getById(id));
    }

    /**
     * 新增数据
     *
     * @param sysUser 实体对象
     * @return 新增结果
     */
    @RequestMapping(method = {RequestMethod.POST, RequestMethod.PUT})
    @Transactional(rollbackFor = Exception.class)
    public R insertOrUpdate(SysUser sysUser, String roleIds) {
        sysUser.setPassword(bCryptPasswordEncoder.encode(sysUser.getPassword()));
        sysUserService.saveOrUpdate(sysUser);
        String userId = sysUser.getId();
        String[] roleIdArr = roleIds.split(",");
        List<SysUserRole> userRoles = new ArrayList<>();
        Arrays.stream(roleIdArr).forEach((id) -> {
            SysUserRole sysUserRole = new SysUserRole();
            sysUserRole.setUserId(userId);
            sysUserRole.setRoleId(id);
            sysUserRole.setId(null);
            userRoles.add(sysUserRole);
        });
        log.info("userRoles={}", userRoles);
        //sysUserRoleService.saveOrUpdate()
        sysUserRoleService.saveOrUpdateBatch(userRoles);

        return R.ok(null);
    }

    /**
     * 删除数据
     *
     * @param idList 主键结合
     * @return 删除结果
     */
    @DeleteMapping
    public R delete(String[] idList) {
        return success(this.sysUserService.removeByIds(Arrays.asList(idList)));
    }


    @PostMapping("/lastLogin")
    public R lastLogin(SysUser user) {
        user.setLastLoginTime(LocalDateTime.now());
        sysUserService.updateById(user);
        return R.ok(user);
    }

}