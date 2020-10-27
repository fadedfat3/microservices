# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 134.175.47.234 (MySQL 5.7.31)
# Database: rbac-security
# Generation Time: 2020-10-27 13:13:26 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table generator_config
# ------------------------------------------------------------

DROP TABLE IF EXISTS `generator_config`;

CREATE TABLE `generator_config` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `projectPath` varchar(256) DEFAULT NULL COMMENT '项目绝对路径',
  `moduleName` varchar(128) DEFAULT NULL COMMENT '模块名',
  `author` varchar(64) DEFAULT NULL COMMENT '作者名',
  `url` varchar(1024) DEFAULT NULL COMMENT '数据库URL',
  `username` varchar(64) DEFAULT NULL COMMENT '数据库用户名',
  `password` varchar(256) DEFAULT NULL COMMENT '数据库密码',
  `packageName` varchar(64) DEFAULT NULL COMMENT '包名',
  `deleted` int(11) NOT NULL DEFAULT '0' COMMENT '删除标识，0-存在，1-删除',
  `createdTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updatedTime` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `generator_config` WRITE;
/*!40000 ALTER TABLE `generator_config` DISABLE KEYS */;

INSERT INTO `generator_config` (`id`, `projectPath`, `moduleName`, `author`, `url`, `username`, `password`, `packageName`, `deleted`, `createdTime`, `updatedTime`)
VALUES
	(1,'/Users/fadedfat3/Codes/microservices/admin','','ymm','jdbc:mysql://134.175.47.234:3306/rbac-security?characterEncoding=UTF-8&useUnicode=true&useSSL=false&serverTimezone=GMT%2B8','root','Wangu123!@#','com.example.microservices.admin',0,'2020-10-23 16:27:51','2020-10-25 17:31:59'),
	(2,NULL,NULL,'jobss',NULL,NULL,NULL,NULL,1,'2020-10-23 16:40:59','2020-10-23 16:41:52'),
	(3,NULL,NULL,NULL,'test',NULL,NULL,NULL,1,'2020-10-23 16:43:36','2020-10-23 16:44:46');

/*!40000 ALTER TABLE `generator_config` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oauth_client_details
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oauth_client_details`;

CREATE TABLE `oauth_client_details` (
  `client_id` varchar(255) NOT NULL,
  `resource_ids` varchar(255) DEFAULT NULL,
  `client_secret` varchar(255) NOT NULL,
  `scope` varchar(255) NOT NULL,
  `authorized_grant_types` varchar(255) NOT NULL,
  `web_server_redirect_uri` varchar(255) DEFAULT NULL,
  `authorities` varchar(255) DEFAULT NULL,
  `access_token_validity` int(11) NOT NULL,
  `refresh_token_validity` int(11) DEFAULT NULL,
  `additional_information` varchar(4096) DEFAULT NULL,
  `autoapprove` tinyint(4) DEFAULT NULL,
  `origin_secret` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`client_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='客户端配置表';

LOCK TABLES `oauth_client_details` WRITE;
/*!40000 ALTER TABLE `oauth_client_details` DISABLE KEYS */;

INSERT INTO `oauth_client_details` (`client_id`, `resource_ids`, `client_secret`, `scope`, `authorized_grant_types`, `web_server_redirect_uri`, `authorities`, `access_token_validity`, `refresh_token_validity`, `additional_information`, `autoapprove`, `origin_secret`)
VALUES
	('app','','$2a$10$8Qk/efslEpO1Af1kyw/rp.DdJGsdnET8UCp1vGDzpQEa.1qBklvua','all','refresh_token,password','',NULL,86400,864000,NULL,NULL,'123456'),
	('febs',' ','$2a$10$aSZTvMOtUAYUQ.75z2n3ceJd6dCIk9Vy3J/SKZUE4hBLd6sz7.6ge','all','password,refresh_token',NULL,NULL,86400,8640000,NULL,0,'123456'),
	('password','rid','$2a$10$MTNPRR0CkuZyhk50rDNi1eJtmzUDq3Ye/J5kRlpIRQDjBXP90zwnu','all','password,refresh_token',NULL,NULL,86400,864000,NULL,NULL,'wangu123!@#');

