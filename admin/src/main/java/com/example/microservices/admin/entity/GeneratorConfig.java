package com.example.microservices.admin.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * <p>
 * 实体
 * </p>
 *
 * @author jobob
 * @since 2020-10-23
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class GeneratorConfig extends Model<GeneratorConfig> {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 项目绝对路径
     */
    @TableField("projectPath")
    private String projectPath;

    /**
     * 模块名
     */
    @TableField("moduleName")
    private String moduleName;

    /**
     * 作者名
     */
    private String author;

    /**
     * 数据库URL
     */
    private String url;

    /**
     * 数据库用户名
     */
    private String username;

    /**
     * 数据库密码
     */
    private String password;

    /**
     * 包名
     */
    @TableField("packageName")
    private String packageName;

    /**
     * 删除标识，0-存在，1-删除
     */
    @TableLogic
    private Integer deleted;

    /**
     * 创建时间
     */
    @TableField("createdTime")
    @JsonIgnore
    private LocalDateTime createdTime;

    /**
     * 更新时间
     */
    @TableField("updatedTime")
    @JsonIgnore
    private LocalDateTime updatedTime;


    @Override
    protected Serializable pkVal() {
        return this.id;
    }

}
