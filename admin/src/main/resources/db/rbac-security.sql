-- MySQL dump 10.13  Distrib 5.7.23, for osx10.14 (x86_64)
--
-- Host: 192.168.70.159    Database: rbac-security
-- ------------------------------------------------------
-- Server version	5.7.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT = @@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS = @@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION = @@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE = @@TIME_ZONE */;
/*!40103 SET TIME_ZONE = '+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS = @@UNIQUE_CHECKS, UNIQUE_CHECKS = 0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS = 0 */;
/*!40101 SET @OLD_SQL_MODE = @@SQL_MODE, SQL_MODE = 'NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES = @@SQL_NOTES, SQL_NOTES = 0 */;

--
-- Table structure for table `oauth_access_token`
--

DROP TABLE IF EXISTS `oauth_access_token`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_access_token`
(
    `token_id`          varchar(256) DEFAULT NULL COMMENT 'MD5加密的access_token的值',
    `token`             blob COMMENT 'OAuth2AccessToken.java对象序列化后的二进制数据',
    `authentication_id` varchar(256) DEFAULT NULL COMMENT 'MD5加密过的username,client_id,scope',
    `user_name`         varchar(256) DEFAULT NULL COMMENT '登录的用户名',
    `client_id`         varchar(256) DEFAULT NULL COMMENT '客户端ID',
    `authentication`    blob COMMENT 'OAuth2Authentication.java对象序列化后的二进制数据',
    `refresh_token`     varchar(256) DEFAULT NULL COMMENT 'MD5加密果的refresh_token的值'
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='访问令牌表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_access_token`
--

LOCK TABLES `oauth_access_token` WRITE;
/*!40000 ALTER TABLE `oauth_access_token`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_access_token`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_approvals`
--

DROP TABLE IF EXISTS `oauth_approvals`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_approvals`
(
    `userid`         varchar(256) DEFAULT NULL COMMENT '登录的用户名',
    `clientid`       varchar(256) DEFAULT NULL COMMENT '客户端ID',
    `scope`          varchar(256) DEFAULT NULL COMMENT '申请的权限',
    `status`         varchar(10)  DEFAULT NULL COMMENT '状态（Approve或Deny）',
    `expiresat`      datetime     DEFAULT NULL COMMENT '过期时间',
    `lastmodifiedat` datetime     DEFAULT NULL COMMENT '最终修改时间'
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='授权记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_approvals`
--

LOCK TABLES `oauth_approvals` WRITE;
/*!40000 ALTER TABLE `oauth_approvals`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_approvals`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_client_details`
--

DROP TABLE IF EXISTS `oauth_client_details`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_client_details`
(
    `client_id`               varchar(255) NOT NULL,
    `resource_ids`            varchar(255)  DEFAULT NULL,
    `client_secret`           varchar(255) NOT NULL,
    `scope`                   varchar(255) NOT NULL,
    `authorized_grant_types`  varchar(255) NOT NULL,
    `web_server_redirect_uri` varchar(255)  DEFAULT NULL,
    `authorities`             varchar(255)  DEFAULT NULL,
    `access_token_validity`   int(11)      NOT NULL,
    `refresh_token_validity`  int(11)       DEFAULT NULL,
    `additional_information`  varchar(4096) DEFAULT NULL,
    `autoapprove`             tinyint(4)    DEFAULT NULL,
    `origin_secret`           varchar(255)  DEFAULT NULL,
    PRIMARY KEY (`client_id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = DYNAMIC COMMENT ='客户端配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_client_details`
--

LOCK TABLES `oauth_client_details` WRITE;
/*!40000 ALTER TABLE `oauth_client_details`
    DISABLE KEYS */;
INSERT INTO `oauth_client_details`
VALUES ('app', '', '$2a$10$8Qk/efslEpO1Af1kyw/rp.DdJGsdnET8UCp1vGDzpQEa.1qBklvua', 'all', 'refresh_token,password', '',
        NULL, 86400, 864000, NULL, NULL, '123456'),
       ('febs', ' ', '$2a$10$aSZTvMOtUAYUQ.75z2n3ceJd6dCIk9Vy3J/SKZUE4hBLd6sz7.6ge', 'all', 'password,refresh_token',
        NULL, NULL, 86400, 8640000, NULL, 0, '123456'),
       ('password', 'rid', '$2a$10$MTNPRR0CkuZyhk50rDNi1eJtmzUDq3Ye/J5kRlpIRQDjBXP90zwnu', 'all',
        'password,refresh_token', NULL, NULL, 86400, 864000, NULL, NULL, 'wangu123!@#');
/*!40000 ALTER TABLE `oauth_client_details`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_client_token`
--

DROP TABLE IF EXISTS `oauth_client_token`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_client_token`
(
    `token_id`          varchar(256) DEFAULT NULL COMMENT 'MD5加密的access_token值',
    `token`             blob COMMENT 'OAuth2AccessToken.java对象序列化后的二进制数据',
    `authentication_id` varchar(256) DEFAULT NULL COMMENT 'MD5加密过的username,client_id,scope',
    `user_name`         varchar(256) DEFAULT NULL COMMENT '登录的用户名',
    `client_id`         varchar(256) DEFAULT NULL COMMENT '客户端ID'
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='客户端授权令牌表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_client_token`
--

LOCK TABLES `oauth_client_token` WRITE;
/*!40000 ALTER TABLE `oauth_client_token`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_client_token`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_code`
--

DROP TABLE IF EXISTS `oauth_code`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_code`
(
    `code`           varchar(256) DEFAULT NULL COMMENT '授权码(未加密)',
    `authentication` blob COMMENT 'AuthorizationRequestHolder.java对象序列化后的二进制数据'
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='授权码表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_code`
--

LOCK TABLES `oauth_code` WRITE;
/*!40000 ALTER TABLE `oauth_code`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_code`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_refresh_token`
--

DROP TABLE IF EXISTS `oauth_refresh_token`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_refresh_token`
(
    `token_id`       varchar(256) DEFAULT NULL COMMENT 'MD5加密过的refresh_token的值',
    `token`          blob COMMENT 'OAuth2RefreshToken.java对象序列化后的二进制数据',
    `authentication` blob COMMENT 'OAuth2Authentication.java对象序列化后的二进制数据'
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='更新令牌表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_refresh_token`
--

LOCK TABLES `oauth_refresh_token` WRITE;
/*!40000 ALTER TABLE `oauth_refresh_token`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_refresh_token`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_userconnection`
--

DROP TABLE IF EXISTS `social_userconnection`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_userconnection`
(
    `userId`         varchar(255) NOT NULL,
    `providerId`     varchar(255) NOT NULL,
    `providerUserId` varchar(255) NOT NULL,
    `rank`           int(11)      NOT NULL,
    `displayName`    varchar(255)      DEFAULT NULL,
    `profileUrl`     varchar(512)      DEFAULT NULL,
    `imageUrl`       varchar(512)      DEFAULT NULL,
    `accessToken`    varchar(512) NOT NULL,
    `secret`         varchar(512)      DEFAULT NULL,
    `refreshToken`   varchar(512)      DEFAULT NULL,
    `expireTime`     bigint(20)        DEFAULT NULL,
    `create_time`    timestamp    NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `tenant_id`      int(11)           DEFAULT NULL COMMENT '租户id',
    PRIMARY KEY (`userId`, `providerId`, `providerUserId`) USING BTREE,
    UNIQUE KEY `UserConnectionRank` (`userId`, `providerId`, `rank`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8 COMMENT ='社交登录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_userconnection`
--

LOCK TABLES `social_userconnection` WRITE;
/*!40000 ALTER TABLE `social_userconnection`
    DISABLE KEYS */;
INSERT INTO `social_userconnection`
VALUES ('4', 'gitee', '1758995', 1, '小东啊', 'https://gitee.com/li_haodong', 'https://gitee.com/assets/no_portrait.png',
        'c1fca8c75ab27aaca5dfb5a6eace6399', NULL, 'dfb4a011a1f64b84351ed105e34a9ef606dc2b79c89c524e021b16a5a231b192',
        1565078033891, '2019-07-22 05:29:56', 1),
       ('4', 'github', '34288907', 1, 'LiHaodong888', 'https://github.com/34288907',
        'https://avatars1.githubusercontent.com/u/34288907?v=4', 'f67968d673df3cba6b844792dc0f13202dc4d7c5', NULL, NULL,
        NULL, '2019-08-05 03:37:43', 1),
       ('4', 'qq', '50C4D34B696F544B6D7768D6EAB1E9EE', 1, '旧情书。', NULL,
        'http://thirdqq.qlogo.cn/g?b=oidb&k=ct6ia1Gv2PgIDQvMltfB1XA&s=40&t=1555562263',
        '2AF1394759F6B346007DC780ECAF31BE', NULL, 'BA0D2EDD55D0055AB6C2305FDD2B57E4', 1572923822297,
        '2019-08-07 03:11:13', 1),
       ('4', 'weixin', 'ooAdzwJY_uPdf9wEZtYFTrWnv9bc', 1, '小东啊', NULL,
        'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJfRDzSZlwKOfYOywzGU2RxBfreicz4Q5alcYlzzUlvML295UW3Gr6S2NVFJsoiaGUYiatmaxib4gnEibg/132',
        '24_1OaDjCScr8b4URArw1UVcf9YJ9Q6id1Y5_xc7SMa5RqkkiJNK_hU6IGfegwe8ygZ5TPqjstKXbjuC1KUibPnmqdui1SWfdw1oZkESggDOqY',
        NULL,
        '24_YLfiVQJPMnGzAUjkyquwU722nCJlHHNWowxtMl6VQhF7JygDTajqYVtqKmOuraTrtaFvZULGR7eNmC2Qr713wKKAJVBxTE3wqh3p86kX44U',
        1566557314755, '2019-08-23 08:46:11', 1);
/*!40000 ALTER TABLE `social_userconnection`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dept`
--

DROP TABLE IF EXISTS `sys_dept`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_dept`
(
    `dept_id`     int(20)   NOT NULL AUTO_INCREMENT COMMENT '部门主键ID',
    `name`        varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '部门名称',
    `sort`        int(11)                         DEFAULT NULL COMMENT '排序',
    `create_time` timestamp NULL                  DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` timestamp NULL                  DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
    `del_flag`    char(1) COLLATE utf8mb4_bin     DEFAULT '0' COMMENT '是否删除  -1：已删除  0：正常',
    `parent_id`   int(11)                         DEFAULT NULL COMMENT '上级部门',
    `tenant_id`   int(11)                         DEFAULT NULL COMMENT '租户id',
    PRIMARY KEY (`dept_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 22
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_bin
  ROW_FORMAT = DYNAMIC COMMENT ='部门管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dept`
--

LOCK TABLES `sys_dept` WRITE;
/*!40000 ALTER TABLE `sys_dept`
    DISABLE KEYS */;
