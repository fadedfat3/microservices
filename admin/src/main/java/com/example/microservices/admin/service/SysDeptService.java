package com.example.microservices.admin.service;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.example.microservices.admin.dto.SysDeptDTO;
import com.example.microservices.admin.entity.SysDept;

import java.util.List;

/**
 * 部门管理(SysDept)表服务接口
 *
 * @author makejava
 * @since 2020-08-05 16:14:58
 */
public interface SysDeptService extends IService<SysDept> {
    IPage<SysDeptDTO> pageDeptDTO(IPage<SysDept> page, Wrapper<SysDept> wrapper);

    List<SysDeptDTO> listDeptDTO(LambdaQueryWrapper<SysDept> wrapper);
}