/*!40000 ALTER TABLE `oauth_client_details` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_dept
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_dept`;

CREATE TABLE `sys_dept` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '部门主键ID',
  `name` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '部门名称',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `created_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '是否删除  -1：已删除  0：正常',
  `parent_id` int(11) DEFAULT NULL COMMENT '上级部门',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='部门管理';

LOCK TABLES `sys_dept` WRITE;
/*!40000 ALTER TABLE `sys_dept` DISABLE KEYS */;

INSERT INTO `sys_dept` (`id`, `name`, `sort`, `created_time`, `updated_time`, `deleted`, `parent_id`, `tenant_id`)
VALUES
	(4,'某某集团',0,'2019-04-21 22:53:33','2019-10-08 10:57:59',0,0,1),
	(5,'上海分公司',0,'2019-04-21 22:53:57','2019-12-14 15:26:45',0,4,1),
	(6,'开发部',2,'2019-04-21 22:54:10','2020-09-23 22:57:42',0,5,1),
	(7,'财务部',1,'2019-04-21 22:54:46','2020-09-23 23:29:29',0,16,1),
	(12,'市场部',4,'2019-04-30 14:31:46','2019-12-14 15:15:42',0,5,1),
	(14,'人事部',0,'2019-12-14 15:25:17','2019-12-14 15:25:17',0,5,1),
	(16,'北京分公司',1,'2019-12-14 15:26:35','2020-09-23 22:54:10',0,4,1),
	(17,'人事部',0,'2019-12-14 15:33:38','2020-08-20 15:45:21',0,16,1);

/*!40000 ALTER TABLE `sys_dept` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_dict
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_dict`;

CREATE TABLE `sys_dict` (
  `id` int(64) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `dict_name` varchar(100) NOT NULL COMMENT '名称',
  `dict_code` varchar(50) DEFAULT NULL COMMENT '字典编码',
  `description` varchar(100) DEFAULT NULL COMMENT '描述',
  `sort` int(4) DEFAULT NULL COMMENT '排序（升序）',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `remark` varchar(50) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标记',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户Id',
  PRIMARY KEY (`id`),
  KEY `sys_dict_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='字典表';

LOCK TABLES `sys_dict` WRITE;
/*!40000 ALTER TABLE `sys_dict` DISABLE KEYS */;

INSERT INTO `sys_dict` (`id`, `dict_name`, `dict_code`, `description`, `sort`, `create_time`, `update_time`, `remark`, `del_flag`, `tenant_id`)
VALUES
	(1,'用户状态','lock_flag','用户是否正常还是锁定',NULL,'2019-12-16 13:35:43','2019-12-17 21:24:29',NULL,'0',1),
	(2,'菜单类型','menu_type','菜单类型 （类型   0：目录   1：菜单   2：按钮）',NULL,'2019-12-16 13:42:46','2019-12-17 21:24:29',NULL,'0',1);

/*!40000 ALTER TABLE `sys_dict` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_dict_item
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_dict_item`;

CREATE TABLE `sys_dict_item` (
  `id` varchar(50) CHARACTER SET utf8 NOT NULL,
  `dict_id` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '字典id',
  `item_text` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '字典项文本',
  `item_value` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '字典项值',
  `description` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '描述',
  `status` int(11) DEFAULT NULL COMMENT '状态（1启用 0不启用）',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_table_dict_id` (`dict_id`) USING BTREE,
  KEY `index_table_dict_status` (`status`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='字典详情表';

LOCK TABLES `sys_dict_item` WRITE;
/*!40000 ALTER TABLE `sys_dict_item` DISABLE KEYS */;

