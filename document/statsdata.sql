/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : statsdata

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2016-07-13 17:47:41
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
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8;

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
  `linkPid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`categoryid`),
  UNIQUE KEY `uniqueid` (`uniqueid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `linkPid` varchar(255) DEFAULT NULL,
  `time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`hgyddataid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `linkPid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`quotasid`),
  UNIQUE KEY `uniqueid` (`uniqueid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `linkPid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`subcategoryid`),
  UNIQUE KEY `uniqueid` (`uniqueid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `linkPid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`subcategoryid`),
  UNIQUE KEY `uniqueid` (`uniqueid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  PRIMARY KEY (`hgydwdid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for hgnd_category
-- ----------------------------
DROP TABLE IF EXISTS `hgnd_category`;
CREATE TABLE `hgnd_category` (
  `categoryid` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(255) DEFAULT NULL,
  `uniqueid` varchar(255) DEFAULT NULL,
  `wdcode` varchar(255) DEFAULT NULL,
  `dbcode` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `isParent` varchar(255) DEFAULT NULL,
  `pid` varchar(255) DEFAULT NULL,
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `linkPid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`categoryid`),
  UNIQUE KEY `uniqueid` (`uniqueid`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for hgnd_data
-- ----------------------------
DROP TABLE IF EXISTS `hgnd_data`;
CREATE TABLE `hgnd_data` (
  `hgyddataid` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `wdcode` varchar(255) DEFAULT NULL,
  `sjcode` varchar(255) DEFAULT NULL,
  `data` double DEFAULT NULL,
  `dotcount` int(11) DEFAULT NULL,
  `hasdata` int(11) DEFAULT NULL,
  `strdata` varchar(255) DEFAULT NULL,
  `uniqueid` varchar(255) DEFAULT NULL,
  `linkPid` varchar(255) DEFAULT NULL,
  `time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`hgyddataid`)
) ENGINE=InnoDB AUTO_INCREMENT=3345 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for hgnd_quotas
-- ----------------------------
DROP TABLE IF EXISTS `hgnd_quotas`;
CREATE TABLE `hgnd_quotas` (
  `quotasid` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(255) DEFAULT NULL,
  `uniqueid` varchar(255) DEFAULT NULL,
  `wdcode` varchar(255) DEFAULT NULL,
  `dbcode` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `isParent` varchar(255) DEFAULT NULL,
  `pid` varchar(255) DEFAULT NULL,
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `linkPid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`quotasid`),
  UNIQUE KEY `uniqueid` (`uniqueid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for hgnd_subcategory
-- ----------------------------
DROP TABLE IF EXISTS `hgnd_subcategory`;
CREATE TABLE `hgnd_subcategory` (
  `subcategoryid` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(255) DEFAULT NULL,
  `uniqueid` varchar(255) DEFAULT NULL,
  `wdcode` varchar(255) DEFAULT NULL,
  `dbcode` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `isParent` varchar(255) DEFAULT NULL,
  `pid` varchar(255) DEFAULT NULL,
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `linkPid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`subcategoryid`),
  UNIQUE KEY `uniqueid` (`uniqueid`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for hgnd_treecategory
-- ----------------------------
DROP TABLE IF EXISTS `hgnd_treecategory`;
CREATE TABLE `hgnd_treecategory` (
  `subcategoryid` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(255) DEFAULT NULL,
  `uniqueid` varchar(255) DEFAULT NULL,
  `wdcode` varchar(255) DEFAULT NULL,
  `dbcode` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `isParent` varchar(255) DEFAULT NULL,
  `pid` varchar(255) DEFAULT NULL,
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `linkPid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`subcategoryid`),
  UNIQUE KEY `uniqueid` (`uniqueid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for hgnd_wd
-- ----------------------------
DROP TABLE IF EXISTS `hgnd_wd`;
CREATE TABLE `hgnd_wd` (
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
  PRIMARY KEY (`hgydwdid`)
) ENGINE=InnoDB AUTO_INCREMENT=583 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for hgyd_category
-- ----------------------------
DROP TABLE IF EXISTS `hgyd_category`;
CREATE TABLE `hgyd_category` (
  `categoryid` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(255) DEFAULT NULL,
  `uniqueid` varchar(255) DEFAULT NULL,
  `wdcode` varchar(255) DEFAULT NULL,
  `dbcode` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `isParent` varchar(255) DEFAULT NULL,
  `pid` varchar(255) DEFAULT NULL,
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `linkPid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`categoryid`),
  UNIQUE KEY `uniqueid` (`uniqueid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for hgyd_data
-- ----------------------------
DROP TABLE IF EXISTS `hgyd_data`;
CREATE TABLE `hgyd_data` (
  `hgyddataid` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `wdcode` varchar(255) DEFAULT NULL,
  `sjcode` varchar(255) DEFAULT NULL,
  `data` double DEFAULT NULL,
  `dotcount` int(11) DEFAULT NULL,
  `hasdata` int(11) DEFAULT NULL,
  `strdata` varchar(255) DEFAULT NULL,
  `uniqueid` varchar(255) DEFAULT NULL,
  `linkPid` varchar(255) DEFAULT NULL,
  `time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`hgyddataid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for hgyd_quotas
-- ----------------------------
DROP TABLE IF EXISTS `hgyd_quotas`;
CREATE TABLE `hgyd_quotas` (
  `quotasid` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(255) DEFAULT NULL,
  `uniqueid` varchar(255) DEFAULT NULL,
  `wdcode` varchar(255) DEFAULT NULL,
  `dbcode` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `isParent` varchar(255) DEFAULT NULL,
  `pid` varchar(255) DEFAULT NULL,
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `linkPid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`quotasid`),
  UNIQUE KEY `uniqueid` (`uniqueid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for hgyd_subcategory
-- ----------------------------
DROP TABLE IF EXISTS `hgyd_subcategory`;
CREATE TABLE `hgyd_subcategory` (
  `subcategoryid` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(255) DEFAULT NULL,
  `uniqueid` varchar(255) DEFAULT NULL,
  `wdcode` varchar(255) DEFAULT NULL,
  `dbcode` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `isParent` varchar(255) DEFAULT NULL,
  `pid` varchar(255) DEFAULT NULL,
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `linkPid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`subcategoryid`),
  UNIQUE KEY `uniqueid` (`uniqueid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for hgyd_treecategory
-- ----------------------------
DROP TABLE IF EXISTS `hgyd_treecategory`;
CREATE TABLE `hgyd_treecategory` (
  `subcategoryid` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(255) DEFAULT NULL,
  `uniqueid` varchar(255) DEFAULT NULL,
  `wdcode` varchar(255) DEFAULT NULL,
  `dbcode` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `isParent` varchar(255) DEFAULT NULL,
  `pid` varchar(255) DEFAULT NULL,
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `linkPid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`subcategoryid`),
  UNIQUE KEY `uniqueid` (`uniqueid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for hgyd_wd
-- ----------------------------
DROP TABLE IF EXISTS `hgyd_wd`;
CREATE TABLE `hgyd_wd` (
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
  PRIMARY KEY (`hgydwdid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for hsjd_category
-- ----------------------------
DROP TABLE IF EXISTS `hsjd_category`;
CREATE TABLE `hsjd_category` (
  `categoryid` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(255) DEFAULT NULL,
  `uniqueid` varchar(255) DEFAULT NULL,
  `wdcode` varchar(255) DEFAULT NULL,
  `dbcode` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `isParent` varchar(255) DEFAULT NULL,
  `pid` varchar(255) DEFAULT NULL,
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `linkPid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`categoryid`),
  UNIQUE KEY `uniqueid` (`uniqueid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for hsjd_data
-- ----------------------------
DROP TABLE IF EXISTS `hsjd_data`;
CREATE TABLE `hsjd_data` (
  `hgyddataid` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `wdcode` varchar(255) DEFAULT NULL,
  `sjcode` varchar(255) DEFAULT NULL,
  `data` double DEFAULT NULL,
  `dotcount` int(11) DEFAULT NULL,
  `hasdata` int(11) DEFAULT NULL,
  `strdata` varchar(255) DEFAULT NULL,
  `uniqueid` varchar(255) DEFAULT NULL,
  `linkPid` varchar(255) DEFAULT NULL,
  `time` datetime DEFAULT CURRENT_TIMESTAMP,
  `regcode` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`hgyddataid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for hsjd_quotas
-- ----------------------------
DROP TABLE IF EXISTS `hsjd_quotas`;
CREATE TABLE `hsjd_quotas` (
  `quotasid` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(255) DEFAULT NULL,
  `uniqueid` varchar(255) DEFAULT NULL,
  `wdcode` varchar(255) DEFAULT NULL,
  `dbcode` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `isParent` varchar(255) DEFAULT NULL,
  `pid` varchar(255) DEFAULT NULL,
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `linkPid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`quotasid`),
  UNIQUE KEY `uniqueid` (`uniqueid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for hsjd_subcategory
-- ----------------------------
DROP TABLE IF EXISTS `hsjd_subcategory`;
CREATE TABLE `hsjd_subcategory` (
  `subcategoryid` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(255) DEFAULT NULL,
  `uniqueid` varchar(255) DEFAULT NULL,
  `wdcode` varchar(255) DEFAULT NULL,
  `dbcode` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `isParent` varchar(255) DEFAULT NULL,
  `pid` varchar(255) DEFAULT NULL,
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `linkPid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`subcategoryid`),
  UNIQUE KEY `uniqueid` (`uniqueid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for hsjd_treecategory
-- ----------------------------
DROP TABLE IF EXISTS `hsjd_treecategory`;
CREATE TABLE `hsjd_treecategory` (
  `subcategoryid` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(255) DEFAULT NULL,
  `uniqueid` varchar(255) DEFAULT NULL,
  `wdcode` varchar(255) DEFAULT NULL,
  `dbcode` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `isParent` varchar(255) DEFAULT NULL,
  `pid` varchar(255) DEFAULT NULL,
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `linkPid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`subcategoryid`),
  UNIQUE KEY `uniqueid` (`uniqueid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for hsjd_wd
-- ----------------------------
DROP TABLE IF EXISTS `hsjd_wd`;
CREATE TABLE `hsjd_wd` (
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
  PRIMARY KEY (`hgydwdid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for hsnd_category
-- ----------------------------
DROP TABLE IF EXISTS `hsnd_category`;
CREATE TABLE `hsnd_category` (
  `categoryid` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(255) DEFAULT NULL,
  `uniqueid` varchar(255) DEFAULT NULL,
  `wdcode` varchar(255) DEFAULT NULL,
  `dbcode` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `isParent` varchar(255) DEFAULT NULL,
  `pid` varchar(255) DEFAULT NULL,
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `linkPid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`categoryid`),
  UNIQUE KEY `uniqueid` (`uniqueid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for hsnd_data
-- ----------------------------
DROP TABLE IF EXISTS `hsnd_data`;
CREATE TABLE `hsnd_data` (
  `hgyddataid` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `wdcode` varchar(255) DEFAULT NULL,
  `sjcode` varchar(255) DEFAULT NULL,
  `data` double DEFAULT NULL,
  `dotcount` int(11) DEFAULT NULL,
  `hasdata` int(11) DEFAULT NULL,
  `strdata` varchar(255) DEFAULT NULL,
  `uniqueid` varchar(255) DEFAULT NULL,
  `linkPid` varchar(255) DEFAULT NULL,
  `time` datetime DEFAULT CURRENT_TIMESTAMP,
  `regcode` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`hgyddataid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for hsnd_quotas
-- ----------------------------
DROP TABLE IF EXISTS `hsnd_quotas`;
CREATE TABLE `hsnd_quotas` (
  `quotasid` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(255) DEFAULT NULL,
  `uniqueid` varchar(255) DEFAULT NULL,
  `wdcode` varchar(255) DEFAULT NULL,
  `dbcode` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `isParent` varchar(255) DEFAULT NULL,
  `pid` varchar(255) DEFAULT NULL,
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `linkPid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`quotasid`),
  UNIQUE KEY `uniqueid` (`uniqueid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for hsnd_subcategory
-- ----------------------------
DROP TABLE IF EXISTS `hsnd_subcategory`;
CREATE TABLE `hsnd_subcategory` (
  `subcategoryid` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(255) DEFAULT NULL,
  `uniqueid` varchar(255) DEFAULT NULL,
  `wdcode` varchar(255) DEFAULT NULL,
  `dbcode` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `isParent` varchar(255) DEFAULT NULL,
  `pid` varchar(255) DEFAULT NULL,
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `linkPid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`subcategoryid`),
  UNIQUE KEY `uniqueid` (`uniqueid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for hsnd_treecategory
-- ----------------------------
DROP TABLE IF EXISTS `hsnd_treecategory`;
CREATE TABLE `hsnd_treecategory` (
  `subcategoryid` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(255) DEFAULT NULL,
  `uniqueid` varchar(255) DEFAULT NULL,
  `wdcode` varchar(255) DEFAULT NULL,
  `dbcode` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `isParent` varchar(255) DEFAULT NULL,
  `pid` varchar(255) DEFAULT NULL,
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `linkPid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`subcategoryid`),
  UNIQUE KEY `uniqueid` (`uniqueid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for hsnd_wd
-- ----------------------------
DROP TABLE IF EXISTS `hsnd_wd`;
CREATE TABLE `hsnd_wd` (
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
  PRIMARY KEY (`hgydwdid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for hsyd_category
-- ----------------------------
DROP TABLE IF EXISTS `hsyd_category`;
CREATE TABLE `hsyd_category` (
  `categoryid` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(255) DEFAULT NULL,
  `uniqueid` varchar(255) DEFAULT NULL,
  `wdcode` varchar(255) DEFAULT NULL,
  `dbcode` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `isParent` varchar(255) DEFAULT NULL,
  `pid` varchar(255) DEFAULT NULL,
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `linkPid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`categoryid`),
  UNIQUE KEY `uniqueid` (`uniqueid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for hsyd_data
-- ----------------------------
DROP TABLE IF EXISTS `hsyd_data`;
CREATE TABLE `hsyd_data` (
  `hgyddataid` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `wdcode` varchar(255) DEFAULT NULL,
  `sjcode` varchar(255) DEFAULT NULL,
  `data` double DEFAULT NULL,
  `dotcount` int(11) DEFAULT NULL,
  `hasdata` int(11) DEFAULT NULL,
  `strdata` varchar(255) DEFAULT NULL,
  `uniqueid` varchar(255) DEFAULT NULL,
  `linkPid` varchar(255) DEFAULT NULL,
  `time` datetime DEFAULT CURRENT_TIMESTAMP,
  `regcode` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`hgyddataid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for hsyd_quotas
-- ----------------------------
DROP TABLE IF EXISTS `hsyd_quotas`;
CREATE TABLE `hsyd_quotas` (
  `quotasid` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(255) DEFAULT NULL,
  `uniqueid` varchar(255) DEFAULT NULL,
  `wdcode` varchar(255) DEFAULT NULL,
  `dbcode` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `isParent` varchar(255) DEFAULT NULL,
  `pid` varchar(255) DEFAULT NULL,
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `linkPid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`quotasid`),
  UNIQUE KEY `uniqueid` (`uniqueid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for hsyd_subcategory
-- ----------------------------
DROP TABLE IF EXISTS `hsyd_subcategory`;
CREATE TABLE `hsyd_subcategory` (
  `subcategoryid` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(255) DEFAULT NULL,
  `uniqueid` varchar(255) DEFAULT NULL,
  `wdcode` varchar(255) DEFAULT NULL,
  `dbcode` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `isParent` varchar(255) DEFAULT NULL,
  `pid` varchar(255) DEFAULT NULL,
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `linkPid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`subcategoryid`),
  UNIQUE KEY `uniqueid` (`uniqueid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for hsyd_treecategory
-- ----------------------------
DROP TABLE IF EXISTS `hsyd_treecategory`;
CREATE TABLE `hsyd_treecategory` (
  `subcategoryid` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(255) DEFAULT NULL,
  `uniqueid` varchar(255) DEFAULT NULL,
  `wdcode` varchar(255) DEFAULT NULL,
  `dbcode` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `isParent` varchar(255) DEFAULT NULL,
  `pid` varchar(255) DEFAULT NULL,
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `linkPid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`subcategoryid`),
  UNIQUE KEY `uniqueid` (`uniqueid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for hsyd_wd
-- ----------------------------
DROP TABLE IF EXISTS `hsyd_wd`;
CREATE TABLE `hsyd_wd` (
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
  PRIMARY KEY (`hgydwdid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
