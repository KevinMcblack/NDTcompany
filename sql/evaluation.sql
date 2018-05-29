/*
 Navicat Premium Data Transfer

 Source Server         : MySQL
 Source Server Type    : MySQL
 Source Server Version : 50719
 Source Host           : localhost:3306
 Source Schema         : ndt

 Target Server Type    : MySQL
 Target Server Version : 50719
 File Encoding         : 65001

 Date: 29/05/2018 14:08:34
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for evaluation
-- ----------------------------
DROP TABLE IF EXISTS `evaluation`;
CREATE TABLE `evaluation`  (
  `id` int(11) NOT NULL COMMENT '订单编号',
  `uid` int(11) NULL DEFAULT NULL COMMENT '用户编号',
  `cid` int(11) NULL DEFAULT NULL COMMENT '承运公司编号',
  `oid` int(11) NULL DEFAULT NULL COMMENT '订单编号',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文字内容',
  `file1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片1',
  `file2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片2',
  `file3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片3',
  `file4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片4',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
