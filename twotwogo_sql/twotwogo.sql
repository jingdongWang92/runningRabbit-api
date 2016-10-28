/*
Navicat MySQL Data Transfer

Source Server         : 121.42.31.38
Source Server Version : 50173
Source Host           : 121.42.31.38:3306
Source Database       : twotwogo

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2016-09-08 10:42:00
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_activity`
-- ----------------------------
DROP TABLE IF EXISTS `t_activity`;
CREATE TABLE `t_activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(32) DEFAULT NULL COMMENT '活动名称',
  `remarks` varchar(256) DEFAULT NULL COMMENT '活动描述',
  `startDate` varchar(32) DEFAULT NULL COMMENT '开始日期',
  `endDate` varchar(32) DEFAULT NULL COMMENT '结束日期',
  `sensitivity` int(11) DEFAULT NULL COMMENT '活动灵敏度',
  `reInterval` int(11) DEFAULT NULL COMMENT '复活间隔 单位：秒',
  `integral` int(11) DEFAULT NULL COMMENT '奖励积分',
  `jl` int(11) DEFAULT NULL,
  `refreshTime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='活动表表';

-- ----------------------------
-- Records of t_activity
-- ----------------------------
INSERT INTO `t_activity` VALUES ('1', '西部动漫节', null, '2016-09-06', '2016-09-10', '-80', null, '1', '100000', '120');
INSERT INTO `t_activity` VALUES ('2', '22', null, '2016-09-06', '2016-09-14', '-80', null, '1', '100000', '120');

-- ----------------------------
-- Table structure for `t_activity_rabbit_rel`
-- ----------------------------
DROP TABLE IF EXISTS `t_activity_rabbit_rel`;
CREATE TABLE `t_activity_rabbit_rel` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `aid` varchar(32) DEFAULT NULL COMMENT '活动ID',
  `rid` varchar(256) DEFAULT NULL COMMENT '兔子ID',
  `createTime` varchar(32) DEFAULT NULL COMMENT '创建时间',
  `oid` varchar(32) DEFAULT NULL COMMENT '操作人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 COMMENT='活动兔子关系表';

-- ----------------------------
-- Records of t_activity_rabbit_rel
-- ----------------------------
INSERT INTO `t_activity_rabbit_rel` VALUES ('50', '1', '10', '2016-09-06 17:17:23', '1');
INSERT INTO `t_activity_rabbit_rel` VALUES ('51', '1', '11', '2016-09-06 17:17:27', '1');
INSERT INTO `t_activity_rabbit_rel` VALUES ('52', '1', '13', '2016-09-06 17:17:32', '1');
INSERT INTO `t_activity_rabbit_rel` VALUES ('53', '1', '12', '2016-09-06 17:17:36', '1');
INSERT INTO `t_activity_rabbit_rel` VALUES ('54', '1', '14', '2016-09-06 17:17:39', '1');
INSERT INTO `t_activity_rabbit_rel` VALUES ('55', '2', '10', '2016-09-06 17:17:46', '1');

-- ----------------------------
-- Table structure for `t_advertising`
-- ----------------------------
DROP TABLE IF EXISTS `t_advertising`;
CREATE TABLE `t_advertising` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `imgname` varchar(100) DEFAULT NULL COMMENT '图片名称',
  `imgurl` varchar(255) DEFAULT NULL COMMENT '图片跳转URL',
  `sortno` int(11) DEFAULT NULL COMMENT '排序号',
  `status` int(11) DEFAULT NULL COMMENT '图片状态',
  `name` varchar(50) DEFAULT NULL COMMENT '广告名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='广告位信息表';

-- ----------------------------
-- Records of t_advertising
-- ----------------------------

-- ----------------------------
-- Table structure for `t_coupon`
-- ----------------------------
DROP TABLE IF EXISTS `t_coupon`;
CREATE TABLE `t_coupon` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(32) DEFAULT NULL COMMENT '优惠券名称',
  `title` varchar(32) DEFAULT NULL COMMENT '优惠券标题',
  `startDate` varchar(32) DEFAULT NULL COMMENT '有效期开始',
  `endDate` varchar(32) DEFAULT NULL COMMENT '有效期结束',
  `pic` varchar(256) DEFAULT NULL COMMENT '图片地址',
  `remarks` varchar(256) DEFAULT NULL COMMENT '备注',
  `integral` int(11) DEFAULT NULL COMMENT '积分数量',
  `operatorno` int(11) DEFAULT NULL COMMENT '操作员ID',
  `act_id` int(11) DEFAULT NULL,
  `type` varchar(16) DEFAULT NULL,
  `total` int(11) DEFAULT '0',
  `stock` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='优惠券信息表';

-- ----------------------------
-- Records of t_coupon
-- ----------------------------
INSERT INTO `t_coupon` VALUES ('12', '滴滴快车代金券', '滴滴快车代金券', '2016-09-06', '2016-09-22', 'JQ_STYLE_12_1473153567081.png', null, '1', '1', '2', '滴滴快车代金券', '1000', '990');
INSERT INTO `t_coupon` VALUES ('13', '可口可乐畅饮券', '可口可乐畅饮券', '2016-09-06', '2016-09-15', 'JQ_STYLE_13_1473217504715.png', null, '2', '1', '1', '可口可乐畅饮券', '5', '3');
INSERT INTO `t_coupon` VALUES ('14', '星巴克优惠卷', '星巴克优惠卷', '2016-09-06', '2016-09-09', 'JQ_STYLE_14_1473239208872.png', null, '1', '1', '1', '星巴克优惠卷', '2', '0');

-- ----------------------------
-- Table structure for `t_leaflet`
-- ----------------------------
DROP TABLE IF EXISTS `t_leaflet`;
CREATE TABLE `t_leaflet` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(32) DEFAULT NULL COMMENT '活动名称',
  `remarks` varchar(256) DEFAULT NULL COMMENT '活动描述',
  `startDate` varchar(32) DEFAULT NULL COMMENT '开始日期',
  `endDate` varchar(32) DEFAULT NULL COMMENT '结束日期',
  `pic` varchar(256) DEFAULT NULL COMMENT '图片地址',
  `skipUrl` varchar(512) DEFAULT NULL COMMENT '点击图片后的跳转地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='广告表';

-- ----------------------------
-- Records of t_leaflet
-- ----------------------------
INSERT INTO `t_leaflet` VALUES ('2', '西部动漫节', '西部动漫节', '2016-09-07', '2016-09-30', 'GG_STYLE_2_1473217322268.png', 'https://mp.weixin.qq.com/s?__biz=MzAwOTUzMzY4OQ==&mid=309617905&idx=1&sn=21dc3c711bef244689a160fb45acba11&scene=1&srcid=09077xftgn9YWmEO1m0FbFMo&key=7b81aac53bd2393d2bd47e407fb7720a54a30b8672f94e3b4a86b11f42586f21972a5e85b1dff315915d9664b0190832&ascene=0&uin=MjUwMjI2NTM2MQ%3D%3D&devicetype=iMac+MacBookPro11%2C2+OSX+OSX+10.11.6+build');

-- ----------------------------
-- Table structure for `t_operate_log`
-- ----------------------------
DROP TABLE IF EXISTS `t_operate_log`;
CREATE TABLE `t_operate_log` (
  `logno` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(50) NOT NULL,
  `operatetime` varchar(23) NOT NULL,
  `operatetype` varchar(40) NOT NULL,
  `description` varchar(255) NOT NULL,
  `ipaddress` varchar(20) DEFAULT NULL,
  `schoolcode` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`logno`),
  KEY `idx_operate_log_operatetime` (`operatetime`),
  KEY `idx_operate_log_operateno` (`operatetype`)
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_operate_log
-- ----------------------------
INSERT INTO `t_operate_log` VALUES ('1', 'admin', '2016-08-26 11:53:33', '2001', '管理员 [admin] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('2', 'admin', '2016-08-26 13:32:54', '2001', '管理员 [admin] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('3', 'admin', '2016-08-26 14:05:16', '2001', '管理员 [admin] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('4', 'admin', '2016-08-26 14:12:07', '2001', '管理员 [admin] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('5', 'admin', '2016-08-26 14:15:28', '2001', '管理员 [admin] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('6', 'admin', '2016-08-26 14:19:21', '2001', '管理员 [admin] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('7', 'admin', '2016-08-26 15:01:59', '2001', '管理员 [admin] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('8', 'admin', '2016-08-26 15:12:05', '2001', '管理员 [admin] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('9', 'admin', '2016-08-26 15:13:10', '2001', '管理员 [admin] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('10', 'admin', '2016-08-26 15:27:39', '2001', '管理员 [admin] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('11', 'admin', '2016-08-26 15:36:39', '2001', '管理员 [admin] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('12', 'admin', '2016-08-26 15:48:30', '2001', '管理员 [admin] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('13', 'admin', '2016-08-26 16:12:07', '2001', '管理员 [admin] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('14', 'admin', '2016-08-26 17:15:28', '2001', '管理员 [admin] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('15', 'admin', '2016-08-26 17:29:05', '2001', '管理员 [admin] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('16', 'admin', '2016-08-26 17:58:18', '2001', '管理员 [admin] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('17', 'admin', '2016-08-26 18:44:40', '2001', '管理员 [admin] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('18', 'admin', '2016-08-27 10:07:34', '2001', '管理员 [admin] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('19', 'admin', '2016-08-27 10:21:52', '2001', '管理员 [admin] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('20', 'admin', '2016-08-27 10:35:13', '2001', '管理员 [admin] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('21', 'admin', '2016-08-27 10:40:49', '2001', '管理员 [admin] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('22', 'admin', '2016-08-27 10:58:57', '2001', '管理员 [admin] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('23', 'admin', '2016-08-27 11:06:51', '2001', '管理员 [admin] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('24', 'admin', '2016-08-27 13:51:57', '2001', '管理员 [admin] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('25', 'admin', '2016-08-27 14:00:30', '2001', '管理员 [admin] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('26', 'admin', '2016-08-27 14:15:47', '2001', '管理员 [admin] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('27', 'admin', '2016-08-27 14:29:41', '2001', '管理员 [admin] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('28', 'admin', '2016-08-27 14:49:36', '2001', '管理员 [admin] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('29', 'admin', '2016-08-27 15:04:01', '2001', '管理员 [admin] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('30', 'admin', '2016-08-27 15:08:36', '2004', '管理员 [admin] 新增角色 [商家][成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('31', 'admin', '2016-08-27 15:09:10', '2007', '管理员 [admin] 新增用户 [13527502075][失败]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('32', 'admin', '2016-08-27 15:11:16', '2001', '管理员 [admin] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('33', 'admin', '2016-08-27 15:12:15', '2001', '管理员 [admin] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('34', 'admin', '2016-08-27 15:12:20', '2007', '管理员 [admin] 新增用户 [13527502075][成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('35', '13527502075', '2016-08-27 15:12:38', '2001', '管理员 [13527502075] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('36', 'admin', '2016-08-27 15:14:34', '2001', '管理员 [admin] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('37', 'admin', '2016-08-27 15:22:06', '2001', '管理员 [admin] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('38', 'shanghu', '2016-08-27 15:23:55', '2001', '管理员 [shanghu] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('39', 'admin', '2016-08-27 15:24:58', '2001', '管理员 [admin] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('40', 'shanghu', '2016-08-27 15:36:16', '2001', '管理员 [shanghu] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('41', 'shanghu', '2016-08-27 15:37:02', '2001', '管理员 [shanghu] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('42', 'admin', '2016-08-27 15:41:01', '2001', '管理员 [admin] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('43', 'shanghu', '2016-08-27 15:55:54', '2001', '管理员 [shanghu] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('44', 'admin', '2016-08-27 15:57:06', '2001', '管理员 [admin] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('45', 'admin', '2016-08-27 08:31:37', '2001', '管理员 [admin] 登录 [成功]', '172.17.0.1', null);
INSERT INTO `t_operate_log` VALUES ('46', 'admin', '2016-08-28 05:10:26', '2001', '管理员 [admin] 登录 [成功]', '27.10.150.119', null);
INSERT INTO `t_operate_log` VALUES ('47', 'admin', '2016-08-28 05:10:27', '2001', '管理员 [admin] 登录 [成功]', '27.10.150.119', null);
INSERT INTO `t_operate_log` VALUES ('48', 'admin', '2016-08-28 06:40:32', '2001', '管理员 [admin] 登录 [成功]', '27.10.150.119', null);
INSERT INTO `t_operate_log` VALUES ('49', 'admin', '2016-08-29 11:38:15', '2001', '管理员 [admin] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('50', 'admin', '2016-08-29 15:11:59', '2001', '管理员 [admin] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('51', 'admin', '2016-08-29 15:17:16', '2001', '管理员 [admin] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('52', 'admin', '2016-08-29 15:20:29', '2001', '管理员 [admin] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('53', 'admin', '2016-08-29 15:32:33', '2001', '管理员 [admin] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('54', 'admin', '2016-08-29 16:04:09', '2001', '管理员 [admin] 登录 [成功]', '192.168.1.43', null);
INSERT INTO `t_operate_log` VALUES ('55', 'admin', '2016-08-29 16:14:52', '2001', '管理员 [admin] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('56', 'admin', '2016-08-29 16:35:18', '2001', '管理员 [admin] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('57', 'shanghu', '2016-08-29 16:37:38', '2001', '管理员 [shanghu] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('58', 'admin', '2016-08-29 16:40:22', '2001', '管理员 [admin] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('59', 'shanghu', '2016-08-29 16:42:40', '2001', '管理员 [shanghu] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('60', 'admin', '2016-08-29 16:43:33', '2001', '管理员 [admin] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('61', 'admin', '2016-08-29 16:47:12', '2006', '管理员 [admin] 删除角色 [][]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('62', 'admin', '2016-08-29 17:01:30', '2001', '管理员 [admin] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('63', 'admin', '2016-09-03 14:43:46', '2001', '管理员 [admin] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('64', 'admin', '2016-09-03 14:46:24', '2001', '管理员 [admin] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('65', 'admin', '2016-09-03 17:40:07', '2001', '管理员 [admin] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('66', 'admin', '2016-09-03 19:23:23', '2001', '管理员 [admin] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('67', 'admin', '2016-09-03 19:58:04', '2001', '管理员 [admin] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('68', 'admin', '2016-09-03 19:58:29', '2001', '管理员 [admin] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('69', 'admin', '2016-09-03 20:10:20', '2001', '管理员 [admin] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('70', 'admin', '2016-09-03 20:11:53', '2001', '管理员 [admin] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('71', 'admin', '2016-09-03 20:39:42', '2001', '管理员 [admin] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('72', 'admin', '2016-09-03 21:06:24', '2001', '管理员 [admin] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('73', 'admin', '2016-09-03 21:10:24', '2001', '管理员 [admin] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('74', 'admin', '2016-09-03 21:30:38', '2001', '管理员 [admin] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('75', 'admin', '2016-09-03 21:49:23', '2001', '管理员 [admin] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('76', 'admin', '2016-09-03 22:21:02', '2001', '管理员 [admin] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('77', 'admin', '2016-09-04 16:40:59', '2001', '管理员 [admin] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('78', 'admin', '2016-09-04 16:51:04', '2001', '管理员 [admin] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('79', 'admin', '2016-09-04 17:08:02', '2001', '管理员 [admin] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('80', 'admin', '2016-09-05 11:50:28', '2001', '管理员 [admin] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('81', 'admin', '2016-09-05 13:41:41', '2001', '管理员 [admin] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('82', 'admin', '2016-09-05 13:59:09', '2001', '管理员 [admin] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('83', 'admin', '2016-09-05 14:15:00', '2001', '管理员 [admin] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('84', 'admin', '2016-09-05 14:26:35', '2001', '管理员 [admin] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('85', 'admin', '2016-09-05 14:52:14', '2001', '管理员 [admin] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('86', 'admin', '2016-09-05 15:09:18', '2001', '管理员 [admin] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('87', 'admin', '2016-09-05 15:14:53', '2001', '管理员 [admin] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('88', 'shanghu', '2016-09-05 15:15:25', '2001', '管理员 [shanghu] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('89', 'admin', '2016-09-05 15:17:18', '2001', '管理员 [admin] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('90', 'admin', '2016-09-05 15:44:53', '2001', '管理员 [admin] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('91', 'shanghu', '2016-09-05 15:45:12', '2001', '管理员 [shanghu] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('92', 'shanghu', '2016-09-05 15:46:48', '2001', '管理员 [shanghu] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('93', 'admin', '2016-09-05 15:49:15', '2001', '管理员 [admin] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('94', 'admin', '2016-09-05 18:29:14', '2001', '管理员 [admin] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('95', 'admin', '2016-09-06 12:43:23', '2001', '管理员 [admin] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('96', 'admin', '2016-09-06 12:46:13', '2001', '管理员 [admin] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('97', 'admin', '2016-09-06 12:50:27', '2001', '管理员 [admin] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('98', 'admin', '2016-09-06 12:52:08', '2001', '管理员 [admin] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('99', 'admin', '2016-09-06 12:56:09', '2001', '管理员 [admin] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('100', 'admin', '2016-09-06 13:02:27', '2001', '管理员 [admin] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('101', 'admin', '2016-09-06 13:05:48', '2001', '管理员 [admin] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('102', 'admin', '2016-09-06 13:20:30', '2001', '管理员 [admin] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('103', 'admin', '2016-09-06 13:32:25', '2001', '管理员 [admin] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('104', 'admin', '2016-09-06 13:39:39', '2001', '管理员 [admin] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('105', 'admin', '2016-09-06 13:46:47', '2001', '管理员 [admin] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('106', 'admin', '2016-09-06 13:52:38', '2001', '管理员 [admin] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('107', 'admin', '2016-09-06 13:55:38', '2001', '管理员 [admin] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('108', 'admin', '2016-09-06 14:00:14', '2001', '管理员 [admin] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('109', 'admin', '2016-09-06 14:19:33', '2001', '管理员 [admin] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('110', 'shanghu', '2016-09-06 14:21:15', '2001', '管理员 [shanghu] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('111', 'admin', '2016-09-06 14:37:22', '2001', '管理员 [admin] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('112', 'admin', '2016-09-06 15:12:39', '2001', '管理员 [admin] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('113', 'admin', '2016-09-06 15:21:54', '2001', '管理员 [admin] 登录 [成功]', '192.168.1.43', null);
INSERT INTO `t_operate_log` VALUES ('114', 'admin', '2016-09-06 15:25:38', '2001', '管理员 [admin] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('115', 'admin', '2016-09-06 15:36:00', '2001', '管理员 [admin] 登录 [成功]', '192.168.1.43', null);
INSERT INTO `t_operate_log` VALUES ('116', 'admin', '2016-09-06 15:48:14', '2001', '管理员 [admin] 登录 [成功]', '192.168.1.43', null);
INSERT INTO `t_operate_log` VALUES ('117', 'admin', '2016-09-06 16:50:30', '2001', '管理员 [admin] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('118', 'admin', '2016-09-06 16:52:09', '2001', '管理员 [admin] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('119', 'admin', '2016-09-06 17:01:51', '2001', '管理员 [admin] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('120', 'admin', '2016-09-06 17:15:45', '2001', '管理员 [admin] 登录 [成功]', '192.168.1.43', null);
INSERT INTO `t_operate_log` VALUES ('121', 'admin', '2016-09-06 17:39:35', '2001', '管理员 [admin] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('122', 'admin', '2016-09-06 18:16:17', '2001', '管理员 [admin] 登录 [成功]', '192.168.1.43', null);
INSERT INTO `t_operate_log` VALUES ('123', 'admin', '2016-09-06 18:22:16', '2001', '管理员 [admin] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('124', 'admin', '2016-09-06 18:26:18', '2001', '管理员 [admin] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('125', 'admin', '2016-09-06 11:28:04', '2001', '管理员 [admin] 登录 [成功]', '58.17.246.125', null);
INSERT INTO `t_operate_log` VALUES ('126', 'admin', '2016-09-06 19:41:07', '2001', '管理员 [admin] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('127', 'admin', '2016-09-06 19:56:38', '2003', '管理员 [admin] 修改系统参数 参数代码[][成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('128', 'admin', '2016-09-06 20:07:59', '2001', '管理员 [admin] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('129', 'admin', '2016-09-06 20:11:50', '2001', '管理员 [admin] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('130', 'admin', '2016-09-06 20:14:51', '2001', '管理员 [admin] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('131', 'admin', '2016-09-06 20:17:04', '2003', '管理员 [admin] 修改系统参数 参数代码[share.title][成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('132', 'admin', '2016-09-06 20:18:25', '2003', '管理员 [admin] 修改系统参数 参数代码[share.url][成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('133', 'admin', '2016-09-06 20:18:43', '2003', '管理员 [admin] 修改系统参数 参数代码[][成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('134', 'admin', '2016-09-06 20:22:22', '2001', '管理员 [admin] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('135', 'admin', '2016-09-06 20:22:53', '2003', '管理员 [admin] 修改系统参数 参数代码[][成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('136', 'admin', '2016-09-07 02:48:27', '2001', '管理员 [admin] 登录 [成功]', '58.17.246.126', null);
INSERT INTO `t_operate_log` VALUES ('137', 'admin', '2016-09-07 02:55:18', '2001', '管理员 [admin] 登录 [成功]', '58.17.246.126', null);
INSERT INTO `t_operate_log` VALUES ('138', 'admin', '2016-09-07 04:39:56', '2001', '管理员 [admin] 登录 [成功]', '58.17.246.126', null);
INSERT INTO `t_operate_log` VALUES ('139', 'admin', '2016-09-07 04:41:29', '2003', '管理员 [admin] 修改系统参数 参数代码[share.url][失败]', '58.17.246.126', null);
INSERT INTO `t_operate_log` VALUES ('140', 'admin', '2016-09-07 05:05:07', '2003', '管理员 [admin] 修改系统参数 参数代码[share.url][成功]', '58.17.246.126', null);
INSERT INTO `t_operate_log` VALUES ('141', 'admin', '2016-09-07 08:21:09', '2001', '管理员 [admin] 登录 [成功]', '58.17.246.126', null);
INSERT INTO `t_operate_log` VALUES ('142', 'admin', '2016-09-07 08:57:24', '2001', '管理员 [admin] 登录 [成功]', '58.17.246.126', null);
INSERT INTO `t_operate_log` VALUES ('143', 'admin', '2016-09-07 08:59:32', '2001', '管理员 [admin] 登录 [失败]', '58.17.246.126', null);
INSERT INTO `t_operate_log` VALUES ('144', 'admin', '2016-09-07 08:59:43', '2001', '管理员 [admin] 登录 [成功]', '58.17.246.126', null);
INSERT INTO `t_operate_log` VALUES ('145', 'admin', '2016-09-07 09:04:14', '2001', '管理员 [admin] 登录 [成功]', '58.17.246.126', null);
INSERT INTO `t_operate_log` VALUES ('146', 'admin', '2016-09-08 01:53:08', '2001', '管理员 [admin] 登录 [成功]', '58.17.246.126', null);
INSERT INTO `t_operate_log` VALUES ('147', 'admin', '2016-09-08 02:03:54', '2001', '管理员 [admin] 登录 [成功]', '58.17.252.175', null);
INSERT INTO `t_operate_log` VALUES ('148', 'admin', '2016-09-08 10:20:40', '2001', '管理员 [admin] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('149', 'admin', '2016-09-08 10:32:20', '2001', '管理员 [admin] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('150', 'admin', '2016-09-08 10:34:58', '2001', '管理员 [admin] 登录 [成功]', '127.0.0.1', null);
INSERT INTO `t_operate_log` VALUES ('151', 'admin', '2016-09-08 10:37:41', '2001', '管理员 [admin] 登录 [成功]', '127.0.0.1', null);

-- ----------------------------
-- Table structure for `t_operator`
-- ----------------------------
DROP TABLE IF EXISTS `t_operator`;
CREATE TABLE `t_operator` (
  `operatorno` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `account` varchar(20) NOT NULL COMMENT '手机号注册，作为帐号',
  `password` varchar(32) NOT NULL,
  `operatorname` varchar(50) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `createno` int(11) NOT NULL,
  `roleno` int(11) NOT NULL,
  `levelcode` varchar(20) DEFAULT NULL,
  `createtime` varchar(23) DEFAULT NULL,
  `schoolcode` varchar(100) DEFAULT NULL COMMENT '所属驾校编码',
  `operatortype` int(11) DEFAULT '0' COMMENT '操作类型：0平台用户 1驾校用户',
  `status` int(11) DEFAULT '1' COMMENT '操作员状态',
  `pic` varchar(128) DEFAULT NULL,
  `address` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`operatorno`),
  UNIQUE KEY `idx_operator_account` (`account`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_operator
-- ----------------------------
INSERT INTO `t_operator` VALUES ('1', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin', '00000000000', '1', '1', '000', '2016-05-01 10:10:10', null, '0', '1', 'OH_STYLE_1_1472283353975.jpg', '麒麟座');
INSERT INTO `t_operator` VALUES ('2', 'shanghu', '21232f297a57a5a743894a0e4a801fc3', '商户', '13111111111', '1', '2', '000', '2016-05-01 10:10:10', null, '0', '1', 'OH_STYLE_2_1472282665493.png', '重庆市渝北区');

-- ----------------------------
-- Table structure for `t_privinfo`
-- ----------------------------
DROP TABLE IF EXISTS `t_privinfo`;
CREATE TABLE `t_privinfo` (
  `privno` int(11) NOT NULL,
  `privname` varchar(255) DEFAULT NULL,
  `privdesc` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_privinfo
-- ----------------------------
INSERT INTO `t_privinfo` VALUES ('101', '我的信息', '我的信息');
INSERT INTO `t_privinfo` VALUES ('102', '奖券管理', '奖券管理');
INSERT INTO `t_privinfo` VALUES ('103', '奖券核销', '奖券核销');
INSERT INTO `t_privinfo` VALUES ('201', '活动管理', '活动管理');
INSERT INTO `t_privinfo` VALUES ('202', '兔子管理', '兔子管理');
INSERT INTO `t_privinfo` VALUES ('203', '用户管理', '用户管理');
INSERT INTO `t_privinfo` VALUES ('301', '全局设置', '全局设置');
INSERT INTO `t_privinfo` VALUES ('302', '角色管理', '角色管理');
INSERT INTO `t_privinfo` VALUES ('303', '操作员管理', '操作员管理');
INSERT INTO `t_privinfo` VALUES ('200', '广告管理', '广告管理');

-- ----------------------------
-- Table structure for `t_privinfo_operation`
-- ----------------------------
DROP TABLE IF EXISTS `t_privinfo_operation`;
CREATE TABLE `t_privinfo_operation` (
  `operno` int(11) NOT NULL,
  `privno` int(11) NOT NULL,
  `opername` varchar(255) DEFAULT NULL,
  `operdesc` varchar(255) DEFAULT NULL,
  `url` varchar(512) NOT NULL,
  PRIMARY KEY (`operno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_privinfo_operation
-- ----------------------------
INSERT INTO `t_privinfo_operation` VALUES ('1010', '101', null, null, 'myOperator_toList|toDetail');
INSERT INTO `t_privinfo_operation` VALUES ('1011', '101', null, null, 'myOperator_*');
INSERT INTO `t_privinfo_operation` VALUES ('1020', '102', null, null, 'coupon_toList|toDetail');
INSERT INTO `t_privinfo_operation` VALUES ('1021', '102', null, null, 'coupon_*');
INSERT INTO `t_privinfo_operation` VALUES ('1030', '103', null, null, 'useCoupon_toList|toDetail');
INSERT INTO `t_privinfo_operation` VALUES ('1031', '103', null, null, 'useCoupon_*');
INSERT INTO `t_privinfo_operation` VALUES ('2000', '200', null, null, 'leaflet_toList|toDetail');
INSERT INTO `t_privinfo_operation` VALUES ('2001', '200', null, null, 'leaflet_*');
INSERT INTO `t_privinfo_operation` VALUES ('2010', '201', null, null, 'activity_toList|toDetail');
INSERT INTO `t_privinfo_operation` VALUES ('2011', '201', null, null, 'activity_*');
INSERT INTO `t_privinfo_operation` VALUES ('2020', '202', null, null, 'rabbit_toList|toDetail');
INSERT INTO `t_privinfo_operation` VALUES ('2021', '202', null, null, 'rabbit_*');
INSERT INTO `t_privinfo_operation` VALUES ('2030', '203', null, null, 'user_toList|toDetail');
INSERT INTO `t_privinfo_operation` VALUES ('2031', '203', null, null, 'user_*');
INSERT INTO `t_privinfo_operation` VALUES ('3010', '301', null, null, 'globalSet_toList|toDetail');
INSERT INTO `t_privinfo_operation` VALUES ('3011', '301', null, null, 'globalSet_*');
INSERT INTO `t_privinfo_operation` VALUES ('3020', '302', null, null, 'role_toList|toDetail');
INSERT INTO `t_privinfo_operation` VALUES ('3021', '302', null, null, 'role_*');
INSERT INTO `t_privinfo_operation` VALUES ('3030', '303', null, null, 'operator_toList|toDetail');
INSERT INTO `t_privinfo_operation` VALUES ('3031', '303', null, null, 'operator_*');

-- ----------------------------
-- Table structure for `t_rabbit`
-- ----------------------------
DROP TABLE IF EXISTS `t_rabbit`;
CREATE TABLE `t_rabbit` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `x` varchar(32) DEFAULT NULL COMMENT 'X坐标',
  `y` varchar(32) DEFAULT NULL COMMENT 'Y坐标',
  `uuid` varchar(64) DEFAULT NULL,
  `major` varchar(64) DEFAULT NULL,
  `minor` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='兔子信息表';

-- ----------------------------
-- Records of t_rabbit
-- ----------------------------
INSERT INTO `t_rabbit` VALUES ('10', '106.514575', '29.547492', 'A640BA53-68A6-4A9B-80AE-6F3E8E59D31F', '65533', '1');
INSERT INTO `t_rabbit` VALUES ('11', '106.507279', '29.533883', 'A640BA53-68A6-4A9B-80AE-6F3E8E59D31F', '65533', '2');
INSERT INTO `t_rabbit` VALUES ('12', '106.504275', '29.539876', 'A640BA53-68A6-4A9B-80AE-6F3E8E59D31F', '65533', '3');
INSERT INTO `t_rabbit` VALUES ('13', '106.499211', '29.537188', 'A640BA53-68A6-4A9B-80AE-6F3E8E59D31F', '65533', '4');
INSERT INTO `t_rabbit` VALUES ('14', '106.506335', '29.528375', 'A640BA53-68A6-4A9B-80AE-6F3E8E59D31F', '65533', '5');

-- ----------------------------
-- Table structure for `t_rabbit_record`
-- ----------------------------
DROP TABLE IF EXISTS `t_rabbit_record`;
CREATE TABLE `t_rabbit_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `userId` int(11) DEFAULT NULL COMMENT '用户ID',
  `rabbitId` int(11) DEFAULT NULL COMMENT '兔子ID',
  `integral` int(11) DEFAULT NULL COMMENT '获得积分',
  `createTime` varchar(32) DEFAULT NULL COMMENT '创建时间',
  `activityId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8 COMMENT='抓取兔子记录表';

-- ----------------------------
-- Records of t_rabbit_record
-- ----------------------------
INSERT INTO `t_rabbit_record` VALUES ('48', '10', '14', '1', '2016-09-06 17:18:20', '1');
INSERT INTO `t_rabbit_record` VALUES ('49', '15', '14', '1', '2016-09-06 17:33:51', '1');
INSERT INTO `t_rabbit_record` VALUES ('50', '16', '10', '1', '2016-09-06 17:41:26', '2');
INSERT INTO `t_rabbit_record` VALUES ('51', '16', '10', '1', '2016-09-06 17:41:35', '2');
INSERT INTO `t_rabbit_record` VALUES ('52', '16', '10', '1', '2016-09-06 17:42:26', '1');
INSERT INTO `t_rabbit_record` VALUES ('53', '16', '14', '1', '2016-09-06 17:43:23', '1');
INSERT INTO `t_rabbit_record` VALUES ('54', '15', '14', '1', '2016-09-06 17:43:28', '1');
INSERT INTO `t_rabbit_record` VALUES ('55', '16', '14', '1', '2016-09-06 17:43:30', '1');
INSERT INTO `t_rabbit_record` VALUES ('56', '15', '14', '1', '2016-09-06 17:43:34', '1');
INSERT INTO `t_rabbit_record` VALUES ('57', '15', '14', '1', '2016-09-06 17:43:42', '1');
INSERT INTO `t_rabbit_record` VALUES ('58', '15', '10', '1', '2016-09-06 17:45:24', '2');
INSERT INTO `t_rabbit_record` VALUES ('59', '15', '10', '1', '2016-09-06 18:15:10', '1');
INSERT INTO `t_rabbit_record` VALUES ('60', '9', '14', '1', '2016-09-06 18:36:59', '1');
INSERT INTO `t_rabbit_record` VALUES ('61', '9', '14', '1', '2016-09-06 18:37:05', '1');
INSERT INTO `t_rabbit_record` VALUES ('62', '9', '14', '1', '2016-09-06 18:37:56', '1');
INSERT INTO `t_rabbit_record` VALUES ('63', '17', '14', '1', '2016-09-06 19:12:02', '1');
INSERT INTO `t_rabbit_record` VALUES ('64', '9', '14', '1', '2016-09-06 11:29:57', '1');
INSERT INTO `t_rabbit_record` VALUES ('65', '18', '14', '1', '2016-09-06 11:32:42', '1');
INSERT INTO `t_rabbit_record` VALUES ('66', '18', '10', '1', '2016-09-06 11:33:39', '2');
INSERT INTO `t_rabbit_record` VALUES ('67', '9', '14', '1', '2016-09-06 13:25:35', '1');
INSERT INTO `t_rabbit_record` VALUES ('68', '19', '10', '1', '2016-09-07 02:20:57', '2');
INSERT INTO `t_rabbit_record` VALUES ('69', '19', '12', '1', '2016-09-07 03:09:45', '1');
INSERT INTO `t_rabbit_record` VALUES ('70', '19', '12', '1', '2016-09-07 03:09:49', '1');
INSERT INTO `t_rabbit_record` VALUES ('71', '19', '12', '1', '2016-09-07 03:09:55', '1');
INSERT INTO `t_rabbit_record` VALUES ('72', '13', '13', '1', '2016-09-07 07:20:56', '1');
INSERT INTO `t_rabbit_record` VALUES ('73', '13', '13', '1', '2016-09-07 07:21:04', '1');
INSERT INTO `t_rabbit_record` VALUES ('74', '13', '12', '1', '2016-09-07 07:21:32', '1');

-- ----------------------------
-- Table structure for `t_role`
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `roleno` int(11) NOT NULL AUTO_INCREMENT,
  `rolename` varchar(255) DEFAULT NULL,
  `roledesc` varchar(255) DEFAULT NULL,
  `operatorno` int(11) DEFAULT NULL,
  PRIMARY KEY (`roleno`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('1', '超级管理员', '超级管理员', '1');
INSERT INTO `t_role` VALUES ('2', '商户管理员', '商户管理员', '2');

-- ----------------------------
-- Table structure for `t_role_oper`
-- ----------------------------
DROP TABLE IF EXISTS `t_role_oper`;
CREATE TABLE `t_role_oper` (
  `roleno` int(11) NOT NULL,
  `operno` int(11) NOT NULL,
  UNIQUE KEY `idx_role_priv` (`roleno`,`operno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role_oper
-- ----------------------------
INSERT INTO `t_role_oper` VALUES ('1', '1010');
INSERT INTO `t_role_oper` VALUES ('1', '1011');
INSERT INTO `t_role_oper` VALUES ('1', '1020');
INSERT INTO `t_role_oper` VALUES ('1', '1021');
INSERT INTO `t_role_oper` VALUES ('1', '1030');
INSERT INTO `t_role_oper` VALUES ('1', '1031');
INSERT INTO `t_role_oper` VALUES ('1', '2000');
INSERT INTO `t_role_oper` VALUES ('1', '2001');
INSERT INTO `t_role_oper` VALUES ('1', '2010');
INSERT INTO `t_role_oper` VALUES ('1', '2011');
INSERT INTO `t_role_oper` VALUES ('1', '2020');
INSERT INTO `t_role_oper` VALUES ('1', '2021');
INSERT INTO `t_role_oper` VALUES ('1', '2030');
INSERT INTO `t_role_oper` VALUES ('1', '2031');
INSERT INTO `t_role_oper` VALUES ('1', '3010');
INSERT INTO `t_role_oper` VALUES ('1', '3011');
INSERT INTO `t_role_oper` VALUES ('1', '3020');
INSERT INTO `t_role_oper` VALUES ('1', '3021');
INSERT INTO `t_role_oper` VALUES ('1', '3030');
INSERT INTO `t_role_oper` VALUES ('1', '3031');
INSERT INTO `t_role_oper` VALUES ('2', '1010');
INSERT INTO `t_role_oper` VALUES ('2', '1011');
INSERT INTO `t_role_oper` VALUES ('2', '1020');
INSERT INTO `t_role_oper` VALUES ('2', '1021');
INSERT INTO `t_role_oper` VALUES ('2', '1030');
INSERT INTO `t_role_oper` VALUES ('2', '1031');

-- ----------------------------
-- Table structure for `t_rolegroup`
-- ----------------------------
DROP TABLE IF EXISTS `t_rolegroup`;
CREATE TABLE `t_rolegroup` (
  `privgroupno` int(11) NOT NULL,
  `privgroupname` varchar(255) DEFAULT NULL,
  `privgroupdesc` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_rolegroup
-- ----------------------------
INSERT INTO `t_rolegroup` VALUES ('1', '商户管理', '商户管理');
INSERT INTO `t_rolegroup` VALUES ('2', '后台管理', '后台管理');
INSERT INTO `t_rolegroup` VALUES ('3', '系统管理', '系统管理');

-- ----------------------------
-- Table structure for `t_roles_relate`
-- ----------------------------
DROP TABLE IF EXISTS `t_roles_relate`;
CREATE TABLE `t_roles_relate` (
  `privgroupno` int(11) NOT NULL,
  `privno` int(11) NOT NULL,
  UNIQUE KEY `idx_roles_relate` (`privgroupno`,`privno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_roles_relate
-- ----------------------------
INSERT INTO `t_roles_relate` VALUES ('1', '101');
INSERT INTO `t_roles_relate` VALUES ('1', '102');
INSERT INTO `t_roles_relate` VALUES ('1', '103');
INSERT INTO `t_roles_relate` VALUES ('2', '200');
INSERT INTO `t_roles_relate` VALUES ('2', '201');
INSERT INTO `t_roles_relate` VALUES ('2', '202');
INSERT INTO `t_roles_relate` VALUES ('2', '203');
INSERT INTO `t_roles_relate` VALUES ('3', '301');
INSERT INTO `t_roles_relate` VALUES ('3', '302');
INSERT INTO `t_roles_relate` VALUES ('3', '303');

-- ----------------------------
-- Table structure for `t_syscfg`
-- ----------------------------
DROP TABLE IF EXISTS `t_syscfg`;
CREATE TABLE `t_syscfg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paramname` varchar(40) NOT NULL,
  `paramcode` varchar(50) NOT NULL,
  `paramtype` int(1) NOT NULL COMMENT '0数字，1字符串',
  `paramvalue` varchar(255) NOT NULL,
  `min` int(10) DEFAULT NULL,
  `max` int(10) DEFAULT NULL COMMENT '数字是最大值，字符串是最大长度',
  `paramdesc` varchar(255) DEFAULT NULL,
  `paramflag` int(1) NOT NULL,
  `defaultvalue` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_syscfg_paramcode` (`paramcode`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_syscfg
-- ----------------------------
INSERT INTO `t_syscfg` VALUES ('1', 'app分享的标题', 'share.title', '1', '快来抓兔子~', null, null, 'app分享的标题', '1', '');
INSERT INTO `t_syscfg` VALUES ('2', 'app分享的链接', 'share.url', '1', 'http://dwz.cn/46cIrI', null, null, 'app分享的链接', '1', '');
INSERT INTO `t_syscfg` VALUES ('3', 'JPush推送MasterSecret', 'jpush.master.secret', '1', 'a813b4c1aa813c0a4232a456', null, null, 'JPush推送MasterSecret', '1', 'a813b4c1aa813c0a4232a456');
INSERT INTO `t_syscfg` VALUES ('4', 'JPush推送AppKey', 'jpush.app.key', '1', '09f870b5f995812fe3c7ec90', null, null, 'JPush推送AppKey', '1', '09f870b5f995812fe3c7ec90');
INSERT INTO `t_syscfg` VALUES ('5', '七牛空间地址', 'qiniu.api.domain', '1', 'http://7xu5fh.com2.z0.glb.qiniucdn.com', null, null, '七牛空间地址', '1', 'http://7xu5fh.com2.z0.glb.qiniucdn.com');
INSERT INTO `t_syscfg` VALUES ('6', '七牛空间名称', 'qiniu.api.space.name', '1', 'jcnetwork', null, null, '七牛空间名称', '1', 'jcnetwork');
INSERT INTO `t_syscfg` VALUES ('7', '七牛空间AccessKey', 'qiniu.api.accessKey', '1', 'IFA07UP_aluyU9bnPDVN89p56CEeIwr_v2Vt2qa5', null, null, '七牛空间AccessKey', '1', 'IFA07UP_aluyU9bnPDVN89p56CEeIwr_v2Vt2qa5');
INSERT INTO `t_syscfg` VALUES ('8', '七牛空间SecretKey', 'qiniu.api.secretKey', '1', 'dkVIO0IcDWDewFKpgIGsaQfGHYX-kdaBjW8sfnPU', null, null, '七牛空间SecretKey', '1', 'dkVIO0IcDWDewFKpgIGsaQfGHYX-kdaBjW8sfnPU');
INSERT INTO `t_syscfg` VALUES ('9', '七牛空间AccessToken失效时间(MS)', 'qiniu.api.expires', '0', '5000', null, null, '七牛空间AccessToken失效时间(MS)', '1', '5000');
INSERT INTO `t_syscfg` VALUES ('10', '七牛回调模式回调地址', 'qiniu.service.server.callback.url', '1', 'http://127.0.0.1:8080/yo_server/;http://127.0.0.1:8081/yo_server/', null, null, '七牛回调模式回调地址', '1', 'http://127.0.0.1:8080/yo_server/;http://127.0.0.1:8081/yo_server/');
INSERT INTO `t_syscfg` VALUES ('11', '七牛回调模式回调HOST', 'qiniu.service.server.callback.host', '1', 'www.jiachong.com', null, null, '七牛回调模式回调HOST', '1', 'www.jiachong.com');
INSERT INTO `t_syscfg` VALUES ('12', '七牛回调模式回调Body', 'qiniu.service.server.callback.body', '1', 'fname=$(fname)&hash=$(etag)&type=$(x:type)', null, null, '七牛回调模式回调Body', '1', 'fname=$(fname)&hash=$(etag)&type=$(x:type)');

-- ----------------------------
-- Table structure for `t_use_coupon_record`
-- ----------------------------
DROP TABLE IF EXISTS `t_use_coupon_record`;
CREATE TABLE `t_use_coupon_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `operatorno` int(11) DEFAULT NULL COMMENT '操作员ID',
  `userId` int(11) DEFAULT NULL COMMENT '所属用户ID',
  `tucid` int(11) DEFAULT NULL COMMENT '用户优惠券ID',
  `createTime` varchar(32) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='用户优惠券信息表';

-- ----------------------------
-- Records of t_use_coupon_record
-- ----------------------------
INSERT INTO `t_use_coupon_record` VALUES ('4', '1', '15', '17', '2016-09-06 17:38:17');
INSERT INTO `t_use_coupon_record` VALUES ('5', '1', '9', '19', '2016-09-06 18:17:33');
INSERT INTO `t_use_coupon_record` VALUES ('6', '1', '10', '15', '2016-09-06 18:29:21');
INSERT INTO `t_use_coupon_record` VALUES ('7', '1', '9', '22', '2016-09-06 19:32:04');

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `account` varchar(128) NOT NULL COMMENT '用户账号',
  `appType` int(1) NOT NULL COMMENT 'APP类型  1Android 2IOS 3web',
  `nickname` varchar(50) DEFAULT NULL COMMENT '用户昵称',
  `headUrl` varchar(300) DEFAULT NULL COMMENT '用户头像',
  `recentLoginTime` varchar(25) DEFAULT NULL COMMENT '最近登录时间',
  `regtime` varchar(25) NOT NULL COMMENT '注册时间',
  `jpushid` varchar(32) DEFAULT NULL COMMENT '推送ID',
  `integral` int(11) NOT NULL DEFAULT '0' COMMENT '总积分',
  `balance` int(11) NOT NULL DEFAULT '0' COMMENT '剩余积分',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_user_account` (`account`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('9', 'o0E2OwHL8dKFYQgJA7vvDHJJkP0E', '2', '孟驰力©JCBLE', 'http://wx.qlogo.cn/mmopen/jC6iatya006RM2pJia0SwOaClh7LiaUBR9fwNWRdnRS7lPiaEvwwNJzicXpJibHaKZgnmFISUXPZ78Bm2g9Y879IPFrDLkiaYfp3DCv/0', '2016-09-07 12:01:49', '2016-09-06 15:35:28', null, '13', '0');
INSERT INTO `t_user` VALUES ('10', 'o0E2OwK1I3NFJUHc1N_lbhrrLj_o', '2', '他人骑大马', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM4lPRp4VNQLRCVpncekyC00EiaFT0mIvdHyzicvlZbmjky0tkltNgQd0ESJzGpALeq2UTddFMG6Gs0Q/0', '2016-09-08 02:07:28', '2016-09-06 15:58:28', null, '3', '1');
INSERT INTO `t_user` VALUES ('11', 'o0E2OwC9h0K36R2KOEJRy88PlQvs', '2', '王朝', 'http://wx.qlogo.cn/mmopen/4EOKia6kgMajnfANGAObtxNVUs2AeFuEJyic8lXiajFCqB3RI6Y9OYMukOHt4hxDETTqFXricHKKQKRcNINPuPZGQATsKqTgYh9O/0', '2016-09-07 10:42:56', '2016-09-06 08:02:05', null, '0', '0');
INSERT INTO `t_user` VALUES ('12', 'o0E2OwJY539GVB7DLQQ2n6jmJxhM', '1', 'find', 'http://wx.qlogo.cn/mmopen/0T8yO33zeeiaicg91uedSx1CMQ0MHk2cuKhJ7Qs08rrDmH8wX5rXRhicRibLLicmSvC3d56jRbwEL30qGNDSOUkwficIVYianzLq4Mw/0', '2016-09-08 02:31:00', '2016-09-06 08:09:06', null, '0', '0');
INSERT INTO `t_user` VALUES ('13', 'o0E2OwEK-F3gtKudEookpwzcQIHk', '2', '林丶离', 'http://wx.qlogo.cn/mmopen/4EOKia6kgMahj1EB0HUhQQhJgicZDPKXMibV0bko73LmbWSsu6m8AiaJa4TXNianDOLckrQXLHbmQ6v2ja1dbquEuo83TaqjPb21d/0', '2016-09-08 02:41:30', '2016-09-06 08:59:18', null, '3', '1');
INSERT INTO `t_user` VALUES ('14', 'jiekouceshi_main', '2', 'test_main', '', '2016-09-06 17:09:40', '2016-09-06 17:09:40', null, '0', '0');
INSERT INTO `t_user` VALUES ('15', 'o0E2OwPdJKgWbBKATDK_oYqrFy44', '2', 'jc', 'http://wx.qlogo.cn/mmopen/jC6iatya006QAruTHKAGuhnvhTiaaKQVuWFNrKdxfaxAzFRpe319hlI1sfOhRQATQHZXX36xFd878tIywQSksDkBm9Q0fY8Ksd/0', '2016-09-06 17:37:41', '2016-09-06 17:29:44', null, '6', '5');
INSERT INTO `t_user` VALUES ('16', 'o0E2OwOwf9QNG2VH6okdFMLxpd-8', '2', 'minls', 'http://wx.qlogo.cn/mmopen/fyBia6F3Y8LDHQAricJKY8acNxZ9Kwn1ZpiaNCaE4Q9acicovzvScm99xLPQDuAobK02CkibkWSCvvv2cGdPU1Uywzvd9nD0uOcIib/0', '2016-09-06 17:40:00', '2016-09-06 17:40:00', null, '5', '4');
INSERT INTO `t_user` VALUES ('17', 'o0E2OwPQhfRAYEWHgJsqVlChk1eY', '2', '高明', 'http://wx.qlogo.cn/mmopen/jC6iatya006TLYKCiauVRAtxlribibvhdTPibibKXhXWZGfpjuTPK8MWcZqa90g9O81PXO4NYrxzyI12PibFic7E6RWoLGZg1PB0xHbib/0', '2016-09-06 13:29:33', '2016-09-06 18:36:56', null, '1', '0');
INSERT INTO `t_user` VALUES ('18', 'o0E2OwBoA2QSxW_D6jOgY7E3k03c', '2', '陈立@jcble', 'http://wx.qlogo.cn/mmopen/0T8yO33zeegwJm3ib4LYib52h7RE9icMZyuVSV7UTzdJwLeIdDoDYTITuictzlmOUwtSrk5asKJTD2ibia88iaM9JVG8lASYefMhgiau/0', '2016-09-06 11:37:59', '2016-09-06 11:31:35', null, '2', '1');
INSERT INTO `t_user` VALUES ('19', 'o0E2OwI81rQdSDrxTi8xRo8ZgsRk', '2', '步履蹒跚', 'http://wx.qlogo.cn/mmopen/y5movOA28vYK0n3Z8EdZb5W8ps6z7ic8v3oRfuMnuT1qmickHBibvdqldFS6u4AMe54OLoC8bB2XSnJyEZN2APwkVQzPGKItdTQ/0', '2016-09-07 03:43:18', '2016-09-07 01:51:10', null, '4', '1');

-- ----------------------------
-- Table structure for `t_user_coupon`
-- ----------------------------
DROP TABLE IF EXISTS `t_user_coupon`;
CREATE TABLE `t_user_coupon` (
  `act_id` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(32) DEFAULT NULL COMMENT '优惠券名称',
  `title` varchar(32) DEFAULT NULL COMMENT '优惠券标题',
  `startDate` varchar(32) DEFAULT NULL COMMENT '有效期开始',
  `endDate` varchar(32) DEFAULT NULL COMMENT '有效期结束',
  `pic` varchar(64) DEFAULT NULL COMMENT '图片地址',
  `remarks` varchar(64) DEFAULT NULL COMMENT '备注',
  `integral` int(11) DEFAULT NULL COMMENT '积分数量',
  `operatorno` int(11) DEFAULT NULL COMMENT '操作员ID',
  `userId` int(11) DEFAULT NULL COMMENT '所属用户ID',
  `createTime` varchar(32) DEFAULT NULL COMMENT '创建时间',
  `status` int(11) DEFAULT NULL COMMENT '0未使用 1已经使用 ',
  `code` varchar(32) DEFAULT NULL,
  `type` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='用户优惠券信息表';

-- ----------------------------
-- Records of t_user_coupon
-- ----------------------------
INSERT INTO `t_user_coupon` VALUES ('2', '15', '甲虫活动测试', '测试', '2016-09-06', '2016-09-17', 'JQ_STYLE_12_1473153567081.png', null, '1', '1', '10', '2016-09-06 17:25:40', '1', 'NW78EP', '测试');
INSERT INTO `t_user_coupon` VALUES ('2', '16', '甲虫活动测试', '测试', '2016-09-06', '2016-09-17', 'JQ_STYLE_12_1473153567081.png', null, '1', '1', '10', '2016-09-06 17:30:03', '0', 'JVSHEC', '测试');
INSERT INTO `t_user_coupon` VALUES ('2', '17', '甲虫活动测试', '测试', '2016-09-06', '2016-09-17', 'JQ_STYLE_12_1473153567081.png', null, '1', '1', '15', '2016-09-06 17:37:59', '1', '57TAI4', '测试');
INSERT INTO `t_user_coupon` VALUES ('2', '18', '甲虫活动测试', '测试', '2016-09-06', '2016-09-17', 'JQ_STYLE_12_1473153567081.png', null, '1', '1', '16', '2016-09-06 17:43:58', '0', 'PXBM0L', '测试');
INSERT INTO `t_user_coupon` VALUES ('2', '19', '甲虫活动测试', '测试', '2016-09-06', '2016-09-17', 'JQ_STYLE_12_1473153567081.png', null, '1', '1', '9', '2016-09-06 18:16:58', '1', '66TIGJ', '测试');
INSERT INTO `t_user_coupon` VALUES ('1', '20', '玛莎拉蒂一辆', '玛莎拉蒂总裁', '2016-09-06', '2016-09-10', 'JQ_STYLE_13_1473154932227.png', null, '10', '1', '9', '2016-09-06 18:38:10', '0', 'NOX7OO', '兑换券');
INSERT INTO `t_user_coupon` VALUES ('2', '21', '甲虫活动测试', '测试', '2016-09-06', '2016-09-17', 'JQ_STYLE_12_1473153567081.png', null, '1', '1', '17', '2016-09-06 19:12:15', '0', 'SVDK4E', '测试');
INSERT INTO `t_user_coupon` VALUES ('2', '22', '甲虫活动测试', '测试', '2016-09-06', '2016-09-17', 'JQ_STYLE_12_1473153567081.png', null, '1', '1', '9', '2016-09-06 11:31:32', '1', 'THUCHN', '测试');
INSERT INTO `t_user_coupon` VALUES ('2', '23', '甲虫活动测试', '测试', '2016-09-06', '2016-09-17', 'JQ_STYLE_12_1473153567081.png', null, '1', '1', '18', '2016-09-06 11:32:59', '0', 'PCYHK1', '测试');
INSERT INTO `t_user_coupon` VALUES ('2', '24', '甲虫活动测试', '测试', '2016-09-06', '2016-09-17', 'JQ_STYLE_12_1473153567081.png', null, '1', '1', '19', '2016-09-07 03:06:50', '0', 'HWVH3W', '测试');
INSERT INTO `t_user_coupon` VALUES ('1', '25', '可口可乐畅饮券', '可口可乐畅饮券', '2016-09-06', '2016-09-15', 'JQ_STYLE_13_1473217504715.png', null, '2', '1', '19', '2016-09-07 03:10:07', '0', 'PCG6BP', '可口可乐畅饮券');
INSERT INTO `t_user_coupon` VALUES ('2', '26', '滴滴快车代金券', '滴滴快车代金券', '2016-09-06', '2016-09-22', 'JQ_STYLE_12_1473153567081.png', null, '1', '1', '13', '2016-09-07 07:52:56', '0', 'H2YBIT', '滴滴快车代金券');
INSERT INTO `t_user_coupon` VALUES ('1', '27', '星巴克优惠卷', '星巴克优惠卷', '2016-09-06', '2016-09-09', 'JQ_STYLE_14_1473239208872.png', null, '1', '1', '13', '2016-09-07 09:33:28', '0', 'AFJ9WE', '星巴克优惠卷');
INSERT INTO `t_user_coupon` VALUES ('1', '28', '星巴克优惠卷', '星巴克优惠卷', '2016-09-06', '2016-09-09', 'JQ_STYLE_14_1473239208872.png', null, '1', '1', '9', '2016-09-07 09:48:32', '0', 'H9MH6B', '星巴克优惠卷');
