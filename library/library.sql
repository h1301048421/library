/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50725
 Source Host           : localhost:3306
 Source Schema         : library

 Target Server Type    : MySQL
 Target Server Version : 50725
 File Encoding         : 65001

 Date: 29/06/2020 22:42:16
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `publish` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ISBN` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `price` decimal(10, 2) NOT NULL,
  `classId` int(11) NULL DEFAULT NULL,
  `number` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `book_classid`(`classId`) USING BTREE,
  CONSTRAINT `book_classid` FOREIGN KEY (`classId`) REFERENCES `book_class` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES (1, 'Java入门', 'Thinking in Java', '机械工业出版社', '9787111213826', 108.00, 1, 10);
INSERT INTO `book` VALUES (2, 'Java入门', 'Thinking in Java', '机械工业出版社', '9787111213826', 108.00, 1, 9);
INSERT INTO `book` VALUES (3, 'Java入门', 'Thinking in Java', '机械工业出版社', '9787111213826', 108.00, 2, 9);
INSERT INTO `book` VALUES (4, 'Java入门', 'Thinking in Java', '机械工业出版社', '9787111213826', 108.00, 3, 9);
INSERT INTO `book` VALUES (5, 'Java入门', 'Thinking in Java', '机械工业出版社', '9787111213826', 108.00, 2, 9);
INSERT INTO `book` VALUES (6, 'Java入门', 'Thinking in Java', '机械工业出版社', '9787111213826', 108.00, 1, 9);
INSERT INTO `book` VALUES (7, 'Java入门', 'Thinking in Java', '机械工业出版社', '9787111213826', 108.00, 4, 9);
INSERT INTO `book` VALUES (8, 'Java入门', 'Thinking in Java', '机械工业出版社', '9787111213826', 108.00, 1, 9);
INSERT INTO `book` VALUES (9, 'Java入门', 'Thinking in Java', '机械工业出版社', '9787111213826', 108.00, 1, 9);
INSERT INTO `book` VALUES (10, 'Java入门', 'Thinking in Java', '机械工业出版社', '9787111213826', 108.00, 1, 9);
INSERT INTO `book` VALUES (11, 'Java入门', 'Thinking in Java', '机械工业出版社', '9787111213826', 108.00, 1, 9);
INSERT INTO `book` VALUES (12, 'Java入门', 'Thinking in Java', '机械工业出版社', '9787111213826', 108.00, 1, 9);
INSERT INTO `book` VALUES (13, 'Java入门', 'Thinking in Java', '机械工业出版社', '9787111213826', 108.00, 1, 9);
INSERT INTO `book` VALUES (14, 'Java入门', 'Thinking in Java', '机械工业出版社', '9787111213826', 108.00, 1, 9);
INSERT INTO `book` VALUES (15, 'Java入门', 'Thinking in Java', '机械工业出版社', '9787111213826', 108.00, 1, 9);
INSERT INTO `book` VALUES (16, 'Java入门', 'Thinking in Java', '机械工业出版社', '9787111213826', 108.00, 1, 9);
INSERT INTO `book` VALUES (17, 'Java入门', 'Thinking in Java', '机械工业出版社', '9787111213826', 108.00, 1, 9);
INSERT INTO `book` VALUES (18, 'Java入门', 'Thinking in Java', '机械工业出版社', '9787111213826', 108.00, 1, 9);
INSERT INTO `book` VALUES (25, '程序员的自我修养', '哈利波特', '清华大学出版社', '1111111111111', 50.00, 3, 0);
INSERT INTO `book` VALUES (28, '目送', '龙应台', '机械工业出版社', '9787111213826', 108.00, 3, 10);
INSERT INTO `book` VALUES (29, '面向对象编程', 'Java', '清华大学出版社', '22222222222', 52.00, 1, 10);
INSERT INTO `book` VALUES (30, '霍乱时期的爱情', '加西亚·马尔克斯', '南海出版公司', '9787544258975', 39.50, 3, 20);
INSERT INTO `book` VALUES (31, '小王子', '安东尼·德·圣-埃克苏佩里', '人民文学出版社', '9787020042494', 22.00, 3, 17);

-- ----------------------------
-- Table structure for book_class
-- ----------------------------
DROP TABLE IF EXISTS `book_class`;
CREATE TABLE `book_class`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book_class
-- ----------------------------
INSERT INTO `book_class` VALUES (1, '计算机类');
INSERT INTO `book_class` VALUES (2, '哲学类');
INSERT INTO `book_class` VALUES (3, '文学类');
INSERT INTO `book_class` VALUES (4, '历史类');

-- ----------------------------
-- Table structure for lendinfo
-- ----------------------------
DROP TABLE IF EXISTS `lendinfo`;
CREATE TABLE `lendinfo`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `b_id` int(11) NULL DEFAULT NULL,
  `r_id` int(11) NULL DEFAULT NULL,
  `lend_date` date NULL DEFAULT NULL,
  `back_date` date NULL DEFAULT NULL,
  `isback` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `book`(`b_id`) USING BTREE,
  INDEX `reader`(`r_id`) USING BTREE,
  CONSTRAINT `book` FOREIGN KEY (`b_id`) REFERENCES `book` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `reader` FOREIGN KEY (`r_id`) REFERENCES `reader` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lendinfo
-- ----------------------------
INSERT INTO `lendinfo` VALUES (1, 29, 1, '2020-06-12', '2020-06-30', 0);
INSERT INTO `lendinfo` VALUES (2, 31, 2, '2020-06-12', '2020-06-30', 0);
INSERT INTO `lendinfo` VALUES (3, 1, 3, '2020-06-12', '2020-07-01', 0);
INSERT INTO `lendinfo` VALUES (4, 2, 4, '2020-06-12', '2020-07-03', 0);
INSERT INTO `lendinfo` VALUES (5, 3, 5, '2020-06-12', '2020-07-04', 0);
INSERT INTO `lendinfo` VALUES (6, 4, 6, '2020-06-12', '2020-07-05', 0);
INSERT INTO `lendinfo` VALUES (7, 5, 7, '2020-06-12', '2020-07-06', 0);
INSERT INTO `lendinfo` VALUES (8, 6, 8, '2020-06-12', '2020-07-07', 0);
INSERT INTO `lendinfo` VALUES (9, 7, 9, '2020-06-12', '2020-07-08', 0);
INSERT INTO `lendinfo` VALUES (10, 8, 10, '2020-06-12', '2020-07-09', 0);
INSERT INTO `lendinfo` VALUES (11, 9, 11, '2020-06-12', '2020-07-10', 0);
INSERT INTO `lendinfo` VALUES (26, 31, 12, '2020-06-29', '2020-06-30', 0);
INSERT INTO `lendinfo` VALUES (27, 1, 13, '2020-06-29', '2020-06-30', 0);
INSERT INTO `lendinfo` VALUES (28, 28, 14, '2020-06-29', '2020-06-30', 0);
INSERT INTO `lendinfo` VALUES (30, 18, 14, '2020-06-29', '2020-06-30', 0);
INSERT INTO `lendinfo` VALUES (31, 25, 14, '2020-06-29', '2020-06-30', 0);

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `path` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `component` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `iconCls` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `requireAuth` tinyint(1) NULL DEFAULT NULL,
  `parentId` int(11) NULL DEFAULT NULL,
  `enabled` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES (1, '/', NULL, NULL, '所有', NULL, NULL, NULL, 1);
INSERT INTO `menu` VALUES (2, '/', '/home', 'Home', '图书管理', 'fa fa-book', 1, 1, 1);
INSERT INTO `menu` VALUES (3, '/', '/home', 'Home', '用户管理', 'fa fa-user', 1, 1, 1);
INSERT INTO `menu` VALUES (4, '/', '/home', 'Home', '系统管理', 'fa fa-cog', 1, 1, 1);
INSERT INTO `menu` VALUES (10, '/', '/home', 'Home', '借还日志', 'fa fa-history', 1, 1, 1);
INSERT INTO `menu` VALUES (11, '/book/basic/**', '/book/basic', 'BookBasic', '书籍列表', 'fa fa-table', 1, 2, 1);
INSERT INTO `menu` VALUES (13, '/reader/basic/**', '/reader/basic', 'ReaderBasic', '读者设置', 'fa fa-user-plus', 1, 3, 1);
INSERT INTO `menu` VALUES (14, '/system/basic/**', '/system/basci', 'SystemBasic', '系统权限', 'fa fa-cogs', 1, 4, 1);
INSERT INTO `menu` VALUES (15, '/system/data/**', '/system/data', 'SystemData', '数据库备份', 'fa fa-database', 1, 4, 1);
INSERT INTO `menu` VALUES (16, '/system/init/**', '/system/init', 'SystemInit', '数据库初始化', 'fa fa-refresh', 1, 4, 1);
INSERT INTO `menu` VALUES (17, '/record/user/**', '/record/user', 'RecordUser', '用户借还日志', NULL, 1, 10, 1);
INSERT INTO `menu` VALUES (18, '/record/all/**', '/record/all', 'RecordAll', '所有借还日志', 'fa fa-calendar', 1, 10, 1);

-- ----------------------------
-- Table structure for menu_role
-- ----------------------------
DROP TABLE IF EXISTS `menu_role`;
CREATE TABLE `menu_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) NULL DEFAULT NULL,
  `rid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `mr_mid`(`mid`) USING BTREE,
  INDEX `mr`(`rid`) USING BTREE,
  CONSTRAINT `mr` FOREIGN KEY (`rid`) REFERENCES `role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `mr_mid` FOREIGN KEY (`mid`) REFERENCES `menu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menu_role
-- ----------------------------
INSERT INTO `menu_role` VALUES (5, 11, 1);
INSERT INTO `menu_role` VALUES (7, 13, 1);
INSERT INTO `menu_role` VALUES (8, 14, 1);
INSERT INTO `menu_role` VALUES (9, 15, 1);
INSERT INTO `menu_role` VALUES (10, 16, 1);
INSERT INTO `menu_role` VALUES (11, 18, 1);
INSERT INTO `menu_role` VALUES (12, 11, 2);
INSERT INTO `menu_role` VALUES (14, 13, 2);
INSERT INTO `menu_role` VALUES (15, 14, 2);
INSERT INTO `menu_role` VALUES (16, 14, 2);
INSERT INTO `menu_role` VALUES (17, 15, 2);
INSERT INTO `menu_role` VALUES (18, 16, 2);
INSERT INTO `menu_role` VALUES (19, 18, 2);
INSERT INTO `menu_role` VALUES (20, 11, 3);
INSERT INTO `menu_role` VALUES (21, 17, 3);

-- ----------------------------
-- Table structure for reader
-- ----------------------------
DROP TABLE IF EXISTS `reader`;
CREATE TABLE `reader`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `birth` date NULL DEFAULT NULL,
  `email` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `isenable` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of reader
-- ----------------------------
INSERT INTO `reader` VALUES (1, '胡坤', '男', '2019-01-30', '5200606@qq.com', '5200250606', '湖南省常德市滨湖路', 1);
INSERT INTO `reader` VALUES (2, 'ZP', '女', '2020-06-06', '025520@qq.com', '2222222222', '湖南省永州市宗元习路', 1);
INSERT INTO `reader` VALUES (3, 'kunkun', '男', '2020-06-12', '11111111@qq.com', '123456454', '湖南省长沙市岳麓区', 1);
INSERT INTO `reader` VALUES (4, '老邓', '男', '2020-06-11', '22222222@qq.com', '32165498745', '湖南省郴州市桂东县', 1);
INSERT INTO `reader` VALUES (5, '老朱', '男', '2020-06-10', '987654321@qq.com', '17878994664', '湖南省郴州市鲁城县', 1);
INSERT INTO `reader` VALUES (6, '老陶1', '男', '2020-06-09', '4565158123@qq.com', '17895464585', '上海市嘉定区', 1);
INSERT INTO `reader` VALUES (7, '老陶2', '男', '2020-06-09', '4565158123@qq.com', '17895464585', '上海市嘉定区', 1);
INSERT INTO `reader` VALUES (8, '老陶3', '男', '2020-06-09', '4565158123@qq.com', '17895464585', '上海市嘉定区', 1);
INSERT INTO `reader` VALUES (9, '老陶4', '男', '2020-06-09', '4565158123@qq.com', '17895464585', '上海市嘉定区', 1);
INSERT INTO `reader` VALUES (10, '老陶5', '男', '2020-06-09', '4565158123@qq.com', '17895464585', '上海市嘉定区', 1);
INSERT INTO `reader` VALUES (11, '老陶6', '男', '2020-06-09', '4565158123@qq.com', '17895464585', '上海市嘉定区', 1);
INSERT INTO `reader` VALUES (12, '老陶7', '男', '2020-06-09', '4565158123@qq.com', '17895464585', '上海市嘉定区', 1);
INSERT INTO `reader` VALUES (13, '老陶8', '男', '2020-06-09', '4565158123@qq.com', '17895464585', '上海市嘉定区', 1);
INSERT INTO `reader` VALUES (14, '老陶9', '男', '2020-06-09', '4565158123@qq.com', '17895464585', '上海市嘉定区', 1);
INSERT INTO `reader` VALUES (15, '老陶10', '男', '2020-06-09', '4565158123@qq.com', '17895464585', '上海市嘉定区', 1);
INSERT INTO `reader` VALUES (16, '老陶11', '男', '2020-06-09', '4565158123@qq.com', '17895464585', '上海市嘉定区', 1);
INSERT INTO `reader` VALUES (17, '老陶12', '男', '2020-06-09', '4565158123@qq.com', '17895464585', '上海市嘉定区', 1);
INSERT INTO `reader` VALUES (18, '老陶13', '男', '2020-06-09', '4565158123@qq.com', '17895464585', '上海市嘉定区', 1);
INSERT INTO `reader` VALUES (19, '老陶14', '男', '2020-06-09', '4565158123@qq.com', '17895464585', '上海市嘉定区', 1);
INSERT INTO `reader` VALUES (20, '老陶15', '男', '2020-06-09', '4565158123@qq.com', '17895464585', '上海市嘉定区', 1);
INSERT INTO `reader` VALUES (21, '老陶16', '男', '2020-06-09', '4565158123@qq.com', '17895464585', '上海市嘉定区', 1);
INSERT INTO `reader` VALUES (22, '老陶17', '男', '2020-06-09', '4565158123@qq.com', '17895464585', '上海市嘉定区', 1);
INSERT INTO `reader` VALUES (23, '老陶18', '男', '2020-06-09', '4565158123@qq.com', '17895464585', '上海市嘉定区', 1);
INSERT INTO `reader` VALUES (24, '老陶19', '男', '2020-06-09', '4565158123@qq.com', '17895464585', '上海市嘉定区', 1);
INSERT INTO `reader` VALUES (25, '老陶20', '男', '2020-06-09', '4565158123@qq.com', '17895464585', '上海市嘉定区', 1);
INSERT INTO `reader` VALUES (26, '老陶21', '男', '2020-06-09', '4565158123@qq.com', '17895464585', '上海市嘉定区', 1);
INSERT INTO `reader` VALUES (27, '老陶22', '男', '2020-06-09', '4565158123@qq.com', '17895464585', '上海市嘉定区', 1);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nameZh` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, 'ROLE_admin', '系统管理员');
INSERT INTO `role` VALUES (2, 'ROLE_book', '图书管理员');
INSERT INTO `role` VALUES (3, 'ROLE_user', '用户');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userface` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `enabled` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '胡坤管理员', 'hukun', '$2a$10$/xX0smcOxBLmBi5ujGQwGO6rOl2Eq2C08kIzhwpdR64IZ8eb6g1XC', '12345678911', 'http://bpic.588ku.com/element_pic/01/40/00/64573ce2edc0728.jpg', 1);
INSERT INTO `user` VALUES (2, '测试用户', 'lovepp', '$2a$10$UHGHHWM0bamIs7httekuT.Inl6lO9JKbcGU1Nz5ie1pDacnGMlsty', '11111111111', NULL, 1);

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `rid` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid-id`(`uid`) USING BTREE,
  INDEX `rid-id`(`rid`) USING BTREE,
  CONSTRAINT `rid-id` FOREIGN KEY (`rid`) REFERENCES `role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `uid-id` FOREIGN KEY (`uid`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES (1, 1, 1);
INSERT INTO `user_role` VALUES (3, 2, 3);

SET FOREIGN_KEY_CHECKS = 1;
