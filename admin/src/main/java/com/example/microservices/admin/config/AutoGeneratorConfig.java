package com.example.microservices.admin.config;

import cn.hutool.core.io.FileUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.toolkit.StringPool;
import com.baomidou.mybatisplus.generator.AutoGenerator;
import com.baomidou.mybatisplus.generator.InjectionConfig;
import com.baomidou.mybatisplus.generator.config.*;
import com.baomidou.mybatisplus.generator.config.converts.MySqlTypeConvert;
import com.baomidou.mybatisplus.generator.config.po.TableInfo;
import com.baomidou.mybatisplus.generator.config.rules.DbColumnType;
import com.baomidou.mybatisplus.generator.config.rules.NamingStrategy;
import com.example.microservices.admin.entity.GeneratorConfig;
import net.lingala.zip4j.ZipFile;
import net.lingala.zip4j.exception.ZipException;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.io.File;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Component
public class AutoGeneratorConfig {
    @Value("${generator.filepath}")
    private String GENERATOR_FILEPATH;
    private AutoGenerator mpg;
    private GlobalConfig gc;
    private DataSourceConfig dsc;
    private PackageConfig pc;
    private StrategyConfig strategy;
    private InjectionConfig ic;
    private TemplateConfig templateConfig;

    private GeneratorConfig config;
    private String tableNames;
    private String types;
    private String projectPath;

    public AutoGeneratorConfig() {
        this.mpg = new AutoGenerator();
        this.gc = new GlobalConfig();
        this.dsc = new DataSourceConfig();
        this.pc = new PackageConfig();
        this.strategy = new StrategyConfig();
        this.ic = new InjectionConfig() {
            @Override
            public void initMap() {

            }
        };
        this.templateConfig = new TemplateConfig();
        this.config = new GeneratorConfig();
        this.tableNames = "";
        this.types = "";
        this.projectPath = "";
    }

    public String generate(GeneratorConfig config, String tableNames, String fileTypes) {
        config(config, tableNames, fileTypes);
        mpg.execute();
        String zipFilepath = GENERATOR_FILEPATH + "/" + LocalDateTime.now().format(DateTimeFormatter.ISO_DATE)
                + "/" + FileUtil.getName(projectPath) + ".zip";
        ZipFile zipFile = new ZipFile(zipFilepath);
        try {
            zipFile.addFolder(new File(projectPath));
        } catch (ZipException e) {
            e.printStackTrace();
            return null;
        }
        FileUtil.del(projectPath);
        return zipFilepath;
    }

