package com.example.microservices.admin.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.microservices.admin.dao.SysDictDao;
import com.example.microservices.admin.entity.SysDict;
import com.example.microservices.admin.service.SysDictService;
import org.springframework.stereotype.Service;

/**
 * 字典表(SysDict)表服务实现类
 *
 * @author makejava
 * @since 2020-08-05 16:14:58
 */
@Service("sysDictService")
public class SysDictServiceImpl extends ServiceImpl<SysDictDao, SysDict> implements SysDictService {

}