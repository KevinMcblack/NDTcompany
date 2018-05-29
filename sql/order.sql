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

 Date: 29/05/2018 09:03:24
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Departure` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '出发地',
  `Destination` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '目的地',
  `time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '订单发布时间',
  `Delivery time` timestamp(0) NULL DEFAULT NULL COMMENT '取货时间',
  `Companyid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '快递公司id',
  `item amount` int(10) NULL DEFAULT NULL COMMENT '货物个数',
  `item size` double(10, 0) NULL DEFAULT NULL COMMENT '货物重量',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '价格',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