INSERT INTO `sys_dept`
VALUES (4, '某某集团', 0, '2019-04-21 14:53:33', '2019-10-08 02:57:59', '0', 0, 1),
       (5, '上海分公司', 0, '2019-04-21 14:53:57', '2019-12-14 07:26:45', '0', 4, 1),
       (6, '研发部', 0, '2019-04-21 14:54:10', '2019-12-10 08:48:03', '0', 5, 1),
       (7, '财务部', 0, '2019-04-21 14:54:46', '2019-10-08 02:58:01', '0', 5, 1),
       (12, '市场部', 4, '2019-04-30 06:31:46', '2019-12-14 07:15:42', '0', 5, 1),
       (14, '人事部', 0, '2019-12-14 07:25:17', '2019-12-14 07:25:17', '0', 5, 1),
       (16, '北京分公司', 0, '2019-12-14 07:26:35', '2019-12-14 07:26:35', '0', 4, 1),
       (17, '人事部', 0, '2019-12-14 07:33:38', '2019-12-14 13:42:32', '1', 16, 1),
       (18, '111', 0, '2019-12-14 13:36:42', '2019-12-14 13:37:34', '1', 4, 1),
       (19, '111', 0, '2019-12-14 13:40:26', '2019-12-14 13:40:43', '1', 16, 1),
       (20, '11', 0, '2019-12-14 13:42:24', '2019-12-14 13:42:32', '1', 17, 1),
       (21, '默认部门', 0, '2019-12-17 13:30:31', '2019-12-17 13:30:31', '0', 0, 2);
/*!40000 ALTER TABLE `sys_dept`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict`
--

DROP TABLE IF EXISTS `sys_dict`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_dict`
(
    `id`          int(64)      NOT NULL AUTO_INCREMENT COMMENT '编号',
    `dict_name`   varchar(100) NOT NULL COMMENT '名称',
    `dict_code`   varchar(50)           DEFAULT NULL COMMENT '字典编码',
    `description` varchar(100)          DEFAULT NULL COMMENT '描述',
    `sort`        int(4)                DEFAULT NULL COMMENT '排序（升序）',
    `create_time` timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `remark`      varchar(50)           DEFAULT NULL COMMENT '备注信息',
    `del_flag`    char(1)               DEFAULT '0' COMMENT '删除标记',
    `tenant_id`   int(11)               DEFAULT NULL COMMENT '租户Id',
    PRIMARY KEY (`id`),
    KEY `sys_dict_del_flag` (`del_flag`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 3
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = DYNAMIC COMMENT ='字典表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict`
--

LOCK TABLES `sys_dict` WRITE;
/*!40000 ALTER TABLE `sys_dict`
    DISABLE KEYS */;
INSERT INTO `sys_dict`
VALUES (1, '用户状态', 'lock_flag', '用户是否正常还是锁定', NULL, '2019-12-16 05:35:43', '2019-12-17 13:24:29', NULL, '0', 1),
       (2, '菜单类型', 'menu_type', '菜单类型 （类型   0：目录   1：菜单   2：按钮）', NULL, '2019-12-16 05:42:46', '2019-12-17 13:24:29',
        NULL, '0', 1);
/*!40000 ALTER TABLE `sys_dict`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_item`
--

DROP TABLE IF EXISTS `sys_dict_item`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_dict_item`
(
    `id`          varchar(50) CHARACTER SET utf8 NOT NULL,
    `dict_id`     varchar(20) CHARACTER SET utf8      DEFAULT NULL COMMENT '字典id',
    `item_text`   varchar(100) CHARACTER SET utf8     DEFAULT NULL COMMENT '字典项文本',
    `item_value`  varchar(100) CHARACTER SET utf8     DEFAULT NULL COMMENT '字典项值',
    `description` varchar(255) CHARACTER SET utf8     DEFAULT NULL COMMENT '描述',
    `status`      int(11)                             DEFAULT NULL COMMENT '状态（1启用 0不启用）',
    `create_time` timestamp                      NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` timestamp                      NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE,
    KEY `index_table_dict_id` (`dict_id`) USING BTREE,
    KEY `index_table_dict_status` (`status`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='字典详情表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_item`
--

LOCK TABLES `sys_dict_item` WRITE;
/*!40000 ALTER TABLE `sys_dict_item`
    DISABLE KEYS */;
INSERT INTO `sys_dict_item`
VALUES ('0c8f86876bfc7c59a5236010fdcaa07e', '2', '目录', '1', '', NULL, '2019-12-16 05:57:39', '2019-12-16 05:57:39'),
       ('3fe7ad23294384de45197f3379b8d658', '1', '锁定', '1', '0-正常，1-锁定', NULL, '2019-12-16 05:39:56',
        '2019-12-16 05:39:56'),
       ('5ace75b3caf31b86efa50430954d624f', '2', '按钮', '3', '', NULL, '2019-12-16 05:57:55', '2019-12-16 05:57:55'),
       ('6ea98d652a06220c99b9468ead68e6f9', '2', '菜单', '1', '', NULL, '2019-12-16 05:57:48', '2019-12-16 05:57:48'),
       ('f27a639dee243eef860f453c2ab8547e', '1', '正常', '0', '0-正常，1-锁定', NULL, '2019-12-16 05:39:45',
        '2019-12-16 05:39:45');
/*!40000 ALTER TABLE `sys_dict_item`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_log`
--

DROP TABLE IF EXISTS `sys_log`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_log`
(
    `id`             int(18)   NOT NULL AUTO_INCREMENT COMMENT '主键',
    `ip`             varchar(50) COLLATE utf8mb4_bin   DEFAULT NULL COMMENT '操作IP',
    `type`           int(3)                            DEFAULT NULL COMMENT '操作类型 1 操作记录2异常记录',
    `user_name`      varchar(20) COLLATE utf8mb4_bin   DEFAULT NULL COMMENT '操作人',
    `description`    varchar(50) COLLATE utf8mb4_bin   DEFAULT NULL COMMENT '操作描述',
    `action_method`  varchar(50) COLLATE utf8mb4_bin   DEFAULT NULL COMMENT '请求方法',
    `action_url`     varchar(50) COLLATE utf8mb4_bin   DEFAULT NULL,
    `params`         varchar(1000) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '请求参数',
    `browser`        varchar(500) COLLATE utf8mb4_bin  DEFAULT NULL COMMENT '浏览器',
    `class_path`     varchar(255) COLLATE utf8mb4_bin  DEFAULT NULL COMMENT '类路径',
    `request_method` varchar(10) COLLATE utf8mb4_bin   DEFAULT NULL COMMENT '请求方法',
    `start_time`     timestamp NULL                    DEFAULT NULL COMMENT '开始时间',
    `finish_time`    timestamp NULL                    DEFAULT NULL COMMENT '完成时间',
    `consuming_time` bigint(11)                        DEFAULT NULL COMMENT '消耗时间',
    `ex_desc`        varchar(1000) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '异常详情信息',
    `ex_detail`      text COLLATE utf8mb4_bin COMMENT '异常描述',
    `tenant_id`      int(11)                           DEFAULT NULL COMMENT '租户id',
    `location`       varchar(255) COLLATE utf8mb4_bin  DEFAULT NULL COMMENT '操作地点',
    `os`             varchar(255) COLLATE utf8mb4_bin  DEFAULT NULL COMMENT '操作系统',
    PRIMARY KEY (`id`),
    KEY `index_type` (`type`) USING BTREE COMMENT '日志类型'
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_bin COMMENT ='系统日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_log`
--

LOCK TABLES `sys_log` WRITE;
/*!40000 ALTER TABLE `sys_log`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_log`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_menu`
(
    `menu_id`     int(11)                         NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
    `name`        varchar(32) COLLATE utf8mb4_bin NOT NULL COMMENT '菜单名称',
    `perms`       varchar(32) COLLATE utf8mb4_bin      DEFAULT NULL COMMENT '菜单权限标识',
    `path`        varchar(128) COLLATE utf8mb4_bin     DEFAULT NULL COMMENT '前端跳转URL',
    `component`   varchar(255) COLLATE utf8mb4_bin     DEFAULT NULL COMMENT '菜单组件',
    `parent_id`   int(11)                              DEFAULT NULL COMMENT '父菜单ID',
    `icon`        varchar(32) COLLATE utf8mb4_bin      DEFAULT NULL COMMENT '图标',
    `sort`        int(11)                              DEFAULT '1' COMMENT '排序',
    `type`        char(1) COLLATE utf8mb4_bin          DEFAULT NULL COMMENT '菜单类型 （类型   0：目录   1：菜单   2：按钮）',
    `create_time` timestamp                       NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` timestamp                       NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `del_flag`    char(1) COLLATE utf8mb4_bin          DEFAULT '0' COMMENT '逻辑删除标记(0--正常 1--删除)',
    `is_frame`    tinyint(1)                           DEFAULT NULL COMMENT '是否为外链',
    PRIMARY KEY (`menu_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 73
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_bin
  ROW_FORMAT = DYNAMIC COMMENT ='菜单权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu`
    DISABLE KEYS */;