INSERT INTO `sys_dict_item` (`id`, `dict_id`, `item_text`, `item_value`, `description`, `status`, `create_time`, `update_time`)
VALUES
	('0c8f86876bfc7c59a5236010fdcaa07e','2','目录','1','',NULL,'2019-12-16 13:57:39','2019-12-16 13:57:39'),
	('3fe7ad23294384de45197f3379b8d658','1','锁定','1','0-正常，1-锁定',NULL,'2019-12-16 13:39:56','2019-12-16 13:39:56'),
	('5ace75b3caf31b86efa50430954d624f','2','按钮','3','',NULL,'2019-12-16 13:57:55','2019-12-16 13:57:55'),
	('6ea98d652a06220c99b9468ead68e6f9','2','菜单','1','',NULL,'2019-12-16 13:57:48','2019-12-16 13:57:48'),
	('f27a639dee243eef860f453c2ab8547e','1','正常','0','0-正常，1-锁定',NULL,'2019-12-16 13:39:45','2019-12-16 13:39:45');

/*!40000 ALTER TABLE `sys_dict_item` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_log`;

CREATE TABLE `sys_log` (
  `id` int(18) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ip` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作IP',
  `type` int(3) DEFAULT NULL COMMENT '操作类型 1 操作记录2异常记录',
  `user_name` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作人',
  `description` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作描述',
  `action_method` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '请求方法',
  `action_url` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `params` varchar(1000) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '请求参数',
  `browser` varchar(500) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '浏览器',
  `class_path` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '类路径',
  `request_method` varchar(10) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '请求方法',
  `start_time` timestamp NULL DEFAULT NULL COMMENT '开始时间',
  `finish_time` timestamp NULL DEFAULT NULL COMMENT '完成时间',
  `consuming_time` bigint(11) DEFAULT NULL COMMENT '消耗时间',
  `ex_desc` varchar(1000) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '异常详情信息',
  `ex_detail` text COLLATE utf8mb4_bin COMMENT '异常描述',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户id',
  `location` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作地点',
  `os` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作系统',
  PRIMARY KEY (`id`),
  KEY `index_type` (`type`) USING BTREE COMMENT '日志类型'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='系统日志';



# Dump of table sys_permission
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_permission`;

CREATE TABLE `sys_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(256) NOT NULL DEFAULT '' COMMENT 'url正则表达式',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `sys_permission` WRITE;
/*!40000 ALTER TABLE `sys_permission` DISABLE KEYS */;

INSERT INTO `sys_permission` (`id`, `url`, `deleted`, `created_time`, `updated_time`)
VALUES
	(1,'/**',0,'2020-07-02 16:21:06','2020-08-15 18:44:12'),
	(2,'/sysUser/*',0,'2020-07-02 16:22:17','2020-07-02 16:22:17'),
	(3,'/sysRole/*',0,'2020-07-02 16:22:41','2020-07-02 16:22:41'),
	(4,'/sysUser/one',1,'2020-07-02 17:07:41','2020-09-23 17:27:48'),
	(5,'/*/*',1,'2020-07-08 16:58:36','2020-09-23 17:22:35'),
	(6,'/*/*',0,'2020-09-23 17:26:25','2020-09-23 17:26:25'),
	(7,'/sysPermission/*',0,'2020-09-23 17:36:18','2020-09-23 17:36:18');

