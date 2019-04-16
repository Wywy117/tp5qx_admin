/*
Navicat MySQL Data Transfer

Source Server         : lotus_page
Source Server Version : 50558
Source Host           : 182.61.54.187:3306
Source Database       : lotus_two

Target Server Type    : MYSQL
Target Server Version : 50558
File Encoding         : 65001

Date: 2018-01-02 22:38:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for lotus_admin_user
-- ----------------------------
DROP TABLE IF EXISTS `lotus_admin_user`;
CREATE TABLE `lotus_admin_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(50) NOT NULL COMMENT '密码',
  `mobile` varchar(11) DEFAULT '' COMMENT '手机',
  `email` varchar(50) DEFAULT '' COMMENT '邮箱',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '用户状态  1 正常  2 禁止',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_login_time` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `last_login_ip` varchar(50) DEFAULT '' COMMENT '最后登录IP',
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=139 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of lotus_admin_user
-- ----------------------------
INSERT INTO `lotus_admin_user` VALUES ('1', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '13262877293', 'whnde@qq.com', '1', '2017-12-22 10:47:49', null, '0.0.0.0', '2018-01-02 13:24:46');
INSERT INTO `lotus_admin_user` VALUES ('133', 'demo1', 'e10adc3949ba59abbe56e057f20f883e', '13262877295', 'whnadsde@qq.com', '1', '2018-01-02 14:15:54', null, '0.0.0.0', '2018-01-02 17:52:20');
INSERT INTO `lotus_admin_user` VALUES ('137', 'wenhainan', '121144d6c3114c583415f06860ad3710', '13262877298', 'whndeasd@qq.com', '1', '2018-01-02 14:38:07', null, '0.0.0.0', '2018-01-02 14:38:07');
INSERT INTO `lotus_admin_user` VALUES ('138', '1112332', 'badf62f4e2f145302fdefbcafa7acced', '13800138000', '1112332@qq.com', '1', '2018-01-02 22:22:10', null, '0.0.0.0', '2018-01-02 22:22:10');

-- ----------------------------
-- Table structure for lotus_api
-- ----------------------------
DROP TABLE IF EXISTS `lotus_api`;
CREATE TABLE `lotus_api` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `base_url` varchar(255) DEFAULT NULL,
  `hash` varchar(50) DEFAULT NULL,
  `method` varchar(10) DEFAULT NULL,
  `is_token` varchar(255) DEFAULT '0',
  `app_id` int(11) DEFAULT NULL,
  `param` varchar(255) DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lotus_api
-- ----------------------------
INSERT INTO `lotus_api` VALUES ('1', '124', 'http://www.sucaihuo.com/index/index/testPost.html', 'NGPJPXYFLBFCTASBXYMYJ97R5', 'post', '1', null, 'id:1|name:jack', null, null, '1511938273', '1512028794');

-- ----------------------------
-- Table structure for lotus_app
-- ----------------------------
DROP TABLE IF EXISTS `lotus_app`;
CREATE TABLE `lotus_app` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `app_id` int(11) NOT NULL,
  `secret` varchar(255) NOT NULL,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `app_id` (`app_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lotus_app
-- ----------------------------
INSERT INTO `lotus_app` VALUES ('30', 'aaa', '98217915', 'J34WCRWUKOZ5F9GUZ5BTKOI5S', '1511852796', '1512028358');
INSERT INTO `lotus_app` VALUES ('31', '鹅鹅鹅', '77730573', '7L6DQPFDAHYUYWVC1U86ZWUE1', '1512003546', '1512003546');

-- ----------------------------
-- Table structure for lotus_article
-- ----------------------------
DROP TABLE IF EXISTS `lotus_article`;
CREATE TABLE `lotus_article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文章ID',
  `cid` smallint(5) unsigned NOT NULL COMMENT '分类ID',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `introduction` varchar(255) DEFAULT '' COMMENT '简介',
  `content` longtext COMMENT '内容',
  `author` varchar(20) DEFAULT '' COMMENT '作者',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态 0 待审核  1 审核',
  `reading` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '阅读量',
  `thumb` varchar(255) DEFAULT '' COMMENT '缩略图',
  `photo` text COMMENT '图集',
  `is_top` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否置顶  0 不置顶  1 置顶',
  `is_recommend` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否推荐  0 不推荐  1 推荐',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `publish_time` datetime NOT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='文章表';

-- ----------------------------
-- Records of lotus_article
-- ----------------------------
INSERT INTO `lotus_article` VALUES ('1', '1', '测试文章一', '', '<p>测试内容</p>', 'admin', '1', '0', '', null, '0', '0', '0', '2017-04-11 14:10:10', '2017-04-11 14:09:45');

-- ----------------------------
-- Table structure for lotus_auth_group
-- ----------------------------
DROP TABLE IF EXISTS `lotus_auth_group`;
CREATE TABLE `lotus_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `title` char(100) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `rules` varchar(255) NOT NULL COMMENT '权限规则ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=245 DEFAULT CHARSET=utf8 COMMENT='权限组表';

-- ----------------------------
-- Records of lotus_auth_group
-- ----------------------------
INSERT INTO `lotus_auth_group` VALUES ('1', '超级管理组', '1', '1,2,187,188,3,189,190,191,4,192,193,10,11,195,197,198,199');
INSERT INTO `lotus_auth_group` VALUES ('241', '普通用户', '1', '1,2,187,188,201,3,189,190,191,4,192,200,10,11,195,197,198,199');
INSERT INTO `lotus_auth_group` VALUES ('242', 'ceshi', '0', '1,2,187,188,201,3,189,190,191,10,11,195,197,198,199');
INSERT INTO `lotus_auth_group` VALUES ('243', 'demo2', '0', '');

-- ----------------------------
-- Table structure for lotus_auth_group_access
-- ----------------------------
DROP TABLE IF EXISTS `lotus_auth_group_access`;
CREATE TABLE `lotus_auth_group_access` (
  `uid` mediumint(8) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='权限组规则表';

-- ----------------------------
-- Records of lotus_auth_group_access
-- ----------------------------
INSERT INTO `lotus_auth_group_access` VALUES ('1', '1');
INSERT INTO `lotus_auth_group_access` VALUES ('130', '1');
INSERT INTO `lotus_auth_group_access` VALUES ('131', '1');
INSERT INTO `lotus_auth_group_access` VALUES ('132', '1');
INSERT INTO `lotus_auth_group_access` VALUES ('133', '241');
INSERT INTO `lotus_auth_group_access` VALUES ('134', '241');
INSERT INTO `lotus_auth_group_access` VALUES ('135', '241');
INSERT INTO `lotus_auth_group_access` VALUES ('136', '241');
INSERT INTO `lotus_auth_group_access` VALUES ('137', '241');
INSERT INTO `lotus_auth_group_access` VALUES ('138', '1');

-- ----------------------------
-- Table structure for lotus_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `lotus_auth_rule`;
CREATE TABLE `lotus_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL DEFAULT '' COMMENT '规则名称',
  `title` varchar(20) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `pid` smallint(5) unsigned NOT NULL COMMENT '父级ID',
  `icon` varchar(50) DEFAULT '' COMMENT '图标',
  `sort` tinyint(4) unsigned NOT NULL COMMENT '排序',
  `condition` char(100) DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=207 DEFAULT CHARSET=utf8 COMMENT='规则表';

-- ----------------------------
-- Records of lotus_auth_rule
-- ----------------------------
INSERT INTO `lotus_auth_rule` VALUES ('1', 'admin/user/default', '后台权限', '1', '1', '0', 'fa fa-user-circle-o', '0', '');
INSERT INTO `lotus_auth_rule` VALUES ('2', 'admin/adminUser/index', '管理员列表', '1', '1', '1', 'fa fa-dashboard', '0', '');
INSERT INTO `lotus_auth_rule` VALUES ('3', 'admin/adminUser/authList', '权限管理', '1', '1', '1', 'fa fa-users', '0', '');
INSERT INTO `lotus_auth_rule` VALUES ('4', 'admin/adminUser/roleList', '角色列表', '1', '1', '1', 'fa fa-dashboard', '0', '');
INSERT INTO `lotus_auth_rule` VALUES ('199', 'admin/system/index', '系统日志', '1', '1', '198', 'fa fa-circle-o', '0', '');
INSERT INTO `lotus_auth_rule` VALUES ('187', 'admin/adminUser/edit_user', '管理员编辑', '1', '1', '2', 'fa fa-circle-o', '0', '');
INSERT INTO `lotus_auth_rule` VALUES ('10', 'admin/index/default', '仪表盘', '1', '1', '0', 'fa fa-dashboard', '2', '');
INSERT INTO `lotus_auth_rule` VALUES ('11', 'admin/index/index', '控制面板', '1', '1', '10', 'fa fa-circle-o', '255', '');
INSERT INTO `lotus_auth_rule` VALUES ('188', 'admin/adminUser/delete_user', '管理员删除', '1', '1', '2', 'fa fa-circle-o', '0', '');
INSERT INTO `lotus_auth_rule` VALUES ('189', 'admin/adminUser/add_menu', '增加权限', '1', '1', '3', 'fa fa-circle-o', '0', '');
INSERT INTO `lotus_auth_rule` VALUES ('190', 'admin/adminUser/edit_menu', '编辑', '1', '0', '3', 'fa fa-circle-o', '0', '');
INSERT INTO `lotus_auth_rule` VALUES ('191', 'admin/adminUser/deleteauthrule', '删除', '1', '0', '3', 'fa fa-circle-o', '0', '');
INSERT INTO `lotus_auth_rule` VALUES ('192', 'admin/adminUser/add_role', '新增', '1', '0', '4', 'fa fa-circle-o', '0', '');
INSERT INTO `lotus_auth_rule` VALUES ('193', 'admin/adminUser/auth', '授权', '1', '0', '4', 'fa fa-circle-o', '0', '');
INSERT INTO `lotus_auth_rule` VALUES ('197', 'admin/system/setting', '配置', '1', '1', '195', 'fa fa-circle-o', '0', '');
INSERT INTO `lotus_auth_rule` VALUES ('195', 'admin/default/default', '系统设置', '1', '1', '0', 'fa fa-wrench', '0', '');
INSERT INTO `lotus_auth_rule` VALUES ('198', 'admin/default/default0', '日志', '1', '1', '0', 'fa fa-table', '0', '');
INSERT INTO `lotus_auth_rule` VALUES ('200', 'admin/adminUser/delete_role', '角色删除', '1', '1', '4', 'fa fa-circle-o', '0', '');
INSERT INTO `lotus_auth_rule` VALUES ('201', 'admin/adminUser/add_user', '管理员新增', '1', '1', '2', 'fa fa-circle-o', '0', '');

-- ----------------------------
-- Table structure for lotus_auth_tips
-- ----------------------------
DROP TABLE IF EXISTS `lotus_auth_tips`;
CREATE TABLE `lotus_auth_tips` (
  `t_id` int(11) NOT NULL AUTO_INCREMENT,
  `mark` varchar(255) DEFAULT NULL,
  `auth_group_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`t_id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lotus_auth_tips
-- ----------------------------
INSERT INTO `lotus_auth_tips` VALUES ('2', '333', '161');
INSERT INTO `lotus_auth_tips` VALUES ('3', 'c', '162');
INSERT INTO `lotus_auth_tips` VALUES ('4', '22222222222', '163');
INSERT INTO `lotus_auth_tips` VALUES ('5', null, '164');
INSERT INTO `lotus_auth_tips` VALUES ('6', 'adasdasczx', '165');
INSERT INTO `lotus_auth_tips` VALUES ('7', '', '166');
INSERT INTO `lotus_auth_tips` VALUES ('8', '哈哈哈', '167');
INSERT INTO `lotus_auth_tips` VALUES ('9', '请不要对我干坏事', '1');
INSERT INTO `lotus_auth_tips` VALUES ('10', '', '169');
INSERT INTO `lotus_auth_tips` VALUES ('12', '', '171');
INSERT INTO `lotus_auth_tips` VALUES ('13', 'sdaxzcxzc', '172');
INSERT INTO `lotus_auth_tips` VALUES ('14', null, '173');
INSERT INTO `lotus_auth_tips` VALUES ('15', '', '174');
INSERT INTO `lotus_auth_tips` VALUES ('16', null, '175');
INSERT INTO `lotus_auth_tips` VALUES ('17', null, '176');
INSERT INTO `lotus_auth_tips` VALUES ('18', null, '177');
INSERT INTO `lotus_auth_tips` VALUES ('19', null, '178');
INSERT INTO `lotus_auth_tips` VALUES ('21', null, '180');
INSERT INTO `lotus_auth_tips` VALUES ('22', null, '181');
INSERT INTO `lotus_auth_tips` VALUES ('23', null, '182');
INSERT INTO `lotus_auth_tips` VALUES ('24', null, '183');
INSERT INTO `lotus_auth_tips` VALUES ('25', null, '184');
INSERT INTO `lotus_auth_tips` VALUES ('26', '', '185');
INSERT INTO `lotus_auth_tips` VALUES ('27', null, '186');
INSERT INTO `lotus_auth_tips` VALUES ('28', 'asdxzcxzcxzc', '187');
INSERT INTO `lotus_auth_tips` VALUES ('30', null, '189');
INSERT INTO `lotus_auth_tips` VALUES ('31', null, '190');
INSERT INTO `lotus_auth_tips` VALUES ('32', null, '191');
INSERT INTO `lotus_auth_tips` VALUES ('33', null, '192');
INSERT INTO `lotus_auth_tips` VALUES ('34', null, '193');
INSERT INTO `lotus_auth_tips` VALUES ('35', null, '194');
INSERT INTO `lotus_auth_tips` VALUES ('36', null, '195');
INSERT INTO `lotus_auth_tips` VALUES ('37', null, '196');
INSERT INTO `lotus_auth_tips` VALUES ('38', null, '197');
INSERT INTO `lotus_auth_tips` VALUES ('39', null, '198');
INSERT INTO `lotus_auth_tips` VALUES ('40', null, '199');
INSERT INTO `lotus_auth_tips` VALUES ('41', null, '200');
INSERT INTO `lotus_auth_tips` VALUES ('42', null, '201');
INSERT INTO `lotus_auth_tips` VALUES ('43', null, '202');
INSERT INTO `lotus_auth_tips` VALUES ('44', null, '203');
INSERT INTO `lotus_auth_tips` VALUES ('46', '', '205');
INSERT INTO `lotus_auth_tips` VALUES ('79', '', '241');
INSERT INTO `lotus_auth_tips` VALUES ('80', '', '242');
INSERT INTO `lotus_auth_tips` VALUES ('81', null, '243');

-- ----------------------------
-- Table structure for lotus_category
-- ----------------------------
DROP TABLE IF EXISTS `lotus_category`;
CREATE TABLE `lotus_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `name` varchar(50) NOT NULL COMMENT '分类名称',
  `alias` varchar(50) DEFAULT '' COMMENT '导航别名',
  `content` longtext COMMENT '分类内容',
  `thumb` varchar(255) DEFAULT '' COMMENT '缩略图',
  `icon` varchar(20) DEFAULT '' COMMENT '分类图标',
  `list_template` varchar(50) DEFAULT '' COMMENT '分类列表模板',
  `detail_template` varchar(50) DEFAULT '' COMMENT '分类详情模板',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '分类类型  1  列表  2 单页',
  `sort` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `path` varchar(255) DEFAULT '' COMMENT '路径',
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='分类表';

-- ----------------------------
-- Records of lotus_category
-- ----------------------------
INSERT INTO `lotus_category` VALUES ('1', '分类一', '', '', '', '', '', '', '1', '0', '0', '0,', '2016-12-22 18:22:24');

-- ----------------------------
-- Table structure for lotus_link
-- ----------------------------
DROP TABLE IF EXISTS `lotus_link`;
CREATE TABLE `lotus_link` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '链接名称',
  `link` varchar(255) DEFAULT '' COMMENT '链接地址',
  `image` varchar(255) DEFAULT '' COMMENT '链接图片',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态 1 显示  2 隐藏',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='友情链接表';

-- ----------------------------
-- Records of lotus_link
-- ----------------------------

-- ----------------------------
-- Table structure for lotus_nav
-- ----------------------------
DROP TABLE IF EXISTS `lotus_nav`;
CREATE TABLE `lotus_nav` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL COMMENT '父ID',
  `name` varchar(20) NOT NULL COMMENT '导航名称',
  `alias` varchar(20) DEFAULT '' COMMENT '导航别称',
  `link` varchar(255) DEFAULT '' COMMENT '导航链接',
  `icon` varchar(255) DEFAULT '' COMMENT '导航图标',
  `target` varchar(10) DEFAULT '' COMMENT '打开方式',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态  0 隐藏  1 显示',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='导航表';

-- ----------------------------
-- Records of lotus_nav
-- ----------------------------

-- ----------------------------
-- Table structure for lotus_slide
-- ----------------------------
DROP TABLE IF EXISTS `lotus_slide`;
CREATE TABLE `lotus_slide` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cid` int(10) unsigned NOT NULL COMMENT '分类ID',
  `name` varchar(50) NOT NULL COMMENT '轮播图名称',
  `description` varchar(255) DEFAULT '' COMMENT '说明',
  `link` varchar(255) DEFAULT '' COMMENT '链接',
  `target` varchar(10) DEFAULT '' COMMENT '打开方式',
  `image` varchar(255) DEFAULT '' COMMENT '轮播图片',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态  1 显示  0  隐藏',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='轮播图表';

-- ----------------------------
-- Records of lotus_slide
-- ----------------------------

-- ----------------------------
-- Table structure for lotus_slide_category
-- ----------------------------
DROP TABLE IF EXISTS `lotus_slide_category`;
CREATE TABLE `lotus_slide_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '轮播图分类',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='轮播图分类表';

-- ----------------------------
-- Records of lotus_slide_category
-- ----------------------------
INSERT INTO `lotus_slide_category` VALUES ('1', '首页轮播');

-- ----------------------------
-- Table structure for lotus_system
-- ----------------------------
DROP TABLE IF EXISTS `lotus_system`;
CREATE TABLE `lotus_system` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '配置项名称',
  `value` text NOT NULL COMMENT '配置项值',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='系统配置表';

-- ----------------------------
-- Records of lotus_system
-- ----------------------------
INSERT INTO `lotus_system` VALUES ('1', 'site_config', 'a:8:{s:5:\"title\";s:10:\"LotusAdmin\";s:7:\"company\";s:12:\"猫的梦想\";s:3:\"seo\";s:10:\"LotusAdmin\";s:8:\"keywords\";s:10:\"LotusAdmin\";s:11:\"description\";s:10:\"LotusAdmin\";s:7:\"version\";s:10:\"LotusAdmin\";s:3:\"ICP\";s:10:\"LotusAdmin\";s:4:\"code\";s:1:\" \";}');

-- ----------------------------
-- Table structure for lotus_system_log
-- ----------------------------
DROP TABLE IF EXISTS `lotus_system_log`;
CREATE TABLE `lotus_system_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `way` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `descript` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `ip` varchar(150) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=268 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lotus_system_log
-- ----------------------------
INSERT INTO `lotus_system_log` VALUES ('13', '成功登陆', 'Login/login', 'admin', null, '2017-12-25 04:07:16', '127.0.0.1', null);
INSERT INTO `lotus_system_log` VALUES ('14', '成功登陆', 'Login/login', 'admin', null, '2017-12-25 04:07:18', '127.0.0.1', null);
INSERT INTO `lotus_system_log` VALUES ('15', '成功登陆', 'Login/login', 'admin', null, '2017-12-25 04:07:49', '127.0.0.1', null);
INSERT INTO `lotus_system_log` VALUES ('16', '成功登陆', 'Login/login', 'admin', null, '2017-12-25 04:07:54', '127.0.0.1', null);
INSERT INTO `lotus_system_log` VALUES ('17', '成功登陆', 'Login/login', 'admin', null, '2017-12-25 04:08:51', '127.0.0.1', null);
INSERT INTO `lotus_system_log` VALUES ('18', '增加用户asdasd', 'AdminUser/addUser', 'admin', null, '2017-12-25 04:11:48', '127.0.0.1', null);
INSERT INTO `lotus_system_log` VALUES ('19', '增加用户#asdzxcxzc#', 'AdminUser/addUser', 'admin', null, '2017-12-25 04:12:42', '127.0.0.1', null);
INSERT INTO `lotus_system_log` VALUES ('20', '增加用户<a style=color:red>asxzczxc</a>', 'AdminUser/addUser', 'admin', null, '2017-12-25 04:13:52', '127.0.0.1', null);
INSERT INTO `lotus_system_log` VALUES ('21', '增加用户<a style=color:red>wenhainan</a>', 'AdminUser/addUser', 'admin', null, '2017-12-25 04:14:54', '127.0.0.1', null);
INSERT INTO `lotus_system_log` VALUES ('22', '成功登陆', 'Login/login', 'wenhainan', null, '2017-12-25 04:15:03', '127.0.0.1', null);
INSERT INTO `lotus_system_log` VALUES ('23', '成功登陆', 'Login/login', 'admin', null, '2017-12-25 04:15:39', '127.0.0.1', null);
INSERT INTO `lotus_system_log` VALUES ('24', '增加用户:admin1', 'AdminUser/addUser', 'admin', null, '2017-12-25 04:23:49', '127.0.0.1', null);
INSERT INTO `lotus_system_log` VALUES ('25', '成功登陆', 'Login/login', 'wenhainan', null, '2017-12-25 04:30:42', '127.0.0.1', null);
INSERT INTO `lotus_system_log` VALUES ('26', '成功登陆', 'Login/login', 'admin', null, '2017-12-25 04:33:32', '127.0.0.1', null);
INSERT INTO `lotus_system_log` VALUES ('27', '成功登陆', 'Login/login', 'admin', null, '2017-12-25 04:33:49', '127.0.0.1', null);
INSERT INTO `lotus_system_log` VALUES ('28', '成功登陆', 'Login/login', 'wenhainan', null, '2017-12-25 04:35:48', '127.0.0.1', null);
INSERT INTO `lotus_system_log` VALUES ('29', '成功登陆', 'Login/login', 'admin', null, '2017-12-25 04:36:33', '127.0.0.1', null);
INSERT INTO `lotus_system_log` VALUES ('30', '成功登陆', 'Login/login', 'wenhainan', null, '2017-12-25 04:36:57', '127.0.0.1', null);
INSERT INTO `lotus_system_log` VALUES ('31', '成功登陆', 'Login/login', 'admin', null, '2017-12-25 04:41:28', '127.0.0.1', null);
INSERT INTO `lotus_system_log` VALUES ('32', '成功登陆', 'Login/login', 'wenhainan', null, '2017-12-25 04:54:13', '127.0.0.1', null);
INSERT INTO `lotus_system_log` VALUES ('33', '成功登陆', 'Login/login', 'admin', null, '2017-12-25 04:54:50', '127.0.0.1', null);
INSERT INTO `lotus_system_log` VALUES ('34', '成功登陆', 'Login/login', 'wenhainan', null, '2017-12-25 04:58:23', '127.0.0.1', null);
INSERT INTO `lotus_system_log` VALUES ('35', '增加用户wenhainan', 'AdminUser/addUser', 'wenhainan', null, '2017-12-25 05:01:17', '127.0.0.1', null);
INSERT INTO `lotus_system_log` VALUES ('36', '成功登陆', 'Login/login', 'wenhainan', null, '2017-12-25 05:01:29', '127.0.0.1', null);
INSERT INTO `lotus_system_log` VALUES ('37', '成功登陆', 'Login/login', 'admin', null, '2017-12-25 05:09:18', '127.0.0.1', null);
INSERT INTO `lotus_system_log` VALUES ('38', '增加用户wenhainan', 'AdminUser/addUser', 'admin', null, '2017-12-25 05:10:08', '127.0.0.1', null);
INSERT INTO `lotus_system_log` VALUES ('39', '成功登陆', 'Login/login', 'wenhainan', null, '2017-12-25 05:10:18', '127.0.0.1', null);
INSERT INTO `lotus_system_log` VALUES ('40', '成功登陆', 'Login/login', 'admin', null, '2017-12-25 05:12:18', '127.0.0.1', null);
INSERT INTO `lotus_system_log` VALUES ('41', '成功登陆', 'Login/login', 'wenhainan', null, '2017-12-25 05:12:46', '127.0.0.1', null);
INSERT INTO `lotus_system_log` VALUES ('42', '成功登陆', 'Login/login', 'admin', null, '2017-12-25 05:13:06', '127.0.0.1', null);
INSERT INTO `lotus_system_log` VALUES ('43', '成功登陆', 'Login/login', 'wenhainan', null, '2017-12-25 05:18:03', '127.0.0.1', null);
INSERT INTO `lotus_system_log` VALUES ('44', '成功登陆', 'Login/login', 'wenhainan', null, '2017-12-25 05:19:05', '127.0.0.1', null);
INSERT INTO `lotus_system_log` VALUES ('45', '成功登陆', 'Login/login', 'admin', null, '2017-12-25 05:19:14', '127.0.0.1', null);
INSERT INTO `lotus_system_log` VALUES ('46', '成功登陆', 'Login/login', 'wenhainan', null, '2017-12-25 05:19:55', '127.0.0.1', null);
INSERT INTO `lotus_system_log` VALUES ('47', '成功登陆', 'Login/login', 'admin', null, '2017-12-25 05:20:25', '127.0.0.1', null);
INSERT INTO `lotus_system_log` VALUES ('48', '成功登陆', 'Login/login', 'wenhainan', null, '2017-12-25 05:21:15', '127.0.0.1', null);
INSERT INTO `lotus_system_log` VALUES ('49', '成功登陆', 'Login/login', 'admin', null, '2017-12-25 05:21:52', '127.0.0.1', null);
INSERT INTO `lotus_system_log` VALUES ('50', '成功登陆', 'Login/login', 'wenhainan', null, '2017-12-25 05:23:12', '127.0.0.1', null);
INSERT INTO `lotus_system_log` VALUES ('51', '成功登陆', 'Login/login', 'admin', null, '2017-12-25 05:27:33', '127.0.0.1', null);
INSERT INTO `lotus_system_log` VALUES ('52', '成功登陆', 'Login/login', 'wenhainan', null, '2017-12-25 05:29:23', '127.0.0.1', null);
INSERT INTO `lotus_system_log` VALUES ('53', '成功登陆', 'Login/login', 'admin', null, '2017-12-25 05:32:42', '127.0.0.1', null);
INSERT INTO `lotus_system_log` VALUES ('54', '成功登陆', 'Login/login', 'wenhainan', null, '2017-12-25 05:32:56', '127.0.0.1', null);
INSERT INTO `lotus_system_log` VALUES ('55', '成功登陆', 'Login/login', 'wenhainan', null, '2017-12-26 09:31:04', '127.0.0.1', null);
INSERT INTO `lotus_system_log` VALUES ('56', '成功登陆', 'Login/login', 'admin', null, '2017-12-26 11:32:09', '127.0.0.1', null);
INSERT INTO `lotus_system_log` VALUES ('57', '成功登陆', 'Login/login', 'wenhainan', null, '2017-12-26 11:41:28', '127.0.0.1', null);
INSERT INTO `lotus_system_log` VALUES ('58', '成功登陆', 'Login/login', 'admin', null, '2017-12-26 11:42:11', '127.0.0.1', null);
INSERT INTO `lotus_system_log` VALUES ('59', '成功登陆', 'Login/login', 'wenhainan', null, '2017-12-26 01:34:48', '127.0.0.1', null);
INSERT INTO `lotus_system_log` VALUES ('60', '成功登陆', 'Login/login', 'admin', null, '2017-12-26 01:35:20', '127.0.0.1', null);
INSERT INTO `lotus_system_log` VALUES ('61', '成功登陆', 'Login/login', 'wenhainan', null, '2017-12-26 01:36:13', '127.0.0.1', null);
INSERT INTO `lotus_system_log` VALUES ('62', '成功登陆', 'Login/login', 'wenhainan', null, '2017-12-26 01:38:54', '127.0.0.1', null);
INSERT INTO `lotus_system_log` VALUES ('63', '成功登陆', 'Login/login', 'admin', null, '2017-12-26 01:42:01', '127.0.0.1', null);
INSERT INTO `lotus_system_log` VALUES ('64', '成功登陆', 'Login/login', 'wenhainan', null, '2017-12-26 01:42:35', '127.0.0.1', null);
INSERT INTO `lotus_system_log` VALUES ('65', '增加用户wensad', 'AdminUser/addUser', 'wenhainan', null, '2017-12-26 01:42:58', '127.0.0.1', null);
INSERT INTO `lotus_system_log` VALUES ('66', '成功登陆', 'Login/login', 'admin', null, '2017-12-26 01:44:51', '127.0.0.1', null);
INSERT INTO `lotus_system_log` VALUES ('67', '成功登陆', 'Login/login', 'wenhainan', null, '2017-12-26 01:45:45', '127.0.0.1', null);
INSERT INTO `lotus_system_log` VALUES ('68', '成功登陆', 'Login/login', 'admin', null, '2017-12-26 02:33:43', '127.0.0.1', null);
INSERT INTO `lotus_system_log` VALUES ('69', '成功登陆', 'Login/login', 'admin', null, '2017-12-26 05:34:31', '127.0.0.1', null);
INSERT INTO `lotus_system_log` VALUES ('70', '成功登陆', 'Login/login', 'wenhainan', null, '2017-12-27 09:12:25', '127.0.0.1', null);
INSERT INTO `lotus_system_log` VALUES ('71', '成功登陆', 'Login/login', 'wenhainan', null, '2017-12-27 09:30:08', '127.0.0.1', null);
INSERT INTO `lotus_system_log` VALUES ('72', '成功登陆', 'Login/login', 'admin', null, '2017-12-27 10:02:14', '127.0.0.1', null);
INSERT INTO `lotus_system_log` VALUES ('73', '成功登陆', 'Login/login', 'admin', null, '2017-12-27 10:10:39', '127.0.0.1', null);
INSERT INTO `lotus_system_log` VALUES ('74', '成功登陆', 'Login/login', 'admin', null, '2017-12-27 10:11:45', '127.0.0.1', null);
INSERT INTO `lotus_system_log` VALUES ('75', '成功登陆', 'Login/login', 'admin', null, '2017-12-27 10:50:24', '127.0.0.1', null);
INSERT INTO `lotus_system_log` VALUES ('76', '成功登陆', 'Login/login', 'admin', null, '2017-12-27 13:08:53', '127.0.0.1', null);
INSERT INTO `lotus_system_log` VALUES ('77', '成功登陆', 'Login/login', 'admin', null, '2017-12-28 09:21:11', '127.0.0.1', null);
INSERT INTO `lotus_system_log` VALUES ('78', '增加用户wenhainande', 'AdminUser/addUser', 'admin', null, '2017-12-28 14:19:11', '127.0.0.1', null);
INSERT INTO `lotus_system_log` VALUES ('79', '成功登陆', 'Login/login', 'admin', null, '2017-12-28 14:47:00', '127.0.0.1', null);
INSERT INTO `lotus_system_log` VALUES ('80', '成功登陆', 'Login/login', 'admin', null, '2017-12-29 09:34:08', '127.0.0.1', null);
INSERT INTO `lotus_system_log` VALUES ('81', '成功登陆', 'Login/login', 'admin', null, '2017-12-29 10:32:26', '127.0.0.1', null);
INSERT INTO `lotus_system_log` VALUES ('82', '成功登陆', 'Login/login', 'admin', null, '2017-12-29 10:33:05', '127.0.0.1', null);
INSERT INTO `lotus_system_log` VALUES ('83', '成功登陆', 'Login/login', 'admin', null, '2017-12-29 10:36:16', '127.0.0.1', null);
INSERT INTO `lotus_system_log` VALUES ('84', '成功登陆', 'Login/login', 'admin', null, '2017-12-29 10:40:01', '127.0.0.1', null);
INSERT INTO `lotus_system_log` VALUES ('85', '成功登陆', 'Login/login', 'admin', null, '2017-12-29 11:00:10', '127.0.0.1', null);
INSERT INTO `lotus_system_log` VALUES ('86', '成功登陆', 'Login/login', 'admin', null, '2017-12-29 11:13:52', '127.0.0.1', null);
INSERT INTO `lotus_system_log` VALUES ('87', '成功登陆', 'Login/login', 'admin', null, '2017-12-29 13:32:29', '127.0.0.1', null);
INSERT INTO `lotus_system_log` VALUES ('88', '成功登陆', 'Login/login', 'admin', null, '2017-12-29 14:10:01', '127.0.0.1', null);
INSERT INTO `lotus_system_log` VALUES ('89', '成功登陆', 'Login/login', 'admin', null, '2017-12-29 15:31:47', '127.0.0.1', null);
INSERT INTO `lotus_system_log` VALUES ('90', '成功登陆', 'Login/login', 'admin', null, '2017-12-29 16:02:22', '0.0.0.0', null);
INSERT INTO `lotus_system_log` VALUES ('91', '成功登陆', 'Login/login', 'admin', null, '2017-12-29 16:15:04', '0.0.0.0', null);
INSERT INTO `lotus_system_log` VALUES ('92', '成功登陆', 'Login/login', 'admin', null, '2017-12-29 16:23:02', '0.0.0.0', null);
INSERT INTO `lotus_system_log` VALUES ('93', '成功登陆', 'Login/login', 'admin', null, '2017-12-29 16:23:23', '0.0.0.0', null);
INSERT INTO `lotus_system_log` VALUES ('94', '成功登陆', 'Login/login', 'admin', null, '2017-12-29 16:23:57', '0.0.0.0', null);
INSERT INTO `lotus_system_log` VALUES ('95', '成功登陆', 'Login/login', 'admin', null, '2017-12-29 16:25:52', '0.0.0.0', null);
INSERT INTO `lotus_system_log` VALUES ('96', '成功登陆', 'Login/login', 'admin', null, '2017-12-29 16:31:39', '0.0.0.0', null);
INSERT INTO `lotus_system_log` VALUES ('97', '成功登陆', 'Login/login', 'admin', null, '2018-01-02 09:04:26', '127.0.0.1', null);
INSERT INTO `lotus_system_log` VALUES ('98', '成功登陆', 'Login/login', 'admin', null, '2018-01-02 09:14:06', '127.0.0.1', null);
INSERT INTO `lotus_system_log` VALUES ('99', '成功登陆', 'Login/login', 'admin', null, '2018-01-02 13:33:38', '127.0.0.1', null);
INSERT INTO `lotus_system_log` VALUES ('100', '增加用户demo1', 'AdminUser/addUser', 'admin', null, '2018-01-02 14:15:54', '127.0.0.1', null);
INSERT INTO `lotus_system_log` VALUES ('101', '成功登陆', 'Login/login', 'demo1', null, '2018-01-02 14:16:05', '127.0.0.1', null);
INSERT INTO `lotus_system_log` VALUES ('102', '增加用户wenhainan', 'AdminUser/addUser', 'demo1', null, '2018-01-02 14:26:14', '127.0.0.1', null);
INSERT INTO `lotus_system_log` VALUES ('103', '增加用户wenhainan', 'AdminUser/addUser', 'demo1', null, '2018-01-02 14:35:42', '127.0.0.1', null);
INSERT INTO `lotus_system_log` VALUES ('104', '增加用户wenhainan', 'AdminUser/addUser', 'admin', null, '2018-01-02 14:37:07', '127.0.0.1', null);
INSERT INTO `lotus_system_log` VALUES ('105', '增加用户wenhainan', 'AdminUser/addUser', 'admin', null, '2018-01-02 14:38:07', '127.0.0.1', null);
INSERT INTO `lotus_system_log` VALUES ('106', '成功登陆', 'Login/login', 'admin', null, '2018-01-02 14:54:41', '127.0.0.1', null);
INSERT INTO `lotus_system_log` VALUES ('107', '成功登陆', 'Login/login', 'demo1', null, '2018-01-02 16:03:46', '127.0.0.1', null);
INSERT INTO `lotus_system_log` VALUES ('108', '成功登陆', 'Login/login', 'demo1', null, '2018-01-02 16:24:29', '127.0.0.1', null);
INSERT INTO `lotus_system_log` VALUES ('109', '成功登陆', 'Login/login', 'demo1', null, '2018-01-02 17:06:21', '127.0.0.1', null);
INSERT INTO `lotus_system_log` VALUES ('110', '成功登陆', 'Login/login', 'admin', null, '2018-01-02 17:12:15', '101.80.103.37', null);
INSERT INTO `lotus_system_log` VALUES ('111', '成功登陆', 'Login/login', 'demo1', null, '2018-01-02 17:12:51', '113.132.9.138', null);
INSERT INTO `lotus_system_log` VALUES ('112', '成功登陆', 'Login/login', 'demo1', null, '2018-01-02 17:13:42', '111.198.15.150', null);
INSERT INTO `lotus_system_log` VALUES ('113', '成功登陆', 'Login/login', 'demo1', null, '2018-01-02 17:13:55', '101.80.103.37', null);
INSERT INTO `lotus_system_log` VALUES ('114', '成功登陆', 'Login/login', 'demo1', null, '2018-01-02 17:18:29', '140.250.86.190', null);
INSERT INTO `lotus_system_log` VALUES ('115', '成功登陆', 'Login/login', 'demo1', null, '2018-01-02 17:18:35', '218.94.115.131', null);
INSERT INTO `lotus_system_log` VALUES ('116', '成功登陆', 'Login/login', 'demo1', null, '2018-01-02 17:19:43', '118.194.243.52', null);
INSERT INTO `lotus_system_log` VALUES ('117', '成功登陆', 'Login/login', 'demo1', null, '2018-01-02 17:21:30', '219.238.5.2', null);
INSERT INTO `lotus_system_log` VALUES ('118', '成功登陆', 'Login/login', 'demo1', null, '2018-01-02 17:21:47', '101.80.103.37', null);
INSERT INTO `lotus_system_log` VALUES ('119', '成功登陆', 'Login/login', 'demo1', null, '2018-01-02 17:22:24', '101.80.103.37', null);
INSERT INTO `lotus_system_log` VALUES ('120', '成功登陆', 'Login/login', 'demo1', null, '2018-01-02 17:22:45', '183.51.120.10', null);
INSERT INTO `lotus_system_log` VALUES ('121', '成功登陆', 'Login/login', 'demo1', null, '2018-01-02 17:22:57', '121.8.184.189', null);
INSERT INTO `lotus_system_log` VALUES ('122', '成功登陆', 'Login/login', 'demo1', null, '2018-01-02 17:23:02', '183.15.247.0', null);
INSERT INTO `lotus_system_log` VALUES ('123', '成功登陆', 'Login/login', 'admin', null, '2018-01-02 17:24:11', '101.80.103.37', null);
INSERT INTO `lotus_system_log` VALUES ('124', '成功登陆', 'Login/login', 'demo1', null, '2018-01-02 17:24:25', '122.192.14.84', null);
INSERT INTO `lotus_system_log` VALUES ('125', '成功登陆', 'Login/login', 'admin', null, '2018-01-02 17:25:41', '101.80.103.37', null);
INSERT INTO `lotus_system_log` VALUES ('126', '成功登陆', 'Login/login', 'demo1', null, '2018-01-02 17:26:16', '218.63.48.186', null);
INSERT INTO `lotus_system_log` VALUES ('127', '成功登陆', 'Login/login', 'admin', null, '2018-01-02 17:26:43', '113.246.167.130', null);
INSERT INTO `lotus_system_log` VALUES ('128', '成功登陆', 'Login/login', 'admin', null, '2018-01-02 17:27:13', '183.238.243.134', null);
INSERT INTO `lotus_system_log` VALUES ('129', '成功登陆', 'Login/login', 'demo1', null, '2018-01-02 17:28:06', '180.168.194.234', null);
INSERT INTO `lotus_system_log` VALUES ('130', '成功登陆', 'Login/login', 'admin', null, '2018-01-02 17:28:12', '183.14.132.212', null);
INSERT INTO `lotus_system_log` VALUES ('131', '成功登陆', 'Login/login', 'admin', null, '2018-01-02 17:28:19', '171.8.68.13', null);
INSERT INTO `lotus_system_log` VALUES ('132', '成功登陆', 'Login/login', 'admin', null, '2018-01-02 17:28:22', '101.80.103.37', null);
INSERT INTO `lotus_system_log` VALUES ('133', '成功登陆', 'Login/login', 'admin', null, '2018-01-02 17:29:49', '180.168.194.234', null);
INSERT INTO `lotus_system_log` VALUES ('134', '成功登陆', 'Login/login', 'demo1', null, '2018-01-02 17:30:11', '117.158.17.227', null);
INSERT INTO `lotus_system_log` VALUES ('135', '成功登陆', 'Login/login', 'demo1', null, '2018-01-02 17:31:35', '1.84.216.227', null);
INSERT INTO `lotus_system_log` VALUES ('136', '成功登陆', 'Login/login', 'demo1', null, '2018-01-02 17:33:03', '36.22.110.11', null);
INSERT INTO `lotus_system_log` VALUES ('137', '成功登陆', 'Login/login', 'demo1', null, '2018-01-02 17:35:02', '123.157.153.130', null);
INSERT INTO `lotus_system_log` VALUES ('138', '成功登陆', 'Login/login', 'demo1', null, '2018-01-02 17:36:59', '101.80.103.37', null);
INSERT INTO `lotus_system_log` VALUES ('139', '成功登陆', 'Login/login', 'demo1', null, '2018-01-02 17:38:17', '223.104.130.31', null);
INSERT INTO `lotus_system_log` VALUES ('140', '成功登陆', 'Login/login', 'admin', null, '2018-01-02 17:43:46', '112.65.48.77', null);
INSERT INTO `lotus_system_log` VALUES ('141', '成功登陆', 'Login/login', 'demo1', null, '2018-01-02 17:44:49', '183.22.254.94', null);
INSERT INTO `lotus_system_log` VALUES ('142', '成功登陆', 'Login/login', 'demo1', null, '2018-01-02 17:44:51', '183.22.254.94', null);
INSERT INTO `lotus_system_log` VALUES ('143', '成功登陆', 'Login/login', 'admin', null, '2018-01-02 17:45:49', '223.74.15.240', null);
INSERT INTO `lotus_system_log` VALUES ('144', '成功登陆', 'Login/login', 'demo1', null, '2018-01-02 17:46:13', '110.86.1.18', null);
INSERT INTO `lotus_system_log` VALUES ('145', '成功登陆', 'Login/login', 'demo1', null, '2018-01-02 17:50:03', '121.69.74.42', null);
INSERT INTO `lotus_system_log` VALUES ('146', '成功登陆', 'Login/login', 'demo1', null, '2018-01-02 17:50:44', '116.117.22.253', null);
INSERT INTO `lotus_system_log` VALUES ('147', '成功登陆', 'Login/login', 'demo1', null, '2018-01-02 17:51:02', '116.30.218.94', null);
INSERT INTO `lotus_system_log` VALUES ('148', '成功登陆', 'Login/login', 'demo1', null, '2018-01-02 17:51:18', '61.149.11.94', null);
INSERT INTO `lotus_system_log` VALUES ('149', '成功登陆', 'Login/login', 'demo1', null, '2018-01-02 17:51:19', '106.114.35.149', null);
INSERT INTO `lotus_system_log` VALUES ('150', '成功登陆', 'Login/login', 'admin', null, '2018-01-02 17:51:21', '27.154.78.181', null);
INSERT INTO `lotus_system_log` VALUES ('151', '成功登陆', 'Login/login', 'demo1', null, '2018-01-02 17:51:46', '110.186.48.229', null);
INSERT INTO `lotus_system_log` VALUES ('152', '成功登陆', 'Login/login', 'demo1', null, '2018-01-02 17:51:46', '121.34.146.46', null);
INSERT INTO `lotus_system_log` VALUES ('153', '成功登陆', 'Login/login', 'demo1', null, '2018-01-02 17:51:56', '115.192.252.12', null);
INSERT INTO `lotus_system_log` VALUES ('154', '成功登陆', 'Login/login', 'demo1', null, '2018-01-02 17:52:50', '61.178.145.122', null);
INSERT INTO `lotus_system_log` VALUES ('155', '成功登陆', 'Login/login', 'demo1', null, '2018-01-02 17:52:55', '39.88.36.81', null);
INSERT INTO `lotus_system_log` VALUES ('156', '成功登陆', 'Login/login', 'admin', null, '2018-01-02 17:53:36', '218.17.99.205', null);
INSERT INTO `lotus_system_log` VALUES ('157', '成功登陆', 'Login/login', 'admin', null, '2018-01-02 17:53:41', '218.15.24.242', null);
INSERT INTO `lotus_system_log` VALUES ('158', '成功登陆', 'Login/login', 'demo1', null, '2018-01-02 17:53:58', '121.32.49.73', null);
INSERT INTO `lotus_system_log` VALUES ('159', '成功登陆', 'Login/login', 'demo1', null, '2018-01-02 17:54:10', '121.32.49.73', null);
INSERT INTO `lotus_system_log` VALUES ('160', '成功登陆', 'Login/login', 'demo1', null, '2018-01-02 17:54:10', '121.32.49.73', null);
INSERT INTO `lotus_system_log` VALUES ('161', '成功登陆', 'Login/login', 'admin', null, '2018-01-02 17:54:32', '111.121.45.231', null);
INSERT INTO `lotus_system_log` VALUES ('162', '成功登陆', 'Login/login', 'admin', null, '2018-01-02 17:54:34', '111.121.45.231', null);
INSERT INTO `lotus_system_log` VALUES ('163', '成功登陆', 'Login/login', 'admin', null, '2018-01-02 17:54:35', '111.121.45.231', null);
INSERT INTO `lotus_system_log` VALUES ('164', '成功登陆', 'Login/login', 'admin', null, '2018-01-02 17:54:36', '111.121.45.231', null);
INSERT INTO `lotus_system_log` VALUES ('165', '成功登陆', 'Login/login', 'admin', null, '2018-01-02 17:54:37', '111.121.45.231', null);
INSERT INTO `lotus_system_log` VALUES ('166', '成功登陆', 'Login/login', 'admin', null, '2018-01-02 17:55:01', '42.80.202.235', null);
INSERT INTO `lotus_system_log` VALUES ('167', '成功登陆', 'Login/login', 'admin', null, '2018-01-02 17:55:03', '218.75.65.122', null);
INSERT INTO `lotus_system_log` VALUES ('168', '成功登陆', 'Login/login', 'demo1', null, '2018-01-02 17:55:06', '175.188.159.150', null);
INSERT INTO `lotus_system_log` VALUES ('169', '成功登陆', 'Login/login', 'demo1', null, '2018-01-02 17:55:52', '211.138.116.133', null);
INSERT INTO `lotus_system_log` VALUES ('170', '成功登陆', 'Login/login', 'demo1', null, '2018-01-02 17:57:13', '222.209.149.52', null);
INSERT INTO `lotus_system_log` VALUES ('171', '成功登陆', 'Login/login', 'admin', null, '2018-01-02 17:59:29', '123.125.199.187', null);
INSERT INTO `lotus_system_log` VALUES ('172', '成功登陆', 'Login/login', 'admin', null, '2018-01-02 17:59:45', '112.65.48.77', null);
INSERT INTO `lotus_system_log` VALUES ('173', '成功登陆', 'Login/login', 'demo1', null, '2018-01-02 18:00:03', '183.17.225.199', null);
INSERT INTO `lotus_system_log` VALUES ('174', '成功登陆', 'Login/login', 'demo1', null, '2018-01-02 18:00:22', '61.148.245.220', null);
INSERT INTO `lotus_system_log` VALUES ('175', '成功登陆', 'Login/login', 'demo1', null, '2018-01-02 18:02:28', '218.19.98.147', null);
INSERT INTO `lotus_system_log` VALUES ('176', '成功登陆', 'Login/login', 'demo1', null, '2018-01-02 18:03:10', '183.12.50.177', null);
INSERT INTO `lotus_system_log` VALUES ('177', '成功登陆', 'Login/login', 'demo1', null, '2018-01-02 18:03:50', '36.57.160.1', null);
INSERT INTO `lotus_system_log` VALUES ('178', '成功登陆', 'Login/login', 'admin', null, '2018-01-02 18:05:34', '113.13.13.27', null);
INSERT INTO `lotus_system_log` VALUES ('179', '成功登陆', 'Login/login', 'admin', null, '2018-01-02 18:06:15', '61.148.245.72', null);
INSERT INTO `lotus_system_log` VALUES ('180', '成功登陆', 'Login/login', 'admin', null, '2018-01-02 18:08:16', '113.140.69.178', null);
INSERT INTO `lotus_system_log` VALUES ('181', '成功登陆', 'Login/login', 'demo1', null, '2018-01-02 18:08:57', '123.160.234.198', null);
INSERT INTO `lotus_system_log` VALUES ('182', '成功登陆', 'Login/login', 'demo1', null, '2018-01-02 18:10:19', '223.104.210.201', null);
INSERT INTO `lotus_system_log` VALUES ('183', '成功登陆', 'Login/login', 'demo1', null, '2018-01-02 18:10:23', '110.179.66.19', null);
INSERT INTO `lotus_system_log` VALUES ('184', '成功登陆', 'Login/login', 'admin', null, '2018-01-02 18:10:54', '117.136.70.63', null);
INSERT INTO `lotus_system_log` VALUES ('185', '成功登陆', 'Login/login', 'demo1', null, '2018-01-02 18:15:33', '113.129.136.83', null);
INSERT INTO `lotus_system_log` VALUES ('186', '成功登陆', 'Login/login', 'demo1', null, '2018-01-02 18:15:43', '58.49.42.70', null);
INSERT INTO `lotus_system_log` VALUES ('187', '成功登陆', 'Login/login', 'admin', null, '2018-01-02 18:18:38', '183.94.21.142', null);
INSERT INTO `lotus_system_log` VALUES ('188', '成功登陆', 'Login/login', 'admin', null, '2018-01-02 18:21:09', '180.136.43.122', null);
INSERT INTO `lotus_system_log` VALUES ('189', '成功登陆', 'Login/login', 'demo1', null, '2018-01-02 18:22:48', '180.136.43.122', null);
INSERT INTO `lotus_system_log` VALUES ('190', '成功登陆', 'Login/login', 'demo1', null, '2018-01-02 18:26:40', '119.4.113.124', null);
INSERT INTO `lotus_system_log` VALUES ('191', '成功登陆', 'Login/login', 'admin', null, '2018-01-02 18:27:22', '223.74.15.240', null);
INSERT INTO `lotus_system_log` VALUES ('192', '成功登陆', 'Login/login', 'demo1', null, '2018-01-02 18:27:38', '180.169.11.122', null);
INSERT INTO `lotus_system_log` VALUES ('193', '成功登陆', 'Login/login', 'demo1', null, '2018-01-02 18:28:38', '49.77.235.16', null);
INSERT INTO `lotus_system_log` VALUES ('194', '成功登陆', 'Login/login', 'demo1', null, '2018-01-02 18:34:53', '118.212.202.216', null);
INSERT INTO `lotus_system_log` VALUES ('195', '成功登陆', 'Login/login', 'admin', null, '2018-01-02 18:39:31', '39.128.248.114', null);
INSERT INTO `lotus_system_log` VALUES ('196', '成功登陆', 'Login/login', 'admin', null, '2018-01-02 18:40:11', '211.162.9.72', null);
INSERT INTO `lotus_system_log` VALUES ('197', '成功登陆', 'Login/login', 'admin', null, '2018-01-02 18:45:49', '171.212.127.139', null);
INSERT INTO `lotus_system_log` VALUES ('198', '成功登陆', 'Login/login', 'demo1', null, '2018-01-02 18:46:47', '61.174.158.223', null);
INSERT INTO `lotus_system_log` VALUES ('199', '成功登陆', 'Login/login', 'admin', null, '2018-01-02 18:56:31', '61.144.174.51', null);
INSERT INTO `lotus_system_log` VALUES ('200', '成功登陆', 'Login/login', 'admin', null, '2018-01-02 19:00:13', '223.93.170.136', null);
INSERT INTO `lotus_system_log` VALUES ('201', '成功登陆', 'Login/login', 'demo1', null, '2018-01-02 19:03:09', '115.211.81.201', null);
INSERT INTO `lotus_system_log` VALUES ('202', '成功登陆', 'Login/login', 'admin', null, '2018-01-02 19:03:12', '110.184.45.65', null);
INSERT INTO `lotus_system_log` VALUES ('203', '成功登陆', 'Login/login', 'admin', null, '2018-01-02 19:03:32', '117.11.14.231', null);
INSERT INTO `lotus_system_log` VALUES ('204', '成功登陆', 'Login/login', 'demo1', null, '2018-01-02 19:13:33', '221.218.67.196', null);
INSERT INTO `lotus_system_log` VALUES ('205', '成功登陆', 'Login/login', 'demo1', null, '2018-01-02 19:18:37', '183.251.24.57', null);
INSERT INTO `lotus_system_log` VALUES ('206', '成功登陆', 'Login/login', 'demo1', null, '2018-01-02 19:21:38', '114.94.154.161', null);
INSERT INTO `lotus_system_log` VALUES ('207', '成功登陆', 'Login/login', 'demo1', null, '2018-01-02 19:22:11', '121.34.32.105', null);
INSERT INTO `lotus_system_log` VALUES ('208', '成功登陆', 'Login/login', 'demo1', null, '2018-01-02 19:29:46', '60.13.131.22', null);
INSERT INTO `lotus_system_log` VALUES ('209', '成功登陆', 'Login/login', 'demo1', null, '2018-01-02 19:30:08', '122.96.41.124', null);
INSERT INTO `lotus_system_log` VALUES ('210', '成功登陆', 'Login/login', 'admin', null, '2018-01-02 19:33:30', '114.94.154.161', null);
INSERT INTO `lotus_system_log` VALUES ('211', '成功登陆', 'Login/login', 'demo1', null, '2018-01-02 19:40:20', '183.17.59.178', null);
INSERT INTO `lotus_system_log` VALUES ('212', '成功登陆', 'Login/login', 'demo1', null, '2018-01-02 19:41:00', '139.205.190.220', null);
INSERT INTO `lotus_system_log` VALUES ('213', '成功登陆', 'Login/login', 'demo1', null, '2018-01-02 19:54:02', '119.133.214.187', null);
INSERT INTO `lotus_system_log` VALUES ('214', '成功登陆', 'Login/login', 'demo1', null, '2018-01-02 19:58:14', '223.153.138.239', null);
INSERT INTO `lotus_system_log` VALUES ('215', '成功登陆', 'Login/login', 'demo1', null, '2018-01-02 19:58:44', '49.74.13.156', null);
INSERT INTO `lotus_system_log` VALUES ('216', '成功登陆', 'Login/login', 'admin', null, '2018-01-02 20:03:29', '101.70.215.158', null);
INSERT INTO `lotus_system_log` VALUES ('217', '成功登陆', 'Login/login', 'demo1', null, '2018-01-02 20:08:35', '113.89.236.52', null);
INSERT INTO `lotus_system_log` VALUES ('218', '成功登陆', 'Login/login', 'admin', null, '2018-01-02 20:15:41', '114.94.154.161', null);
INSERT INTO `lotus_system_log` VALUES ('219', '成功登陆', 'Login/login', 'admin', null, '2018-01-02 20:34:42', '223.166.93.184', null);
INSERT INTO `lotus_system_log` VALUES ('220', '成功登陆', 'Login/login', 'admin', null, '2018-01-02 20:36:20', '222.137.157.191', null);
INSERT INTO `lotus_system_log` VALUES ('221', '成功登陆', 'Login/login', 'admin', null, '2018-01-02 20:41:41', '182.133.251.148', null);
INSERT INTO `lotus_system_log` VALUES ('222', '成功登陆', 'Login/login', 'admin', null, '2018-01-02 21:01:48', '114.94.154.161', '中国*华东*上海市*上海市');
INSERT INTO `lotus_system_log` VALUES ('223', '成功登陆', 'Login/login', 'admin', null, '2018-01-02 21:02:55', '36.149.75.210', '中国*华东*江苏省*常州市');
INSERT INTO `lotus_system_log` VALUES ('224', '成功登陆', 'Login/login', 'admin', null, '2018-01-02 21:10:15', '110.82.110.206', '中国*华东*福建省*龙岩市');
INSERT INTO `lotus_system_log` VALUES ('225', '成功登陆', 'Login/login', 'admin', null, '2018-01-02 21:11:48', '119.137.53.79', '中国*华南*广东省*深圳市');
INSERT INTO `lotus_system_log` VALUES ('226', '成功登陆', 'Login/login', 'admin', null, '2018-01-02 21:11:59', '121.24.35.69', '中国*华北*河北省*邯郸市');
INSERT INTO `lotus_system_log` VALUES ('227', '成功登陆', 'Login/login', 'admin', null, '2018-01-02 21:12:01', '121.24.35.69', '中国*华北*河北省*邯郸市');
INSERT INTO `lotus_system_log` VALUES ('228', '成功登陆', 'Login/login', 'admin', null, '2018-01-02 21:12:18', '125.64.220.16', '中国*西南*四川省*宜宾市');
INSERT INTO `lotus_system_log` VALUES ('229', '成功登陆', 'Login/login', 'admin', null, '2018-01-02 21:13:01', '124.204.198.89', '中国*华北*北京市*北京市');
INSERT INTO `lotus_system_log` VALUES ('230', '成功登陆', 'Login/login', 'admin', null, '2018-01-02 21:13:15', '39.64.118.99', '中国*华东*山东省*济南市');
INSERT INTO `lotus_system_log` VALUES ('231', '成功登陆', 'Login/login', 'admin', null, '2018-01-02 21:13:21', '114.249.116.164', '中国*华北*北京市*北京市');
INSERT INTO `lotus_system_log` VALUES ('232', '成功登陆', 'Login/login', 'admin', null, '2018-01-02 21:13:45', '113.98.191.24', '中国*华南*广东省*东莞市');
INSERT INTO `lotus_system_log` VALUES ('233', '成功登陆', 'Login/login', 'admin', null, '2018-01-02 21:14:21', '113.98.191.24', '中国*华南*广东省*东莞市');
INSERT INTO `lotus_system_log` VALUES ('234', '成功登陆', 'Login/login', 'admin', null, '2018-01-02 21:14:26', '112.28.173.27', '中国*华东*安徽省*合肥市');
INSERT INTO `lotus_system_log` VALUES ('235', '成功登陆', 'Login/login', 'admin', null, '2018-01-02 21:14:38', '183.226.224.181', '中国*西南*重庆市*重庆市');
INSERT INTO `lotus_system_log` VALUES ('236', '成功登陆', 'Login/login', 'admin', null, '2018-01-02 21:14:51', '14.111.49.129', '中国*西南*重庆市*重庆市');
INSERT INTO `lotus_system_log` VALUES ('237', '成功登陆', 'Login/login', 'admin', null, '2018-01-02 21:15:01', '112.230.57.206', '中国*华东*山东省*济南市');
INSERT INTO `lotus_system_log` VALUES ('238', '成功登陆', 'Login/login', 'admin', null, '2018-01-02 21:15:09', '14.111.49.129', '中国*西南*重庆市*重庆市');
INSERT INTO `lotus_system_log` VALUES ('239', '成功登陆', 'Login/login', 'admin', null, '2018-01-02 21:15:17', '14.111.49.129', '中国*西南*重庆市*重庆市');
INSERT INTO `lotus_system_log` VALUES ('240', '成功登陆', 'Login/login', 'admin', null, '2018-01-02 21:16:44', '112.11.75.1', '中国*华东*浙江省*嘉兴市');
INSERT INTO `lotus_system_log` VALUES ('241', '成功登陆', 'Login/login', 'admin', null, '2018-01-02 21:17:43', '117.136.45.212', '中国*华东*江苏省*盐城市');
INSERT INTO `lotus_system_log` VALUES ('242', '成功登陆', 'Login/login', 'admin', null, '2018-01-02 21:20:54', '114.94.154.161', '中国*华东*上海市*上海市');
INSERT INTO `lotus_system_log` VALUES ('243', '成功登陆', 'Login/login', 'admin', null, '2018-01-02 21:21:11', '115.197.137.81', '中国*华东*浙江省*杭州市');
INSERT INTO `lotus_system_log` VALUES ('244', '成功登陆', 'Login/login', 'admin', null, '2018-01-02 21:27:27', '117.136.103.217', '中国*华东*安徽省*合肥市');
INSERT INTO `lotus_system_log` VALUES ('245', '成功登陆', 'Login/login', 'admin', null, '2018-01-02 21:28:42', '117.136.45.212', '中国*华东*江苏省*盐城市');
INSERT INTO `lotus_system_log` VALUES ('246', '成功登陆', 'Login/login', 'admin', null, '2018-01-02 21:35:36', '163.125.180.134', '中国*华南*广东省*深圳市');
INSERT INTO `lotus_system_log` VALUES ('247', '成功登陆', 'Login/login', 'admin', null, '2018-01-02 21:37:49', '116.8.44.115', '中国*华南*广西壮族自治区*南宁市');
INSERT INTO `lotus_system_log` VALUES ('248', '成功登陆', 'Login/login', 'admin', null, '2018-01-02 21:41:47', '58.23.17.114', '中国*华东*福建省*厦门市');
INSERT INTO `lotus_system_log` VALUES ('249', '成功登陆', 'Login/login', 'admin', null, '2018-01-02 21:42:17', '112.28.162.74', '中国*华东*安徽省*亳州市');
INSERT INTO `lotus_system_log` VALUES ('250', '成功登陆', 'Login/login', 'admin', null, '2018-01-02 21:49:51', '114.94.154.161', '中国*华东*上海市*上海市');
INSERT INTO `lotus_system_log` VALUES ('251', '成功登陆', 'Login/login', 'admin', null, '2018-01-02 21:53:33', '117.139.248.102', '中国*西南*四川省*成都市');
INSERT INTO `lotus_system_log` VALUES ('252', '成功登陆', 'Login/login', 'admin', null, '2018-01-02 21:55:06', '114.94.154.161', '中国*华东*上海市*上海市');
INSERT INTO `lotus_system_log` VALUES ('253', '成功登陆', 'Login/login', 'admin', null, '2018-01-02 21:58:00', '61.140.237.208', '中国*华南*广东省*广州市');
INSERT INTO `lotus_system_log` VALUES ('254', '成功登陆', 'Login/login', 'admin', null, '2018-01-02 21:58:24', '125.46.34.26', '中国*华中*河南省*郑州市');
INSERT INTO `lotus_system_log` VALUES ('255', '成功登陆', 'Login/login', 'admin', null, '2018-01-02 21:59:47', '112.115.129.36', '中国*西南*云南省*昆明市');
INSERT INTO `lotus_system_log` VALUES ('256', '成功登陆', 'Login/login', 'admin', null, '2018-01-02 21:59:47', '112.115.129.36', '中国*西南*云南省*昆明市');
INSERT INTO `lotus_system_log` VALUES ('257', '成功登陆', 'Login/login', 'admin', null, '2018-01-02 22:00:32', '119.117.123.202', '中国*东北*辽宁省*葫芦岛市');
INSERT INTO `lotus_system_log` VALUES ('258', '成功登陆', 'Login/login', 'admin', null, '2018-01-02 22:09:30', '58.247.150.156', '中国*华东*上海市*上海市');
INSERT INTO `lotus_system_log` VALUES ('259', '成功登陆', 'Login/login', 'admin', null, '2018-01-02 22:14:06', '59.42.207.210', '中国*华南*广东省*广州市');
INSERT INTO `lotus_system_log` VALUES ('260', '成功登陆', 'Login/login', 'admin', null, '2018-01-02 22:21:22', '183.4.40.28', '中国*华南*广东省*汕头市');
INSERT INTO `lotus_system_log` VALUES ('261', '增加用户1112332', 'AdminUser/addUser', 'admin', null, '2018-01-02 22:22:10', '183.4.40.28', '中国*华南*广东省*汕头市');
INSERT INTO `lotus_system_log` VALUES ('262', '成功登陆', 'Login/login', 'admin', null, '2018-01-02 22:23:26', '223.104.3.194', '中国*华北*北京市*北京市');
INSERT INTO `lotus_system_log` VALUES ('263', '成功登陆', 'Login/login', 'admin', null, '2018-01-02 22:27:08', '223.72.90.225', '中国*华北*北京市*北京市');
INSERT INTO `lotus_system_log` VALUES ('264', '成功登陆', 'Login/login', 'admin', null, '2018-01-02 22:29:56', '106.6.179.126', '中国*华东*江西省*南昌市');
INSERT INTO `lotus_system_log` VALUES ('265', '成功登陆', 'Login/login', 'admin', null, '2018-01-02 22:36:52', '123.162.185.147', '中国*华中*河南省*洛阳市');
INSERT INTO `lotus_system_log` VALUES ('266', '成功登陆', 'Login/login', 'admin', null, '2018-01-02 22:38:57', '111.146.28.24', '中国*华东*福建省*漳州市');
INSERT INTO `lotus_system_log` VALUES ('267', '成功登陆', 'Login/login', 'admin', null, '2018-01-02 22:39:08', '113.246.158.125', '中国*华中*湖南省*长沙市');

-- ----------------------------
-- Table structure for lotus_version
-- ----------------------------
DROP TABLE IF EXISTS `lotus_version`;
CREATE TABLE `lotus_version` (
  `id` int(11) NOT NULL,
  `name` datetime DEFAULT NULL,
  `version_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lotus_version
-- ----------------------------