INSERT INTO `sys_menu`
VALUES (1, '权限管理', '', 'admin', '', 0, 'authority', 0, '0', '2019-04-21 14:45:08', '2019-05-05 12:20:31', '0', 1),
       (2, '用户管理', '', 'user', 'admin/user', 1, 'user', 1, '1', '2019-04-21 14:49:22', '2019-05-12 11:02:34', '0', 1),
       (3, '部门管理', '', 'dept', 'admin/dept', 1, 'dept', 2, '1', '2019-04-21 14:52:11', '2019-05-12 13:25:14', '0', 1),
       (5, '用户新增', 'sys:user:add', '', NULL, 2, '', 0, '2', '2019-04-22 05:09:11', '2019-06-08 03:21:07', '0', 1),
       (6, '系统管理', '', 'sys', '', 0, 'sys', 1, '0', '2019-04-22 15:48:02', '2019-05-06 14:44:51', '0', 1),
       (7, '操作日志', '', 'log', 'sys/log', 6, 'log', 1, '1', '2019-04-22 15:59:40', '2019-09-23 07:58:22', '0', 1),
       (11, '部门新增', 'sys:dept:add', '', NULL, 3, '', 0, '2', '2019-04-25 03:09:50', '2019-06-08 05:13:45', '0', 1),
       (13, '角色管理', '', 'role', 'admin/role', 1, 'peoples', 1, '1', '2019-04-29 13:08:28', '2019-05-05 12:20:53', '0',
        1),
       (14, '用户修改', 'sys:user:update', '', NULL, 2, '', 0, '2', '2019-04-30 15:43:31', '2019-06-08 03:22:23', '0', 1),
       (15, '角色新增', 'sys:role:add', '', NULL, 13, '', 0, '2', '2019-05-01 00:49:21', '2019-06-09 08:39:48', '0', 1),
       (16, '菜单管理', '', 'menu', 'admin/menu', 1, 'menu', 3, '1', '2019-05-03 07:26:58', '2019-05-05 12:20:56', '0', 1),
       (27, '日志删除', 'sys:log:delete', '', '', 7, '', 0, '2', '2019-05-06 14:47:47', '2019-06-08 05:15:05', '0', 1),
       (28, '菜单增加', 'sys:menu:add', '', '', 16, '', 0, '2', '2019-05-08 08:09:43', '2019-06-08 05:14:02', '0', 1),
       (29, '菜单修改', 'sys:menu:update', '', '', 16, '', 0, '2', '2019-05-08 08:10:06', '2019-06-08 05:14:05', '0', 1),
       (30, '部门修改', 'sys:dept:update', '', '', 3, '', 0, '2', '2019-05-08 15:49:54', '2019-06-08 05:13:49', '0', 1),
       (31, '部门删除', 'sys:dept:delete', '', '', 3, '', 0, '2', '2019-05-08 15:53:41', '2019-06-08 05:13:52', '0', 1),
       (33, '用户查看', 'sys:user:view', '', '', 2, '', 0, '2', '2019-05-12 10:59:46', '2019-06-08 03:23:01', '0', 1),
       (34, '角色修改', 'sys:role:update', '', '', 13, '', 0, '2', '2019-05-12 11:05:03', '2019-06-08 05:13:29', '0', 1),
       (35, '用户删除', 'sys:user:delete', '', '', 2, '', 0, '2', '2019-05-12 11:08:13', '2019-06-08 03:23:07', '0', 1),
       (36, '菜单删除', 'sys:menu:delete', '', '', 16, '', 0, '2', '2019-05-12 11:10:02', '2019-06-08 05:14:09', '0', 1),
       (37, '角色删除', 'sys:role:delete', '', '', 13, '', 0, '2', '2019-05-12 11:11:14', '2019-06-08 05:13:34', '0', 1),
       (38, '角色查看', 'sys:role:view', '', '', 13, '', 0, '2', '2019-05-12 11:11:37', '2019-06-08 05:13:37', '0', 1),
       (43, '数据字典', '', 'dict', 'sys/dict', 6, 'tag', 0, '1', '2019-05-16 10:17:32', '2019-12-16 07:30:37', '0', 1),
       (44, '部门查看', 'sys:dept:view', '', '', 3, '', 0, '2', '2019-06-07 12:50:31', '2019-06-08 05:13:55', '0', 1),
       (45, '字典查看', 'sys:dipt:view', '', '', 43, '', 0, '2', '2019-06-07 12:55:42', '2019-06-08 05:14:56', '0', 1),
       (46, '菜单查看', 'sys:menu:view', '', '', 16, '', 0, '2', '2019-06-08 05:14:32', NULL, '0', 1),
       (47, '修改密码', 'sys:user:updatePass', '', '', 2, '', 0, '2', '2019-06-15 01:43:20', '2019-06-15 01:43:20', '0', 1),
       (48, '修改邮箱', 'sys:user:updateEmail', '', '', 2, '', 0, '2', '2019-06-15 01:43:58', '2019-06-15 01:43:58', '0',
        1),
       (51, '社交账号管理', '', 'social', 'admin/social', 1, 'peoples', 6, '1', '2019-07-19 05:22:44', '2019-07-19 05:24:45',
        '0', 1),
       (52, '解绑账号', 'sys:social:untied', '', '', 51, '', 0, '2', '2019-07-22 05:06:53', '2019-07-22 05:06:53', '0', 1),
       (53, '代码生成', '', '/codegen', 'sys/codegen', 6, 'clipboard', 0, '1', '2019-07-25 04:55:37', '2019-08-02 06:52:04',
        '0', 1),
       (54, '社交查看', 'sys:social:view', '', '', 51, '', 0, '2', '2019-08-03 08:16:46', '2019-08-03 08:16:46', '0', 1),
       (55, '代码生成', 'sys:codegen:codegen', '', '', 53, '', 0, '2', '2019-08-09 16:08:20', '2019-08-09 16:08:20', '0',
        1),
       (56, '租户管理', '', 'tenant', 'admin/tenant', 1, 'guide', 5, '1', '2019-08-10 02:52:26', '2019-08-10 02:54:11', '0',
        1),
       (57, '流程管理', '', 'activiti', '', 0, 'documentation', 2, '0', '2019-10-08 03:03:22', '2019-10-08 03:03:22', '0',
        1),
       (58, '模型管理', '', 'model', 'activiti/model', 57, 'chart', 0, '1', '2019-10-08 03:06:51', '2019-10-08 03:06:51',
        '0', 1),
       (59, '流程部署', '', 'processDeployment', 'activiti/processDeployment', 57, 'blog', 0, '1', '2019-10-08 05:48:20',
        '2019-10-08 05:49:02', '0', 1),
       (61, '我的流程', '', 'process', '', 0, 'excel', 0, '0', '2019-10-11 02:39:00', '2019-10-11 02:39:00', '0', 1),
       (62, '发起流程', '', 'processList', 'process/processList', 61, 'documentation', 0, '1', '2019-10-11 02:49:11',
        '2019-10-11 02:49:11', '0', 1),
       (63, '待签任务', '', 'pendingTask', 'process/pendingTask', 61, 'excel', 0, '1', '2019-10-11 02:54:12',
        '2019-10-11 02:54:12', '0', 1),
       (64, '待办任务', '', 'upcomingTask', 'process/upcomingTask', 61, 'eye-open', 0, '1', '2019-10-11 02:55:46',
        '2019-10-11 02:55:46', '0', 1),
       (65, '已发任务', '', 'deliveredTask', 'process/deliveredTask', 61, 'drag', 0, '1', '2019-10-11 02:57:15',
        '2019-10-11 02:57:15', '0', 1),
       (66, '已完任务', '', 'completedTask', 'process/completedTask', 61, 'clipboard', 0, '1', '2019-10-11 02:58:38',
        '2019-10-11 02:59:19', '0', 1),
       (67, '查看日志', 'sys:log:view', '', '', 7, '', 0, '2', '2019-12-10 08:49:05', '2019-12-10 08:49:05', '0', 1),
       (68, '添加字典', 'sys:dict:add', '', '', 43, '', 0, '2', '2019-12-15 13:16:09', '2019-12-15 13:16:09', '0', 1),
       (69, '添加字典详情', 'sys:dictItem:add', '', '', 43, '', 0, '2', '2019-12-15 14:08:01', '2019-12-15 14:08:01', '0', 1),
       (70, '更新字典详情', 'sys:dictItem:edit', '', '', 43, '', 0, '2', '2019-12-16 04:19:53', '2019-12-16 04:19:53', '0',
        1),
       (71, '更新字典', 'sys:dict:edit', '', '', 43, '', 0, '2', '2019-12-16 05:44:01', '2019-12-16 05:44:01', '0', 1),
       (72, '添加租户', 'sys:tenant:add', '', '', 56, '', 0, '2', '2019-12-17 13:29:52', '2019-12-17 13:29:52', '0', 1);
/*!40000 ALTER TABLE `sys_menu`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_permission`
--

DROP TABLE IF EXISTS `sys_permission`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_permission`
(
    `id`           varchar(32)  NOT NULL DEFAULT '',
    `url`          varchar(256) NOT NULL DEFAULT '' COMMENT 'url正则表达式',
    `is_deleted`   tinyint(1)   NOT NULL DEFAULT '0',
    `created_time` timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_time` timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_permission`
--

LOCK TABLES `sys_permission` WRITE;
/*!40000 ALTER TABLE `sys_permission`
    DISABLE KEYS */;
INSERT INTO `sys_permission`
VALUES ('1', '/*', 0, '2020-07-02 08:21:06', '2020-07-02 08:21:06'),
       ('2', '/sysUser/*', 0, '2020-07-02 08:22:17', '2020-07-02 08:22:17'),
       ('3', '/sysRole/*', 0, '2020-07-02 08:22:41', '2020-07-02 08:22:41'),
       ('4', '/sysUser/one', 0, '2020-07-02 09:07:41', '2020-07-02 09:07:41'),
       ('5', '/*/*', 0, '2020-07-08 08:58:36', '2020-07-08 08:58:36');
/*!40000 ALTER TABLE `sys_permission`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role`
(
    `id`          varchar(32) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '角色主键',
    `role_name`   varchar(64) COLLATE utf8mb4_bin NOT NULL COMMENT '角色名称',
    `role_code`   varchar(40) COLLATE utf8mb4_bin          DEFAULT NULL COMMENT '角色标识',
    `role_desc`   varchar(255) COLLATE utf8mb4_bin         DEFAULT NULL COMMENT '角色描述',
    `create_time` timestamp                       NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` timestamp                       NULL     DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `is_deleted`  tinyint(1)                      NOT NULL DEFAULT '0' COMMENT '删除标识（0-正常,1-删除）',
    `ds_type`     int(1)                                   DEFAULT NULL COMMENT '数据权限类型',
    `ds_scope`    varchar(255) COLLATE utf8mb4_bin         DEFAULT NULL COMMENT '数据权限范围 1 全部 2 本级 3 本级以及子级 4 自定义',
    `tenant_id`   int(11)                                  DEFAULT NULL COMMENT '租户id',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_bin
  ROW_FORMAT = DYNAMIC COMMENT ='系统角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role`
    DISABLE KEYS */;
