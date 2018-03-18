/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50527
Source Host           : localhost:3306
Source Database       : housingdb

Target Server Type    : MYSQL
Target Server Version : 50527
File Encoding         : 65001

Date: 2017-12-06 09:28:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `tb_sysuser`
-- ----------------------------
DROP TABLE IF EXISTS `tb_sysuser`;
CREATE TABLE `tb_sysuser` (
  `id` varchar(4) NOT NULL DEFAULT '',
  `usename` varchar(10) DEFAULT NULL,
  `password` varchar(10) DEFAULT NULL,
  `last_login_time` varchar(20) DEFAULT NULL,
  `create_time` varchar(20) DEFAULT NULL,
  `isDelete` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_sysuser
-- ----------------------------
INSERT INTO `tb_sysuser` VALUES ('0001', 'admin', 'admin11', null, null, '0', null);