/*!40000 ALTER TABLE `sys_permission` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色主键',
  `role_name` varchar(64) COLLATE utf8mb4_bin NOT NULL COMMENT '角色名称',
  `role_code` varchar(40) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '角色标识',
  `role_desc` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '角色描述',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标识（0-正常,1-删除）',
  `ds_type` int(1) DEFAULT NULL COMMENT '数据权限类型',
  `ds_scope` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '数据权限范围 1 全部 2 本级 3 本级以及子级 4 自定义',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='系统角色表';

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;

INSERT INTO `sys_role` (`id`, `role_name`, `role_code`, `role_desc`, `created_time`, `updated_time`, `deleted`, `ds_type`, `ds_scope`, `tenant_id`)
VALUES
	(5,X'E7AEA1E79086E59198',X'41444D494E5F524F4C45',X'E7AEA1E79086E59198EFBC8CE69C80E9AB98E69D83E99990','2019-04-22 21:53:38','2020-09-22 17:44:08',0,1,X'342C352C362C372C31322C31342C3136',1),
	(7,X'E5BC80E58F91E4BABAE59198',X'4445565F524F4C45',X'E5BC80E58F91E4BABAE59198','2019-04-24 21:11:28','2019-10-08 11:04:52',0,1,X'32',1),
	(8,X'E4BD93E9AA8CE4BABAE59198',X'47554553545F524F4C45',X'E4B893E997A8E4BD93E9AA8CE7B3BBE7BB9FEFBC8CE69D83E99990E69C80E4BD8E','2019-08-03 15:52:36','2020-09-22 17:56:45',0,4,X'31362C31372C342C352C362C372C31322C3134',1),
	(9,X'E6938DE4BD9CE4BABAE59198',X'4F5045524154455F524F4C45',X'E6938DE4BD9CE4BABAE59198EFBC8CE699AEE9809AE794A8E688B7','2020-09-22 17:49:51','2020-09-22 17:56:31',1,NULL,NULL,NULL);

/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_role_dept
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_role_dept`;

CREATE TABLE `sys_role_dept` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '部门主键ID',
  `role_id` int(20) DEFAULT NULL COMMENT '角色ID',
  `dept_id` int(20) DEFAULT NULL COMMENT '部门ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='角色与部门对应关系';

LOCK TABLES `sys_role_dept` WRITE;
/*!40000 ALTER TABLE `sys_role_dept` DISABLE KEYS */;

INSERT INTO `sys_role_dept` (`id`, `role_id`, `dept_id`)
VALUES
	(47,7,6),
	(74,0,4),
	(75,0,5),
	(76,0,6),
	(77,0,7),
	(78,0,12),
	(99,0,4),
	(100,0,5),
	(101,0,6),
	(102,0,7),
	(103,0,12),
	(104,0,4),
	(105,0,5),
	(106,0,6),
	(107,0,7),
	(108,0,12),
	(109,0,4),
	(110,0,5),
	(111,0,6),
	(112,0,7),
	(113,0,12),
	(263,8,16),
	(264,8,17),
	(265,8,4),
	(266,8,5),
	(267,8,6),
	(268,8,7),
	(269,8,12),
	(270,8,14),
	(299,5,4),
	(300,5,5),
	(301,5,6),
	(302,5,7),
	(303,5,12),
	(304,5,14),
	(305,5,16);