INSERT INTO `sys_role`
VALUES ('5', '管理员', 'ADMIN_ROLE', '管理员', '2019-04-22 13:53:38', '2019-12-15 13:17:07', 0, 1, '4,5,6,7,12,14,16', 1),
       ('7', '开发人员', 'DEV_ROLE', '开发人员', '2019-04-24 13:11:28', '2019-10-08 03:04:52', 0, 1, '2', 1),
       ('8', '体验人员', 'LEARN_ROLE', '专门体验系统', '2019-08-03 07:52:36', '2019-12-14 09:57:38', 0, 4, '16,17,4,5,6,7,12,14',
        1);
/*!40000 ALTER TABLE `sys_role`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_dept`
--

DROP TABLE IF EXISTS `sys_role_dept`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role_dept`
(
    `id`      int(20) NOT NULL AUTO_INCREMENT COMMENT '部门主键ID',
    `role_id` int(20) DEFAULT NULL COMMENT '角色ID',
    `dept_id` int(20) DEFAULT NULL COMMENT '部门ID',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 306
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_bin
  ROW_FORMAT = DYNAMIC COMMENT ='角色与部门对应关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_dept`
--

LOCK TABLES `sys_role_dept` WRITE;
/*!40000 ALTER TABLE `sys_role_dept`
    DISABLE KEYS */;
INSERT INTO `sys_role_dept`
VALUES (47, 7, 6),
       (74, 0, 4),
       (75, 0, 5),
       (76, 0, 6),
       (77, 0, 7),
       (78, 0, 12),
       (99, 0, 4),
       (100, 0, 5),
       (101, 0, 6),
       (102, 0, 7),
       (103, 0, 12),
       (104, 0, 4),
       (105, 0, 5),
       (106, 0, 6),
       (107, 0, 7),
       (108, 0, 12),
       (109, 0, 4),
       (110, 0, 5),
       (111, 0, 6),
       (112, 0, 7),
       (113, 0, 12),
       (263, 8, 16),
       (264, 8, 17),
       (265, 8, 4),
       (266, 8, 5),
       (267, 8, 6),
       (268, 8, 7),
       (269, 8, 12),
       (270, 8, 14),
       (299, 5, 4),
       (300, 5, 5),
       (301, 5, 6),
       (302, 5, 7),
       (303, 5, 12),
       (304, 5, 14),
       (305, 5, 16);
/*!40000 ALTER TABLE `sys_role_dept`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_menu`
--

DROP TABLE IF EXISTS `sys_role_menu`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role_menu`
(
    `id`      int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `role_id` int(11) NOT NULL COMMENT '角色ID',
    `menu_id` int(11) NOT NULL COMMENT '菜单ID',
    PRIMARY KEY (`id`),
    KEY `index_role_id` (`role_id`) USING BTREE COMMENT '角色Id',
    KEY `index_menu_id` (`menu_id`) USING BTREE COMMENT '菜单Id'
) ENGINE = InnoDB
  AUTO_INCREMENT = 3232
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_bin
  ROW_FORMAT = DYNAMIC COMMENT ='角色菜单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_menu`
--

LOCK TABLES `sys_role_menu` WRITE;
/*!40000 ALTER TABLE `sys_role_menu`
    DISABLE KEYS */;
INSERT INTO `sys_role_menu`
VALUES (1456, 7, 1),
       (1457, 7, 2),
       (1458, 7, 33),
       (1459, 7, 13),
       (1460, 7, 38),
       (1461, 7, 3),
       (1462, 7, 44),
       (1463, 7, 16),
       (1464, 7, 17),
       (1465, 7, 41),
       (1466, 7, 6),
       (1467, 7, 7),
       (1468, 7, 18),
       (2954, 8, 1),
       (2955, 8, 2),
       (2956, 8, 33),
       (2957, 8, 13),
       (2958, 8, 38),
       (2959, 8, 3),
       (2960, 8, 44),
       (2961, 8, 16),
       (2962, 8, 46),
       (2963, 8, 6),
       (2964, 8, 43),
       (2965, 8, 45),
       (2966, 8, 7),
       (3141, 5, 1),
       (3142, 5, 2),
       (3143, 5, 5),
       (3144, 5, 14),
       (3145, 5, 33),
       (3146, 5, 35),
       (3147, 5, 47),
       (3148, 5, 48),
       (3149, 5, 13),
       (3150, 5, 15),
       (3151, 5, 34),
       (3152, 5, 37),
       (3153, 5, 38),
       (3154, 5, 3),
       (3155, 5, 11),
       (3156, 5, 30),
       (3157, 5, 31),
       (3158, 5, 44),
       (3159, 5, 16),
       (3160, 5, 28),
       (3161, 5, 29),
       (3162, 5, 36),
       (3163, 5, 46),
       (3164, 5, 56),
       (3165, 5, 72),
       (3166, 5, 52),
       (3167, 5, 54),
       (3168, 5, 62),
       (3169, 5, 63),
       (3170, 5, 64),
       (3171, 5, 65),
       (3172, 5, 66),
       (3173, 5, 6),
       (3174, 5, 43),
       (3175, 5, 45),
       (3176, 5, 68),
       (3177, 5, 69),
       (3178, 5, 70),
       (3179, 5, 71),
       (3180, 5, 53),
       (3181, 5, 55),
       (3182, 5, 7),
       (3183, 5, 27),
       (3184, 5, 67),
       (3185, 5, 58),
       (3186, 5, 59),
       (3187, 9, 1),
       (3188, 9, 2),
       (3189, 9, 3),
       (3190, 9, 5),
       (3191, 9, 6),
       (3192, 9, 7),
       (3193, 9, 11),
       (3194, 9, 13),
       (3195, 9, 14),
       (3196, 9, 15),
       (3197, 9, 16),
       (3198, 9, 27),
       (3199, 9, 28),
       (3200, 9, 29),
       (3201, 9, 30),
       (3202, 9, 31),
       (3203, 9, 33),
       (3204, 9, 34),
       (3205, 9, 35),
       (3206, 9, 36),
       (3207, 9, 37),
       (3208, 9, 38),
       (3209, 9, 43),
       (3210, 9, 44),
       (3211, 9, 45),
       (3212, 9, 46),
       (3213, 9, 47),
       (3214, 9, 48),
       (3215, 9, 51),
       (3216, 9, 52),
       (3217, 9, 54),
       (3218, 9, 57),
       (3219, 9, 58),
       (3220, 9, 59),
       (3221, 9, 61),
       (3222, 9, 62),
       (3223, 9, 63),
       (3224, 9, 64),
       (3225, 9, 65),
       (3226, 9, 66),
       (3227, 9, 67),
       (3228, 9, 68),
       (3229, 9, 69),
       (3230, 9, 70),
       (3231, 9, 71);
/*!40000 ALTER TABLE `sys_role_menu`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_permission`
--

DROP TABLE IF EXISTS `sys_role_permission`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role_permission`
(
    `id`            varchar(32) NOT NULL DEFAULT '',
    `role_id`       varchar(32) NOT NULL DEFAULT '',
    `permission_id` varchar(32) NOT NULL DEFAULT '',
    `is_deleted`    tinyint(4)  NOT NULL DEFAULT '0',
    `created_time`  timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_time`  timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_permission`
--

LOCK TABLES `sys_role_permission` WRITE;
/*!40000 ALTER TABLE `sys_role_permission`
    DISABLE KEYS */;
INSERT INTO `sys_role_permission`
VALUES ('1', '5', '1', 0, '2020-07-02 08:22:54', '2020-07-02 08:23:07'),
       ('2', '7', '2', 0, '2020-07-02 08:23:19', '2020-07-02 08:23:19'),
       ('3', '7', '3', 0, '2020-07-02 08:23:33', '2020-07-02 08:23:33'),
       ('4', '8', '2', 0, '2020-07-02 08:23:44', '2020-07-02 08:23:44'),
       ('5', '7', '4', 0, '2020-07-02 09:08:09', '2020-07-02 09:08:09'),
       ('6', '5', '5', 0, '2020-07-08 08:59:13', '2020-07-08 08:59:13');
/*!40000 ALTER TABLE `sys_role_permission`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_tenant`
--

DROP TABLE IF EXISTS `sys_tenant`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_tenant`
(
    `id`          int(11)   NOT NULL AUTO_INCREMENT COMMENT '租户id',
    `name`        varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '租户名称',
    `code`        varchar(64) CHARACTER SET utf8mb4  DEFAULT NULL COMMENT '租户编号',
    `start_time`  timestamp NULL                     DEFAULT NULL COMMENT '授权开始时间',
    `end_time`    timestamp NULL                     DEFAULT NULL COMMENT '授权结束时间',
    `status`      int(11)   NOT NULL                 DEFAULT '0' COMMENT '0正常 9-冻结',
    `del_flag`    char(1) CHARACTER SET utf8mb4      DEFAULT '0' COMMENT '删除标记',
    `create_time` timestamp NOT NULL                 DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` timestamp NOT NULL                 DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 3
  DEFAULT CHARSET = utf8
  ROW_FORMAT = DYNAMIC COMMENT ='租户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_tenant`
--

LOCK TABLES `sys_tenant` WRITE;
/*!40000 ALTER TABLE `sys_tenant`
    DISABLE KEYS */;
INSERT INTO `sys_tenant`
VALUES (1, '上海某某公司', '1', '2019-08-09 16:00:00', '2020-08-09 16:00:00', 0, '0', '2019-08-10 02:13:12',
        '2019-08-10 04:44:52'),
       (2, '北京分公司', '2', '2019-12-17 13:30:23', '2021-12-01 16:00:00', 0, '0', '2019-12-17 13:30:31',
        '2019-12-17 13:30:31');
/*!40000 ALTER TABLE `sys_tenant`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user`
(
    `id`           varchar(32) COLLATE utf8mb4_bin  NOT NULL DEFAULT '' COMMENT '主键ID',
    `username`     varchar(64) COLLATE utf8mb4_bin  NOT NULL COMMENT '用户名',
    `password`     varchar(255) COLLATE utf8mb4_bin NOT NULL COMMENT '密码',
    `dept_id`      int(10)                                   DEFAULT NULL COMMENT '部门ID',
    `job_id`       int(10)                                   DEFAULT NULL COMMENT '岗位ID',
    `email`        varchar(25) COLLATE utf8mb4_bin           DEFAULT NULL COMMENT '邮箱',
    `phone`        varchar(20) COLLATE utf8mb4_bin           DEFAULT NULL COMMENT '手机号',
    `avatar`       varchar(255) COLLATE utf8mb4_bin          DEFAULT NULL COMMENT '头像',
    `created_time` timestamp                        NULL     DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_time` timestamp                        NULL     DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
    `lock_flag`    char(1) COLLATE utf8mb4_bin               DEFAULT '0' COMMENT '0-正常，1-锁定',
    `is_deleted`   tinyint(1)                       NOT NULL DEFAULT '0' COMMENT '0-正常，1-删除',
    `tenant_id`    int(11)                                   DEFAULT NULL COMMENT '租户id',
    PRIMARY KEY (`id`),
    KEY `user_idx_dept_id` (`dept_id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_bin
  ROW_FORMAT = DYNAMIC COMMENT ='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user`
    DISABLE KEYS */;
