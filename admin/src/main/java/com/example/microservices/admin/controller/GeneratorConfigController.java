package com.example.microservices.admin.controller;

import cn.hutool.core.io.FileUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.OrderItem;
import com.baomidou.mybatisplus.extension.api.ApiController;
import com.baomidou.mybatisplus.extension.api.R;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.microservices.admin.config.AutoGeneratorConfig;
import com.example.microservices.admin.entity.GeneratorConfig;
import com.example.microservices.admin.service.GeneratorConfigService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.net.URLEncoder;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 控制器
 * </p>
 *
 * @author jobob
 * @since 2020-10-23
 */
@RestController
@RequestMapping("generator-config")

public class GeneratorConfigController extends ApiController {
    @Autowired
    private GeneratorConfigService generatorConfigService;
    @Autowired
    private AutoGeneratorConfig autoGeneratorConfig;

    /**
     * 分页查询所有数据
     *
     * @param page            分页对象
     * @param generatorConfig 查询实体
     * @return 分页数据
     */
    @PostMapping
    public R selectAll(Page<GeneratorConfig> page, GeneratorConfig generatorConfig, @RequestParam(required = false) String field, @RequestParam(required = false) Boolean order) {
        if (field != null) {
            field = StrUtil.toUnderlineCase(field);
            List<OrderItem> orderItems = (order == null || order) ? OrderItem.ascs(field) : OrderItem.descs(field);
            page.setOrders(orderItems);
        }
        page.setOptimizeCountSql(false);
        page.setSearchCount(false);
        LambdaQueryWrapper<GeneratorConfig> wrapper = new LambdaQueryWrapper<>();

        page.setTotal(generatorConfigService.count(wrapper));
        return success(generatorConfigService.page(page, wrapper));
    }

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("{id}")
    public R selectOne(@PathVariable Integer id) {
        return success(generatorConfigService.getById(id));
    }

    /**
     * 查询所有数据
     *
     * @param generatorConfig 实体对象
     * @return 所有数据
     */
    @GetMapping
    public R list(GeneratorConfig generatorConfig) {
        LambdaQueryWrapper<GeneratorConfig> wrapper = new LambdaQueryWrapper<>();
        return success(generatorConfigService.list(wrapper));
    }

    /**
     * 修改数据
     *
     * @param generatorConfig 实体对象
     * @return 修改结果
     */
    @PutMapping
    public R save(GeneratorConfig generatorConfig) {
        return success(generatorConfigService.saveOrUpdate(generatorConfig));
    }

    /**
     * 删除数据
     *
     * @param idList 主键集合
     * @return 删除结果
     */
    @DeleteMapping
    public R delete(@RequestParam("ids") Integer[] idList) {
        return success(generatorConfigService.removeByIds(Arrays.asList(idList)));
    }

    @PostMapping("/generate")
    public R generate(Integer id, String tableNames, String fileTypes) {
        GeneratorConfig config = generatorConfigService.getById(id);
        String filepath = autoGeneratorConfig.generate(config, tableNames, fileTypes);
        if (null == filepath) {
            return failed("生成失败");
        }
        Map<String, Object> result = new HashMap<>();
        result.put("filepath", filepath);
        result.put("fileName", FileUtil.getName(filepath));
        return success(result);
    }

    @GetMapping("/download")
    public Object download(String filepath, HttpServletResponse response) {
        String filename = new File(filepath).getName();
        try {
            filename = URLEncoder.encode(filename, "UTF-8");
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        response.setHeader("content-type", "application/octet-stream");
        response.setContentType("application/octet-stream");
        // 下载文件能正常显示中文
        response.setHeader("Content-Disposition", "attachment;filename=" + filename);
        try {
            FileUtil.writeToStream(filepath, response.getOutputStream());
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        return null;
    }

}