/*!40000 ALTER TABLE `sys_role_dept` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_role_menu
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_role_menu`;

CREATE TABLE `sys_role_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `menu_id` int(11) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`),
  KEY `index_role_id` (`role_id`) USING BTREE COMMENT '角色Id',
  KEY `index_menu_id` (`menu_id`) USING BTREE COMMENT '菜单Id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='角色菜单表';

LOCK TABLES `sys_role_menu` WRITE;
/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;

INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`)
VALUES
	(1458,7,33),
	(1460,7,38),
	(1462,7,44),
	(1464,7,17),
	(1465,7,41),
	(1467,7,7),
	(1468,7,18),
	(2956,8,33),
	(2958,8,38),
	(2960,8,44),
	(2962,8,46),
	(2964,8,43),
	(2965,8,45),
	(2966,8,7),
	(3143,5,5),
	(3144,5,14),
	(3145,5,33),
	(3146,5,35),
	(3147,5,47),
	(3148,5,48),
	(3150,5,15),
	(3151,5,34),
	(3152,5,37),
	(3153,5,38),
	(3155,5,11),
	(3156,5,30),
	(3157,5,31),
	(3158,5,44),
	(3160,5,28),
	(3161,5,29),
	(3162,5,36),
	(3163,5,46),
	(3164,5,56),
	(3165,5,72),
	(3166,5,52),
	(3167,5,54),
	(3168,5,62),
	(3169,5,63),
	(3170,5,64),
	(3171,5,65),
	(3172,5,66),
	(3174,5,43),
	(3175,5,45),
	(3176,5,68),
	(3177,5,69),
	(3178,5,70),
	(3179,5,71),
	(3180,5,53),
	(3181,5,55),
	(3182,5,7),
	(3183,5,27),
	(3184,5,67),
	(3185,5,58),
	(3186,5,59),
	(3190,9,5),
	(3192,9,7),
	(3193,9,11),
	(3195,9,14),
	(3196,9,15),
	(3198,9,27),
	(3199,9,28),
	(3200,9,29),
	(3201,9,30),
	(3202,9,31),
	(3203,9,33),
	(3204,9,34),
	(3205,9,35),
	(3206,9,36),
	(3207,9,37),
	(3208,9,38),
	(3209,9,43),
	(3210,9,44),
	(3211,9,45),
	(3212,9,46),
	(3213,9,47),
	(3214,9,48),
	(3215,9,51),
	(3216,9,52),
	(3217,9,54),
	(3218,9,57),
	(3219,9,58),
	(3220,9,59),
	(3221,9,61),
	(3222,9,62),
	(3223,9,63),
	(3224,9,64),
	(3225,9,65),
	(3226,9,66),
	(3227,9,67),
	(3228,9,68),
	(3229,9,69),
	(3230,9,70),
	(3231,9,71),
	(3239,5,3),
	(3240,7,3),
	(3243,5,13),
	(3244,7,13),
	(3289,5,73),
	(3290,7,73),
	(3297,5,76),
	(3298,7,76),
	(3303,5,77),
	(3304,7,77),
	(3313,5,78),
	(3314,7,78),
	(3315,5,6),
	(3316,7,6),
	(3319,5,79),
	(3320,7,79),
	(3321,5,80),
	(3322,7,80),
	(3323,5,81),
	(3324,7,81),
	(3325,5,82),
	(3326,7,82),
	(3332,5,85),
	(3333,7,85),
	(3334,8,85),
	(3335,5,83),
	(3336,7,83),
	(3337,5,86),
	(3338,7,86),
	(3339,8,86),
	(3345,5,16),
	(3346,7,16),
	(3347,5,1),
	(3348,7,1),
	(3349,8,1),
	(3353,5,2),
	(3354,7,2),
	(3355,5,74),
	(3356,7,74),
	(3357,8,74),
	(3359,7,87);

/*!40000 ALTER TABLE `sys_role_menu` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_role_permission
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_role_permission`;

CREATE TABLE `sys_role_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `sys_role_permission` WRITE;
/*!40000 ALTER TABLE `sys_role_permission` DISABLE KEYS */;

INSERT INTO `sys_role_permission` (`id`, `role_id`, `permission_id`, `deleted`, `created_time`, `updated_time`)
VALUES
	(1,5,1,0,'2020-07-02 16:22:54','2020-07-02 16:23:07'),
	(2,7,2,1,'2020-07-02 16:23:19','2020-09-23 17:23:03'),
	(3,7,3,1,'2020-07-02 16:23:33','2020-09-23 17:27:30'),
	(4,8,2,1,'2020-07-02 16:23:44','2020-09-23 17:23:03'),
	(5,7,4,0,'2020-07-02 17:08:09','2020-07-02 17:08:09'),
	(6,5,5,1,'2020-07-08 16:59:13','2020-09-23 17:18:53'),
	(7,5,5,1,'2020-09-23 16:39:33','2020-09-23 17:18:55'),
	(8,7,5,1,'2020-09-23 16:39:33','2020-09-23 17:18:57'),
	(9,7,5,0,'2020-09-23 17:16:55','2020-09-23 17:16:55'),
	(10,5,5,0,'2020-09-23 17:16:55','2020-09-23 17:16:55'),
	(11,7,2,1,'2020-09-23 17:23:04','2020-09-23 17:27:01'),
	(12,8,2,1,'2020-09-23 17:23:04','2020-09-23 17:27:01'),
	(13,5,2,1,'2020-09-23 17:23:04','2020-09-23 17:27:01'),
	(14,7,6,0,'2020-09-23 17:26:26','2020-09-23 17:26:26'),
	(15,8,2,0,'2020-09-23 17:27:01','2020-09-23 17:27:01'),
	(16,8,3,0,'2020-09-23 17:27:30','2020-09-23 17:27:30'),
	(17,8,7,0,'2020-09-23 17:36:36','2020-09-23 17:36:36');