INSERT INTO `sys_user`
VALUES ('1278603519116464129', 'admin', '123456', NULL, NULL, NULL, NULL, NULL, '2020-07-02 08:17:49',
        '2020-07-03 02:32:54', '0', 0, NULL),
       ('1278603559943819265', 'dev', '123456', NULL, NULL, NULL, NULL, NULL, '2020-07-02 08:17:59',
        '2020-07-03 02:32:50', '0', 0, NULL),
       ('1283207886211952642', 'zhangsan', '$2a$10$Ee9VD9TXxEP.yVNO9sgSHeMlMUJoI1wSyHCRmZ6ABLJ00/zBpAcOq', NULL, NULL,
        NULL, NULL, NULL, '2020-07-15 01:14:00', '2020-07-15 01:14:00', '0', 0, NULL),
       ('1283242098994495489', 'lisi', '$2a$10$3Wqr5qEZWRSvWiaK3/45zOMj95PFKLicY.Ug89cA8JuyoQjpDm.E6', NULL, NULL, NULL,
        NULL, NULL, '2020-07-15 03:29:57', '2020-07-15 03:29:57', '0', 0, NULL);
/*!40000 ALTER TABLE `sys_user`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_role`
--

DROP TABLE IF EXISTS `sys_user_role`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user_role`
(
    `id`           int(11)                           NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `user_id`      varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '用户ID',
    `role_id`      varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '角色ID',
    `is_deleted`   tinyint(1)                        NOT NULL DEFAULT '0',
    `created_time` timestamp                         NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_time` timestamp                         NULL     DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 4557788
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_bin
  ROW_FORMAT = DYNAMIC COMMENT ='用户角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role`
    DISABLE KEYS */;
INSERT INTO `sys_user_role`
VALUES (40, '1278602077840351234', '5', 0, '2020-07-02 01:35:07', '2020-07-02 08:17:05'),
       (43, '1278603519116464129', '5', 0, '2020-07-02 01:35:07', '2020-07-02 08:19:46'),
       (44, '1278603559943819265', '7', 0, '2020-07-02 01:35:07', '2020-07-02 08:20:10'),
       (50, '1283207886211952642', '5', 0, '2020-07-15 01:20:37', '2020-07-15 01:20:37'),
       (4557787, '1278603708640284674', '8', 0, '2020-07-02 08:20:23', '2020-07-02 08:20:34');
/*!40000 ALTER TABLE `sys_user_role`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_data_permission_test`
--

DROP TABLE IF EXISTS `t_data_permission_test`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_data_permission_test`
(
    `FIELD1`      varchar(20) NOT NULL,
    `FIELD2`      varchar(20) NOT NULL,
    `FIELD3`      varchar(20) NOT NULL,
    `FIELD4`      varchar(20) NOT NULL,
    `DEPT_ID`     int(11)     NOT NULL,
    `CREATE_TIME` datetime    NOT NULL,
    `ID`          int(11)     NOT NULL,
    PRIMARY KEY (`ID`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8 COMMENT ='用户权限测试';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_data_permission_test`
--

LOCK TABLES `t_data_permission_test` WRITE;
/*!40000 ALTER TABLE `t_data_permission_test`
    DISABLE KEYS */;
INSERT INTO `t_data_permission_test`
VALUES ('小米', '小米10Pro', '4999', '珍珠白', 1, '2020-04-14 15:00:38', 1),
       ('腾讯', '黑鲨游戏手机3', '3799', '铠甲灰', 2, '2020-04-14 15:01:36', 2),
       ('华为', '华为P30', '3299', '天空之境', 1, '2020-04-14 15:03:11', 3),
       ('华为', '华为P40Pro', '6488', '亮黑色', 3, '2020-04-14 15:04:31', 4),
       ('vivo', 'Vivo iQOO 3', '3998', '拉力橙', 4, '2020-04-14 15:05:55', 5),
       ('一加', '一加7T', '3199', '冰际蓝', 5, '2020-04-14 15:06:53', 6),
       ('三星', '三星Galaxy S10', '4098', '浩玉白', 6, '2020-04-14 15:08:25', 7),
       ('苹果', 'iPhone 11 pro max', '9198', '暗夜绿', 4, '2020-04-14 15:09:20', 8);
/*!40000 ALTER TABLE `t_data_permission_test`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_dept`
--

DROP TABLE IF EXISTS `t_dept`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_dept`
(
    `DEPT_ID`     bigint(20)   NOT NULL AUTO_INCREMENT COMMENT '部门ID',
    `PARENT_ID`   bigint(20)   NOT NULL COMMENT '上级部门ID',
    `DEPT_NAME`   varchar(100) NOT NULL COMMENT '部门名称',
    `ORDER_NUM`   double(20, 0) DEFAULT NULL COMMENT '排序',
    `CREATE_TIME` datetime      DEFAULT NULL COMMENT '创建时间',
    `MODIFY_TIME` datetime      DEFAULT NULL COMMENT '修改时间',
    PRIMARY KEY (`DEPT_ID`) USING BTREE,
    KEY `t_dept_parent_id` (`PARENT_ID`),
    KEY `t_dept_dept_name` (`DEPT_NAME`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 7
  DEFAULT CHARSET = utf8
  ROW_FORMAT = DYNAMIC COMMENT ='部门表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_dept`
--

LOCK TABLES `t_dept` WRITE;
/*!40000 ALTER TABLE `t_dept`
    DISABLE KEYS */;
INSERT INTO `t_dept`
VALUES (1, 0, '开发部', 1, '2018-01-04 15:42:26', '2019-01-05 21:08:27'),
       (2, 1, '开发一部', 1, '2018-01-04 15:42:34', '2019-01-18 00:59:37'),
       (3, 1, '开发二部', 2, '2018-01-04 15:42:29', '2019-01-05 14:09:39'),
       (4, 0, '市场部', 2, '2018-01-04 15:42:36', '2019-01-23 06:27:56'),
       (5, 0, '人事部', 3, '2018-01-04 15:42:32', '2019-01-23 06:27:59'),
       (6, 0, '测试部', 4, '2018-01-04 15:42:38', '2019-01-17 08:15:47');
/*!40000 ALTER TABLE `t_dept`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_eximport`
--

DROP TABLE IF EXISTS `t_eximport`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_eximport`
(
    `FIELD1`      varchar(20)  NOT NULL,
    `FIELD2`      int(11)      NOT NULL,
    `FIELD3`      varchar(100) NOT NULL,
    `CREATE_TIME` datetime     NOT NULL
) ENGINE = MyISAM
  DEFAULT CHARSET = utf8
  ROW_FORMAT = DYNAMIC COMMENT ='Excel导入导出测试';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_eximport`
--

LOCK TABLES `t_eximport` WRITE;
/*!40000 ALTER TABLE `t_eximport`
    DISABLE KEYS */;
INSERT INTO `t_eximport`
VALUES ('字段1', 1, 'mrbird0@gmail.com', '2019-07-25 19:08:01'),
       ('字段1', 2, 'mrbird1@gmail.com', '2019-07-25 19:08:01'),
       ('字段1', 3, 'mrbird2@gmail.com', '2019-07-25 19:08:01'),
       ('字段1', 4, 'mrbird3@gmail.com', '2019-07-25 19:08:01'),
       ('字段1', 5, 'mrbird4@gmail.com', '2019-07-25 19:08:01'),
       ('字段1', 6, 'mrbird5@gmail.com', '2019-07-25 19:08:01'),
       ('字段1', 7, 'mrbird6@gmail.com', '2019-07-25 19:08:01'),
       ('字段1', 8, 'mrbird7@gmail.com', '2019-07-25 19:08:01');
/*!40000 ALTER TABLE `t_eximport`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_generator_config`
--

DROP TABLE IF EXISTS `t_generator_config`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_generator_config`
(
    `id`                   int(11)     NOT NULL COMMENT '主键',
    `author`               varchar(20) NOT NULL COMMENT '作者',
    `base_package`         varchar(50) NOT NULL COMMENT '基础包名',
    `entity_package`       varchar(20) NOT NULL COMMENT 'entity文件存放路径',
    `mapper_package`       varchar(20) NOT NULL COMMENT 'mapper文件存放路径',
    `mapper_xml_package`   varchar(20) NOT NULL COMMENT 'mapper xml文件存放路径',
    `service_package`      varchar(20) NOT NULL COMMENT 'servcie文件存放路径',
    `service_impl_package` varchar(20) NOT NULL COMMENT 'serviceImpl文件存放路径',
    `controller_package`   varchar(20) NOT NULL COMMENT 'controller文件存放路径',
    `is_trim`              char(1)     NOT NULL COMMENT '是否去除前缀 1是 0否',
    `trim_value`           varchar(10) DEFAULT NULL COMMENT '前缀内容',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  ROW_FORMAT = DYNAMIC COMMENT ='代码生成配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_generator_config`
--

LOCK TABLES `t_generator_config` WRITE;
/*!40000 ALTER TABLE `t_generator_config`
    DISABLE KEYS */;
INSERT INTO `t_generator_config`
VALUES (1, 'MrBird', 'cc.mrbird.febs.server.generator.gen', 'entity', 'mapper', 'mapper', 'service', 'service.impl',
        'controller', '1', 't_');
