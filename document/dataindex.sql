/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : statsdata

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2016-07-14 09:44:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for dataindex
-- ----------------------------
DROP TABLE IF EXISTS `dataindex`;
CREATE TABLE `dataindex` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `level` int(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dataindex
-- ----------------------------
INSERT INTO `dataindex` VALUES ('1', '1', 'aa');
INSERT INTO `dataindex` VALUES ('2', '3', '国民经济核算');
INSERT INTO `dataindex` VALUES ('3', '5', '投入产出基本流量表');
INSERT INTO `dataindex` VALUES ('4', '7', '最终使用部分');
INSERT INTO `dataindex` VALUES ('5', '9', '其他服务业');
