package com.example.microservices.admin.mapper;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Constants;
import com.example.microservices.admin.dto.SysDeptDTO;
import com.example.microservices.admin.entity.SysDept;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 部门管理(SysDept)表数据库访问层
 *
 * @author makejava
 * @since 2020-08-05 16:14:58
 */
public interface SysDeptMapper extends BaseMapper<SysDept> {
    IPage<SysDeptDTO> pageDeptDTO(IPage<SysDept> page, @Param(Constants.WRAPPER) Wrapper<SysDept> wrapper);

    List<SysDeptDTO> listDeptDTO(@Param(Constants.WRAPPER) Wrapper<SysDept> wrapper);
}