/*!40000 ALTER TABLE `t_generator_config`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_job`
--

DROP TABLE IF EXISTS `t_job`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_job`
(
    `JOB_ID`          bigint(20)  NOT NULL AUTO_INCREMENT COMMENT '任务id',
    `BEAN_NAME`       varchar(50) NOT NULL COMMENT 'spring bean名称',
    `METHOD_NAME`     varchar(50) NOT NULL COMMENT '方法名',
    `PARAMS`          varchar(50) DEFAULT NULL COMMENT '参数',
    `CRON_EXPRESSION` varchar(20) NOT NULL COMMENT 'cron表达式',
    `STATUS`          char(2)     NOT NULL COMMENT '任务状态  0：正常  1：暂停',
    `REMARK`          varchar(50) DEFAULT NULL COMMENT '备注',
    `CREATE_TIME`     datetime    DEFAULT NULL COMMENT '创建时间',
    PRIMARY KEY (`JOB_ID`) USING BTREE,
    KEY `t_job_create_time` (`CREATE_TIME`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 5
  DEFAULT CHARSET = utf8
  ROW_FORMAT = DYNAMIC COMMENT ='定时任务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_job`
--

LOCK TABLES `t_job` WRITE;
/*!40000 ALTER TABLE `t_job`
    DISABLE KEYS */;
INSERT INTO `t_job`
VALUES (1, 'taskList', 'test', 'hello', '0/1 * * * * ?', '1', '有参任务调度测试', '2018-02-24 16:26:14'),
       (2, 'taskList', 'test1', NULL, '0/10 * * * * ?', '1', '无参任务调度测试', '2018-02-24 17:06:23'),
       (3, 'taskList', 'test2', '{\"name\":\"mrbird\",\"age\":18}', '0/1 * * * * ?', '1', 'JSON类型参数任务测试',
        '2018-02-26 09:28:26'),
       (4, 'taskList', 'test3', '', '0/5 * * * * ?', '1', '测试异常，没有编写test3任务', '2018-02-26 11:15:30');
/*!40000 ALTER TABLE `t_job`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_job_log`
--

DROP TABLE IF EXISTS `t_job_log`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_job_log`
(
    `LOG_ID`      bigint(20)   NOT NULL AUTO_INCREMENT COMMENT '任务日志id',
    `JOB_ID`      bigint(20)   NOT NULL COMMENT '任务id',
    `BEAN_NAME`   varchar(100) NOT NULL COMMENT 'spring bean名称',
    `METHOD_NAME` varchar(100) NOT NULL COMMENT '方法名',
    `PARAMS`      varchar(200)   DEFAULT NULL COMMENT '参数',
    `STATUS`      char(2)      NOT NULL COMMENT '任务状态    0：成功    1：失败',
    `ERROR`       text COMMENT '失败信息',
    `TIMES`       decimal(11, 0) DEFAULT NULL COMMENT '耗时(单位：毫秒)',
    `CREATE_TIME` datetime       DEFAULT NULL COMMENT '创建时间',
    PRIMARY KEY (`LOG_ID`) USING BTREE,
    KEY `t_job_log_create_time` (`CREATE_TIME`)
) ENGINE = MyISAM
  DEFAULT CHARSET = utf8
  ROW_FORMAT = DYNAMIC COMMENT ='调度日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_job_log`
--

LOCK TABLES `t_job_log` WRITE;
/*!40000 ALTER TABLE `t_job_log`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `t_job_log`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_log`
--

DROP TABLE IF EXISTS `t_log`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_log`
(
    `ID`          bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志ID',
    `USERNAME`    varchar(50)    DEFAULT NULL COMMENT '操作用户',
    `OPERATION`   text COMMENT '操作内容',
    `TIME`        decimal(11, 0) DEFAULT NULL COMMENT '耗时',
    `METHOD`      text COMMENT '操作方法',
    `PARAMS`      text COMMENT '方法参数',
    `IP`          varchar(64)    DEFAULT NULL COMMENT '操作者IP',
    `CREATE_TIME` datetime       DEFAULT NULL COMMENT '创建时间',
    `location`    varchar(50)    DEFAULT NULL COMMENT '操作地点',
    PRIMARY KEY (`ID`) USING BTREE,
    KEY `t_log_create_time` (`CREATE_TIME`)
) ENGINE = MyISAM
  DEFAULT CHARSET = utf8
  ROW_FORMAT = DYNAMIC COMMENT ='用户操作日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_log`
--

LOCK TABLES `t_log` WRITE;
/*!40000 ALTER TABLE `t_log`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `t_log`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_logger`
--

DROP TABLE IF EXISTS `t_logger`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_logger`
(
    `id`          bigint(20)    NOT NULL AUTO_INCREMENT,
    `group_id`    varchar(64)   NOT NULL,
    `unit_id`     varchar(32)   NOT NULL,
    `tag`         varchar(50)   NOT NULL,
    `content`     varchar(1024) NOT NULL,
    `create_time` varchar(30)   NOT NULL,
    `app_name`    varchar(128)  NOT NULL,
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8 COMMENT ='分布式事务日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_logger`
--

LOCK TABLES `t_logger` WRITE;
/*!40000 ALTER TABLE `t_logger`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `t_logger`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_login_log`
--

DROP TABLE IF EXISTS `t_login_log`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_login_log`
(
    `ID`         bigint(11)  NOT NULL AUTO_INCREMENT COMMENT 'id',
    `USERNAME`   varchar(50) NOT NULL COMMENT '用户名',
    `LOGIN_TIME` datetime    NOT NULL COMMENT '登录时间',
    `LOCATION`   varchar(50) DEFAULT NULL COMMENT '登录地点',
    `IP`         varchar(50) DEFAULT NULL COMMENT 'IP地址',
    `SYSTEM`     varchar(50) DEFAULT NULL COMMENT '操作系统',
    `BROWSER`    varchar(50) DEFAULT NULL COMMENT '浏览器',
    PRIMARY KEY (`ID`) USING BTREE,
    KEY `t_login_log_login_time` (`LOGIN_TIME`)
) ENGINE = MyISAM
  DEFAULT CHARSET = utf8
  ROW_FORMAT = DYNAMIC COMMENT ='登录日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_login_log`
--

LOCK TABLES `t_login_log` WRITE;
/*!40000 ALTER TABLE `t_login_log`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `t_login_log`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_menu`
--

DROP TABLE IF EXISTS `t_menu`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_menu`
(
    `MENU_ID`     bigint(20)  NOT NULL AUTO_INCREMENT COMMENT '菜单/按钮ID',
    `PARENT_ID`   bigint(20)  NOT NULL COMMENT '上级菜单ID',
    `MENU_NAME`   varchar(50) NOT NULL COMMENT '菜单/按钮名称',
    `PATH`        varchar(255)  DEFAULT NULL COMMENT '对应路由path',
    `COMPONENT`   varchar(255)  DEFAULT NULL COMMENT '对应路由组件component',
    `PERMS`       varchar(50)   DEFAULT NULL COMMENT '权限标识',
    `ICON`        varchar(50)   DEFAULT NULL COMMENT '图标',
    `TYPE`        char(2)     NOT NULL COMMENT '类型 0菜单 1按钮',
    `ORDER_NUM`   double(20, 0) DEFAULT NULL COMMENT '排序',
    `CREATE_TIME` datetime    NOT NULL COMMENT '创建时间',
    `MODIFY_TIME` datetime      DEFAULT NULL COMMENT '修改时间',
    PRIMARY KEY (`MENU_ID`) USING BTREE,
    KEY `t_menu_parent_id` (`PARENT_ID`),
    KEY `t_menu_menu_id` (`MENU_ID`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 195
  DEFAULT CHARSET = utf8
  ROW_FORMAT = DYNAMIC COMMENT ='菜单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_menu`
--

LOCK TABLES `t_menu` WRITE;
/*!40000 ALTER TABLE `t_menu`
    DISABLE KEYS */;
