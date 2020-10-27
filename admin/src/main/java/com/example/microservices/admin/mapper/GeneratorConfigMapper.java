package com.example.microservices.admin.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.microservices.admin.entity.GeneratorConfig;
import org.springframework.stereotype.Repository;

/**
 * <p>
 * 数据库访问接口
 * </p>
 *
 * @author jobob
 * @since 2020-10-23
 */
@Repository
public interface GeneratorConfigMapper extends BaseMapper<GeneratorConfig> {

}
