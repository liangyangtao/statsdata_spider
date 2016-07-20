/*
Navicat MySQL Data Transfer

Source Server         : 10.0.0.51
Source Server Version : 50610
Source Host           : 10.0.0.51:3306
Source Database       : statsadata

Target Server Type    : MYSQL
Target Server Version : 50610
File Encoding         : 65001

Date: 2016-07-20 11:01:25
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for area
-- ----------------------------
DROP TABLE IF EXISTS `area`;
CREATE TABLE `area` (
  `id` int(22) NOT NULL AUTO_INCREMENT,
  `areaname` varchar(255) DEFAULT NULL,
  `areacode` varchar(255) DEFAULT NULL,
  `areacodeDetail` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `areacodeDetail` (`areacodeDetail`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of area
-- ----------------------------
INSERT INTO `area` VALUES ('1', '北京市', '110000', '2e07b8c9c22897dbd06cb0888eb7e540');
INSERT INTO `area` VALUES ('2', '天津市', '120000', '5344237ad06253d47cee9a4c091aa663');
INSERT INTO `area` VALUES ('3', '河北省', '130000', '4b361b405260550e2cf7d0bde9ad7bab');
INSERT INTO `area` VALUES ('4', '山西省', '140000', '4a3eacc0c4c2ed517aded53241e7630d');
INSERT INTO `area` VALUES ('5', '内蒙古自治区', '150000', '4abbedd62b6f1a99d4153bcb3f691b96');
INSERT INTO `area` VALUES ('6', '辽宁省', '210000', '1f9eb4fe9e20c8c40c16a6d58031c31e');
INSERT INTO `area` VALUES ('7', '吉林省', '220000', '83d634317da9e6facbb206b52937abc3');
INSERT INTO `area` VALUES ('8', '黑龙江省', '230000', '8fe95a968982ae1cd2c7cb37ecb1ef2d');
INSERT INTO `area` VALUES ('9', '上海市', '310000', '47da19f4e311d433559f24b234d59075');
INSERT INTO `area` VALUES ('10', '江苏省', '320000', 'a8e98ba935787f54f3745931bf6bc943');
INSERT INTO `area` VALUES ('11', '浙江省', '330000', '4911239f226f8e2c0bbb812bbea2ce2e');
INSERT INTO `area` VALUES ('12', '安徽省', '340000', '0d333be15bf5987825ea1eb097151589');
INSERT INTO `area` VALUES ('13', '福建省', '350000', 'ffbca00a190859d66ea08c322e3573a8');
INSERT INTO `area` VALUES ('14', '江西省', '360000', '982bb63e10660c9bccdaefc6a633a784');
INSERT INTO `area` VALUES ('15', '山东省', '370000', '2aab09870ce2dac1ccd67c28838103d3');
INSERT INTO `area` VALUES ('16', '河南省', '410000', '3240a605e276bfb580f2544f947b86e0');
INSERT INTO `area` VALUES ('17', '湖北省', '420000', '6b988428eec2ae2aff776956bfa703b1');
INSERT INTO `area` VALUES ('18', '湖南省', '430000', '7e8e0e2f28b497eb278fd6a13d09c7c6');
INSERT INTO `area` VALUES ('19', '广东省', '440000', '5ae4b1e2fb2b7076a92f7d85fd0c9cae');
INSERT INTO `area` VALUES ('20', '广西壮族自治区', '450000', 'e894e1c580aeca742f6ab938dbb64657');
INSERT INTO `area` VALUES ('21', '海南省', '460000', '849b16629709144ce02567914eab3bb6');
INSERT INTO `area` VALUES ('22', '重庆市', '500000', 'c9077732a294f90a75acea3ce5f2a4e8');
INSERT INTO `area` VALUES ('23', '四川省', '510000', '6b2a8b2864a82a58032a848f87b4a0d5');
INSERT INTO `area` VALUES ('24', '贵州省', '520000', 'f2b9650598db29e69630eab99439f10b');
INSERT INTO `area` VALUES ('25', '云南省', '530000', '7d703767895a841c9bbe5e9b1f02df59');
INSERT INTO `area` VALUES ('26', '西藏自治区', '540000', '8f212b81a15af34ccf2dcb0a85597a70');
INSERT INTO `area` VALUES ('27', '陕西省', '610000', '99fc2df8156dadfd47436f75b27d6d16');
INSERT INTO `area` VALUES ('28', '甘肃省', '620000', '43f47e8070b2c577b968740affecb995');
INSERT INTO `area` VALUES ('29', '青海省', '630000', 'c3eff74c193372525dea3c3de19035a6');
INSERT INTO `area` VALUES ('30', '宁夏回族自治区', '640000', 'ad8380435a792afc833d5716f3ec0240');
INSERT INTO `area` VALUES ('31', '新疆维吾尔自治区', '650000', '2a654642654cc6b6cfb65dbec51ef6f9');

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
INSERT INTO `dataindex` VALUES ('3', '5', '地区生产总值');
INSERT INTO `dataindex` VALUES ('4', '7', '固定资产合计');
INSERT INTO `dataindex` VALUES ('5', '9', '中国对其他国家(地区)劳务合作年末在外人员');

-- ----------------------------
-- Table structure for hgjd_category
-- ----------------------------
DROP TABLE IF EXISTS `hgjd_category`;
CREATE TABLE `hgjd_category` (
  `categoryid` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(255) DEFAULT NULL,
  `uniqueid` varchar(255) DEFAULT NULL,
  `wdcode` varchar(255) DEFAULT NULL,
  `dbcode` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `isParent` varchar(255) DEFAULT NULL,
  `pid` varchar(255) DEFAULT NULL,
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`categoryid`),
  UNIQUE KEY `uniqueid` (`uniqueid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hgjd_category
-- ----------------------------

-- ----------------------------
-- Table structure for hgjd_data
-- ----------------------------
DROP TABLE IF EXISTS `hgjd_data`;
CREATE TABLE `hgjd_data` (
  `hgyddataid` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `wdcode` varchar(255) DEFAULT NULL,
  `sjcode` varchar(255) DEFAULT NULL,
  `data` double DEFAULT NULL,
  `dotcount` int(11) DEFAULT NULL,
  `hasdata` int(11) DEFAULT NULL,
  `strdata` varchar(255) DEFAULT NULL,
  `uniqueid` varchar(255) DEFAULT NULL,
  `time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`hgyddataid`),
  UNIQUE KEY `uniqueid` (`uniqueid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hgjd_data
-- ----------------------------

-- ----------------------------
-- Table structure for hgjd_quotas
-- ----------------------------
DROP TABLE IF EXISTS `hgjd_quotas`;
CREATE TABLE `hgjd_quotas` (
  `quotasid` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(255) DEFAULT NULL,
  `uniqueid` varchar(255) DEFAULT NULL,
  `wdcode` varchar(255) DEFAULT NULL,
  `dbcode` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `isParent` varchar(255) DEFAULT NULL,
  `pid` varchar(255) DEFAULT NULL,
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`quotasid`),
  UNIQUE KEY `uniqueid` (`uniqueid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hgjd_quotas
-- ----------------------------

-- ----------------------------
-- Table structure for hgjd_subcategory
-- ----------------------------
DROP TABLE IF EXISTS `hgjd_subcategory`;
CREATE TABLE `hgjd_subcategory` (
  `subcategoryid` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(255) DEFAULT NULL,
  `uniqueid` varchar(255) DEFAULT NULL,
  `wdcode` varchar(255) DEFAULT NULL,
  `dbcode` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `isParent` varchar(255) DEFAULT NULL,
  `pid` varchar(255) DEFAULT NULL,
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`subcategoryid`),
  UNIQUE KEY `uniqueid` (`uniqueid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hgjd_subcategory
-- ----------------------------

-- ----------------------------
-- Table structure for hgjd_treecategory
-- ----------------------------
DROP TABLE IF EXISTS `hgjd_treecategory`;
CREATE TABLE `hgjd_treecategory` (
  `subcategoryid` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(255) DEFAULT NULL,
  `uniqueid` varchar(255) DEFAULT NULL,
  `wdcode` varchar(255) DEFAULT NULL,
  `dbcode` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `isParent` varchar(255) DEFAULT NULL,
  `pid` varchar(255) DEFAULT NULL,
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`subcategoryid`),
  UNIQUE KEY `uniqueid` (`uniqueid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hgjd_treecategory
-- ----------------------------

-- ----------------------------
-- Table structure for hgjd_wd
-- ----------------------------
DROP TABLE IF EXISTS `hgjd_wd`;
CREATE TABLE `hgjd_wd` (
  `hgydwdid` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `dotcount` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `nodesort` varchar(255) DEFAULT NULL,
  `sortcode` int(11) DEFAULT NULL,
  `uniqueid` varchar(255) DEFAULT NULL,
  `linkPid` varchar(255) DEFAULT NULL,
  `time` datetime DEFAULT CURRENT_TIMESTAMP,
  `unit` varchar(255) DEFAULT NULL,
  `tag` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`hgydwdid`),
  UNIQUE KEY `uniqueid` (`uniqueid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hgjd_wd
-- ----------------------------