INSERT INTO `t_menu`
VALUES (1, 0, '系统管理', '/system', 'Layout', NULL, 'el-icon-set-up', '0', 1, '2017-12-27 16:39:07',
        '2019-07-20 16:19:04'),
       (2, 0, '系统监控', '/monitor', 'Layout', NULL, 'el-icon-data-line', '0', 2, '2017-12-27 16:45:51',
        '2019-01-23 06:27:12'),
       (3, 1, '用户管理', '/system/user', 'febs/system/user/Index', 'user:view', '', '0', 1, '2017-12-27 16:47:13',
        '2019-01-22 06:45:55'),
       (4, 1, '角色管理', '/system/role', 'febs/system/role/Index', 'role:view', '', '0', 2, '2017-12-27 16:48:09',
        '2018-04-25 09:01:12'),
       (5, 1, '菜单管理', '/system/menu', 'febs/system/menu/Index', 'menu:view', '', '0', 3, '2017-12-27 16:48:57',
        '2018-04-25 09:01:30'),
       (6, 1, '部门管理', '/system/dept', 'febs/system/dept/Index', 'dept:view', '', '0', 4, '2017-12-27 16:57:33',
        '2018-04-25 09:01:40'),
       (10, 2, '系统日志', '/monitor/systemlog', 'febs/monitor/systemlog/Index', 'log:view', '', '0', 2,
        '2017-12-27 17:00:50', '2020-04-13 11:38:04'),
       (11, 3, '新增用户', '', '', 'user:add', NULL, '1', NULL, '2017-12-27 17:02:58', NULL),
       (12, 3, '修改用户', '', '', 'user:update', NULL, '1', NULL, '2017-12-27 17:04:07', NULL),
       (13, 3, '删除用户', '', '', 'user:delete', NULL, '1', NULL, '2017-12-27 17:04:58', NULL),
       (14, 4, '新增角色', '', '', 'role:add', NULL, '1', NULL, '2017-12-27 17:06:38', NULL),
       (15, 4, '修改角色', '', '', 'role:update', NULL, '1', NULL, '2017-12-27 17:06:38', NULL),
       (16, 4, '删除角色', '', '', 'role:delete', NULL, '1', NULL, '2017-12-27 17:06:38', NULL),
       (17, 5, '新增菜单', '', '', 'menu:add', NULL, '1', NULL, '2017-12-27 17:08:02', NULL),
       (18, 5, '修改菜单', '', '', 'menu:update', NULL, '1', NULL, '2017-12-27 17:08:02', NULL),
       (19, 5, '删除菜单', '', '', 'menu:delete', NULL, '1', NULL, '2017-12-27 17:08:02', NULL),
       (20, 6, '新增部门', '', '', 'dept:add', NULL, '1', NULL, '2017-12-27 17:09:24', NULL),
       (21, 6, '修改部门', '', '', 'dept:update', NULL, '1', NULL, '2017-12-27 17:09:24', NULL),
       (22, 6, '删除部门', '', '', 'dept:delete', NULL, '1', NULL, '2017-12-27 17:09:24', NULL),
       (24, 10, '删除日志', '', '', 'log:delete', NULL, '1', NULL, '2017-12-27 17:11:45', NULL),
       (130, 3, '导出Excel', NULL, NULL, 'user:export', NULL, '1', NULL, '2019-01-23 06:35:16', NULL),
       (131, 4, '导出Excel', NULL, NULL, 'role:export', NULL, '1', NULL, '2019-01-23 06:35:36', NULL),
       (132, 5, '导出Excel', NULL, NULL, 'menu:export', NULL, '1', NULL, '2019-01-23 06:36:05', NULL),
       (133, 6, '导出Excel', NULL, NULL, 'dept:export', NULL, '1', NULL, '2019-01-23 06:36:25', NULL),
       (135, 3, '密码重置', NULL, NULL, 'user:reset', NULL, '1', NULL, '2019-01-23 06:37:00', NULL),
       (136, 10, '导出Excel', NULL, NULL, 'log:export', NULL, '1', NULL, '2019-01-23 06:37:27', NULL),
       (150, 2, '登录日志', '/monitor/loginlog', 'febs/monitor/loginlog/Index', 'monitor:loginlog', '', '0', 3,
        '2019-07-22 13:41:17', '2020-04-13 11:38:08'),
       (151, 150, '删除日志', NULL, NULL, 'loginlog:delete', NULL, '1', NULL, '2019-07-22 13:43:04', NULL),
       (152, 150, '导出Excel', NULL, NULL, 'loginlog:export', NULL, '1', NULL, '2019-07-22 13:43:30', NULL),
       (154, 0, '其他模块', '/others', 'Layout', '', 'el-icon-shopping-bag-1', '0', 6, '2019-07-25 10:16:16',
        '2020-04-14 18:38:20'),
       (155, 154, '导入导出', '/others/eximport', 'febs/others/eximport/Index', 'others:eximport', '', '0', 1,
        '2019-07-25 10:19:31', NULL),
       (156, 0, '代码生成', '/gen', 'Layout', '', 'el-icon-printer', '0', 4, '2019-07-25 10:24:03', '2020-01-16 13:59:49'),
       (157, 156, '基础配置', '/gen/config', 'febs/gen/config/Index', 'gen:config', '', '0', 1, '2019-07-25 10:24:55',
        '2020-04-09 14:21:54'),
       (158, 156, '生成代码', '/gen/generate', 'febs/gen/generate/Index', 'gen:generate', '', '0', 2, '2019-07-25 10:25:26',
        '2019-07-25 11:13:20'),
       (159, 157, '修改配置', NULL, NULL, 'gen:config:update', NULL, '1', NULL, '2019-07-26 16:22:56', NULL),
       (160, 158, '打包生成', NULL, NULL, 'gen:generate:gen', NULL, '1', NULL, '2019-07-26 16:23:38',
        '2019-07-26 16:23:53'),
       (163, 1, '客户端管理', '/client', 'febs/system/client/Index', 'client:view', '', '0', 5, '2019-09-26 22:58:09', NULL),
       (164, 163, '新增', NULL, NULL, 'client:add', NULL, '1', NULL, '2019-09-26 22:58:21', NULL),
       (165, 163, '修改', NULL, NULL, 'client:update', NULL, '1', NULL, '2019-09-26 22:58:43', NULL),
       (166, 163, '删除', NULL, NULL, 'client:delete', NULL, '1', NULL, '2019-09-26 22:58:55', NULL),
       (167, 163, '解密', NULL, NULL, 'client:decrypt', NULL, '1', NULL, '2019-09-26 22:59:08', NULL),
       (168, 0, '静态组件', '/components', 'Layout', '', 'el-icon-present', '0', 7, '2019-12-02 16:41:28',
        '2020-04-14 18:38:23'),
       (169, 168, '二级菜单', '/two', 'demos/two/Index', '', '', '0', 1, '2019-12-02 16:41:51', NULL),
       (170, 169, '三级菜单', '/three', 'demos/two/three/Index', '', '', '0', 1, '2019-12-02 16:42:09', NULL),
       (171, 168, 'MarkDown', '/components/markdown', 'demos/markdown', '', '', '0', 2, '2019-12-02 16:42:34', NULL),
       (172, 168, '富文本编辑器', '/components/tinymce', 'demos/tinymce', '', '', '0', 3, '2019-12-02 16:42:50', NULL),
       (173, 0, '网关管理', '/route', 'Layout', '', 'el-icon-odometer', '0', 3, '2020-01-16 14:00:15', NULL),
       (174, 173, '网关用户', '/route/user', 'febs/route/routeuser/Index', '', '', '0', 1, '2020-01-16 14:00:32', NULL),
       (175, 173, '网关日志', '/route/log', 'febs/route/routelog/Index', '', '', '0', 2, '2020-01-16 14:00:47', NULL),
       (176, 173, '限流规则', '/route/ratelimitrule', 'febs/route/ratelimitrule/Index', '', '', '0', 3,
        '2020-01-16 14:01:01', NULL),
       (177, 173, '限流日志', '/route/ratelimitlog', 'febs/route/ratelimitlog/Index', '', '', '0', 4, '2020-01-16 14:01:17',
        NULL),
       (178, 173, '黑名单管理', '/route/blacklist', 'febs/route/blacklist/Index', '', '', '0', 5, '2020-01-16 14:01:32',
        NULL),
       (179, 173, '黑名单日志', '/route/blocklog', 'febs/route/blocklog/Index', '', '', '0', 6, '2020-01-16 14:01:49', NULL),
       (180, 2, '监控面板', '/monitor/dashboard', 'febs/monitor/dashboard/Index', 'monitor:dashboard', '', '0', 1,
        '2020-04-13 09:44:09', '2020-04-13 11:38:00'),
       (181, 154, '个人博客', '/others/blog', 'febs/others/blog/Index', '', '', '0', 2, '2020-04-13 16:11:48',
        '2020-04-13 16:12:26'),
       (182, 154, '数据权限', '/others/datapermission', 'febs/others/datapermission/Index', 'others:datapermission', '',
        '0', 3, '2020-04-14 14:51:35', '2020-04-14 15:37:19'),
       (183, 0, '任务调度', '/job', 'Layout', '', 'el-icon-alarm-clock', '0', 5, '2020-04-14 18:39:35',
        '2020-04-14 18:39:53'),
       (184, 183, '任务列表', '/job/list', 'febs/job/job/Index', 'job:view', '', '0', 1, '2020-04-14 18:40:37',
        '2020-04-14 18:41:36'),
       (185, 183, '调度日志', '/job/log', 'febs/job/log/Index', 'job:log:view', '', '0', 2, '2020-04-14 18:42:25', NULL),
       (186, 184, '新增任务', NULL, NULL, 'job:add', NULL, '1', NULL, '2020-04-14 18:59:55', '2020-04-15 08:56:03'),
       (187, 184, '修改任务', NULL, NULL, 'job:update', NULL, '1', NULL, '2020-04-14 19:00:13', NULL),
       (188, 184, '删除任务', NULL, NULL, 'job:delete', NULL, '1', NULL, '2020-04-14 19:00:26', NULL),
       (189, 184, '暂停任务', NULL, NULL, 'job:pause', NULL, '1', NULL, '2020-04-14 19:00:42', NULL),
       (190, 184, '恢复任务', NULL, NULL, 'job:resume', NULL, '1', NULL, '2020-04-14 19:00:56', NULL),
       (191, 184, '立即执行一次', NULL, NULL, 'job:run', NULL, '1', NULL, '2020-04-14 19:01:42', NULL),
       (192, 184, '导出Excel', NULL, NULL, 'job:export', NULL, '1', NULL, '2020-04-14 19:01:59', NULL),
       (193, 185, '删除', NULL, NULL, 'job:log:delete', NULL, '1', NULL, '2020-04-15 14:01:33', NULL),
       (194, 185, '导出', NULL, NULL, 'job:log:export', NULL, '1', NULL, '2020-04-15 14:01:45', NULL);
/*!40000 ALTER TABLE `t_menu`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_role`
--

DROP TABLE IF EXISTS `t_role`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_role`
(
    `ROLE_ID`     bigint(20)  NOT NULL AUTO_INCREMENT COMMENT '角色ID',
    `ROLE_NAME`   varchar(10) NOT NULL COMMENT '角色名称',
    `REMARK`      varchar(100) DEFAULT NULL COMMENT '角色描述',
    `CREATE_TIME` datetime    NOT NULL COMMENT '创建时间',
    `MODIFY_TIME` datetime     DEFAULT NULL COMMENT '修改时间',
    PRIMARY KEY (`ROLE_ID`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 5
  DEFAULT CHARSET = utf8
  ROW_FORMAT = DYNAMIC COMMENT ='角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_role`
--

LOCK TABLES `t_role` WRITE;
/*!40000 ALTER TABLE `t_role`
    DISABLE KEYS */;
INSERT INTO `t_role`
VALUES (1, '管理员', '管理员', '2017-12-27 16:23:11', '2020-04-15 14:02:27'),
       (2, '注册用户', '可查看，新增，导出', '2019-01-04 14:11:28', '2020-04-15 16:00:16'),
       (3, '系统监控员', '负责系统监控模块', '2019-09-01 10:30:25', '2019-09-01 10:30:37'),
       (4, '测试角色', '测试角色', '2020-03-08 19:16:01', '2020-04-13 11:26:13');
/*!40000 ALTER TABLE `t_role`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_role_menu`
--

DROP TABLE IF EXISTS `t_role_menu`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_role_menu`
(
    `ROLE_ID` bigint(20) NOT NULL,
    `MENU_ID` bigint(20) NOT NULL,
    PRIMARY KEY (`ROLE_ID`, `MENU_ID`),
    KEY `t_role_menu_menu_id` (`MENU_ID`),
    KEY `t_role_menu_role_id` (`ROLE_ID`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  ROW_FORMAT = DYNAMIC COMMENT ='角色菜单关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_role_menu`
--

LOCK TABLES `t_role_menu` WRITE;
/*!40000 ALTER TABLE `t_role_menu`
    DISABLE KEYS */;
