/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50744 (5.7.44)
 Source Host           : localhost:3306
 Source Schema         : mmall

 Target Server Type    : MySQL
 Target Server Version : 50744 (5.7.44)
 File Encoding         : 65001

 Date: 05/02/2024 22:25:29
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NULL DEFAULT NULL,
  `quantity` int(11) NULL DEFAULT NULL,
  `cost` float NULL DEFAULT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `productId`(`product_id`) USING BTREE,
  INDEX `userId`(`user_id`) USING BTREE,
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cart
-- ----------------------------

-- ----------------------------
-- Table structure for order_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_id` int(11) NOT NULL COMMENT '订单主键',
  `product_id` int(11) NOT NULL COMMENT '商品主键',
  `quantity` int(11) NOT NULL COMMENT '数量',
  `cost` float NOT NULL COMMENT '消费',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `PK__EASYBUY___66E1BD8E2F10007B`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_detail
-- ----------------------------

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户主键',
  `login_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `user_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户地址',
  `cost` float NULL DEFAULT NULL COMMENT '总金额',
  `serialnumber` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单号',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `description` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `price` float NOT NULL COMMENT '价格',
  `stock` int(11) NOT NULL COMMENT '库存',
  `categorylevelone_id` int(11) NULL DEFAULT NULL COMMENT '分类1',
  `categoryleveltwo_id` int(11) NULL DEFAULT NULL COMMENT '分类2',
  `categorylevelthree_id` int(11) NULL DEFAULT NULL COMMENT '分类3',
  `file_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件名称',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `PK__EASYBUY___94F6E55132E0915F`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 777 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (733, '香奈儿', '好闻的香水！！！', 152, 1, 548, 654, 655, 'baby_1.jpg');