/*!40000 ALTER TABLE `sys_role_permission` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_route
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_route`;

CREATE TABLE `sys_route` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '路由ID',
  `name` varchar(32) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '路由名称',
  `perms` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '菜单权限标识',
  `path` varchar(128) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '前端跳转URL',
  `component` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '路由组件',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '父路由ID',
  `icon` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '图标',
  `sort` int(11) DEFAULT '1' COMMENT '排序',
  `type` tinyint(1) DEFAULT '1' COMMENT '路由类型 （类型   0：目录   1：菜单   2：按钮）',
  `created_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '逻辑删除标记(0--正常 1--删除)',
  `is_frame` tinyint(1) DEFAULT NULL COMMENT '是否为外链',
  `hidden` tinyint(1) DEFAULT '0' COMMENT '是否隐藏',
  `title` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '菜单标题',
  `target` varchar(255) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '外链打开方式',
  `hide_children` tinyint(1) DEFAULT NULL,
  `hide_header_content` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='菜单权限表';

LOCK TABLES `sys_route` WRITE;
/*!40000 ALTER TABLE `sys_route` DISABLE KEYS */;

INSERT INTO `sys_route` (`id`, `name`, `perms`, `path`, `component`, `parent_id`, `icon`, `sort`, `type`, `created_time`, `updated_time`, `deleted`, `is_frame`, `hidden`, `title`, `target`, `hide_children`, `hide_header_content`)
VALUES
	(1,X'73797374656D',X'',X'2F73797374656D',X'5061676556696577',0,X'73657474696E67',1,1,'2019-04-21 22:45:08','2020-09-16 16:24:25',0,1,0,X'E7B3BBE7BB9FE7AEA1E79086',X'',NULL,NULL),
	(2,X'75736572',X'',X'2F73797374656D2F75736572',X'73797374656D2F757365722F696E646578',1,X'',0,1,'2019-04-21 22:49:22','2020-10-23 16:49:51',0,1,0,X'E794A8E688B7E7AEA1E79086',X'',NULL,NULL),
	(3,X'64657074',X'',X'2F73797374656D2F64657074',X'73797374656D2F646570742F696E646578',1,X'7465616D',10,1,'2019-04-21 22:52:11','2020-09-10 16:14:43',0,1,0,X'E983A8E997A8E7AEA1E79086',X'',NULL,NULL),
	(6,X'6F7065726174696F6E',X'',X'2F6F7065726174696F6E',X'5061676556696577',0,X'746F6F6C',2,1,'2019-04-22 23:48:02','2020-09-20 18:46:21',0,1,0,X'E6938DE4BD9CE7AEA1E79086',X'',NULL,NULL),
	(13,X'726F6C65',X'',X'2F73797374656D2F726F6C65',X'73797374656D2F726F6C652F696E646578',1,X'66697265',3,1,'2019-04-29 21:08:28','2020-09-10 16:15:59',0,1,0,X'E8A792E889B2E7AEA1E79086',X'',NULL,NULL),
	(16,X'6D656E75',X'',X'2F73797374656D2F6D656E75',X'73797374656D2F6D656E752F696E646578',1,X'6D656E75',2,1,'2019-05-03 15:26:58','2020-09-16 16:05:46',0,1,0,X'E88F9CE58D95E7AEA1E79086',X'',NULL,NULL),
	(73,X'7065726D697373696F6E',X'',X'2F73797374656D2F7065726D697373696F6E',X'73797374656D2F7065726D697373696F6E2F696E646578',1,X'736166657479',15,1,'2020-09-06 02:18:45','2020-09-19 19:26:03',0,NULL,0,X'E69D83E99990E7AEA1E79086',X'',NULL,NULL),
	(74,X'6C6F67676572',X'',X'2F6F7065726174696F6E2F6C6F67676572',X'6F7065726174696F6E2F6C6F676765722F696E646578',6,X'',1,1,'2020-09-10 11:45:57','2020-10-23 16:50:21',0,NULL,0,X'E697A5E5BF97E7AEA1E79086',X'',NULL,NULL),
	(75,X'74657374',X'',X'2F74657374',X'5061676556696577',0,X'74657374',1,0,'2020-09-11 14:44:12','2020-09-20 18:21:33',0,NULL,0,X'74657374',X'',NULL,NULL),
	(76,X'64617368626F617264',X'',X'2F64617368626F617264',X'5061676556696577',0,X'64617368626F617264',0,1,'2020-09-16 16:20:16','2020-09-20 17:51:24',0,NULL,0,X'E4BBAAE8A1A8E79B98',X'',NULL,NULL),
	(77,X'6E61636F73',X'',X'687474703A2F2F3133342E3137352E34372E3233343A383834382F6E61636F73',X'',76,X'',0,1,'2020-09-20 18:02:44','2020-09-20 18:14:19',0,NULL,0,X'6E61636F73',X'5F626C616E6B',NULL,NULL),
	(78,X'73656E74696E656C',X'',X'687474703A2F2F3133342E3137352E34372E3233343A38313830',X'',76,X'',1,1,'2020-09-20 18:23:49','2020-09-20 18:44:08',0,NULL,0,X'73656E74696E656C',X'5F626C616E6B',NULL,NULL),
	(79,X'',X'',X'31',X'',0,X'',4,1,'2020-09-20 23:31:21','2020-09-21 18:36:42',1,NULL,0,X'E6B58BE8AF95',X'',NULL,NULL),
	(80,X'',NULL,X'32',NULL,0,NULL,5,1,'2020-09-20 23:32:14','2020-09-21 18:36:47',1,NULL,0,X'E6B58BE8AF9531',X'',NULL,NULL),
	(81,X'',NULL,X'33',NULL,0,NULL,6,1,'2020-09-20 23:32:56','2020-09-21 18:38:35',1,NULL,0,X'7431',X'',NULL,NULL),
	(82,X'',NULL,X'34',NULL,0,NULL,7,1,'2020-09-20 23:33:28','2020-09-21 18:38:33',1,NULL,0,X'7432',X'',NULL,NULL),
	(83,X'',X'',X'7433',X'',0,X'',3,1,'2020-09-20 23:34:02','2020-09-21 18:38:31',1,NULL,0,X'7433',X'',NULL,NULL),
	(84,X'7434',X'',X'7434',X'',0,X'',8,1,'2020-09-20 23:34:27','2020-10-23 16:50:03',1,NULL,0,X'7434',X'',NULL,NULL),
	(85,X'',NULL,X'7435',NULL,0,NULL,9,1,'2020-09-20 23:34:58','2020-09-21 18:38:28',1,NULL,0,X'7435',X'',NULL,NULL),
	(86,X'',NULL,X'7436',NULL,0,NULL,10,1,'2020-09-20 23:35:43','2020-09-21 18:35:48',1,NULL,0,X'7436',X'',NULL,NULL),
	(87,X'67656E657261746F72',X'',X'2F6F7065726174696F6E2F67656E657261746F72',X'6F7065726174696F6E2F67656E657261746F722F696E646578',6,X'',2,1,'2020-10-23 16:51:49','2020-10-23 16:53:10',0,NULL,0,X'E4BBA3E7A081E7949FE68890',X'',NULL,NULL);