INSERT INTO `t_role_menu`
VALUES (1, 1),
       (2, 1),
       (4, 1),
       (1, 2),
       (2, 2),
       (3, 2),
       (1, 3),
       (2, 3),
       (4, 3),
       (1, 4),
       (2, 4),
       (1, 5),
       (2, 5),
       (1, 6),
       (2, 6),
       (1, 10),
       (2, 10),
       (3, 10),
       (1, 11),
       (4, 11),
       (1, 12),
       (4, 12),
       (1, 13),
       (4, 13),
       (1, 14),
       (2, 14),
       (1, 15),
       (1, 16),
       (1, 17),
       (2, 17),
       (1, 18),
       (1, 19),
       (1, 20),
       (2, 20),
       (1, 21),
       (1, 22),
       (1, 24),
       (3, 24),
       (1, 130),
       (2, 130),
       (4, 130),
       (1, 131),
       (2, 131),
       (1, 132),
       (2, 132),
       (1, 133),
       (2, 133),
       (1, 135),
       (4, 135),
       (1, 136),
       (2, 136),
       (3, 136),
       (3, 148),
       (3, 149),
       (1, 150),
       (2, 150),
       (3, 150),
       (1, 151),
       (3, 151),
       (1, 152),
       (2, 152),
       (3, 152),
       (3, 153),
       (1, 154),
       (2, 154),
       (1, 155),
       (2, 155),
       (1, 156),
       (2, 156),
       (1, 157),
       (2, 157),
       (1, 158),
       (2, 158),
       (1, 159),
       (1, 160),
       (2, 160),
       (1, 163),
       (2, 163),
       (1, 164),
       (2, 164),
       (1, 165),
       (1, 166),
       (1, 167),
       (2, 167),
       (1, 168),
       (2, 168),
       (1, 169),
       (2, 169),
       (1, 170),
       (2, 170),
       (1, 171),
       (2, 171),
       (1, 172),
       (2, 172),
       (1, 173),
       (2, 173),
       (1, 174),
       (2, 174),
       (1, 175),
       (2, 175),
       (1, 176),
       (2, 176),
       (1, 177),
       (2, 177),
       (1, 178),
       (2, 178),
       (1, 179),
       (2, 179),
       (1, 180),
       (2, 180),
       (1, 181),
       (2, 181),
       (1, 182),
       (2, 182),
       (1, 183),
       (2, 183),
       (1, 184),
       (2, 184),
       (1, 185),
       (2, 185),
       (1, 186),
       (1, 187),
       (1, 188),
       (1, 189),
       (1, 190),
       (1, 191),
       (1, 192),
       (2, 192),
       (1, 193),
       (1, 194),
       (2, 194);
/*!40000 ALTER TABLE `t_role_menu`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_trade_log`
--

DROP TABLE IF EXISTS `t_trade_log`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_trade_log`
(
    `id`          int(11)     NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `goods_id`    int(11)     NOT NULL COMMENT '商品ID',
    `goods_name`  varchar(50) NOT NULL COMMENT '商品名称',
    `status`      varchar(50) NOT NULL COMMENT '状态',
    `create_time` datetime    NOT NULL COMMENT '创建时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  ROW_FORMAT = DYNAMIC COMMENT ='分布式事务测试';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_trade_log`
--

LOCK TABLES `t_trade_log` WRITE;
/*!40000 ALTER TABLE `t_trade_log`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `t_trade_log`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_tx_exception`
--

DROP TABLE IF EXISTS `t_tx_exception`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_tx_exception`
(
    `id`                bigint(20) NOT NULL AUTO_INCREMENT,
    `group_id`          varchar(64)    DEFAULT NULL,
    `unit_id`           varchar(32)    DEFAULT NULL,
    `mod_id`            varchar(128)   DEFAULT NULL,
    `transaction_state` tinyint(4)     DEFAULT NULL,
    `registrar`         tinyint(4)     DEFAULT NULL,
    `ex_state`          tinyint(4)     DEFAULT NULL COMMENT '0 待处理 1已处理',
    `remark`            varchar(10240) DEFAULT NULL COMMENT '备注',
    `create_time`       datetime       DEFAULT NULL,
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_tx_exception`
--

LOCK TABLES `t_tx_exception` WRITE;
/*!40000 ALTER TABLE `t_tx_exception`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `t_tx_exception`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_user`
--

DROP TABLE IF EXISTS `t_user`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_user`
(
    `USER_ID`         bigint(20)   NOT NULL AUTO_INCREMENT COMMENT '用户ID',
    `USERNAME`        varchar(50)  NOT NULL COMMENT '用户名',
    `PASSWORD`        varchar(128) NOT NULL COMMENT '密码',
    `DEPT_ID`         bigint(20)   DEFAULT NULL COMMENT '部门ID',
    `EMAIL`           varchar(128) DEFAULT NULL COMMENT '邮箱',
    `MOBILE`          varchar(20)  DEFAULT NULL COMMENT '联系电话',
    `STATUS`          char(1)      NOT NULL COMMENT '状态 0锁定 1有效',
    `CREATE_TIME`     datetime     NOT NULL COMMENT '创建时间',
    `MODIFY_TIME`     datetime     DEFAULT NULL COMMENT '修改时间',
    `LAST_LOGIN_TIME` datetime     DEFAULT NULL COMMENT '最近访问时间',
    `SSEX`            char(1)      DEFAULT NULL COMMENT '性别 0男 1女 2保密',
    `IS_TAB`          char(1)      DEFAULT NULL COMMENT '是否开启tab，0关闭 1开启',
    `THEME`           varchar(10)  DEFAULT NULL COMMENT '主题',
    `AVATAR`          varchar(100) DEFAULT NULL COMMENT '头像',
    `DESCRIPTION`     varchar(100) DEFAULT NULL COMMENT '描述',
    PRIMARY KEY (`USER_ID`) USING BTREE,
    KEY `t_user_username` (`USERNAME`),
    KEY `t_user_mobile` (`MOBILE`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 18
  DEFAULT CHARSET = utf8
  ROW_FORMAT = DYNAMIC COMMENT ='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user`
--

LOCK TABLES `t_user` WRITE;
/*!40000 ALTER TABLE `t_user`
    DISABLE KEYS */;
INSERT INTO `t_user`
VALUES (1, 'MrBird', '$2a$10$gzhiUb1ldc1Rf3lka4k/WOoFKKGPepHSzJxzcPSN5/65SzkMdc.SK', 2, 'mrbird@qq.com', '17788888888',
        '1', '2019-06-14 20:39:22', '2020-04-15 16:00:32', '2020-04-15 16:03:13', '0', '1', 'white',
        'gaOngJwsRYRaVAuXXcmB.png', '我是帅比作者。'),
       (15, 'scott', '$2a$10$7tATi2STciLHnEgO/RfIxOYf2MQBu/SDVMRDs54rlSYVj2VmwwCHC', 5, 'scott@hotmail.com',
        '17720888888', '1', '2019-07-20 19:00:32', '2020-04-15 16:00:42', '2020-04-14 16:49:27', '2', NULL, NULL,
        'BiazfanxmamNRoxxVxka.png', NULL),
       (16, 'Jane', '$2a$10$ECkfipOPY7hORVdlSzIOX.8hnig0shAZQPG8pQ7D5iVP.uVogmmHy', 4, 'Jane@hotmail.com',
        '13489898989', '1', '2019-09-01 10:31:21', '2020-04-15 16:00:48', '2019-09-01 10:32:27', '1', NULL, NULL,
        '2dd7a2d09fa94bf8b5c52e5318868b4d9.jpg', NULL);
/*!40000 ALTER TABLE `t_user`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_user_connection`
--

DROP TABLE IF EXISTS `t_user_connection`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_user_connection`
(
    `USER_NAME`          varchar(50) NOT NULL COMMENT 'FEBS系统用户名',
    `PROVIDER_NAME`      varchar(20) NOT NULL COMMENT '第三方平台名称',
    `PROVIDER_USER_ID`   varchar(50) NOT NULL COMMENT '第三方平台账户ID',
    `PROVIDER_USER_NAME` varchar(50)  DEFAULT NULL COMMENT '第三方平台用户名',
    `NICK_NAME`          varchar(50)  DEFAULT NULL COMMENT '第三方平台昵称',
    `IMAGE_URL`          varchar(512) DEFAULT NULL COMMENT '第三方平台头像',
    `LOCATION`           varchar(255) DEFAULT NULL COMMENT '地址',
    `REMARK`             varchar(255) DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`USER_NAME`, `PROVIDER_NAME`, `PROVIDER_USER_ID`) USING BTREE,
    UNIQUE KEY `UserConnectionRank` (`USER_NAME`, `PROVIDER_NAME`, `PROVIDER_USER_ID`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  ROW_FORMAT = DYNAMIC COMMENT ='系统用户社交账户关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user_connection`
--

LOCK TABLES `t_user_connection` WRITE;
/*!40000 ALTER TABLE `t_user_connection`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `t_user_connection`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_user_data_permission`
--

DROP TABLE IF EXISTS `t_user_data_permission`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_user_data_permission`
(
    `USER_ID` bigint(20) NOT NULL,
    `DEPT_ID` bigint(20) NOT NULL,
    PRIMARY KEY (`USER_ID`, `DEPT_ID`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8 COMMENT ='用户数据权限关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user_data_permission`
--

LOCK TABLES `t_user_data_permission` WRITE;
/*!40000 ALTER TABLE `t_user_data_permission`
    DISABLE KEYS */;
INSERT INTO `t_user_data_permission`
VALUES (1, 1),
       (1, 2),
       (1, 3),
       (1, 4),
       (1, 5),
       (1, 6),
       (15, 1),
       (15, 2),
       (16, 4),
       (16, 5);
/*!40000 ALTER TABLE `t_user_data_permission`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_user_role`
--

DROP TABLE IF EXISTS `t_user_role`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_user_role`
(
    `USER_ID` bigint(20) NOT NULL COMMENT '用户ID',
    `ROLE_ID` bigint(20) NOT NULL COMMENT '角色ID',
    PRIMARY KEY (`USER_ID`, `ROLE_ID`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  ROW_FORMAT = DYNAMIC COMMENT ='用户角色关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user_role`
--

LOCK TABLES `t_user_role` WRITE;
/*!40000 ALTER TABLE `t_user_role`
    DISABLE KEYS */;
INSERT INTO `t_user_role`
VALUES (1, 1),
       (15, 2),
       (16, 3);
/*!40000 ALTER TABLE `t_user_role`
    ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE = @OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE = @OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS = @OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT = @OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS = @OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION = @OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES = @OLD_SQL_NOTES */;

-- Dump completed on 2020-08-14 17:48:50
