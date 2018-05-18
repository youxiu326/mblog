/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80011
 Source Host           : localhost:3306
 Source Schema         : db_mblog

 Target Server Type    : MySQL
 Target Server Version : 80011
 File Encoding         : 65001

 Date: 18/05/2018 17:45:40
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for shiro_permission
-- ----------------------------
DROP TABLE IF EXISTS `shiro_permission`;
CREATE TABLE `shiro_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `parent_id` bigint(11) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `weight` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_89ve8ffuihnryt1nw4o2t1feu` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shiro_permission
-- ----------------------------
BEGIN;
INSERT INTO `shiro_permission` VALUES (1, 'admin', 'admin', 0, 0, 0);
INSERT INTO `shiro_permission` VALUES (2, 'channels', 'channel:list', 0, 0, 0);
INSERT INTO `shiro_permission` VALUES (3, 'channel edit', 'channel:update', 2, 0, 0);
INSERT INTO `shiro_permission` VALUES (4, 'channel delete', 'channel:delete', 2, 0, 0);
INSERT INTO `shiro_permission` VALUES (5, 'poss', 'post:list', 0, 0, 0);
INSERT INTO `shiro_permission` VALUES (6, 'post edit', 'post:update', 5, 0, 0);
INSERT INTO `shiro_permission` VALUES (7, 'post delete', 'post:delete', 5, 0, 0);
INSERT INTO `shiro_permission` VALUES (8, 'comments', 'comment:list', 0, 0, 0);
INSERT INTO `shiro_permission` VALUES (10, 'comment delete', 'comment:delete', 8, 0, 0);
INSERT INTO `shiro_permission` VALUES (11, 'users', 'user:list', 0, 0, 0);
INSERT INTO `shiro_permission` VALUES (12, 'user role', 'user:role', 11, 0, 0);
INSERT INTO `shiro_permission` VALUES (13, 'user pwd', 'user:pwd', 11, 0, 0);
INSERT INTO `shiro_permission` VALUES (14, 'user open', 'user:open', 11, 0, 0);
INSERT INTO `shiro_permission` VALUES (15, 'user close', 'user:close', 11, 0, 0);
INSERT INTO `shiro_permission` VALUES (16, 'roles', 'role:list', 0, 0, 0);
INSERT INTO `shiro_permission` VALUES (17, 'role update', 'role:update', 16, 0, 0);
INSERT INTO `shiro_permission` VALUES (18, 'role delete ', 'role:delete', 16, 0, 0);
INSERT INTO `shiro_permission` VALUES (19, 'configs', 'config:list', 0, 0, 0);
INSERT INTO `shiro_permission` VALUES (20, 'config update', 'config:update', 19, 0, 0);
COMMIT;

-- ----------------------------
-- Table structure for shiro_role
-- ----------------------------
DROP TABLE IF EXISTS `shiro_role`;
CREATE TABLE `shiro_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shiro_role
-- ----------------------------
BEGIN;
INSERT INTO `shiro_role` VALUES (1, NULL, 'admin', 0);
COMMIT;

-- ----------------------------
-- Table structure for shiro_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `shiro_role_permission`;
CREATE TABLE `shiro_role_permission` (
  `role_id` bigint(20) NOT NULL,
  `permission_id` bigint(20) NOT NULL,
  `id` bigint(20) NOT NULL,
  PRIMARY KEY (`role_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shiro_role_permission
-- ----------------------------
BEGIN;
INSERT INTO `shiro_role_permission` VALUES (1, 1, 1);
INSERT INTO `shiro_role_permission` VALUES (1, 2, 2);
INSERT INTO `shiro_role_permission` VALUES (1, 3, 3);
INSERT INTO `shiro_role_permission` VALUES (1, 4, 4);
INSERT INTO `shiro_role_permission` VALUES (1, 11, 7);
INSERT INTO `shiro_role_permission` VALUES (1, 16, 5);
INSERT INTO `shiro_role_permission` VALUES (1, 17, 6);
COMMIT;

-- ----------------------------
-- Table structure for shiro_user_role
-- ----------------------------
DROP TABLE IF EXISTS `shiro_user_role`;
CREATE TABLE `shiro_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shiro_user_role
-- ----------------------------
BEGIN;
INSERT INTO `shiro_user_role` VALUES (1, 1, 1);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
