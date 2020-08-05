package com.example.microservices.admin.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.microservices.admin.dao.SysDeptDao;
import com.example.microservices.admin.entity.SysDept;
import com.example.microservices.admin.service.SysDeptService;
import org.springframework.stereotype.Service;

/**
 * 部门管理(SysDept)表服务实现类
 *
 * @author makejava
 * @since 2020-08-05 16:14:58
 */
@Service("sysDeptService")
public class SysDeptServiceImpl extends ServiceImpl<SysDeptDao, SysDept> implements SysDeptService {

}