/*!40000 ALTER TABLE `sys_route` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_tenant
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_tenant`;

CREATE TABLE `sys_tenant` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '租户id',
  `name` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '租户名称',
  `code` varchar(64) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '租户编号',
  `start_time` timestamp NULL DEFAULT NULL COMMENT '授权开始时间',
  `end_time` timestamp NULL DEFAULT NULL COMMENT '授权结束时间',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0正常 9-冻结',
  `del_flag` char(1) CHARACTER SET utf8mb4 DEFAULT '0' COMMENT '删除标记',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='租户表';

LOCK TABLES `sys_tenant` WRITE;
/*!40000 ALTER TABLE `sys_tenant` DISABLE KEYS */;

INSERT INTO `sys_tenant` (`id`, `name`, `code`, `start_time`, `end_time`, `status`, `del_flag`, `create_time`, `update_time`)
VALUES
	(1,'上海某某公司','1','2019-08-10 00:00:00','2020-08-10 00:00:00',0,'0','2019-08-10 10:13:12','2019-08-10 12:44:52'),
	(2,'北京分公司','2','2019-12-17 21:30:23','2021-12-02 00:00:00',0,'0','2019-12-17 21:30:31','2019-12-17 21:30:31');

/*!40000 ALTER TABLE `sys_tenant` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `username` varchar(64) COLLATE utf8mb4_bin NOT NULL COMMENT '用户名',
  `password` varchar(255) COLLATE utf8mb4_bin NOT NULL COMMENT '密码',
  `dept_id` int(10) DEFAULT NULL COMMENT '部门ID',
  `email` varchar(25) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '手机号',
  `avatar` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '头像',
  `created_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `status` tinyint(1) DEFAULT '0' COMMENT '0-正常，1-停用',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-正常，1-删除',
  `tenant_id` int(11) DEFAULT NULL COMMENT '租户id',
  `sex` int(11) DEFAULT '0' COMMENT '0-保密，1-男，2-女',
  `last_login_time` datetime DEFAULT NULL COMMENT '上次登陆时间',
  PRIMARY KEY (`id`),
  KEY `user_idx_dept_id` (`dept_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='用户表';

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;

INSERT INTO `sys_user` (`id`, `username`, `password`, `dept_id`, `email`, `phone`, `avatar`, `created_time`, `updated_time`, `status`, `deleted`, `tenant_id`, `sex`, `last_login_time`)
VALUES
	(1,X'7A68616E6773616E',X'2432612431302445653956443954587845502E79564E4F3973675348654D6C4D554A6F49317753794843526D5A3641424C4A30302F7A427041634F71',6,X'7A68616E6773616E4071712E636F6D',X'3137383132333434333231',NULL,'2020-07-15 09:14:00','2020-09-21 23:35:44',0,0,NULL,1,'2020-08-21 14:37:56'),
	(2,X'6C697369',X'2432612431302445653956443954587845502E79564E4F3973675348654D6C4D554A6F49317753794843526D5A3641424C4A30302F7A427041634F71',5,X'6C6973694071712E636F6D',X'3132333435363737383835',NULL,'2020-08-19 16:33:25','2020-09-21 23:35:50',0,0,NULL,2,NULL),
	(3,X'77616E677775',X'243261243130243266486B53486D506F542E475738394B5141375A634F6751653745496A78626B6D73376B53476765493562576C383748316F635532',16,X'3140312E636F6D',X'3133323132333434333231',NULL,'2020-08-20 00:19:52','2020-09-21 23:35:57',0,0,NULL,2,'2020-08-20 03:27:22'),
	(4,X'7A68616F6C6975',X'2432612431302468484C3853382E64517931446B564F507474456C552E5A71614D6A522E5170573753465952765557637631536A7431485A6D676453',16,X'31403131312E636F6D',X'3133323132333435363837',X'','2020-08-20 11:23:30','2020-09-24 00:40:09',0,0,NULL,1,NULL);

/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_user_role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_user_role`;

CREATE TABLE `sys_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '用户ID',
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='用户角色表';

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;

INSERT INTO `sys_user_role` (`id`, `user_id`, `role_id`, `deleted`, `created_time`, `updated_time`)
VALUES
	(40,'1',5,0,'2020-07-02 09:35:07','2020-09-21 23:36:30'),
	(43,'3',5,0,'2020-07-02 09:35:07','2020-09-21 23:36:52'),
	(44,'1',7,0,'2020-07-02 09:35:07','2020-09-21 23:36:33'),
	(50,'2',5,0,'2020-07-15 09:20:37','2020-09-21 23:36:48'),
	(4557787,'1',8,0,'2020-07-02 16:20:23','2020-09-21 23:36:35'),
	(4557789,'2',7,0,'2020-08-20 11:23:30','2020-09-21 23:37:09'),
	(4557790,'3',8,0,'2020-08-20 11:23:30','2020-09-21 23:37:17'),
	(4557791,'4',8,0,'2020-09-24 00:40:09','2020-09-24 00:40:09');

/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