INSERT INTO `product` VALUES (734, '洗面奶', '', 153, 75, 548, 654, 655, 'baby_2.jpg');
INSERT INTO `product` VALUES (735, '啫喱水', '', 152, 948, 548, 654, 655, 'baby_3.jpg');
INSERT INTO `product` VALUES (736, '香水', '', 152, 984, 548, 654, 655, 'baby_4.jpg');
INSERT INTO `product` VALUES (737, '香水', '', 152, 111, 548, 654, 655, 'baby_5.jpg');
INSERT INTO `product` VALUES (738, '润肤露', '', 45, 99, 548, 654, 655, 'baby_6.jpg');
INSERT INTO `product` VALUES (739, '洁面装', '', 156, 33, 548, 654, 655, 'bk_2.jpg');
INSERT INTO `product` VALUES (740, '电饭锅', '', 158, 87, 628, 656, 659, 'bk_1.jpg');
INSERT INTO `product` VALUES (741, '婴儿喂奶装', '', 569, 100, 632, 637, 653, 'bk_3.jpg');
INSERT INTO `product` VALUES (742, '坚果套餐', '', 158, 1000, 660, 661, 662, 'bk_4.jpg');
INSERT INTO `product` VALUES (743, '超甜蜜崭', '', 589, 995, 660, 661, 663, 'bk_5.jpg');
INSERT INTO `product` VALUES (744, '华为2566', '', 589, 1000, 670, 671, 672, 'de1.jpg');
INSERT INTO `product` VALUES (745, '荣耀3C', '', 589, 92, 670, 671, 672, 'de2.jpg');
INSERT INTO `product` VALUES (746, '小米手环', '', 963, 98, 670, 674, 675, 'de3.jpg');
INSERT INTO `product` VALUES (747, '华为2265', '', 896, 1000, 670, 671, 673, 'de4.jpg');
INSERT INTO `product` VALUES (748, '越南坚果', '', 520, 1, 660, 661, 662, 'de5.jpg');
INSERT INTO `product` VALUES (749, '进口马桶', '', 5866, 93, 628, 657, NULL, 'food_1.jpg');
INSERT INTO `product` VALUES (750, '联想Y系列', '', 569, 894, 670, 690, 691, 'food_2.jpg');
INSERT INTO `product` VALUES (751, '脑白金1号', '', 589, 998, 676, 677, 680, 'food_3.jpg');
INSERT INTO `product` VALUES (752, '莫里斯按', '', 589, 998, 660, 661, 662, 'food_4.jpg');
INSERT INTO `product` VALUES (753, '三鹿好奶粉', '', 859, 100, 660, 661, 662, 'food_5.jpg');
INSERT INTO `product` VALUES (754, '儿童牛奶', '', 5896, 100, 676, 679, NULL, 'food_6.jpg');
INSERT INTO `product` VALUES (755, '软沙发', '', 8596, 7, 628, 696, NULL, 'food_b1.jpg');
INSERT INTO `product` VALUES (756, '收纳盒', '', 5966, 103, 628, 696, NULL, 'food_b2.jpg');
INSERT INTO `product` VALUES (757, '洗衣液', '', 58, 1000, 628, 696, NULL, 'food_r.jpg');
INSERT INTO `product` VALUES (758, '红短沙发', '', 596, 113, 628, 696, NULL, 'fre_1.jpg');
INSERT INTO `product` VALUES (759, '新西兰奶粉', '', 5896, 100, 676, 679, NULL, 'fre_2.jpg');
INSERT INTO `product` VALUES (760, '婴儿车', '', 11000, 100, 681, 682, 687, 'fre_3.jpg');
INSERT INTO `product` VALUES (761, '夏款婴儿车', '', 963, 99, 681, 682, 688, 'fre_4.jpg');
INSERT INTO `product` VALUES (762, '抗压旅行箱', '', 569, 998, 681, 683, 685, 'fre_5.jpg');
INSERT INTO `product` VALUES (763, '透明手提箱', '', 8596, 1000, 681, 683, 684, 'fre_6.jpg');
INSERT INTO `product` VALUES (764, '婴儿果粉', '', 5896, 999, 660, 661, 662, 'milk_1.jpg');
INSERT INTO `product` VALUES (765, '椰子粉', '', 5963, 1000, 660, 661, 662, 'milk_2.jpg');
INSERT INTO `product` VALUES (766, '坚果蛋糕', '', 200, 94, 660, 661, 663, 'milk_3.jpg');
INSERT INTO `product` VALUES (767, '编制手提箱', '', 5896, 1000, 681, 682, 688, 'milk_4.jpg');
INSERT INTO `product` VALUES (768, '纸箱', '', 5896, 3, 681, 682, 687, 'milk_5.jpg');
INSERT INTO `product` VALUES (769, '健胃液', '', 152, 1000, 676, 679, NULL, 'milk_6.jpg');
INSERT INTO `product` VALUES (770, '联想NTC', '', 8596, 100, 670, 671, 673, 'milk_7.jpg');
INSERT INTO `product` VALUES (771, '香水1', NULL, 100, 100, 548, 654, 655, 'milk_8.jpg');
INSERT INTO `product` VALUES (772, '香水2', NULL, 100, 100, 548, 654, 655, 'pro1.jpg');
INSERT INTO `product` VALUES (773, '香水3', NULL, 100, 95, 548, 654, 655, 'pro2.jpg');
INSERT INTO `product` VALUES (774, '香水4', NULL, 100, 100, 548, 654, 655, 'pro3.jpg');
INSERT INTO `product` VALUES (775, '香水5', NULL, 100, 100, 548, 654, 655, 'pro4.jpg');
INSERT INTO `product` VALUES (776, '香水6', NULL, 1, 1, 548, 654, 655, 'pro5.jpg');