    public void config(GeneratorConfig config, String tableNames, String types) {
        this.config = config;
        this.tableNames = tableNames;
        this.types = types;
        // 代码生成器
        mpg = new AutoGenerator();

        // 全局配置
        gc = new GlobalConfig();
        //String projectPath = System.getProperty("user.dir");
        projectPath = GENERATOR_FILEPATH + File.separator + LocalDateTime.now().format(DateTimeFormatter.ISO_DATE)
                + File.separator + StrUtil.uuid();
        gc.setOutputDir(projectPath + "/src/main/java");
        gc.setAuthor(config.getAuthor());
        gc.setOpen(false);
        // gc.setSwagger2(true); 实体属性 Swagger2 注解
        gc.setActiveRecord(true);
        gc.setBaseResultMap(true);
        gc.setFileOverride(true);
        gc.setServiceName("%sService");
        mpg.setGlobalConfig(gc);

        // 数据源配置
        dsc = new DataSourceConfig();
        //dsc.setUrl("jdbc:mysql://localhost:3306/ant?useUnicode=true&useSSL=false&characterEncoding=utf8");
        //dsc.setUrl("jdbc:mysql://134.175.47.234:3306/rbac-security?characterEncoding=UTF-8&useUnicode=true&useSSL=false&serverTimezone=GMT%2B8");
        // dsc.setSchemaName("public");
        dsc.setUrl(config.getUrl());
        dsc.setDriverName("com.mysql.cj.jdbc.Driver");
        dsc.setUsername(config.getUsername());
        dsc.setPassword(config.getPassword());
        //dsc.setTypeConvert();
        dsc.setTypeConvert((GlobalConfig globalConfig, String fieldType) -> {
            String t = fieldType.toLowerCase();
            if (t.contains("tinyint")) {
                return DbColumnType.INTEGER;
            }
            return new MySqlTypeConvert().processTypeConvert(globalConfig, fieldType);
        });
        mpg.setDataSource(dsc);

        // 包配置
        pc = new PackageConfig();
        pc.setModuleName(config.getModuleName());
        pc.setParent(config.getPackageName());
        pc.setEntity("entity");
        pc.setController("controller");
        pc.setService("service");
        pc.setMapper("mapper");
        pc.setServiceImpl("service.impl");
        //pc.setXml("mapper");
        mpg.setPackageInfo(pc);

        // 策略配置
        strategy = new StrategyConfig();
        strategy.setNaming(NamingStrategy.underline_to_camel);
        strategy.setColumnNaming(NamingStrategy.underline_to_camel);
        //strategy.setSuperEntityClass("你自己的父类实体,没有就不用设置!");
        strategy.setEntityLombokModel(true);
        strategy.setRestControllerStyle(true);
        // 公共父类
        strategy.setSuperControllerClass("com.baomidou.mybatisplus.extension.api.ApiController");
        // 写于父类中的公共字段
        //strategy.setSuperEntityColumns("id");
        strategy.setInclude(tableNames.split(","));
        strategy.setControllerMappingHyphenStyle(true);
        //strategy.setTablePrefix(pc.getModuleName() + "_");
        strategy.setLogicDeleteFieldName("deleted");

        mpg.setStrategy(strategy);

        // 自定义配置
        ic = new InjectionConfig() {
            @Override
            public void initMap() {
                // to do nothing
            }
        };

        // 如果模板引擎是 freemarker
        // String templatePath = "/templates/mapper.xml.ftl";
        // 如果模板引擎是 velocity
        String templatePath = "/templates/mapper.xml.vm";
        String[] fileTypes = types.split(",");
        List<String> files = new ArrayList<String>(Arrays.asList(fileTypes));
        // 自定义输出配置
        List<FileOutConfig> focList = new ArrayList<>();
        // 自定义配置会被优先输出
        if (files.contains("xml")) {
            focList.add(new FileOutConfig(templatePath) {
                @Override
                public String outputFile(TableInfo tableInfo) {
                    // 自定义输出文件名 ， 如果你 Entity 设置了前后缀、此处注意 xml 的名称会跟着发生变化！！
                    return projectPath + "/src/main/resources/mapper/"
                            + (StrUtil.isNotEmpty(pc.getModuleName()) ? pc.getModuleName() + "/" : "")
                            + tableInfo.getEntityName() + "Mapper" + StringPool.DOT_XML;
                }
            });
        }
        /*
        cfg.setFileCreate(new IFileCreate() {
            @Override
            public boolean isCreate(ConfigBuilder configBuilder, FileType fileType, String filePath) {
                // 判断自定义文件夹是否需要创建
                checkDir("调用默认方法创建的目录，自定义目录用");
                if (fileType == FileType.MAPPER) {
                    // 已经生成 mapper 文件判断存在，不想重新生成返回 false
                    return !new File(filePath).exists();
                }
                // 允许生成模板文件
                return true;
            }
        });
        */
        if (focList.size() > 0) {
            ic.setFileOutConfigList(focList);
        }
        mpg.setCfg(ic);

        // 配置模板
        templateConfig = new TemplateConfig();

        // 配置自定义输出模板
        //指定自定义模板路径，注意不要带上.ftl/.vm, 会根据使用的模板引擎自动识别
        // templateConfig.setEntity("templates/entity2.java");
        // templateConfig.setService();

        if (files.contains("controller")) {
            templateConfig.setController("templates/controller.java");
        } else {
            templateConfig.setController(null);
        }
        if (files.contains("entity")) {
            templateConfig.setEntity("templates/entity.java");
        } else {
            templateConfig.setEntity(null);
        }
        if (files.contains("mapper")) {
            templateConfig.setMapper("templates/mapper.java");
        } else {
            templateConfig.setMapper(null);
        }
        if (files.contains("service")) {
            templateConfig.setService("templates/service.java");
            templateConfig.setServiceImpl("templates/service.impl.java");
        } else {
            templateConfig.setService(null);
            templateConfig.setServiceImpl(null);
        }

        templateConfig.setXml(null);
        mpg.setTemplate(templateConfig);
    }

}
