/*
 Navicat MySQL Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50729
 Source Host           : localhost:3306
 Source Schema         : mall

 Target Server Type    : MySQL
 Target Server Version : 50729
 File Encoding         : 65001

 Date: 19/06/2022 12:09:41
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_good_color_img
-- ----------------------------
DROP TABLE IF EXISTS `tb_good_color_img`;
CREATE TABLE `tb_good_color_img`  (
  `good_id` int(11) NOT NULL,
  `good_color` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`good_id`, `good_color`) USING BTREE,
  INDEX `good_id`(`good_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_good_color_img
-- ----------------------------
INSERT INTO `tb_good_color_img` VALUES (10001, '橙', '544881578.jpg');
INSERT INTO `tb_good_color_img` VALUES (10001, '灰', '700601355.jpg');
INSERT INTO `tb_good_color_img` VALUES (10001, '红', '816042392.jpg');
INSERT INTO `tb_good_color_img` VALUES (10001, '绿', '527204098.jpg');
INSERT INTO `tb_good_color_img` VALUES (10001, '黄', '168604505.jpg');
INSERT INTO `tb_good_color_img` VALUES (10001, '黑', '243832474.jpg');
INSERT INTO `tb_good_color_img` VALUES (10002, '配色1', '412233133.jpg');
INSERT INTO `tb_good_color_img` VALUES (10002, '配色2', '356457104.jpg');
INSERT INTO `tb_good_color_img` VALUES (10002, '配色3', '312342912.jpg');
INSERT INTO `tb_good_color_img` VALUES (10002, '配色4', '922548081.jpg');
INSERT INTO `tb_good_color_img` VALUES (10002, '配色5', '999713590.jpg');
INSERT INTO `tb_good_color_img` VALUES (10002, '配色6', '952375529.jpg');
INSERT INTO `tb_good_color_img` VALUES (10003, '熊猫配色2', '273136521.jpg');
INSERT INTO `tb_good_color_img` VALUES (10003, '熊猫配色3', '925800235.jpg');
INSERT INTO `tb_good_color_img` VALUES (10003, '熊猫黑', '458611021.jpg');
INSERT INTO `tb_good_color_img` VALUES (10003, '香料红', '327113964.jpg');
INSERT INTO `tb_good_color_img` VALUES (10003, '黑白', '842909351.jpg');
INSERT INTO `tb_good_color_img` VALUES (10004, '白', '414757414.jpg');
INSERT INTO `tb_good_color_img` VALUES (10004, '蓝', '955813783.jpg');
INSERT INTO `tb_good_color_img` VALUES (10004, '青', '913451624.jpg');
INSERT INTO `tb_good_color_img` VALUES (10004, '黑', '188831458.jpg');
INSERT INTO `tb_good_color_img` VALUES (10005, '白', '207369965.jpg');
INSERT INTO `tb_good_color_img` VALUES (10005, '黑', '375168005.jpg');
INSERT INTO `tb_good_color_img` VALUES (10006, '白', '484294400.jpg');
INSERT INTO `tb_good_color_img` VALUES (10006, '红', '274383557.jpg');
INSERT INTO `tb_good_color_img` VALUES (10006, '绿', '29210672.jpg');
INSERT INTO `tb_good_color_img` VALUES (10006, '蓝', '618722116.jpg');
INSERT INTO `tb_good_color_img` VALUES (10006, '黄', '419930800.jpg');
INSERT INTO `tb_good_color_img` VALUES (10006, '黑', '504971057.jpg');
INSERT INTO `tb_good_color_img` VALUES (10007, '红', '50351337.jpg');
INSERT INTO `tb_good_color_img` VALUES (10007, '绿', '10634224.jpg');
INSERT INTO `tb_good_color_img` VALUES (10007, '蓝', '818483752.jpg');
INSERT INTO `tb_good_color_img` VALUES (10007, '金', '273394872.jpg');
INSERT INTO `tb_good_color_img` VALUES (10007, '黑', '763364512.jpg');
INSERT INTO `tb_good_color_img` VALUES (10008, '棕', '687709999.jpg');
INSERT INTO `tb_good_color_img` VALUES (10008, '白', '152709060.jpg');
INSERT INTO `tb_good_color_img` VALUES (10008, '粉', '566972589.jpg');
INSERT INTO `tb_good_color_img` VALUES (10008, '红', '298321066.jpg');
INSERT INTO `tb_good_color_img` VALUES (10008, '蓝', '38143219.jpg');
INSERT INTO `tb_good_color_img` VALUES (10008, '黑', '915432662.jpg');
INSERT INTO `tb_good_color_img` VALUES (10009, '红', '903108373.jpg');
INSERT INTO `tb_good_color_img` VALUES (10009, '绿', '383618889.jpg');
INSERT INTO `tb_good_color_img` VALUES (10009, '黑', '966556961.jpg');
INSERT INTO `tb_good_color_img` VALUES (10010, '棕', '295392113.jpg');
INSERT INTO `tb_good_color_img` VALUES (10010, '蓝', '952025173.jpg');
INSERT INTO `tb_good_color_img` VALUES (10010, '银', '182668289.jpg');
INSERT INTO `tb_good_color_img` VALUES (10010, '黑', '493880652.jpg');
INSERT INTO `tb_good_color_img` VALUES (10011, '图案1', '562039332.jpg');
INSERT INTO `tb_good_color_img` VALUES (10011, '图案2', '319644873.jpg');
INSERT INTO `tb_good_color_img` VALUES (10011, '图案3', '86828183.jpg');
INSERT INTO `tb_good_color_img` VALUES (10011, '图案4', '214375102.jpg');
INSERT INTO `tb_good_color_img` VALUES (10011, '图案5', '254452414.jpg');
INSERT INTO `tb_good_color_img` VALUES (10011, '图案6', '649937111.jpg');
INSERT INTO `tb_good_color_img` VALUES (10012, '橙', '640627450.jpg');
INSERT INTO `tb_good_color_img` VALUES (10012, '白', '574354403.jpg');
INSERT INTO `tb_good_color_img` VALUES (10012, '红', '125755390.jpg');
INSERT INTO `tb_good_color_img` VALUES (10012, '绿', '164687308.jpg');
INSERT INTO `tb_good_color_img` VALUES (10012, '蓝', '908237875.jpg');
INSERT INTO `tb_good_color_img` VALUES (10012, '黑', '282046671.jpg');
INSERT INTO `tb_good_color_img` VALUES (10013, '棕', '435330976.jpg');
INSERT INTO `tb_good_color_img` VALUES (10013, '橙', '34545413.jpg');
INSERT INTO `tb_good_color_img` VALUES (10013, '白', '735997888.jpg');
INSERT INTO `tb_good_color_img` VALUES (10013, '绿', '34005101.jpg');
INSERT INTO `tb_good_color_img` VALUES (10013, '蓝', '77743083.jpg');
INSERT INTO `tb_good_color_img` VALUES (10013, '黑', '729149533.jpg');
INSERT INTO `tb_good_color_img` VALUES (10014, '灰', '70136174.jpg');
INSERT INTO `tb_good_color_img` VALUES (10014, '粉', '451167912.jpg');
INSERT INTO `tb_good_color_img` VALUES (10014, '蓝', '579444008.jpg');
INSERT INTO `tb_good_color_img` VALUES (10015, '白', '829630681.jpg');
INSERT INTO `tb_good_color_img` VALUES (10015, '黑', '549102551.jpg');
INSERT INTO `tb_good_color_img` VALUES (10016, '橙', '299718391.jpg');
INSERT INTO `tb_good_color_img` VALUES (10016, '灰', '516172680.jpg');
INSERT INTO `tb_good_color_img` VALUES (10016, '白', '623436460.jpg');
INSERT INTO `tb_good_color_img` VALUES (10016, '红', '795820293.jpg');
INSERT INTO `tb_good_color_img` VALUES (10016, '绿', '274595733.jpg');
INSERT INTO `tb_good_color_img` VALUES (10016, '蓝', '377211519.jpg');
INSERT INTO `tb_good_color_img` VALUES (10017, '星空钻', '858204536.jpg');
INSERT INTO `tb_good_color_img` VALUES (10017, '晚霞', '296955298.jpg');
INSERT INTO `tb_good_color_img` VALUES (10017, '月亮神', '669758089.jpg');
INSERT INTO `tb_good_color_img` VALUES (10017, '樱桃粉', '527405706.jpg');
INSERT INTO `tb_good_color_img` VALUES (10017, '蒂芙尼绿', '624774124.jpg');
INSERT INTO `tb_good_color_img` VALUES (10017, '马卡龙', '669891480.jpg');
INSERT INTO `tb_good_color_img` VALUES (10018, '橙', '238184769.jpg');
INSERT INTO `tb_good_color_img` VALUES (10018, '白 ', '51811772.jpg');
INSERT INTO `tb_good_color_img` VALUES (10018, '粉', '325552894.jpg');
INSERT INTO `tb_good_color_img` VALUES (10018, '红', '378541796.jpg');
INSERT INTO `tb_good_color_img` VALUES (10018, '蓝', '879466713.jpg');
INSERT INTO `tb_good_color_img` VALUES (10018, '黑', '879013530.jpg');
INSERT INTO `tb_good_color_img` VALUES (10019, '形状2', '665140897.jpg');
INSERT INTO `tb_good_color_img` VALUES (10020, '灰', '975468198.jpg');
INSERT INTO `tb_good_color_img` VALUES (10020, '白', '881459231.jpg');
INSERT INTO `tb_good_color_img` VALUES (10020, '红', '97363939.jpg');
INSERT INTO `tb_good_color_img` VALUES (10020, '蓝', '72402347.jpg');
INSERT INTO `tb_good_color_img` VALUES (10020, '黄', '690687019.jpg');
INSERT INTO `tb_good_color_img` VALUES (10020, '黑', '761855117.jpg');
INSERT INTO `tb_good_color_img` VALUES (10021, '白', '558490544.jpg');
INSERT INTO `tb_good_color_img` VALUES (10021, '米', '768424298.jpg');
INSERT INTO `tb_good_color_img` VALUES (10021, '黑', '821453439.jpg');
INSERT INTO `tb_good_color_img` VALUES (10022, '棕', '726889121.jpg');
INSERT INTO `tb_good_color_img` VALUES (10022, '灰', '526821392.jpg');
INSERT INTO `tb_good_color_img` VALUES (10022, '白', '56022612.jpg');
INSERT INTO `tb_good_color_img` VALUES (10022, '黑', '989876044.jpg');
INSERT INTO `tb_good_color_img` VALUES (10023, '米', '95000427.jpg');
INSERT INTO `tb_good_color_img` VALUES (10023, '绿', '415781899.jpg');
INSERT INTO `tb_good_color_img` VALUES (10023, '蓝', '293072996.jpg');
INSERT INTO `tb_good_color_img` VALUES (10024, '棕', '851664899.jpg');
INSERT INTO `tb_good_color_img` VALUES (10024, '灰', '472825149.jpg');
INSERT INTO `tb_good_color_img` VALUES (10024, '白', '698700182.jpg');
INSERT INTO `tb_good_color_img` VALUES (10024, '蓝', '613321730.jpg');
INSERT INTO `tb_good_color_img` VALUES (10024, '黑', '679862603.jpg');
INSERT INTO `tb_good_color_img` VALUES (10024, '黑白', '358504364.jpg');
INSERT INTO `tb_good_color_img` VALUES (10025, '卡其', '567411222.jpg');
INSERT INTO `tb_good_color_img` VALUES (10025, '棕', '155794062.jpg');
INSERT INTO `tb_good_color_img` VALUES (10025, '黑', '444191196.jpg');
INSERT INTO `tb_good_color_img` VALUES (10026, '灰', '849123730.jpg');
INSERT INTO `tb_good_color_img` VALUES (10026, '白', '190521239.jpg');
INSERT INTO `tb_good_color_img` VALUES (10026, '红', '929309544.jpg');
INSERT INTO `tb_good_color_img` VALUES (10026, '绿', '37692444.jpg');
INSERT INTO `tb_good_color_img` VALUES (10026, '黄', '889357418.jpg');
INSERT INTO `tb_good_color_img` VALUES (10026, '黑', '701498599.jpg');
INSERT INTO `tb_good_color_img` VALUES (10027, '棕', '572623978.jpg');
INSERT INTO `tb_good_color_img` VALUES (10027, '灰', '982087787.jpg');
INSERT INTO `tb_good_color_img` VALUES (10027, '白', '173672617.jpg');
INSERT INTO `tb_good_color_img` VALUES (10027, '黑', '52338331.jpg');
INSERT INTO `tb_good_color_img` VALUES (100119, '形状1', '852664728.jpg');

-- ----------------------------
-- Table structure for tb_good_part
-- ----------------------------
DROP TABLE IF EXISTS `tb_good_part`;
CREATE TABLE `tb_good_part`  (
  `good_id` int(11) NOT NULL,
  `color` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `size` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  INDEX `good_id`(`good_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_good_part
-- ----------------------------
INSERT INTO `tb_good_part` VALUES (10001, '黑', '40');
INSERT INTO `tb_good_part` VALUES (10001, '橙', '41');
INSERT INTO `tb_good_part` VALUES (10001, '黄', '42');
INSERT INTO `tb_good_part` VALUES (10001, '灰', '43');
INSERT INTO `tb_good_part` VALUES (10001, '绿', '44');
INSERT INTO `tb_good_part` VALUES (10001, '红', '45');
INSERT INTO `tb_good_part` VALUES (10002, '配色1', 'iPhone');
INSERT INTO `tb_good_part` VALUES (10002, '配色2', 'iPhone12');
INSERT INTO `tb_good_part` VALUES (10002, '配色3', 'iPhone12');
INSERT INTO `tb_good_part` VALUES (10002, '配色4', 'iPhone12');
INSERT INTO `tb_good_part` VALUES (10002, '配色5', 'iPhone12');
INSERT INTO `tb_good_part` VALUES (10002, '配色6', 'iPhone12');
INSERT INTO `tb_good_part` VALUES (10003, '黑白', '40');
INSERT INTO `tb_good_part` VALUES (10003, '香料红', '41');
INSERT INTO `tb_good_part` VALUES (10003, '熊猫黑', '42');
INSERT INTO `tb_good_part` VALUES (10003, '熊猫配色2', '43');
INSERT INTO `tb_good_part` VALUES (10003, '熊猫配色3', '44');
INSERT INTO `tb_good_part` VALUES (10004, '白', 'XL');
INSERT INTO `tb_good_part` VALUES (10004, '黑', 'S');
INSERT INTO `tb_good_part` VALUES (10004, '蓝', 'M');
INSERT INTO `tb_good_part` VALUES (10004, '青', 'L');
INSERT INTO `tb_good_part` VALUES (10005, '黑', 'iPhone12');
INSERT INTO `tb_good_part` VALUES (10005, '白', 'iPhone13');
INSERT INTO `tb_good_part` VALUES (10006, '白', 'XL');
INSERT INTO `tb_good_part` VALUES (10006, '黑', 'S');
INSERT INTO `tb_good_part` VALUES (10006, '红', 'M');
INSERT INTO `tb_good_part` VALUES (10006, '黄', 'L');
INSERT INTO `tb_good_part` VALUES (10006, '蓝', 'XXL');
INSERT INTO `tb_good_part` VALUES (10006, '绿', 'XXXL');
INSERT INTO `tb_good_part` VALUES (10007, '黑', '300ml');
INSERT INTO `tb_good_part` VALUES (10007, '红', '350ml');
INSERT INTO `tb_good_part` VALUES (10007, '金', '400ml');
INSERT INTO `tb_good_part` VALUES (10007, '蓝', '450ml');
INSERT INTO `tb_good_part` VALUES (10007, '绿', '500ml');
INSERT INTO `tb_good_part` VALUES (10008, '白', '200ml');
INSERT INTO `tb_good_part` VALUES (10008, '粉', '250ml');
INSERT INTO `tb_good_part` VALUES (10008, '黑', '300ml');
INSERT INTO `tb_good_part` VALUES (10008, '红', '350ml');
INSERT INTO `tb_good_part` VALUES (10008, '蓝', '150ml');
INSERT INTO `tb_good_part` VALUES (10008, '棕', '100ml');
INSERT INTO `tb_good_part` VALUES (10009, '黑', '200ml');
INSERT INTO `tb_good_part` VALUES (10009, '红', '250ml');
INSERT INTO `tb_good_part` VALUES (10009, '绿', '300ml');
INSERT INTO `tb_good_part` VALUES (10010, '黑', '280ml');
INSERT INTO `tb_good_part` VALUES (10010, '蓝', '280ml');
INSERT INTO `tb_good_part` VALUES (10010, '银', '280ml');
INSERT INTO `tb_good_part` VALUES (10010, '棕', '280ml');
INSERT INTO `tb_good_part` VALUES (10011, '图案1', '90ml');
INSERT INTO `tb_good_part` VALUES (10011, '图案2', '90ml');
INSERT INTO `tb_good_part` VALUES (10011, '图案3', '90ml');
INSERT INTO `tb_good_part` VALUES (10011, '图案4', '90ml');
INSERT INTO `tb_good_part` VALUES (10011, '图案5', '90ml');
INSERT INTO `tb_good_part` VALUES (10011, '图案6', '90ml');
INSERT INTO `tb_good_part` VALUES (10012, '白', 'S');
INSERT INTO `tb_good_part` VALUES (10012, '橙', 'M');
INSERT INTO `tb_good_part` VALUES (10012, '黑', 'L');
INSERT INTO `tb_good_part` VALUES (10012, '红', 'XL');
INSERT INTO `tb_good_part` VALUES (10012, '蓝', 'XXL');
INSERT INTO `tb_good_part` VALUES (10012, '绿', 'XXXL');
INSERT INTO `tb_good_part` VALUES (10013, '白', 'S');
INSERT INTO `tb_good_part` VALUES (10013, '橙', 'M');
INSERT INTO `tb_good_part` VALUES (10013, '黑', 'L');
INSERT INTO `tb_good_part` VALUES (10013, '蓝', 'XL');
INSERT INTO `tb_good_part` VALUES (10013, '绿', 'XXL');
INSERT INTO `tb_good_part` VALUES (10013, '棕', 'XXXL');
INSERT INTO `tb_good_part` VALUES (10014, '粉', '40');
INSERT INTO `tb_good_part` VALUES (10014, '灰', '41');
INSERT INTO `tb_good_part` VALUES (10014, '蓝', '42');
INSERT INTO `tb_good_part` VALUES (10015, '黑', '41');
INSERT INTO `tb_good_part` VALUES (10015, '白', '42');
INSERT INTO `tb_good_part` VALUES (10016, '白', '39');
INSERT INTO `tb_good_part` VALUES (10016, '橙', '40');
INSERT INTO `tb_good_part` VALUES (10016, '红', '41');
INSERT INTO `tb_good_part` VALUES (10016, '灰', '42');
INSERT INTO `tb_good_part` VALUES (10016, '蓝', '43');
INSERT INTO `tb_good_part` VALUES (10016, '绿', '44');
INSERT INTO `tb_good_part` VALUES (10017, '蒂芙尼绿', '35');
INSERT INTO `tb_good_part` VALUES (10017, '马卡龙', '36');
INSERT INTO `tb_good_part` VALUES (10017, '晚霞', '37');
INSERT INTO `tb_good_part` VALUES (10017, '星空钻', '38');
INSERT INTO `tb_good_part` VALUES (10017, '樱桃粉', '39');
INSERT INTO `tb_good_part` VALUES (10017, '月亮神', '40');
INSERT INTO `tb_good_part` VALUES (10018, '白 ', 'S');
INSERT INTO `tb_good_part` VALUES (10018, '橙', 'M');
INSERT INTO `tb_good_part` VALUES (10018, '粉', 'L');
INSERT INTO `tb_good_part` VALUES (10018, '黑', 'XL');
INSERT INTO `tb_good_part` VALUES (10018, '红', 'XXL');
INSERT INTO `tb_good_part` VALUES (10018, '蓝', 'XXXL');
INSERT INTO `tb_good_part` VALUES (100119, '形状1', '250ml');
INSERT INTO `tb_good_part` VALUES (10019, '形状2', '250ml');
INSERT INTO `tb_good_part` VALUES (10020, '白', 'S');
INSERT INTO `tb_good_part` VALUES (10020, '黑', 'M');
INSERT INTO `tb_good_part` VALUES (10020, '红', 'L');
INSERT INTO `tb_good_part` VALUES (10020, '黄', 'XL');
INSERT INTO `tb_good_part` VALUES (10020, '灰', 'XXL');
INSERT INTO `tb_good_part` VALUES (10020, '蓝', 'XXXL');
INSERT INTO `tb_good_part` VALUES (10021, '黑', '35');
INSERT INTO `tb_good_part` VALUES (10021, '白', '36');
INSERT INTO `tb_good_part` VALUES (10021, '米', '37');
INSERT INTO `tb_good_part` VALUES (10022, '白', 'M');
INSERT INTO `tb_good_part` VALUES (10022, '黑', 'L');
INSERT INTO `tb_good_part` VALUES (10022, '灰', 'XL');
INSERT INTO `tb_good_part` VALUES (10022, '棕', 'XXL');
INSERT INTO `tb_good_part` VALUES (10023, '蓝', '300ml');
INSERT INTO `tb_good_part` VALUES (10023, '绿', '400ml');
INSERT INTO `tb_good_part` VALUES (10023, '米', '500ml');
INSERT INTO `tb_good_part` VALUES (10024, '白', '36');
INSERT INTO `tb_good_part` VALUES (10024, '黑', '37');
INSERT INTO `tb_good_part` VALUES (10024, '黑白', '38');
INSERT INTO `tb_good_part` VALUES (10024, '灰', '39');
INSERT INTO `tb_good_part` VALUES (10024, '蓝', '40');
INSERT INTO `tb_good_part` VALUES (10024, '棕', '41');
INSERT INTO `tb_good_part` VALUES (10025, '黑', '35');
INSERT INTO `tb_good_part` VALUES (10025, '卡其', '36');
INSERT INTO `tb_good_part` VALUES (10025, '棕', '37');
INSERT INTO `tb_good_part` VALUES (10026, '白', 'S');
INSERT INTO `tb_good_part` VALUES (10026, '黑', 'M');
INSERT INTO `tb_good_part` VALUES (10026, '红', 'L');
INSERT INTO `tb_good_part` VALUES (10026, '黄', 'XXL');
INSERT INTO `tb_good_part` VALUES (10026, '灰', 'XL');
INSERT INTO `tb_good_part` VALUES (10026, '绿', 'XXXL');
INSERT INTO `tb_good_part` VALUES (10027, '白', 'M');
INSERT INTO `tb_good_part` VALUES (10027, '黑', 'L');
INSERT INTO `tb_good_part` VALUES (10027, '灰', 'XL');
INSERT INTO `tb_good_part` VALUES (10027, '棕', 'XXL');

-- ----------------------------
-- Table structure for tb_goods
-- ----------------------------
DROP TABLE IF EXISTS `tb_goods`;
CREATE TABLE `tb_goods`  (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` int(10) NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `hot` int(10) NULL DEFAULT NULL,
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sale` int(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_goods
-- ----------------------------
INSERT INTO `tb_goods` VALUES (10001, 'AF1空军一号板鞋', 1399, '鞋子', 17, '583964602.jpg', 2);
INSERT INTO `tb_goods` VALUES (10002, 'iPhone手机壳-虎年', 50, '手机壳', 4, '374757836.jpg', 0);
INSERT INTO `tb_goods` VALUES (10003, 'Nike Air Force 1', 1299, '鞋子', 3, '677612531.jpg', 0);
INSERT INTO `tb_goods` VALUES (10004, 'polo衫', 89, '衣服', 6, '846917611.jpg', 0);
INSERT INTO `tb_goods` VALUES (10005, '啊对对对手机壳', 35, '手机壳', 0, '927177754.jpg', 0);
INSERT INTO `tb_goods` VALUES (10006, '短袖T恤', 69, '衣服', 8, '571007459.jpg', 0);
INSERT INTO `tb_goods` VALUES (10007, '保温杯', 119, '杯子', 4, '471442352.jpg', 0);
INSERT INTO `tb_goods` VALUES (10008, '圆筒杯', 25, '杯子', 5, '276526038.jpg', 0);
INSERT INTO `tb_goods` VALUES (10009, '咖啡杯', 39, '杯子', 9, '616461675.jpg', 0);
INSERT INTO `tb_goods` VALUES (10010, '玻璃杯', 88, '杯子', 0, '512914605.jpg', 0);
INSERT INTO `tb_goods` VALUES (10011, '茶杯', 22, '杯子', 5, '761846127.jpg', 0);
INSERT INTO `tb_goods` VALUES (10012, '短袖polo衫', 69, '衣服', 5, '943323110.jpg', 0);
INSERT INTO `tb_goods` VALUES (10013, '工装休闲裤', 69, '裤子', 6, '937523500.jpg', 0);
INSERT INTO `tb_goods` VALUES (10014, '海豚鞋', 19, '鞋子', 1, '367371230.jpg', 0);
INSERT INTO `tb_goods` VALUES (10015, '回力帆布鞋', 239, '鞋子', 1, '987743439.jpg', 0);
INSERT INTO `tb_goods` VALUES (10016, '空军', 1399, '鞋子', 5, '313985036.jpg', 0);
INSERT INTO `tb_goods` VALUES (10017, '空军(女)', 1299, '鞋子', 3, '247924696.jpg', 0);
INSERT INTO `tb_goods` VALUES (10018, '宽松短袖', 79, '衣服', 4, '53674817.jpg', 0);
INSERT INTO `tb_goods` VALUES (10019, '马克杯', 23, '杯子', 0, '315607881.jpg', 0);
INSERT INTO `tb_goods` VALUES (10020, '毛圈款卫衣', 99, '衣服', 2, '388117451.jpg', 0);
INSERT INTO `tb_goods` VALUES (10021, '帆布鞋', 89, '鞋子', 0, '514513918.jpg', 0);
INSERT INTO `tb_goods` VALUES (10022, '束脚休闲裤', 69, '裤子', 4, '985337107.jpg', 0);
INSERT INTO `tb_goods` VALUES (10023, '信封杯', 129, '杯子', 4, '898891890.jpg', 0);
INSERT INTO `tb_goods` VALUES (10024, '星星鞋', 77, '鞋子', 5, '392251675.jpg', 0);
INSERT INTO `tb_goods` VALUES (10025, '雪地靴', 229, '鞋子', 1, '402726245.jpg', 0);
INSERT INTO `tb_goods` VALUES (10026, '摇粒绒卫衣', 119, '衣服', 2, '575349595.jpg', 0);
INSERT INTO `tb_goods` VALUES (10027, '直筒短裤', 59, '裤子', 1, '327858179.jpg', 0);

-- ----------------------------
-- Table structure for tb_orders
-- ----------------------------
DROP TABLE IF EXISTS `tb_orders`;
CREATE TABLE `tb_orders`  (
  `id` bigint(30) NOT NULL AUTO_INCREMENT,
  `good_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `good_size` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `good_color` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `good_image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `money` int(10) NULL DEFAULT NULL,
  `telephone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `date` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `good`(`good_id`) USING BTREE,
  INDEX `users`(`user_id`) USING BTREE,
  CONSTRAINT `good` FOREIGN KEY (`good_id`) REFERENCES `tb_goods` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `users` FOREIGN KEY (`user_id`) REFERENCES `tb_users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 202258101019 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_orders
-- ----------------------------
INSERT INTO `tb_orders` VALUES (20225751737, 10001, 1002, '福建省厦门市集美区后溪镇理工路600号', '40', '灰', '567279569.jpg', 1399, '18020737930', '2022-06-07 17:27:37', '定制中');
INSERT INTO `tb_orders` VALUES (202258101018, 10001, 1003, '福建省厦门市集美区理工路630号', '40', '绿', '220665190.jpg', 1399, '18020737930', '2022-06-08 10:45:18', '已收货');

-- ----------------------------
-- Table structure for tb_type
-- ----------------------------
DROP TABLE IF EXISTS `tb_type`;
CREATE TABLE `tb_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_type
-- ----------------------------
INSERT INTO `tb_type` VALUES (1, '衣服');
INSERT INTO `tb_type` VALUES (2, '裤子');
INSERT INTO `tb_type` VALUES (3, '鞋子');
INSERT INTO `tb_type` VALUES (4, '杯子');
INSERT INTO `tb_type` VALUES (5, '手机壳');

-- ----------------------------
-- Table structure for tb_user_address
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_address`;
CREATE TABLE `tb_user_address`  (
  `id` int(11) NOT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  INDEX `user`(`id`) USING BTREE,
  CONSTRAINT `user` FOREIGN KEY (`id`) REFERENCES `tb_users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_user_address
-- ----------------------------
INSERT INTO `tb_user_address` VALUES (1002, '福建省厦门市集美区后溪镇理工路600号');

-- ----------------------------
-- Table structure for tb_user_order
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_order`;
CREATE TABLE `tb_user_order`  (
  `id` int(11) NOT NULL,
  `order_id` bigint(15) NOT NULL,
  PRIMARY KEY (`id`, `order_id`) USING BTREE,
  INDEX `orderid_id`(`order_id`) USING BTREE,
  CONSTRAINT `id_id` FOREIGN KEY (`id`) REFERENCES `tb_users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `orderid_id` FOREIGN KEY (`order_id`) REFERENCES `tb_orders` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_user_order
-- ----------------------------

-- ----------------------------
-- Table structure for tb_users
-- ----------------------------
DROP TABLE IF EXISTS `tb_users`;
CREATE TABLE `tb_users`  (
  `id` int(11) NOT NULL,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `telephone` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_username`(`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_users
-- ----------------------------
INSERT INTO `tb_users` VALUES (1001, 'admin', 'EFG@AB', '18020737930', '18020737930@163.com', '已激活');
INSERT INTO `tb_users` VALUES (1002, '123456', 'EFG@AB', '18020737930', '18020737930@163.com', '已激活');
INSERT INTO `tb_users` VALUES (1003, '111111', 'EFG@AB', '18020737930', '18020737930@163.com', '已激活');

SET FOREIGN_KEY_CHECKS = 1;