-- ----------------------------
-- Table structure for product_category
-- ----------------------------
DROP TABLE IF EXISTS `product_category`;
CREATE TABLE `product_category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `parent_id` int(11) NOT NULL COMMENT '父级目录id',
  `type` int(11) NULL DEFAULT NULL COMMENT '级别(1:一级 2：二级 3：三级)',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `PK__EASYBUY___9EC2A4E236B12243`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 697 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_category
-- ----------------------------
INSERT INTO `product_category` VALUES (548, '化妆品', 0, 1);
INSERT INTO `product_category` VALUES (628, '家用商品', 0, 1);
INSERT INTO `product_category` VALUES (654, '面部护理', 548, 2);
INSERT INTO `product_category` VALUES (655, '少女派', 654, 3);
INSERT INTO `product_category` VALUES (656, '餐具', 628, 2);
INSERT INTO `product_category` VALUES (657, '卫具', 628, 2);
INSERT INTO `product_category` VALUES (658, '叉子', 656, 3);
INSERT INTO `product_category` VALUES (659, '锅', 656, 3);
INSERT INTO `product_category` VALUES (660, '进口食品', 0, 1);
INSERT INTO `product_category` VALUES (661, '零食/糖果/巧克力', 660, 2);
INSERT INTO `product_category` VALUES (662, '坚果', 661, 3);
INSERT INTO `product_category` VALUES (663, '蜜饯', 661, 3);
INSERT INTO `product_category` VALUES (669, '孕期教育', 546, 3);
INSERT INTO `product_category` VALUES (670, '电子商品', 0, 1);
INSERT INTO `product_category` VALUES (671, '手机', 670, 2);
INSERT INTO `product_category` VALUES (672, '华为手机', 671, 3);
INSERT INTO `product_category` VALUES (673, '联想手机', 671, 3);
INSERT INTO `product_category` VALUES (674, '手环', 670, 2);
INSERT INTO `product_category` VALUES (675, '小米手环', 674, 3);
INSERT INTO `product_category` VALUES (676, '保健食品', 0, 1);
INSERT INTO `product_category` VALUES (677, '老年保健品', 676, 2);
INSERT INTO `product_category` VALUES (678, '中年营养品', 676, 2);
INSERT INTO `product_category` VALUES (679, '儿童保健品', 676, 2);
INSERT INTO `product_category` VALUES (680, '脑白金', 677, 3);
INSERT INTO `product_category` VALUES (681, '箱包', 0, 1);
INSERT INTO `product_category` VALUES (682, '旅行箱', 681, 2);
INSERT INTO `product_category` VALUES (683, '手提箱', 681, 2);
INSERT INTO `product_category` VALUES (684, '大型', 683, 3);
INSERT INTO `product_category` VALUES (685, '小型', 683, 3);
INSERT INTO `product_category` VALUES (686, '中型', 683, 3);
INSERT INTO `product_category` VALUES (687, '大型', 682, 3);
INSERT INTO `product_category` VALUES (688, '中型', 682, 3);
INSERT INTO `product_category` VALUES (689, '小型', 682, 3);
INSERT INTO `product_category` VALUES (690, '电脑', 670, 2);
INSERT INTO `product_category` VALUES (691, '联想电脑', 690, 3);
INSERT INTO `product_category` VALUES (692, '刀叉', 656, 3);
INSERT INTO `product_category` VALUES (693, '碗筷', 656, 3);
INSERT INTO `product_category` VALUES (696, '客厅专用', 628, 2);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `login_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录名',
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `gender` int(11) NOT NULL DEFAULT 1 COMMENT '性别(1:男 0：女)',
  `email` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机',
  `file_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `PK__EASYBUY___C96109CC3A81B327`(`login_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 62 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (58, 'test', '张三', 'b3472e734711122a5c892c3a93705ed11d1513d59b107d57', 1, '123@test.com', '13312345678', NULL, '2021-11-18 12:55:37', '2021-11-18 12:55:37');
INSERT INTO `user` VALUES (59, 'test2', '张三', 'f1bc53d58d67b98a3d41a247a94f5b11de5aa2bc61596723', 1, '123@test.com', '13312345678', NULL, '2021-11-18 13:00:07', '2021-11-18 13:00:07');
INSERT INTO `user` VALUES (61, 'test3', '嘉琳', 'b2830a17947e65ac6c28cf0fc2de4f100f92c1d904204d67', 0, '123@sina.com', '13312345678', NULL, '2024-02-03 08:06:08', '2024-02-03 08:06:08');

-- ----------------------------
-- Table structure for user_address
-- ----------------------------
DROP TABLE IF EXISTS `user_address`;
CREATE TABLE `user_address`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户主键',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `isdefault` int(11) NULL DEFAULT 0 COMMENT '是否是默认地址（1:是 0否）',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 60 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_address
-- ----------------------------
INSERT INTO `user_address` VALUES (49, 56, 'IT园', '公司', 0, '2020-05-21 15:55:24', '2020-07-29 11:22:13');
INSERT INTO `user_address` VALUES (50, 56, '软件园', '公司', 0, '2020-05-22 15:11:07', '2020-07-25 09:14:19');
INSERT INTO `user_address` VALUES (57, 56, '测试', '测试', 0, '2021-11-17 18:04:49', '2021-11-17 18:04:49');
INSERT INTO `user_address` VALUES (59, 59, '软件园', '公司', 1, '2021-11-18 13:01:19', '2021-11-18 13:01:19');

SET FOREIGN_KEY_CHECKS = 1;
