/*
 Navicat MySQL Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50562
 Source Host           : localhost:3306
 Source Schema         : d3_shipintuijianxt

 Target Server Type    : MySQL
 Target Server Version : 50562
 File Encoding         : 65001

 Date: 22/04/2020 09:06:03
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_apply
-- ----------------------------
DROP TABLE IF EXISTS `t_apply`;
CREATE TABLE `t_apply`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `addDate` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userId` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  INDEX `FK9FFABFE374367213`(`userId`) USING BTREE,
  CONSTRAINT `FK9FFABFE374367213` FOREIGN KEY (`userId`) REFERENCES `t_user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_apply
-- ----------------------------
INSERT INTO `t_apply` VALUES (1, '2020-04-16', '试试吧', '拒绝', 1);
INSERT INTO `t_apply` VALUES (2, '2020-04-16', '1111111111111', '同意', 1);

-- ----------------------------
-- Table structure for t_movie
-- ----------------------------
DROP TABLE IF EXISTS `t_movie`;
CREATE TABLE `t_movie`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `daoyan` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `imageFile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `movieAreaId` int(11) NULL DEFAULT NULL,
  `movieFile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `movieType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `movieYear` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `note` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `score` double(11, 1) NULL DEFAULT NULL,
  `scoreUserNumber` int(11) NULL DEFAULT NULL,
  `shangyingshijian` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `shichang` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `yanyuan` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `yuyan` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  INDEX `FKA0A37BA5B2717425`(`movieAreaId`) USING BTREE,
  CONSTRAINT `FKA0A37BA5B2717425` FOREIGN KEY (`movieAreaId`) REFERENCES `t_movie_area` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_movie
-- ----------------------------
INSERT INTO `t_movie` VALUES (1, '格蕾塔·葛韦格', '1584318153507.jpg', 1, '1584318174447.mp4', '剧情,爱情', '2019', '我的英雄学院：英雄崛起', '电影改编自世界名著《小妇人》，由奥斯卡提名最佳导演格雷塔.葛伟格执导，直击当代女性困惑。作为2020年颁奖季热门，影片聚齐两代神仙阵容“世纪大同框”——金球奖最佳女主“伯德小姐”西尔莎·罗南与屡获提名的超人气演员“甜茶”再度携手诠释错过的真爱，“赫敏”艾玛·沃森与“黑寡妇师妹”弗洛伦斯·皮尤联袂呈现手足情深，三获奥斯卡的老戏骨梅尔·斯特里普与四次金球奖得主劳拉·邓恩倾力加盟。导演葛伟格用细腻又颇具新意的叙事手法，为这部经典文学名作带来充满活力的现代风格。 ', 7.2, 22, '2020(中国大陆) / 2019-12-25(美国)', '135分钟', '西尔莎·罗南 / 艾玛·沃森 / 佛罗伦斯·珀 / 伊莱扎·斯坎伦 / 劳拉·邓恩 / 蒂莫西·柴勒梅德 / 梅丽尔·斯特里普 / 鲍勃·奥登科克 / 詹姆斯·诺顿 / 路易·加瑞尔 / 克里斯·库珀 / 崔西·莱茨 / 艾比·奎因 / 萨沙·弗若洛娃 / 莉莉·恩格勒特 / 爱德华德·弗莱彻 / 杰妮·霍蒂谢尔 / 多梅尼克·阿尔迪诺 / 汤姆·斯特拉特福 / 托马斯·马里亚诺 / 哈德莉·罗宾逊 / 杰米·加扎里安', '英语');
INSERT INTO `t_movie` VALUES (2, '格蕾塔·葛韦格', '1584318153507.jpg', 1, '1584318174447.mp4', '剧情,爱情', '2020', '好友互整大电影', '电影改编自世界名著《小妇人》，由奥斯卡提名最佳导演格雷塔.葛伟格执导，直击当代女性困惑。作为2020年颁奖季热门，影片聚齐两代神仙阵容“世纪大同框”——金球奖最佳女主“伯德小姐”西尔莎·罗南与屡获提名的超人气演员“甜茶”再度携手诠释错过的真爱，“赫敏”艾玛·沃森与“黑寡妇师妹”弗洛伦斯·皮尤联袂呈现手足情深，三获奥斯卡的老戏骨梅尔·斯特里普与四次金球奖得主劳拉·邓恩倾力加盟。导演葛伟格用细腻又颇具新意的叙事手法，为这部经典文学名作带来充满活力的现代风格。 ', 5.1, 20, '2020(中国大陆) / 2019-12-25(美国)', '135分钟', '西尔莎·罗南 / 艾玛·沃森 / 佛罗伦斯·珀 / 伊莱扎·斯坎伦 / 劳拉·邓恩 / 蒂莫西·柴勒梅德 / 梅丽尔·斯特里普 / 鲍勃·奥登科克 / 詹姆斯·诺顿 / 路易·加瑞尔 / 克里斯·库珀 / 崔西·莱茨 / 艾比·奎因 / 萨沙·弗若洛娃 / 莉莉·恩格勒特 / 爱德华德·弗莱彻 / 杰妮·霍蒂谢尔 / 多梅尼克·阿尔迪诺 / 汤姆·斯特拉特福 / 托马斯·马里亚诺 / 哈德莉·罗宾逊 / 杰米·加扎里安', '英语');
INSERT INTO `t_movie` VALUES (3, '格蕾塔·葛韦格', '1584318153507.jpg', 1, '1584318174447.mp4', '剧情,爱情', '2020', '绝地战警：疾速追击', '电影改编自世界名著《小妇人》，由奥斯卡提名最佳导演格雷塔.葛伟格执导，直击当代女性困惑。作为2020年颁奖季热门，影片聚齐两代神仙阵容“世纪大同框”——金球奖最佳女主“伯德小姐”西尔莎·罗南与屡获提名的超人气演员“甜茶”再度携手诠释错过的真爱，“赫敏”艾玛·沃森与“黑寡妇师妹”弗洛伦斯·皮尤联袂呈现手足情深，三获奥斯卡的老戏骨梅尔·斯特里普与四次金球奖得主劳拉·邓恩倾力加盟。导演葛伟格用细腻又颇具新意的叙事手法，为这部经典文学名作带来充满活力的现代风格。 ', 6.9, 21, '2020(中国大陆) / 2019-12-25(美国)', '135分钟', '西尔莎·罗南 / 艾玛·沃森 / 佛罗伦斯·珀 / 伊莱扎·斯坎伦 / 劳拉·邓恩 / 蒂莫西·柴勒梅德 / 梅丽尔·斯特里普 / 鲍勃·奥登科克 / 詹姆斯·诺顿 / 路易·加瑞尔 / 克里斯·库珀 / 崔西·莱茨 / 艾比·奎因 / 萨沙·弗若洛娃 / 莉莉·恩格勒特 / 爱德华德·弗莱彻 / 杰妮·霍蒂谢尔 / 多梅尼克·阿尔迪诺 / 汤姆·斯特拉特福 / 托马斯·马里亚诺 / 哈德莉·罗宾逊 / 杰米·加扎里安', '英语');
INSERT INTO `t_movie` VALUES (4, '格蕾塔·葛韦格', '1584318153507.jpg', 1, '1584318174447.mp4', '剧情,爱情', '2020', '爱玛', '电影改编自世界名著《小妇人》，由奥斯卡提名最佳导演格雷塔.葛伟格执导，直击当代女性困惑。作为2020年颁奖季热门，影片聚齐两代神仙阵容“世纪大同框”——金球奖最佳女主“伯德小姐”西尔莎·罗南与屡获提名的超人气演员“甜茶”再度携手诠释错过的真爱，“赫敏”艾玛·沃森与“黑寡妇师妹”弗洛伦斯·皮尤联袂呈现手足情深，三获奥斯卡的老戏骨梅尔·斯特里普与四次金球奖得主劳拉·邓恩倾力加盟。导演葛伟格用细腻又颇具新意的叙事手法，为这部经典文学名作带来充满活力的现代风格。 ', 6.5, 21, '2020(中国大陆) / 2019-12-25(美国)', '135分钟', '西尔莎·罗南 / 艾玛·沃森 / 佛罗伦斯·珀 / 伊莱扎·斯坎伦 / 劳拉·邓恩 / 蒂莫西·柴勒梅德 / 梅丽尔·斯特里普 / 鲍勃·奥登科克 / 詹姆斯·诺顿 / 路易·加瑞尔 / 克里斯·库珀 / 崔西·莱茨 / 艾比·奎因 / 萨沙·弗若洛娃 / 莉莉·恩格勒特 / 爱德华德·弗莱彻 / 杰妮·霍蒂谢尔 / 多梅尼克·阿尔迪诺 / 汤姆·斯特拉特福 / 托马斯·马里亚诺 / 哈德莉·罗宾逊 / 杰米·加扎里安', '英语');
INSERT INTO `t_movie` VALUES (5, '格蕾塔·葛韦格', '1584318153507.jpg', 1, '1584318174447.mp4', '剧情,爱情', '2019', '野性的呼唤', '电影改编自世界名著《小妇人》，由奥斯卡提名最佳导演格雷塔.葛伟格执导，直击当代女性困惑。作为2020年颁奖季热门，影片聚齐两代神仙阵容“世纪大同框”——金球奖最佳女主“伯德小姐”西尔莎·罗南与屡获提名的超人气演员“甜茶”再度携手诠释错过的真爱，“赫敏”艾玛·沃森与“黑寡妇师妹”弗洛伦斯·皮尤联袂呈现手足情深，三获奥斯卡的老戏骨梅尔·斯特里普与四次金球奖得主劳拉·邓恩倾力加盟。导演葛伟格用细腻又颇具新意的叙事手法，为这部经典文学名作带来充满活力的现代风格。 ', 5.8, 20, '2020(中国大陆) / 2019-12-25(美国)', '135分钟', '西尔莎·罗南 / 艾玛·沃森 / 佛罗伦斯·珀 / 伊莱扎·斯坎伦 / 劳拉·邓恩 / 蒂莫西·柴勒梅德 / 梅丽尔·斯特里普 / 鲍勃·奥登科克 / 詹姆斯·诺顿 / 路易·加瑞尔 / 克里斯·库珀 / 崔西·莱茨 / 艾比·奎因 / 萨沙·弗若洛娃 / 莉莉·恩格勒特 / 爱德华德·弗莱彻 / 杰妮·霍蒂谢尔 / 多梅尼克·阿尔迪诺 / 汤姆·斯特拉特福 / 托马斯·马里亚诺 / 哈德莉·罗宾逊 / 杰米·加扎里安', '英语');
INSERT INTO `t_movie` VALUES (6, '格蕾塔·葛韦格', '1584318153507.jpg', 1, '1584318174447.mp4', '剧情,爱情', '2019', '刺猬索尼克', '电影改编自世界名著《小妇人》，由奥斯卡提名最佳导演格雷塔.葛伟格执导，直击当代女性困惑。作为2020年颁奖季热门，影片聚齐两代神仙阵容“世纪大同框”——金球奖最佳女主“伯德小姐”西尔莎·罗南与屡获提名的超人气演员“甜茶”再度携手诠释错过的真爱，“赫敏”艾玛·沃森与“黑寡妇师妹”弗洛伦斯·皮尤联袂呈现手足情深，三获奥斯卡的老戏骨梅尔·斯特里普与四次金球奖得主劳拉·邓恩倾力加盟。导演葛伟格用细腻又颇具新意的叙事手法，为这部经典文学名作带来充满活力的现代风格。 ', 5.6, 17, '2020(中国大陆) / 2019-12-25(美国)', '135分钟', '西尔莎·罗南 / 艾玛·沃森 / 佛罗伦斯·珀 / 伊莱扎·斯坎伦 / 劳拉·邓恩 / 蒂莫西·柴勒梅德 / 梅丽尔·斯特里普 / 鲍勃·奥登科克 / 詹姆斯·诺顿 / 路易·加瑞尔 / 克里斯·库珀 / 崔西·莱茨 / 艾比·奎因 / 萨沙·弗若洛娃 / 莉莉·恩格勒特 / 爱德华德·弗莱彻 / 杰妮·霍蒂谢尔 / 多梅尼克·阿尔迪诺 / 汤姆·斯特拉特福 / 托马斯·马里亚诺 / 哈德莉·罗宾逊 / 杰米·加扎里安', '英语');
INSERT INTO `t_movie` VALUES (7, '格蕾塔·葛韦格', '1584318153507.jpg', 2, '1584318174447.mp4', '剧情,爱情', '2019', '回归之路', '电影改编自世界名著《小妇人》，由奥斯卡提名最佳导演格雷塔.葛伟格执导，直击当代女性困惑。作为2020年颁奖季热门，影片聚齐两代神仙阵容“世纪大同框”——金球奖最佳女主“伯德小姐”西尔莎·罗南与屡获提名的超人气演员“甜茶”再度携手诠释错过的真爱，“赫敏”艾玛·沃森与“黑寡妇师妹”弗洛伦斯·皮尤联袂呈现手足情深，三获奥斯卡的老戏骨梅尔·斯特里普与四次金球奖得主劳拉·邓恩倾力加盟。导演葛伟格用细腻又颇具新意的叙事手法，为这部经典文学名作带来充满活力的现代风格。 ', 6.6, 19, '2020(中国大陆) / 2019-12-25(美国)', '135分钟', '西尔莎·罗南 / 艾玛·沃森 / 佛罗伦斯·珀 / 伊莱扎·斯坎伦 / 劳拉·邓恩 / 蒂莫西·柴勒梅德 / 梅丽尔·斯特里普 / 鲍勃·奥登科克 / 詹姆斯·诺顿 / 路易·加瑞尔 / 克里斯·库珀 / 崔西·莱茨 / 艾比·奎因 / 萨沙·弗若洛娃 / 莉莉·恩格勒特 / 爱德华德·弗莱彻 / 杰妮·霍蒂谢尔 / 多梅尼克·阿尔迪诺 / 汤姆·斯特拉特福 / 托马斯·马里亚诺 / 哈德莉·罗宾逊 / 杰米·加扎里安', '英语');
INSERT INTO `t_movie` VALUES (8, '格蕾塔·葛韦格', '1584318153507.jpg', 1, '1584318174447.mp4', '剧情,爱情', '2019', '隐形人', '电影改编自世界名著《小妇人》，由奥斯卡提名最佳导演格雷塔.葛伟格执导，直击当代女性困惑。作为2020年颁奖季热门，影片聚齐两代神仙阵容“世纪大同框”——金球奖最佳女主“伯德小姐”西尔莎·罗南与屡获提名的超人气演员“甜茶”再度携手诠释错过的真爱，“赫敏”艾玛·沃森与“黑寡妇师妹”弗洛伦斯·皮尤联袂呈现手足情深，三获奥斯卡的老戏骨梅尔·斯特里普与四次金球奖得主劳拉·邓恩倾力加盟。导演葛伟格用细腻又颇具新意的叙事手法，为这部经典文学名作带来充满活力的现代风格。 ', 6.6, 20, '2020(中国大陆) / 2019-12-25(美国)', '135分钟', '西尔莎·罗南 / 艾玛·沃森 / 佛罗伦斯·珀 / 伊莱扎·斯坎伦 / 劳拉·邓恩 / 蒂莫西·柴勒梅德 / 梅丽尔·斯特里普 / 鲍勃·奥登科克 / 詹姆斯·诺顿 / 路易·加瑞尔 / 克里斯·库珀 / 崔西·莱茨 / 艾比·奎因 / 萨沙·弗若洛娃 / 莉莉·恩格勒特 / 爱德华德·弗莱彻 / 杰妮·霍蒂谢尔 / 多梅尼克·阿尔迪诺 / 汤姆·斯特拉特福 / 托马斯·马里亚诺 / 哈德莉·罗宾逊 / 杰米·加扎里安', '英语');
INSERT INTO `t_movie` VALUES (9, '格蕾塔·葛韦格', '1584318153507.jpg', 1, '1584318174447.mp4', '剧情,爱情', '2019', '安尼亚拉号', '电影改编自世界名著《小妇人》，由奥斯卡提名最佳导演格雷塔.葛伟格执导，直击当代女性困惑。作为2020年颁奖季热门，影片聚齐两代神仙阵容“世纪大同框”——金球奖最佳女主“伯德小姐”西尔莎·罗南与屡获提名的超人气演员“甜茶”再度携手诠释错过的真爱，“赫敏”艾玛·沃森与“黑寡妇师妹”弗洛伦斯·皮尤联袂呈现手足情深，三获奥斯卡的老戏骨梅尔·斯特里普与四次金球奖得主劳拉·邓恩倾力加盟。导演葛伟格用细腻又颇具新意的叙事手法，为这部经典文学名作带来充满活力的现代风格。 ', 6.4, 22, '2020(中国大陆) / 2019-12-25(美国)', '135分钟', '西尔莎·罗南 / 艾玛·沃森 / 佛罗伦斯·珀 / 伊莱扎·斯坎伦 / 劳拉·邓恩 / 蒂莫西·柴勒梅德 / 梅丽尔·斯特里普 / 鲍勃·奥登科克 / 詹姆斯·诺顿 / 路易·加瑞尔 / 克里斯·库珀 / 崔西·莱茨 / 艾比·奎因 / 萨沙·弗若洛娃 / 莉莉·恩格勒特 / 爱德华德·弗莱彻 / 杰妮·霍蒂谢尔 / 多梅尼克·阿尔迪诺 / 汤姆·斯特拉特福 / 托马斯·马里亚诺 / 哈德莉·罗宾逊 / 杰米·加扎里安', '英语');
INSERT INTO `t_movie` VALUES (10, '格蕾塔·葛韦格', '1584318153507.jpg', 1, '1584318174447.mp4', '剧情,爱情', '2019', '系统破坏者', '电影改编自世界名著《小妇人》，由奥斯卡提名最佳导演格雷塔.葛伟格执导，直击当代女性困惑。作为2020年颁奖季热门，影片聚齐两代神仙阵容“世纪大同框”——金球奖最佳女主“伯德小姐”西尔莎·罗南与屡获提名的超人气演员“甜茶”再度携手诠释错过的真爱，“赫敏”艾玛·沃森与“黑寡妇师妹”弗洛伦斯·皮尤联袂呈现手足情深，三获奥斯卡的老戏骨梅尔·斯特里普与四次金球奖得主劳拉·邓恩倾力加盟。导演葛伟格用细腻又颇具新意的叙事手法，为这部经典文学名作带来充满活力的现代风格。 ', 4.5, 18, '2020(中国大陆) / 2019-12-25(美国)', '135分钟', '西尔莎·罗南 / 艾玛·沃森 / 佛罗伦斯·珀 / 伊莱扎·斯坎伦 / 劳拉·邓恩 / 蒂莫西·柴勒梅德 / 梅丽尔·斯特里普 / 鲍勃·奥登科克 / 詹姆斯·诺顿 / 路易·加瑞尔 / 克里斯·库珀 / 崔西·莱茨 / 艾比·奎因 / 萨沙·弗若洛娃 / 莉莉·恩格勒特 / 爱德华德·弗莱彻 / 杰妮·霍蒂谢尔 / 多梅尼克·阿尔迪诺 / 汤姆·斯特拉特福 / 托马斯·马里亚诺 / 哈德莉·罗宾逊 / 杰米·加扎里安', '英语');
INSERT INTO `t_movie` VALUES (11, '格蕾塔·葛韦格', '1584318153507.jpg', 1, '1584318174447.mp4', '剧情,爱情', '2019', '维塔利娜·瓦雷拉', '电影改编自世界名著《小妇人》，由奥斯卡提名最佳导演格雷塔.葛伟格执导，直击当代女性困惑。作为2020年颁奖季热门，影片聚齐两代神仙阵容“世纪大同框”——金球奖最佳女主“伯德小姐”西尔莎·罗南与屡获提名的超人气演员“甜茶”再度携手诠释错过的真爱，“赫敏”艾玛·沃森与“黑寡妇师妹”弗洛伦斯·皮尤联袂呈现手足情深，三获奥斯卡的老戏骨梅尔·斯特里普与四次金球奖得主劳拉·邓恩倾力加盟。导演葛伟格用细腻又颇具新意的叙事手法，为这部经典文学名作带来充满活力的现代风格。 ', 5.8, 19, '2020(中国大陆) / 2019-12-25(美国)', '135分钟', '西尔莎·罗南 / 艾玛·沃森 / 佛罗伦斯·珀 / 伊莱扎·斯坎伦 / 劳拉·邓恩 / 蒂莫西·柴勒梅德 / 梅丽尔·斯特里普 / 鲍勃·奥登科克 / 詹姆斯·诺顿 / 路易·加瑞尔 / 克里斯·库珀 / 崔西·莱茨 / 艾比·奎因 / 萨沙·弗若洛娃 / 莉莉·恩格勒特 / 爱德华德·弗莱彻 / 杰妮·霍蒂谢尔 / 多梅尼克·阿尔迪诺 / 汤姆·斯特拉特福 / 托马斯·马里亚诺 / 哈德莉·罗宾逊 / 杰米·加扎里安', '英语');
INSERT INTO `t_movie` VALUES (12, '格蕾塔·葛韦格', '1584318153507.jpg', 1, '1584318174447.mp4', '剧情,爱情', '2019', '狂躁节拍', '电影改编自世界名著《小妇人》，由奥斯卡提名最佳导演格雷塔.葛伟格执导，直击当代女性困惑。作为2020年颁奖季热门，影片聚齐两代神仙阵容“世纪大同框”——金球奖最佳女主“伯德小姐”西尔莎·罗南与屡获提名的超人气演员“甜茶”再度携手诠释错过的真爱，“赫敏”艾玛·沃森与“黑寡妇师妹”弗洛伦斯·皮尤联袂呈现手足情深，三获奥斯卡的老戏骨梅尔·斯特里普与四次金球奖得主劳拉·邓恩倾力加盟。导演葛伟格用细腻又颇具新意的叙事手法，为这部经典文学名作带来充满活力的现代风格。 ', 5.8, 19, '2020(中国大陆) / 2019-12-25(美国)', '135分钟', '西尔莎·罗南 / 艾玛·沃森 / 佛罗伦斯·珀 / 伊莱扎·斯坎伦 / 劳拉·邓恩 / 蒂莫西·柴勒梅德 / 梅丽尔·斯特里普 / 鲍勃·奥登科克 / 詹姆斯·诺顿 / 路易·加瑞尔 / 克里斯·库珀 / 崔西·莱茨 / 艾比·奎因 / 萨沙·弗若洛娃 / 莉莉·恩格勒特 / 爱德华德·弗莱彻 / 杰妮·霍蒂谢尔 / 多梅尼克·阿尔迪诺 / 汤姆·斯特拉特福 / 托马斯·马里亚诺 / 哈德莉·罗宾逊 / 杰米·加扎里安', '英语');
INSERT INTO `t_movie` VALUES (13, '格蕾塔·葛韦格', '1584318153507.jpg', 1, '1584318174447.mp4', '剧情,爱情', '2019', '与爱同居之永恒的爱', '电影改编自世界名著《小妇人》，由奥斯卡提名最佳导演格雷塔.葛伟格执导，直击当代女性困惑。作为2020年颁奖季热门，影片聚齐两代神仙阵容“世纪大同框”——金球奖最佳女主“伯德小姐”西尔莎·罗南与屡获提名的超人气演员“甜茶”再度携手诠释错过的真爱，“赫敏”艾玛·沃森与“黑寡妇师妹”弗洛伦斯·皮尤联袂呈现手足情深，三获奥斯卡的老戏骨梅尔·斯特里普与四次金球奖得主劳拉·邓恩倾力加盟。导演葛伟格用细腻又颇具新意的叙事手法，为这部经典文学名作带来充满活力的现代风格。 ', 7.4, 21, '2020(中国大陆) / 2019-12-25(美国)', '135分钟', '西尔莎·罗南 / 艾玛·沃森 / 佛罗伦斯·珀 / 伊莱扎·斯坎伦 / 劳拉·邓恩 / 蒂莫西·柴勒梅德 / 梅丽尔·斯特里普 / 鲍勃·奥登科克 / 詹姆斯·诺顿 / 路易·加瑞尔 / 克里斯·库珀 / 崔西·莱茨 / 艾比·奎因 / 萨沙·弗若洛娃 / 莉莉·恩格勒特 / 爱德华德·弗莱彻 / 杰妮·霍蒂谢尔 / 多梅尼克·阿尔迪诺 / 汤姆·斯特拉特福 / 托马斯·马里亚诺 / 哈德莉·罗宾逊 / 杰米·加扎里安', '英语');
INSERT INTO `t_movie` VALUES (14, '格蕾塔·葛韦格', '1584318153507.jpg', 1, '1584318174447.mp4', '剧情,爱情', '2019', '剩女', '电影改编自世界名著《小妇人》，由奥斯卡提名最佳导演格雷塔.葛伟格执导，直击当代女性困惑。作为2020年颁奖季热门，影片聚齐两代神仙阵容“世纪大同框”——金球奖最佳女主“伯德小姐”西尔莎·罗南与屡获提名的超人气演员“甜茶”再度携手诠释错过的真爱，“赫敏”艾玛·沃森与“黑寡妇师妹”弗洛伦斯·皮尤联袂呈现手足情深，三获奥斯卡的老戏骨梅尔·斯特里普与四次金球奖得主劳拉·邓恩倾力加盟。导演葛伟格用细腻又颇具新意的叙事手法，为这部经典文学名作带来充满活力的现代风格。 ', 7.2, 22, '2020(中国大陆) / 2019-12-25(美国)', '135分钟', '西尔莎·罗南 / 艾玛·沃森 / 佛罗伦斯·珀 / 伊莱扎·斯坎伦 / 劳拉·邓恩 / 蒂莫西·柴勒梅德 / 梅丽尔·斯特里普 / 鲍勃·奥登科克 / 詹姆斯·诺顿 / 路易·加瑞尔 / 克里斯·库珀 / 崔西·莱茨 / 艾比·奎因 / 萨沙·弗若洛娃 / 莉莉·恩格勒特 / 爱德华德·弗莱彻 / 杰妮·霍蒂谢尔 / 多梅尼克·阿尔迪诺 / 汤姆·斯特拉特福 / 托马斯·马里亚诺 / 哈德莉·罗宾逊 / 杰米·加扎里安', '英语');
INSERT INTO `t_movie` VALUES (15, '格蕾塔·葛韦格', '1584318153507.jpg', 1, '1584318174447.mp4', '剧情,爱情', '2019', '德菲因与卡罗尔：反叛缪斯', '电影改编自世界名著《小妇人》，由奥斯卡提名最佳导演格雷塔.葛伟格执导，直击当代女性困惑。作为2020年颁奖季热门，影片聚齐两代神仙阵容“世纪大同框”——金球奖最佳女主“伯德小姐”西尔莎·罗南与屡获提名的超人气演员“甜茶”再度携手诠释错过的真爱，“赫敏”艾玛·沃森与“黑寡妇师妹”弗洛伦斯·皮尤联袂呈现手足情深，三获奥斯卡的老戏骨梅尔·斯特里普与四次金球奖得主劳拉·邓恩倾力加盟。导演葛伟格用细腻又颇具新意的叙事手法，为这部经典文学名作带来充满活力的现代风格。 ', 5.5, 20, '2020(中国大陆) / 2019-12-25(美国)', '135分钟', '西尔莎·罗南 / 艾玛·沃森 / 佛罗伦斯·珀 / 伊莱扎·斯坎伦 / 劳拉·邓恩 / 蒂莫西·柴勒梅德 / 梅丽尔·斯特里普 / 鲍勃·奥登科克 / 詹姆斯·诺顿 / 路易·加瑞尔 / 克里斯·库珀 / 崔西·莱茨 / 艾比·奎因 / 萨沙·弗若洛娃 / 莉莉·恩格勒特 / 爱德华德·弗莱彻 / 杰妮·霍蒂谢尔 / 多梅尼克·阿尔迪诺 / 汤姆·斯特拉特福 / 托马斯·马里亚诺 / 哈德莉·罗宾逊 / 杰米·加扎里安', '英语');
INSERT INTO `t_movie` VALUES (16, '格蕾塔·葛韦格', '1584318153507.jpg', 1, '1584318174447.mp4', '剧情,爱情', '2019', '我真正的天才女友', '电影改编自世界名著《小妇人》，由奥斯卡提名最佳导演格雷塔.葛伟格执导，直击当代女性困惑。作为2020年颁奖季热门，影片聚齐两代神仙阵容“世纪大同框”——金球奖最佳女主“伯德小姐”西尔莎·罗南与屡获提名的超人气演员“甜茶”再度携手诠释错过的真爱，“赫敏”艾玛·沃森与“黑寡妇师妹”弗洛伦斯·皮尤联袂呈现手足情深，三获奥斯卡的老戏骨梅尔·斯特里普与四次金球奖得主劳拉·邓恩倾力加盟。导演葛伟格用细腻又颇具新意的叙事手法，为这部经典文学名作带来充满活力的现代风格。 ', 6.3, 22, '2020(中国大陆) / 2019-12-25(美国)', '135分钟', '西尔莎·罗南 / 艾玛·沃森 / 佛罗伦斯·珀 / 伊莱扎·斯坎伦 / 劳拉·邓恩 / 蒂莫西·柴勒梅德 / 梅丽尔·斯特里普 / 鲍勃·奥登科克 / 詹姆斯·诺顿 / 路易·加瑞尔 / 克里斯·库珀 / 崔西·莱茨 / 艾比·奎因 / 萨沙·弗若洛娃 / 莉莉·恩格勒特 / 爱德华德·弗莱彻 / 杰妮·霍蒂谢尔 / 多梅尼克·阿尔迪诺 / 汤姆·斯特拉特福 / 托马斯·马里亚诺 / 哈德莉·罗宾逊 / 杰米·加扎里安', '英语');
INSERT INTO `t_movie` VALUES (17, '格蕾塔·葛韦格', '1584318153507.jpg', 4, '1584318174447.mp4', '剧情,爱情', '2019', '黑水', '电影改编自世界名著《小妇人》，由奥斯卡提名最佳导演格雷塔.葛伟格执导，直击当代女性困惑。作为2020年颁奖季热门，影片聚齐两代神仙阵容“世纪大同框”——金球奖最佳女主“伯德小姐”西尔莎·罗南与屡获提名的超人气演员“甜茶”再度携手诠释错过的真爱，“赫敏”艾玛·沃森与“黑寡妇师妹”弗洛伦斯·皮尤联袂呈现手足情深，三获奥斯卡的老戏骨梅尔·斯特里普与四次金球奖得主劳拉·邓恩倾力加盟。导演葛伟格用细腻又颇具新意的叙事手法，为这部经典文学名作带来充满活力的现代风格。 ', 6.4, 22, '2020(中国大陆) / 2019-12-25(美国)', '135分钟', '西尔莎·罗南 / 艾玛·沃森 / 佛罗伦斯·珀 / 伊莱扎·斯坎伦 / 劳拉·邓恩 / 蒂莫西·柴勒梅德 / 梅丽尔·斯特里普 / 鲍勃·奥登科克 / 詹姆斯·诺顿 / 路易·加瑞尔 / 克里斯·库珀 / 崔西·莱茨 / 艾比·奎因 / 萨沙·弗若洛娃 / 莉莉·恩格勒特 / 爱德华德·弗莱彻 / 杰妮·霍蒂谢尔 / 多梅尼克·阿尔迪诺 / 汤姆·斯特拉特福 / 托马斯·马里亚诺 / 哈德莉·罗宾逊 / 杰米·加扎里安', '英语');
INSERT INTO `t_movie` VALUES (18, '格蕾塔·葛韦格', '1584318153507.jpg', 1, '1584318174447.mp4', '剧情,爱情', '2019', '利刃出鞘', '电影改编自世界名著《小妇人》，由奥斯卡提名最佳导演格雷塔.葛伟格执导，直击当代女性困惑。作为2020年颁奖季热门，影片聚齐两代神仙阵容“世纪大同框”——金球奖最佳女主“伯德小姐”西尔莎·罗南与屡获提名的超人气演员“甜茶”再度携手诠释错过的真爱，“赫敏”艾玛·沃森与“黑寡妇师妹”弗洛伦斯·皮尤联袂呈现手足情深，三获奥斯卡的老戏骨梅尔·斯特里普与四次金球奖得主劳拉·邓恩倾力加盟。导演葛伟格用细腻又颇具新意的叙事手法，为这部经典文学名作带来充满活力的现代风格。 ', 6.3, 20, '2020(中国大陆) / 2019-12-25(美国)', '135分钟', '西尔莎·罗南 / 艾玛·沃森 / 佛罗伦斯·珀 / 伊莱扎·斯坎伦 / 劳拉·邓恩 / 蒂莫西·柴勒梅德 / 梅丽尔·斯特里普 / 鲍勃·奥登科克 / 詹姆斯·诺顿 / 路易·加瑞尔 / 克里斯·库珀 / 崔西·莱茨 / 艾比·奎因 / 萨沙·弗若洛娃 / 莉莉·恩格勒特 / 爱德华德·弗莱彻 / 杰妮·霍蒂谢尔 / 多梅尼克·阿尔迪诺 / 汤姆·斯特拉特福 / 托马斯·马里亚诺 / 哈德莉·罗宾逊 / 杰米·加扎里安', '英语');
INSERT INTO `t_movie` VALUES (19, '格蕾塔·葛韦格', '1584318153507.jpg', 1, '1584318174447.mp4', '剧情,爱情', '2019', '阳光普照', '电影改编自世界名著《小妇人》，由奥斯卡提名最佳导演格雷塔.葛伟格执导，直击当代女性困惑。作为2020年颁奖季热门，影片聚齐两代神仙阵容“世纪大同框”——金球奖最佳女主“伯德小姐”西尔莎·罗南与屡获提名的超人气演员“甜茶”再度携手诠释错过的真爱，“赫敏”艾玛·沃森与“黑寡妇师妹”弗洛伦斯·皮尤联袂呈现手足情深，三获奥斯卡的老戏骨梅尔·斯特里普与四次金球奖得主劳拉·邓恩倾力加盟。导演葛伟格用细腻又颇具新意的叙事手法，为这部经典文学名作带来充满活力的现代风格。 ', 6.0, 21, '2020(中国大陆) / 2019-12-25(美国)', '135分钟', '西尔莎·罗南 / 艾玛·沃森 / 佛罗伦斯·珀 / 伊莱扎·斯坎伦 / 劳拉·邓恩 / 蒂莫西·柴勒梅德 / 梅丽尔·斯特里普 / 鲍勃·奥登科克 / 詹姆斯·诺顿 / 路易·加瑞尔 / 克里斯·库珀 / 崔西·莱茨 / 艾比·奎因 / 萨沙·弗若洛娃 / 莉莉·恩格勒特 / 爱德华德·弗莱彻 / 杰妮·霍蒂谢尔 / 多梅尼克·阿尔迪诺 / 汤姆·斯特拉特福 / 托马斯·马里亚诺 / 哈德莉·罗宾逊 / 杰米·加扎里安', '英语');
INSERT INTO `t_movie` VALUES (20, '格蕾塔·葛韦格', '1584318153507.jpg', 1, '1584318174447.mp4', '剧情,爱情', '2019', '乔乔的异想世界', '电影改编自世界名著《小妇人》，由奥斯卡提名最佳导演格雷塔.葛伟格执导，直击当代女性困惑。作为2020年颁奖季热门，影片聚齐两代神仙阵容“世纪大同框”——金球奖最佳女主“伯德小姐”西尔莎·罗南与屡获提名的超人气演员“甜茶”再度携手诠释错过的真爱，“赫敏”艾玛·沃森与“黑寡妇师妹”弗洛伦斯·皮尤联袂呈现手足情深，三获奥斯卡的老戏骨梅尔·斯特里普与四次金球奖得主劳拉·邓恩倾力加盟。导演葛伟格用细腻又颇具新意的叙事手法，为这部经典文学名作带来充满活力的现代风格。 ', 6.6, 23, '2020(中国大陆) / 2019-12-25(美国)', '135分钟', '西尔莎·罗南 / 艾玛·沃森 / 佛罗伦斯·珀 / 伊莱扎·斯坎伦 / 劳拉·邓恩 / 蒂莫西·柴勒梅德 / 梅丽尔·斯特里普 / 鲍勃·奥登科克 / 詹姆斯·诺顿 / 路易·加瑞尔 / 克里斯·库珀 / 崔西·莱茨 / 艾比·奎因 / 萨沙·弗若洛娃 / 莉莉·恩格勒特 / 爱德华德·弗莱彻 / 杰妮·霍蒂谢尔 / 多梅尼克·阿尔迪诺 / 汤姆·斯特拉特福 / 托马斯·马里亚诺 / 哈德莉·罗宾逊 / 杰米·加扎里安', '英语');
INSERT INTO `t_movie` VALUES (21, '格蕾塔·葛韦格', '1584318153507.jpg', 5, '1584318174447.mp4', '剧情,爱情', '2019', '小丑', '电影改编自世界名著《小妇人》，由奥斯卡提名最佳导演格雷塔.葛伟格执导，直击当代女性困惑。作为2020年颁奖季热门，影片聚齐两代神仙阵容“世纪大同框”——金球奖最佳女主“伯德小姐”西尔莎·罗南与屡获提名的超人气演员“甜茶”再度携手诠释错过的真爱，“赫敏”艾玛·沃森与“黑寡妇师妹”弗洛伦斯·皮尤联袂呈现手足情深，三获奥斯卡的老戏骨梅尔·斯特里普与四次金球奖得主劳拉·邓恩倾力加盟。导演葛伟格用细腻又颇具新意的叙事手法，为这部经典文学名作带来充满活力的现代风格。 ', 6.8, 24, '2020(中国大陆) / 2019-12-25(美国)', '135分钟', '西尔莎·罗南 / 艾玛·沃森 / 佛罗伦斯·珀 / 伊莱扎·斯坎伦 / 劳拉·邓恩 / 蒂莫西·柴勒梅德 / 梅丽尔·斯特里普 / 鲍勃·奥登科克 / 詹姆斯·诺顿 / 路易·加瑞尔 / 克里斯·库珀 / 崔西·莱茨 / 艾比·奎因 / 萨沙·弗若洛娃 / 莉莉·恩格勒特 / 爱德华德·弗莱彻 / 杰妮·霍蒂谢尔 / 多梅尼克·阿尔迪诺 / 汤姆·斯特拉特福 / 托马斯·马里亚诺 / 哈德莉·罗宾逊 / 杰米·加扎里安', '英语');
INSERT INTO `t_movie` VALUES (22, '格蕾塔·葛韦格', '1584318153507.jpg', 1, '1584318174447.mp4', '剧情,爱情', '2019', '猛禽小队和哈莉·奎茵', '电影改编自世界名著《小妇人》，由奥斯卡提名最佳导演格雷塔.葛伟格执导，直击当代女性困惑。作为2020年颁奖季热门，影片聚齐两代神仙阵容“世纪大同框”——金球奖最佳女主“伯德小姐”西尔莎·罗南与屡获提名的超人气演员“甜茶”再度携手诠释错过的真爱，“赫敏”艾玛·沃森与“黑寡妇师妹”弗洛伦斯·皮尤联袂呈现手足情深，三获奥斯卡的老戏骨梅尔·斯特里普与四次金球奖得主劳拉·邓恩倾力加盟。导演葛伟格用细腻又颇具新意的叙事手法，为这部经典文学名作带来充满活力的现代风格。 ', 7.4, 26, '2020(中国大陆) / 2019-12-25(美国)', '135分钟', '西尔莎·罗南 / 艾玛·沃森 / 佛罗伦斯·珀 / 伊莱扎·斯坎伦 / 劳拉·邓恩 / 蒂莫西·柴勒梅德 / 梅丽尔·斯特里普 / 鲍勃·奥登科克 / 詹姆斯·诺顿 / 路易·加瑞尔 / 克里斯·库珀 / 崔西·莱茨 / 艾比·奎因 / 萨沙·弗若洛娃 / 莉莉·恩格勒特 / 爱德华德·弗莱彻 / 杰妮·霍蒂谢尔 / 多梅尼克·阿尔迪诺 / 汤姆·斯特拉特福 / 托马斯·马里亚诺 / 哈德莉·罗宾逊 / 杰米·加扎里安', '英语');
INSERT INTO `t_movie` VALUES (23, '格蕾塔·葛韦格', '1584318153507.jpg', 1, '1584318174447.mp4', '剧情,爱情', '2019', '南山的部长们', '电影改编自世界名著《小妇人》，由奥斯卡提名最佳导演格雷塔.葛伟格执导，直击当代女性困惑。作为2020年颁奖季热门，影片聚齐两代神仙阵容“世纪大同框”——金球奖最佳女主“伯德小姐”西尔莎·罗南与屡获提名的超人气演员“甜茶”再度携手诠释错过的真爱，“赫敏”艾玛·沃森与“黑寡妇师妹”弗洛伦斯·皮尤联袂呈现手足情深，三获奥斯卡的老戏骨梅尔·斯特里普与四次金球奖得主劳拉·邓恩倾力加盟。导演葛伟格用细腻又颇具新意的叙事手法，为这部经典文学名作带来充满活力的现代风格。 ', 6.4, 20, '2020(中国大陆) / 2019-12-25(美国)', '135分钟', '西尔莎·罗南 / 艾玛·沃森 / 佛罗伦斯·珀 / 伊莱扎·斯坎伦 / 劳拉·邓恩 / 蒂莫西·柴勒梅德 / 梅丽尔·斯特里普 / 鲍勃·奥登科克 / 詹姆斯·诺顿 / 路易·加瑞尔 / 克里斯·库珀 / 崔西·莱茨 / 艾比·奎因 / 萨沙·弗若洛娃 / 莉莉·恩格勒特 / 爱德华德·弗莱彻 / 杰妮·霍蒂谢尔 / 多梅尼克·阿尔迪诺 / 汤姆·斯特拉特福 / 托马斯·马里亚诺 / 哈德莉·罗宾逊 / 杰米·加扎里安', '英语');
INSERT INTO `t_movie` VALUES (24, '格蕾塔·葛韦格', '1584318153507.jpg', 1, '1584318174447.mp4', '剧情,爱情', '2019', '寄生上流', '电影改编自世界名著《小妇人》，由奥斯卡提名最佳导演格雷塔.葛伟格执导，直击当代女性困惑。作为2020年颁奖季热门，影片聚齐两代神仙阵容“世纪大同框”——金球奖最佳女主“伯德小姐”西尔莎·罗南与屡获提名的超人气演员“甜茶”再度携手诠释错过的真爱，“赫敏”艾玛·沃森与“黑寡妇师妹”弗洛伦斯·皮尤联袂呈现手足情深，三获奥斯卡的老戏骨梅尔·斯特里普与四次金球奖得主劳拉·邓恩倾力加盟。导演葛伟格用细腻又颇具新意的叙事手法，为这部经典文学名作带来充满活力的现代风格。 ', 5.9, 23, '2020(中国大陆) / 2019-12-25(美国)', '135分钟', '西尔莎·罗南 / 艾玛·沃森 / 佛罗伦斯·珀 / 伊莱扎·斯坎伦 / 劳拉·邓恩 / 蒂莫西·柴勒梅德 / 梅丽尔·斯特里普 / 鲍勃·奥登科克 / 詹姆斯·诺顿 / 路易·加瑞尔 / 克里斯·库珀 / 崔西·莱茨 / 艾比·奎因 / 萨沙·弗若洛娃 / 莉莉·恩格勒特 / 爱德华德·弗莱彻 / 杰妮·霍蒂谢尔 / 多梅尼克·阿尔迪诺 / 汤姆·斯特拉特福 / 托马斯·马里亚诺 / 哈德莉·罗宾逊 / 杰米·加扎里安', '英语');
INSERT INTO `t_movie` VALUES (25, '格蕾塔·葛韦格', '1584318153507.jpg', 3, '1584318174447.mp4', '剧情,爱情', '2019', '她们', '电影改编自世界名著《小妇人》，由奥斯卡提名最佳导演格雷塔.葛伟格执导，直击当代女性困惑。作为2020年颁奖季热门，影片聚齐两代神仙阵容“世纪大同框”——金球奖最佳女主“伯德小姐”西尔莎·罗南与屡获提名的超人气演员“甜茶”再度携手诠释错过的真爱，“赫敏”艾玛·沃森与“黑寡妇师妹”弗洛伦斯·皮尤联袂呈现手足情深，三获奥斯卡的老戏骨梅尔·斯特里普与四次金球奖得主劳拉·邓恩倾力加盟。导演葛伟格用细腻又颇具新意的叙事手法，为这部经典文学名作带来充满活力的现代风格。 ', 5.8, 27, '2020(中国大陆) / 2019-12-25(美国)', '135分钟', '西尔莎·罗南 / 艾玛·沃森 / 佛罗伦斯·珀 / 伊莱扎·斯坎伦 / 劳拉·邓恩 / 蒂莫西·柴勒梅德 / 梅丽尔·斯特里普 / 鲍勃·奥登科克 / 詹姆斯·诺顿 / 路易·加瑞尔 / 克里斯·库珀 / 崔西·莱茨 / 艾比·奎因 / 萨沙·弗若洛娃 / 莉莉·恩格勒特 / 爱德华德·弗莱彻 / 杰妮·霍蒂谢尔 / 多梅尼克·阿尔迪诺 / 汤姆·斯特拉特福 / 托马斯·马里亚诺 / 哈德莉·罗宾逊 / 杰米·加扎里安', '英语');
INSERT INTO `t_movie` VALUES (26, '格蕾塔·葛韦格', '1584318153507.jpg', 5, '1584318174447.mp4', '剧情,爱情', '2019', '1917：逆战救兵', '电影改编自世界名著《小妇人》，由奥斯卡提名最佳导演格雷塔.葛伟格执导，直击当代女性困惑。作为2020年颁奖季热门，影片聚齐两代神仙阵容“世纪大同框”——金球奖最佳女主“伯德小姐”西尔莎·罗南与屡获提名的超人气演员“甜茶”再度携手诠释错过的真爱，“赫敏”艾玛·沃森与“黑寡妇师妹”弗洛伦斯·皮尤联袂呈现手足情深，三获奥斯卡的老戏骨梅尔·斯特里普与四次金球奖得主劳拉·邓恩倾力加盟。导演葛伟格用细腻又颇具新意的叙事手法，为这部经典文学名作带来充满活力的现代风格。 ', 7.2, 24, '2020(中国大陆) / 2019-12-25(美国)', '135分钟', '西尔莎·罗南 / 艾玛·沃森 / 佛罗伦斯·珀 / 伊莱扎·斯坎伦 / 劳拉·邓恩 / 蒂莫西·柴勒梅德 / 梅丽尔·斯特里普 / 鲍勃·奥登科克 / 詹姆斯·诺顿 / 路易·加瑞尔 / 克里斯·库珀 / 崔西·莱茨 / 艾比·奎因 / 萨沙·弗若洛娃 / 莉莉·恩格勒特 / 爱德华德·弗莱彻 / 杰妮·霍蒂谢尔 / 多梅尼克·阿尔迪诺 / 汤姆·斯特拉特福 / 托马斯·马里亚诺 / 哈德莉·罗宾逊 / 杰米·加扎里安', '英语');
INSERT INTO `t_movie` VALUES (27, '文牧野', 'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2561305376.jpg', 1, '1584318174447.mp4', '剧情,爱情', '2019', '我不是药神', '电影改编自世界名著《小妇人》，由奥斯卡提名最佳导演格雷塔.葛伟格执导，直击当代女性困惑。作为2020年颁奖季热门，影片聚齐两代神仙阵容“世纪大同框”——金球奖最佳女主“伯德小姐”西尔莎·罗南与屡获提名的超人气演员“甜茶”再度携手诠释错过的真爱，“赫敏”艾玛·沃森与“黑寡妇师妹”弗洛伦斯·皮尤联袂呈现手足情深，三获奥斯卡的老戏骨梅尔·斯特里普与四次金球奖得主劳拉·邓恩倾力加盟。导演葛伟格用细腻又颇具新意的叙事手法，为这部经典文学名作带来充满活力的现代风格。 ', 7.7, 23, '2020(中国大陆) / 2019-12-25(美国)', '135分钟', '西尔莎·罗南 / 艾玛·沃森 / 佛罗伦斯·珀 / 伊莱扎·斯坎伦 / 劳拉·邓恩 / 蒂莫西·柴勒梅德 / 梅丽尔·斯特里普 / 鲍勃·奥登科克 / 詹姆斯·诺顿 / 路易·加瑞尔 / 克里斯·库珀 / 崔西·莱茨 / 艾比·奎因 / 萨沙·弗若洛娃 / 莉莉·恩格勒特 / 爱德华德·弗莱彻 / 杰妮·霍蒂谢尔 / 多梅尼克·阿尔迪诺 / 汤姆·斯特拉特福 / 托马斯·马里亚诺 / 哈德莉·罗宾逊 / 杰米·加扎里安', '英语');
INSERT INTO `t_movie` VALUES (28, '饺子', 'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2563780504.jpg', 1, '1584318174447.mp4', '剧情,爱情,动画,奇幻', '2019', '哪吒之魔童降世', '天地灵气孕育出一颗能量巨大的混元珠，元始天尊将混元珠提炼成灵珠和魔丸，灵珠投胎为人，助周伐纣时可堪大用；而魔丸则会诞出魔王，为祸人间。元始天尊启动了天劫咒语，3年后天雷将会降临，摧毁魔丸。太乙受命将灵珠托生于陈塘关李靖家的儿子哪吒身上。然而阴差阳错，灵珠和魔丸竟然被掉包。本应是灵珠英雄的哪吒却成了混世大魔王。调皮捣蛋顽劣不堪的哪吒却徒有一颗做英雄的心。然而面对众人对魔丸的误解和即将来临的天雷的降临，哪吒是否命中注定会立地成魔？他将何去何从？ ', 6.6, 23, '2019-07-26(中国大陆) ', '135分钟', '吕艳婷 / 囧森瑟夫 / 瀚墨 / 陈浩 / 绿绮 / 张珈铭 / 杨卫', '汉语普通话');
INSERT INTO `t_movie` VALUES (29, '陈家霖', 'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2563766934.jpg', 1, '1584318174447.mp4', '剧情,爱情,古装', '2019', '陈情令', '十六年前，天下五分，姑苏蓝氏，云梦江氏，清河聂氏，岐山温氏，兰陵金氏共治天下。温氏一家独大，其余四家均受其苦。众家青年中，江氏故人之子魏无羡性格开朗，和以雅正闻名的姑苏蓝氏弟子蓝忘机相识并引为知己。一次偶然的机会，二人发现了蓝氏一直以来守护的秘密，二人继承遗志，为苍生消除隐患。但没想到一切的幕后黑手正是温氏家主温若寒。众家不堪其辱，合力讨伐温氏。温氏覆灭后，魏无羡却为保护温氏无辜之人不惜与众家对立，最终被奸人所害酿成大祸，误害师姐江厌离，自己也不知所踪。十六年后，消失已久的魏无羡出现在莫家庄，偶遇故人蓝忘机。莫家庄一桩桩诡异的凶案显得扑朔迷离。随着真相一步步揭开，身处幕后的金光瑶渐渐难以隐藏。最后金光瑶身死，蓝忘机承担起了匡扶天下的使命，而魏无羡不忘初心，最终潇洒世间。 ', 6.3, 25, '2020(中国大陆) / 2019-12-25(美国)', '135分钟', '西尔莎·罗南 / 艾玛·沃森 / 佛罗伦斯·珀 / 伊莱扎·斯坎伦 / 劳拉·邓恩 / 蒂莫西·柴勒梅德 / 梅丽尔·斯特里普 / 鲍勃·奥登科克 / 詹姆斯·诺顿 / 路易·加瑞尔 / 克里斯·库珀 / 崔西·莱茨 / 艾比·奎因 / 萨沙·弗若洛娃 / 莉莉·恩格勒特 / 爱德华德·弗莱彻 / 杰妮·霍蒂谢尔 / 多梅尼克·阿尔迪诺 / 汤姆·斯特拉特福 / 托马斯·马里亚诺 / 哈德莉·罗宾逊 / 杰米·加扎里安', '英语');

-- ----------------------------
-- Table structure for t_movie_area
-- ----------------------------
DROP TABLE IF EXISTS `t_movie_area`;
CREATE TABLE `t_movie_area`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_movie_area
-- ----------------------------
INSERT INTO `t_movie_area` VALUES (1, '中国大陆');
INSERT INTO `t_movie_area` VALUES (2, '日本');
INSERT INTO `t_movie_area` VALUES (3, '法国');
INSERT INTO `t_movie_area` VALUES (4, '澳大利亚');
INSERT INTO `t_movie_area` VALUES (5, '美国');
INSERT INTO `t_movie_area` VALUES (6, '韩国');

-- ----------------------------
-- Table structure for t_movie_comment
-- ----------------------------
DROP TABLE IF EXISTS `t_movie_comment`;
CREATE TABLE `t_movie_comment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `addDate` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `movieId` int(11) NULL DEFAULT NULL,
  `userId` int(11) NULL DEFAULT NULL,
  `vtype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  INDEX `FK84499BC58941562B`(`movieId`) USING BTREE,
  INDEX `FK84499BC574367213`(`userId`) USING BTREE,
  CONSTRAINT `FK84499BC574367213` FOREIGN KEY (`userId`) REFERENCES `t_user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `FK84499BC58941562B` FOREIGN KEY (`movieId`) REFERENCES `t_movie` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_movie_comment
-- ----------------------------
INSERT INTO `t_movie_comment` VALUES (3, '2020-04-16 10:39:47', '十六年前，天下五分，姑苏蓝氏，云梦江氏，清河聂氏，岐山温氏，', 29, 1, 'V');
INSERT INTO `t_movie_comment` VALUES (4, '2020-04-21 21:11:45', '与四次金球奖得主劳拉·邓恩倾力加盟。导演葛伟格用细腻又颇具新意的叙事手法，为这部经典文学名作带来充满活力的现代风格。', 19, 1, 'V');
INSERT INTO `t_movie_comment` VALUES (5, '2020-04-22 03:08:47', '改编自世界名著《小妇人》，由奥斯卡提', 21, 2, NULL);

-- ----------------------------
-- Table structure for t_movie_fav
-- ----------------------------
DROP TABLE IF EXISTS `t_movie_fav`;
CREATE TABLE `t_movie_fav`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `addDate` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `movieId` int(11) NULL DEFAULT NULL,
  `userId` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  INDEX `FK65AFDB818941562B`(`movieId`) USING BTREE,
  INDEX `FK65AFDB8174367213`(`userId`) USING BTREE,
  CONSTRAINT `FK65AFDB8174367213` FOREIGN KEY (`userId`) REFERENCES `t_user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `FK65AFDB818941562B` FOREIGN KEY (`movieId`) REFERENCES `t_movie` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_movie_fav
-- ----------------------------
INSERT INTO `t_movie_fav` VALUES (1, '2020-04-16', 2, 1);
INSERT INTO `t_movie_fav` VALUES (2, '2020-04-16', 22, 1);
INSERT INTO `t_movie_fav` VALUES (3, '2020-04-16', 29, 1);
INSERT INTO `t_movie_fav` VALUES (4, '2020-04-22', 21, 2);
INSERT INTO `t_movie_fav` VALUES (5, '2020-04-22', 13, 2);

-- ----------------------------
-- Table structure for t_movie_hot
-- ----------------------------
DROP TABLE IF EXISTS `t_movie_hot`;
CREATE TABLE `t_movie_hot`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imgFile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `murl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_movie_hot
-- ----------------------------
INSERT INTO `t_movie_hot` VALUES (1, '1584317119412.jpg', 'http://localhost:8080/dy', '1');
INSERT INTO `t_movie_hot` VALUES (2, '1584317109764.jpg', 'http://localhost:8080/dy', '2');
INSERT INTO `t_movie_hot` VALUES (3, '1584317095179.jpg', 'http://localhost:8080/dy', '3');

-- ----------------------------
-- Table structure for t_movie_score
-- ----------------------------
DROP TABLE IF EXISTS `t_movie_score`;
CREATE TABLE `t_movie_score`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `addDate` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `movieId` int(11) NULL DEFAULT NULL,
  `socre` double NULL DEFAULT NULL,
  `userId` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  INDEX `FKB9DF0D788941562B`(`movieId`) USING BTREE,
  INDEX `FKB9DF0D7874367213`(`userId`) USING BTREE,
  CONSTRAINT `FKB9DF0D7874367213` FOREIGN KEY (`userId`) REFERENCES `t_user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `FKB9DF0D788941562B` FOREIGN KEY (`movieId`) REFERENCES `t_movie` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 936 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_movie_score
-- ----------------------------
INSERT INTO `t_movie_score` VALUES (623, '2020-04-16', 7, 5, 1);
INSERT INTO `t_movie_score` VALUES (624, '2020-04-16', 8, 10, 1);
INSERT INTO `t_movie_score` VALUES (625, '2020-04-16', 9, 5, 1);
INSERT INTO `t_movie_score` VALUES (626, '2020-04-16', 10, 5, 1);
INSERT INTO `t_movie_score` VALUES (627, '2020-04-16', 11, 7, 1);
INSERT INTO `t_movie_score` VALUES (628, '2020-04-16', 12, 8, 1);
INSERT INTO `t_movie_score` VALUES (629, '2020-04-16', 13, 10, 1);
INSERT INTO `t_movie_score` VALUES (630, '2020-04-16', 14, 6, 1);
INSERT INTO `t_movie_score` VALUES (631, '2020-04-16', 15, 6, 1);
INSERT INTO `t_movie_score` VALUES (632, '2020-04-16', 16, 8, 1);
INSERT INTO `t_movie_score` VALUES (633, '2020-04-16', 13, 7, 2);
INSERT INTO `t_movie_score` VALUES (634, '2020-04-16', 14, 8, 2);
INSERT INTO `t_movie_score` VALUES (635, '2020-04-16', 15, 3, 2);
INSERT INTO `t_movie_score` VALUES (636, '2020-04-16', 16, 4, 2);
INSERT INTO `t_movie_score` VALUES (637, '2020-04-16', 17, 9, 2);
INSERT INTO `t_movie_score` VALUES (638, '2020-04-16', 18, 6, 2);
INSERT INTO `t_movie_score` VALUES (639, '2020-04-16', 19, 5, 2);
INSERT INTO `t_movie_score` VALUES (640, '2020-04-16', 20, 10, 2);
INSERT INTO `t_movie_score` VALUES (641, '2020-04-16', 21, 9, 2);
INSERT INTO `t_movie_score` VALUES (642, '2020-04-16', 22, 9, 2);
INSERT INTO `t_movie_score` VALUES (643, '2020-04-16', 27, 6, 3);
INSERT INTO `t_movie_score` VALUES (644, '2020-04-16', 28, 7, 3);
INSERT INTO `t_movie_score` VALUES (645, '2020-04-16', 29, 8, 3);
INSERT INTO `t_movie_score` VALUES (646, '2020-04-16', 1, 10, 3);
INSERT INTO `t_movie_score` VALUES (647, '2020-04-16', 2, 7, 3);
INSERT INTO `t_movie_score` VALUES (648, '2020-04-16', 3, 10, 3);
INSERT INTO `t_movie_score` VALUES (649, '2020-04-16', 4, 7, 3);
INSERT INTO `t_movie_score` VALUES (650, '2020-04-16', 5, 7, 3);
INSERT INTO `t_movie_score` VALUES (651, '2020-04-16', 6, 6, 3);
INSERT INTO `t_movie_score` VALUES (652, '2020-04-16', 7, 6, 3);
INSERT INTO `t_movie_score` VALUES (653, '2020-04-16', 1, 6, 4);
INSERT INTO `t_movie_score` VALUES (654, '2020-04-16', 2, 6, 4);
INSERT INTO `t_movie_score` VALUES (655, '2020-04-16', 3, 8, 4);
INSERT INTO `t_movie_score` VALUES (656, '2020-04-16', 4, 3, 4);
INSERT INTO `t_movie_score` VALUES (657, '2020-04-16', 5, 4, 4);
INSERT INTO `t_movie_score` VALUES (658, '2020-04-16', 6, 5, 4);
INSERT INTO `t_movie_score` VALUES (659, '2020-04-16', 7, 8, 4);
INSERT INTO `t_movie_score` VALUES (660, '2020-04-16', 8, 4, 4);
INSERT INTO `t_movie_score` VALUES (661, '2020-04-16', 9, 6, 4);
INSERT INTO `t_movie_score` VALUES (662, '2020-04-16', 10, 4, 4);
INSERT INTO `t_movie_score` VALUES (663, '2020-04-16', 26, 5, 5);
INSERT INTO `t_movie_score` VALUES (664, '2020-04-16', 27, 9, 5);
INSERT INTO `t_movie_score` VALUES (665, '2020-04-16', 28, 8, 5);
INSERT INTO `t_movie_score` VALUES (666, '2020-04-16', 29, 7, 5);
INSERT INTO `t_movie_score` VALUES (667, '2020-04-16', 1, 10, 5);
INSERT INTO `t_movie_score` VALUES (668, '2020-04-16', 2, 3, 5);
INSERT INTO `t_movie_score` VALUES (669, '2020-04-16', 3, 4, 5);
INSERT INTO `t_movie_score` VALUES (670, '2020-04-16', 4, 6, 5);
INSERT INTO `t_movie_score` VALUES (671, '2020-04-16', 5, 5, 5);
INSERT INTO `t_movie_score` VALUES (672, '2020-04-16', 6, 6, 5);
INSERT INTO `t_movie_score` VALUES (673, '2020-04-16', 14, 6, 6);
INSERT INTO `t_movie_score` VALUES (674, '2020-04-16', 15, 10, 6);
INSERT INTO `t_movie_score` VALUES (675, '2020-04-16', 16, 7, 6);
INSERT INTO `t_movie_score` VALUES (676, '2020-04-16', 17, 3, 6);
INSERT INTO `t_movie_score` VALUES (677, '2020-04-16', 18, 6, 6);
INSERT INTO `t_movie_score` VALUES (678, '2020-04-16', 19, 9, 6);
INSERT INTO `t_movie_score` VALUES (679, '2020-04-16', 20, 6, 6);
INSERT INTO `t_movie_score` VALUES (680, '2020-04-16', 21, 3, 6);
INSERT INTO `t_movie_score` VALUES (681, '2020-04-16', 22, 10, 6);
INSERT INTO `t_movie_score` VALUES (682, '2020-04-16', 23, 6, 6);
INSERT INTO `t_movie_score` VALUES (683, '2020-04-16', 13, 9, 7);
INSERT INTO `t_movie_score` VALUES (684, '2020-04-16', 14, 5, 7);
INSERT INTO `t_movie_score` VALUES (685, '2020-04-16', 15, 3, 7);
INSERT INTO `t_movie_score` VALUES (686, '2020-04-16', 16, 6, 7);
INSERT INTO `t_movie_score` VALUES (687, '2020-04-16', 17, 6, 7);
INSERT INTO `t_movie_score` VALUES (688, '2020-04-16', 18, 4, 7);
INSERT INTO `t_movie_score` VALUES (689, '2020-04-16', 19, 4, 7);
INSERT INTO `t_movie_score` VALUES (690, '2020-04-16', 20, 4, 7);
INSERT INTO `t_movie_score` VALUES (691, '2020-04-16', 21, 7, 7);
INSERT INTO `t_movie_score` VALUES (692, '2020-04-16', 22, 4, 7);
INSERT INTO `t_movie_score` VALUES (693, '2020-04-16', 12, 6, 8);
INSERT INTO `t_movie_score` VALUES (694, '2020-04-16', 13, 5, 8);
INSERT INTO `t_movie_score` VALUES (695, '2020-04-16', 14, 10, 8);
INSERT INTO `t_movie_score` VALUES (696, '2020-04-16', 15, 4, 8);
INSERT INTO `t_movie_score` VALUES (697, '2020-04-16', 16, 5, 8);
INSERT INTO `t_movie_score` VALUES (698, '2020-04-16', 17, 9, 8);
INSERT INTO `t_movie_score` VALUES (699, '2020-04-16', 18, 4, 8);
INSERT INTO `t_movie_score` VALUES (700, '2020-04-16', 19, 3, 8);
INSERT INTO `t_movie_score` VALUES (701, '2020-04-16', 20, 3, 8);
INSERT INTO `t_movie_score` VALUES (702, '2020-04-16', 21, 6, 8);
INSERT INTO `t_movie_score` VALUES (703, '2020-04-16', 16, 7, 9);
INSERT INTO `t_movie_score` VALUES (704, '2020-04-16', 17, 5, 9);
INSERT INTO `t_movie_score` VALUES (705, '2020-04-16', 18, 10, 9);
INSERT INTO `t_movie_score` VALUES (706, '2020-04-16', 19, 4, 9);
INSERT INTO `t_movie_score` VALUES (707, '2020-04-16', 20, 10, 9);
INSERT INTO `t_movie_score` VALUES (708, '2020-04-16', 21, 7, 9);
INSERT INTO `t_movie_score` VALUES (709, '2020-04-16', 22, 9, 9);
INSERT INTO `t_movie_score` VALUES (710, '2020-04-16', 23, 10, 9);
INSERT INTO `t_movie_score` VALUES (711, '2020-04-16', 24, 8, 9);
INSERT INTO `t_movie_score` VALUES (712, '2020-04-16', 25, 6, 9);
INSERT INTO `t_movie_score` VALUES (713, '2020-04-16', 13, 5, 10);
INSERT INTO `t_movie_score` VALUES (714, '2020-04-16', 14, 7, 10);
INSERT INTO `t_movie_score` VALUES (715, '2020-04-16', 15, 5, 10);
INSERT INTO `t_movie_score` VALUES (716, '2020-04-16', 16, 5, 10);
INSERT INTO `t_movie_score` VALUES (717, '2020-04-16', 17, 10, 10);
INSERT INTO `t_movie_score` VALUES (718, '2020-04-16', 18, 4, 10);
INSERT INTO `t_movie_score` VALUES (719, '2020-04-16', 19, 6, 10);
INSERT INTO `t_movie_score` VALUES (720, '2020-04-16', 20, 7, 10);
INSERT INTO `t_movie_score` VALUES (721, '2020-04-16', 21, 9, 10);
INSERT INTO `t_movie_score` VALUES (722, '2020-04-16', 22, 4, 10);
INSERT INTO `t_movie_score` VALUES (723, '2020-04-16', 21, 4, 11);
INSERT INTO `t_movie_score` VALUES (724, '2020-04-16', 22, 5, 11);
INSERT INTO `t_movie_score` VALUES (725, '2020-04-16', 23, 3, 11);
INSERT INTO `t_movie_score` VALUES (726, '2020-04-16', 24, 3, 11);
INSERT INTO `t_movie_score` VALUES (727, '2020-04-16', 25, 9, 11);
INSERT INTO `t_movie_score` VALUES (728, '2020-04-16', 26, 9, 11);
INSERT INTO `t_movie_score` VALUES (729, '2020-04-16', 27, 6, 11);
INSERT INTO `t_movie_score` VALUES (730, '2020-04-16', 28, 5, 11);
INSERT INTO `t_movie_score` VALUES (731, '2020-04-16', 29, 9, 11);
INSERT INTO `t_movie_score` VALUES (732, '2020-04-16', 1, 4, 11);
INSERT INTO `t_movie_score` VALUES (733, '2020-04-16', 7, 10, 12);
INSERT INTO `t_movie_score` VALUES (734, '2020-04-16', 8, 6, 12);
INSERT INTO `t_movie_score` VALUES (735, '2020-04-16', 9, 9, 12);
INSERT INTO `t_movie_score` VALUES (736, '2020-04-16', 10, 4, 12);
INSERT INTO `t_movie_score` VALUES (737, '2020-04-16', 11, 6, 12);
INSERT INTO `t_movie_score` VALUES (738, '2020-04-16', 12, 6, 12);
INSERT INTO `t_movie_score` VALUES (739, '2020-04-16', 13, 6, 12);
INSERT INTO `t_movie_score` VALUES (740, '2020-04-16', 14, 7, 12);
INSERT INTO `t_movie_score` VALUES (741, '2020-04-16', 15, 8, 12);
INSERT INTO `t_movie_score` VALUES (742, '2020-04-16', 16, 10, 12);
INSERT INTO `t_movie_score` VALUES (743, '2020-04-16', 24, 5, 13);
INSERT INTO `t_movie_score` VALUES (744, '2020-04-16', 25, 5, 13);
INSERT INTO `t_movie_score` VALUES (745, '2020-04-16', 26, 9, 13);
INSERT INTO `t_movie_score` VALUES (746, '2020-04-16', 27, 5, 13);
INSERT INTO `t_movie_score` VALUES (747, '2020-04-16', 28, 9, 13);
INSERT INTO `t_movie_score` VALUES (748, '2020-04-16', 29, 6, 13);
INSERT INTO `t_movie_score` VALUES (749, '2020-04-16', 1, 6, 13);
INSERT INTO `t_movie_score` VALUES (750, '2020-04-16', 2, 6, 13);
INSERT INTO `t_movie_score` VALUES (751, '2020-04-16', 3, 9, 13);
INSERT INTO `t_movie_score` VALUES (752, '2020-04-16', 4, 6, 13);
INSERT INTO `t_movie_score` VALUES (753, '2020-04-16', 27, 9, 14);
INSERT INTO `t_movie_score` VALUES (754, '2020-04-16', 28, 5, 14);
INSERT INTO `t_movie_score` VALUES (755, '2020-04-16', 29, 3, 14);
INSERT INTO `t_movie_score` VALUES (756, '2020-04-16', 1, 8, 14);
INSERT INTO `t_movie_score` VALUES (757, '2020-04-16', 2, 3, 14);
INSERT INTO `t_movie_score` VALUES (758, '2020-04-16', 3, 10, 14);
INSERT INTO `t_movie_score` VALUES (759, '2020-04-16', 4, 8, 14);
INSERT INTO `t_movie_score` VALUES (760, '2020-04-16', 5, 7, 14);
INSERT INTO `t_movie_score` VALUES (761, '2020-04-16', 6, 6, 14);
INSERT INTO `t_movie_score` VALUES (762, '2020-04-16', 7, 5, 14);
INSERT INTO `t_movie_score` VALUES (763, '2020-04-16', 22, 9, 15);
INSERT INTO `t_movie_score` VALUES (764, '2020-04-16', 23, 8, 15);
INSERT INTO `t_movie_score` VALUES (765, '2020-04-16', 24, 6, 15);
INSERT INTO `t_movie_score` VALUES (766, '2020-04-16', 25, 7, 15);
INSERT INTO `t_movie_score` VALUES (767, '2020-04-16', 26, 9, 15);
INSERT INTO `t_movie_score` VALUES (768, '2020-04-16', 27, 10, 15);
INSERT INTO `t_movie_score` VALUES (769, '2020-04-16', 28, 6, 15);
INSERT INTO `t_movie_score` VALUES (770, '2020-04-16', 29, 10, 15);
INSERT INTO `t_movie_score` VALUES (771, '2020-04-16', 1, 6, 15);
INSERT INTO `t_movie_score` VALUES (772, '2020-04-16', 2, 3, 15);
INSERT INTO `t_movie_score` VALUES (773, '2020-04-16', 20, 3, 16);
INSERT INTO `t_movie_score` VALUES (774, '2020-04-16', 21, 6, 16);
INSERT INTO `t_movie_score` VALUES (775, '2020-04-16', 22, 10, 16);
INSERT INTO `t_movie_score` VALUES (776, '2020-04-16', 23, 8, 16);
INSERT INTO `t_movie_score` VALUES (777, '2020-04-16', 24, 5, 16);
INSERT INTO `t_movie_score` VALUES (778, '2020-04-16', 25, 5, 16);
INSERT INTO `t_movie_score` VALUES (779, '2020-04-16', 26, 10, 16);
INSERT INTO `t_movie_score` VALUES (780, '2020-04-16', 27, 9, 16);
INSERT INTO `t_movie_score` VALUES (781, '2020-04-16', 28, 6, 16);
INSERT INTO `t_movie_score` VALUES (782, '2020-04-16', 29, 3, 16);
INSERT INTO `t_movie_score` VALUES (783, '2020-04-16', 13, 5, 17);
INSERT INTO `t_movie_score` VALUES (784, '2020-04-16', 14, 8, 17);
INSERT INTO `t_movie_score` VALUES (785, '2020-04-16', 15, 7, 17);
INSERT INTO `t_movie_score` VALUES (786, '2020-04-16', 16, 3, 17);
INSERT INTO `t_movie_score` VALUES (787, '2020-04-16', 17, 4, 17);
INSERT INTO `t_movie_score` VALUES (788, '2020-04-16', 18, 4, 17);
INSERT INTO `t_movie_score` VALUES (789, '2020-04-16', 19, 7, 17);
INSERT INTO `t_movie_score` VALUES (790, '2020-04-16', 20, 3, 17);
INSERT INTO `t_movie_score` VALUES (791, '2020-04-16', 21, 5, 17);
INSERT INTO `t_movie_score` VALUES (792, '2020-04-16', 22, 10, 17);
INSERT INTO `t_movie_score` VALUES (793, '2020-04-16', 13, 9, 18);
INSERT INTO `t_movie_score` VALUES (794, '2020-04-16', 14, 10, 18);
INSERT INTO `t_movie_score` VALUES (795, '2020-04-16', 15, 4, 18);
INSERT INTO `t_movie_score` VALUES (796, '2020-04-16', 16, 5, 18);
INSERT INTO `t_movie_score` VALUES (797, '2020-04-16', 17, 10, 18);
INSERT INTO `t_movie_score` VALUES (798, '2020-04-16', 18, 8, 18);
INSERT INTO `t_movie_score` VALUES (799, '2020-04-16', 19, 4, 18);
INSERT INTO `t_movie_score` VALUES (800, '2020-04-16', 20, 10, 18);
INSERT INTO `t_movie_score` VALUES (801, '2020-04-16', 21, 5, 18);
INSERT INTO `t_movie_score` VALUES (802, '2020-04-16', 22, 10, 18);
INSERT INTO `t_movie_score` VALUES (803, '2020-04-16', 24, 8, 19);
INSERT INTO `t_movie_score` VALUES (804, '2020-04-16', 25, 5, 19);
INSERT INTO `t_movie_score` VALUES (805, '2020-04-16', 26, 4, 19);
INSERT INTO `t_movie_score` VALUES (806, '2020-04-16', 27, 9, 19);
INSERT INTO `t_movie_score` VALUES (807, '2020-04-16', 28, 5, 19);
INSERT INTO `t_movie_score` VALUES (808, '2020-04-16', 29, 5, 19);
INSERT INTO `t_movie_score` VALUES (809, '2020-04-16', 1, 6, 19);
INSERT INTO `t_movie_score` VALUES (810, '2020-04-16', 2, 6, 19);
INSERT INTO `t_movie_score` VALUES (811, '2020-04-16', 3, 4, 19);
INSERT INTO `t_movie_score` VALUES (812, '2020-04-16', 4, 8, 19);
INSERT INTO `t_movie_score` VALUES (813, '2020-04-16', 17, 5, 20);
INSERT INTO `t_movie_score` VALUES (814, '2020-04-16', 18, 10, 20);
INSERT INTO `t_movie_score` VALUES (815, '2020-04-16', 19, 5, 20);
INSERT INTO `t_movie_score` VALUES (816, '2020-04-16', 20, 6, 20);
INSERT INTO `t_movie_score` VALUES (817, '2020-04-16', 21, 8, 20);
INSERT INTO `t_movie_score` VALUES (818, '2020-04-16', 22, 7, 20);
INSERT INTO `t_movie_score` VALUES (819, '2020-04-16', 23, 8, 20);
INSERT INTO `t_movie_score` VALUES (820, '2020-04-16', 24, 4, 20);
INSERT INTO `t_movie_score` VALUES (821, '2020-04-16', 25, 4, 20);
INSERT INTO `t_movie_score` VALUES (822, '2020-04-16', 26, 7, 20);
INSERT INTO `t_movie_score` VALUES (823, '2020-04-16', 3, 7, 21);
INSERT INTO `t_movie_score` VALUES (824, '2020-04-16', 4, 10, 21);
INSERT INTO `t_movie_score` VALUES (825, '2020-04-16', 5, 5, 21);
INSERT INTO `t_movie_score` VALUES (826, '2020-04-16', 6, 6, 21);
INSERT INTO `t_movie_score` VALUES (827, '2020-04-16', 7, 6, 21);
INSERT INTO `t_movie_score` VALUES (828, '2020-04-16', 8, 9, 21);
INSERT INTO `t_movie_score` VALUES (829, '2020-04-16', 9, 6, 21);
INSERT INTO `t_movie_score` VALUES (830, '2020-04-16', 10, 3, 21);
INSERT INTO `t_movie_score` VALUES (831, '2020-04-16', 11, 4, 21);
INSERT INTO `t_movie_score` VALUES (832, '2020-04-16', 12, 9, 21);
INSERT INTO `t_movie_score` VALUES (833, '2020-04-16', 29, 5, 22);
INSERT INTO `t_movie_score` VALUES (834, '2020-04-16', 1, 10, 22);
INSERT INTO `t_movie_score` VALUES (835, '2020-04-16', 2, 6, 22);
INSERT INTO `t_movie_score` VALUES (836, '2020-04-16', 3, 6, 22);
INSERT INTO `t_movie_score` VALUES (837, '2020-04-16', 4, 5, 22);
INSERT INTO `t_movie_score` VALUES (838, '2020-04-16', 5, 6, 22);
INSERT INTO `t_movie_score` VALUES (839, '2020-04-16', 6, 5, 22);
INSERT INTO `t_movie_score` VALUES (840, '2020-04-16', 7, 5, 22);
INSERT INTO `t_movie_score` VALUES (841, '2020-04-16', 8, 4, 22);
INSERT INTO `t_movie_score` VALUES (842, '2020-04-16', 9, 4, 22);
INSERT INTO `t_movie_score` VALUES (843, '2020-04-16', 5, 3, 23);
INSERT INTO `t_movie_score` VALUES (844, '2020-04-16', 6, 3, 23);
INSERT INTO `t_movie_score` VALUES (845, '2020-04-16', 7, 5, 23);
INSERT INTO `t_movie_score` VALUES (846, '2020-04-16', 8, 4, 23);
INSERT INTO `t_movie_score` VALUES (847, '2020-04-16', 9, 10, 23);
INSERT INTO `t_movie_score` VALUES (848, '2020-04-16', 10, 4, 23);
INSERT INTO `t_movie_score` VALUES (849, '2020-04-16', 11, 5, 23);
INSERT INTO `t_movie_score` VALUES (850, '2020-04-16', 12, 4, 23);
INSERT INTO `t_movie_score` VALUES (851, '2020-04-16', 13, 5, 23);
INSERT INTO `t_movie_score` VALUES (852, '2020-04-16', 14, 5, 23);
INSERT INTO `t_movie_score` VALUES (853, '2020-04-16', 20, 3, 24);
INSERT INTO `t_movie_score` VALUES (854, '2020-04-16', 21, 8, 24);
INSERT INTO `t_movie_score` VALUES (855, '2020-04-16', 22, 6, 24);
INSERT INTO `t_movie_score` VALUES (856, '2020-04-16', 23, 3, 24);
INSERT INTO `t_movie_score` VALUES (857, '2020-04-16', 24, 5, 24);
INSERT INTO `t_movie_score` VALUES (858, '2020-04-16', 25, 3, 24);
INSERT INTO `t_movie_score` VALUES (859, '2020-04-16', 26, 9, 24);
INSERT INTO `t_movie_score` VALUES (860, '2020-04-16', 27, 4, 24);
INSERT INTO `t_movie_score` VALUES (861, '2020-04-16', 28, 5, 24);
INSERT INTO `t_movie_score` VALUES (862, '2020-04-16', 29, 5, 24);
INSERT INTO `t_movie_score` VALUES (863, '2020-04-16', 22, 4, 25);
INSERT INTO `t_movie_score` VALUES (864, '2020-04-16', 23, 4, 25);
INSERT INTO `t_movie_score` VALUES (865, '2020-04-16', 24, 4, 25);
INSERT INTO `t_movie_score` VALUES (866, '2020-04-16', 25, 6, 25);
INSERT INTO `t_movie_score` VALUES (867, '2020-04-16', 26, 6, 25);
INSERT INTO `t_movie_score` VALUES (868, '2020-04-16', 27, 10, 25);
INSERT INTO `t_movie_score` VALUES (869, '2020-04-16', 28, 10, 25);
INSERT INTO `t_movie_score` VALUES (870, '2020-04-16', 29, 5, 25);
INSERT INTO `t_movie_score` VALUES (871, '2020-04-16', 1, 6, 25);
INSERT INTO `t_movie_score` VALUES (872, '2020-04-16', 2, 6, 25);
INSERT INTO `t_movie_score` VALUES (873, '2020-04-16', 16, 10, 26);
INSERT INTO `t_movie_score` VALUES (874, '2020-04-16', 17, 5, 26);
INSERT INTO `t_movie_score` VALUES (875, '2020-04-16', 18, 7, 26);
INSERT INTO `t_movie_score` VALUES (876, '2020-04-16', 19, 10, 26);
INSERT INTO `t_movie_score` VALUES (877, '2020-04-16', 20, 9, 26);
INSERT INTO `t_movie_score` VALUES (878, '2020-04-16', 21, 10, 26);
INSERT INTO `t_movie_score` VALUES (879, '2020-04-16', 22, 8, 26);
INSERT INTO `t_movie_score` VALUES (880, '2020-04-16', 23, 5, 26);
INSERT INTO `t_movie_score` VALUES (881, '2020-04-16', 24, 8, 26);
INSERT INTO `t_movie_score` VALUES (882, '2020-04-16', 25, 4, 26);
INSERT INTO `t_movie_score` VALUES (883, '2020-04-16', 17, 5, 27);
INSERT INTO `t_movie_score` VALUES (884, '2020-04-16', 18, 6, 27);
INSERT INTO `t_movie_score` VALUES (885, '2020-04-16', 19, 6, 27);
INSERT INTO `t_movie_score` VALUES (886, '2020-04-16', 20, 10, 27);
INSERT INTO `t_movie_score` VALUES (887, '2020-04-16', 21, 8, 27);
INSERT INTO `t_movie_score` VALUES (888, '2020-04-16', 22, 6, 27);
INSERT INTO `t_movie_score` VALUES (889, '2020-04-16', 23, 9, 27);
INSERT INTO `t_movie_score` VALUES (890, '2020-04-16', 24, 9, 27);
INSERT INTO `t_movie_score` VALUES (891, '2020-04-16', 25, 8, 27);
INSERT INTO `t_movie_score` VALUES (892, '2020-04-16', 26, 4, 27);
INSERT INTO `t_movie_score` VALUES (893, '2020-04-16', 2, 5, 28);
INSERT INTO `t_movie_score` VALUES (894, '2020-04-16', 3, 4, 28);
INSERT INTO `t_movie_score` VALUES (895, '2020-04-16', 4, 4, 28);
INSERT INTO `t_movie_score` VALUES (896, '2020-04-16', 5, 6, 28);
INSERT INTO `t_movie_score` VALUES (897, '2020-04-16', 6, 7, 28);
INSERT INTO `t_movie_score` VALUES (898, '2020-04-16', 7, 6, 28);
INSERT INTO `t_movie_score` VALUES (899, '2020-04-16', 8, 10, 28);
INSERT INTO `t_movie_score` VALUES (900, '2020-04-16', 9, 5, 28);
INSERT INTO `t_movie_score` VALUES (901, '2020-04-16', 10, 9, 28);
INSERT INTO `t_movie_score` VALUES (902, '2020-04-16', 11, 7, 28);
INSERT INTO `t_movie_score` VALUES (903, '2020-04-16', 3, 7, 29);
INSERT INTO `t_movie_score` VALUES (904, '2020-04-16', 4, 8, 29);
INSERT INTO `t_movie_score` VALUES (905, '2020-04-16', 5, 9, 29);
INSERT INTO `t_movie_score` VALUES (906, '2020-04-16', 6, 6, 29);
INSERT INTO `t_movie_score` VALUES (907, '2020-04-16', 7, 9, 29);
INSERT INTO `t_movie_score` VALUES (908, '2020-04-16', 8, 4, 29);
INSERT INTO `t_movie_score` VALUES (909, '2020-04-16', 9, 4, 29);
INSERT INTO `t_movie_score` VALUES (910, '2020-04-16', 10, 4, 29);
INSERT INTO `t_movie_score` VALUES (911, '2020-04-16', 11, 6, 29);
INSERT INTO `t_movie_score` VALUES (912, '2020-04-16', 12, 5, 29);
INSERT INTO `t_movie_score` VALUES (913, '2020-04-16', 11, 5, 30);
INSERT INTO `t_movie_score` VALUES (914, '2020-04-16', 12, 3, 30);
INSERT INTO `t_movie_score` VALUES (915, '2020-04-16', 13, 10, 30);
INSERT INTO `t_movie_score` VALUES (916, '2020-04-16', 14, 7, 30);
INSERT INTO `t_movie_score` VALUES (917, '2020-04-16', 15, 6, 30);
INSERT INTO `t_movie_score` VALUES (918, '2020-04-16', 16, 9, 30);
INSERT INTO `t_movie_score` VALUES (919, '2020-04-16', 17, 6, 30);
INSERT INTO `t_movie_score` VALUES (920, '2020-04-16', 18, 7, 30);
INSERT INTO `t_movie_score` VALUES (921, '2020-04-16', 19, 10, 30);
INSERT INTO `t_movie_score` VALUES (922, '2020-04-16', 20, 9, 30);
INSERT INTO `t_movie_score` VALUES (923, '2020-04-16', 7, 8, 31);
INSERT INTO `t_movie_score` VALUES (924, '2020-04-16', 8, 8, 31);
INSERT INTO `t_movie_score` VALUES (925, '2020-04-16', 9, 9, 31);
INSERT INTO `t_movie_score` VALUES (926, '2020-04-16', 10, 3, 31);
INSERT INTO `t_movie_score` VALUES (927, '2020-04-16', 11, 6, 31);
INSERT INTO `t_movie_score` VALUES (928, '2020-04-16', 12, 5, 31);
INSERT INTO `t_movie_score` VALUES (929, '2020-04-16', 13, 10, 31);
INSERT INTO `t_movie_score` VALUES (930, '2020-04-16', 14, 7, 31);
INSERT INTO `t_movie_score` VALUES (931, '2020-04-16', 15, 4, 31);
INSERT INTO `t_movie_score` VALUES (932, '2020-04-16', 16, 3, 31);
INSERT INTO `t_movie_score` VALUES (933, '2020-04-16', 29, 10, 1);
INSERT INTO `t_movie_score` VALUES (934, '2020-04-27', 19, 5, 1);
INSERT INTO `t_movie_score` VALUES (935, '2020-04-22', 25, 8, 2);

-- ----------------------------
-- Table structure for t_movie_type
-- ----------------------------
DROP TABLE IF EXISTS `t_movie_type`;
CREATE TABLE `t_movie_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_movie_type
-- ----------------------------
INSERT INTO `t_movie_type` VALUES (1, '传记');
INSERT INTO `t_movie_type` VALUES (2, '冒险');
INSERT INTO `t_movie_type` VALUES (3, '剧情');
INSERT INTO `t_movie_type` VALUES (4, '动作');
INSERT INTO `t_movie_type` VALUES (5, '动画');
INSERT INTO `t_movie_type` VALUES (6, '历史');
INSERT INTO `t_movie_type` VALUES (7, '古装');
INSERT INTO `t_movie_type` VALUES (8, '喜剧');
INSERT INTO `t_movie_type` VALUES (9, '奇幻');
INSERT INTO `t_movie_type` VALUES (10, '惊悚');
INSERT INTO `t_movie_type` VALUES (11, '灾难');
INSERT INTO `t_movie_type` VALUES (12, '爱情');
INSERT INTO `t_movie_type` VALUES (13, '犯罪');
INSERT INTO `t_movie_type` VALUES (14, '科幻');

-- ----------------------------
-- Table structure for t_sysuser
-- ----------------------------
DROP TABLE IF EXISTS `t_sysuser`;
CREATE TABLE `t_sysuser`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `userAddress` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userBirth` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userEmail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userGender` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `userPassword` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `userPhone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  UNIQUE INDEX `uname`(`uname`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_sysuser
-- ----------------------------
INSERT INTO `t_sysuser` VALUES (1, 'admin', NULL, NULL, NULL, '男', '管理员', 'E10ADC3949BA59ABBE56E057F20F883E', NULL);

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `uname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `userAddress` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userBirth` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userEmail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userGender` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `userPassword` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `userPhone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `locked` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  UNIQUE INDEX `uname`(`uname`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (1, 'V', 'user1', NULL, NULL, '4646464@qq.com', '男', '王琪', 'E10ADC3949BA59ABBE56E057F20F883E', '15746546546', '正常');
INSERT INTO `t_user` VALUES (2, NULL, '9001', NULL, NULL, NULL, '男', '鲍行时', 'E10ADC3949BA59ABBE56E057F20F883E', '15788888888', NULL);
INSERT INTO `t_user` VALUES (3, NULL, '9002', NULL, NULL, NULL, '男', '禹东文', 'E10ADC3949BA59ABBE56E057F20F883E', '15788888888', NULL);
INSERT INTO `t_user` VALUES (4, NULL, '9003', NULL, NULL, NULL, '男', '鲍顺', 'E10ADC3949BA59ABBE56E057F20F883E', '15788888888', NULL);
INSERT INTO `t_user` VALUES (5, NULL, '9004', NULL, NULL, NULL, '女', '殷馨', 'E10ADC3949BA59ABBE56E057F20F883E', '15788888888', NULL);
INSERT INTO `t_user` VALUES (6, NULL, '9005', NULL, NULL, NULL, '男', '戚飞彬', 'E10ADC3949BA59ABBE56E057F20F883E', '15788888888', NULL);
INSERT INTO `t_user` VALUES (7, NULL, '9006', NULL, NULL, NULL, '男', '华以', 'E10ADC3949BA59ABBE56E057F20F883E', '15788888888', NULL);
INSERT INTO `t_user` VALUES (8, NULL, '9007', NULL, NULL, NULL, '男', '安江超', 'E10ADC3949BA59ABBE56E057F20F883E', '15788888888', NULL);
INSERT INTO `t_user` VALUES (9, NULL, '9008', NULL, NULL, NULL, '男', '齐岩中', 'E10ADC3949BA59ABBE56E057F20F883E', '15788888888', NULL);
INSERT INTO `t_user` VALUES (10, NULL, '9009', NULL, NULL, NULL, '男', '茅炎德', 'E10ADC3949BA59ABBE56E057F20F883E', '15788888888', NULL);
INSERT INTO `t_user` VALUES (11, NULL, '9010', NULL, NULL, NULL, '男', '祁鹏泽', 'E10ADC3949BA59ABBE56E057F20F883E', '15788888888', NULL);
INSERT INTO `t_user` VALUES (12, NULL, '9011', NULL, NULL, NULL, '女', '邹咏卿', 'E10ADC3949BA59ABBE56E057F20F883E', '15788888888', NULL);
INSERT INTO `t_user` VALUES (13, NULL, '9012', NULL, NULL, NULL, '女', '柏莺', 'E10ADC3949BA59ABBE56E057F20F883E', '15788888888', NULL);
INSERT INTO `t_user` VALUES (14, NULL, '9013', NULL, NULL, NULL, '女', '花欢霄', 'E10ADC3949BA59ABBE56E057F20F883E', '15788888888', NULL);
INSERT INTO `t_user` VALUES (15, NULL, '9014', NULL, NULL, NULL, '男', '许泰盛', 'E10ADC3949BA59ABBE56E057F20F883E', '15788888888', NULL);
INSERT INTO `t_user` VALUES (16, NULL, '9015', NULL, NULL, NULL, '男', '彭超', 'E10ADC3949BA59ABBE56E057F20F883E', '15788888888', NULL);
INSERT INTO `t_user` VALUES (17, NULL, '9016', NULL, NULL, NULL, '女', '彭飘育', 'E10ADC3949BA59ABBE56E057F20F883E', '15788888888', NULL);
INSERT INTO `t_user` VALUES (18, NULL, '9017', NULL, NULL, NULL, '女', '卫娴', 'E10ADC3949BA59ABBE56E057F20F883E', '15788888888', NULL);
INSERT INTO `t_user` VALUES (19, NULL, '9018', NULL, NULL, NULL, '男', '臧绍功', 'E10ADC3949BA59ABBE56E057F20F883E', '15788888888', NULL);
INSERT INTO `t_user` VALUES (20, NULL, '9019', NULL, NULL, NULL, '男', '杜壮', 'E10ADC3949BA59ABBE56E057F20F883E', '15788888888', NULL);
INSERT INTO `t_user` VALUES (21, NULL, '9020', NULL, NULL, NULL, '女', '俞融', 'E10ADC3949BA59ABBE56E057F20F883E', '15788888888', NULL);
INSERT INTO `t_user` VALUES (22, NULL, '9021', NULL, NULL, NULL, '女', '余枝思', 'E10ADC3949BA59ABBE56E057F20F883E', '15788888888', NULL);
INSERT INTO `t_user` VALUES (23, NULL, '9022', NULL, NULL, NULL, '男', '庞福', 'E10ADC3949BA59ABBE56E057F20F883E', '15788888888', NULL);
INSERT INTO `t_user` VALUES (24, NULL, '9023', NULL, NULL, NULL, '女', '曹青倩', 'E10ADC3949BA59ABBE56E057F20F883E', '15788888888', NULL);
INSERT INTO `t_user` VALUES (25, NULL, '9024', NULL, NULL, NULL, '男', '华宁', 'E10ADC3949BA59ABBE56E057F20F883E', '15788888888', NULL);
INSERT INTO `t_user` VALUES (26, NULL, '9025', NULL, NULL, NULL, '女', '卞荔', 'E10ADC3949BA59ABBE56E057F20F883E', '15788888888', NULL);
INSERT INTO `t_user` VALUES (27, NULL, '9026', NULL, NULL, NULL, '男', '曹昌成', 'E10ADC3949BA59ABBE56E057F20F883E', '15788888888', NULL);
INSERT INTO `t_user` VALUES (28, NULL, '9027', NULL, NULL, NULL, '女', '祁慧巧', 'E10ADC3949BA59ABBE56E057F20F883E', '15788888888', NULL);
INSERT INTO `t_user` VALUES (29, NULL, '9028', NULL, NULL, NULL, '男', '花壮', 'E10ADC3949BA59ABBE56E057F20F883E', '15788888888', NULL);
INSERT INTO `t_user` VALUES (30, NULL, '9029', NULL, NULL, NULL, '男', '韦河哲', 'E10ADC3949BA59ABBE56E057F20F883E', '15788888888', NULL);
INSERT INTO `t_user` VALUES (31, NULL, '9030', NULL, NULL, NULL, '男', '董刚', 'E10ADC3949BA59ABBE56E057F20F883E', '15788888888', '正常');

-- ----------------------------
-- Table structure for t_user_filter_result
-- ----------------------------
DROP TABLE IF EXISTS `t_user_filter_result`;
CREATE TABLE `t_user_filter_result`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `memberid` int(11) NULL DEFAULT NULL,
  `productids` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 186 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_user_filter_result
-- ----------------------------
INSERT INTO `t_user_filter_result` VALUES (155, 1, '18,27,26,22,23,20,21,25,28,1');
INSERT INTO `t_user_filter_result` VALUES (156, 2, '23,26,24');
INSERT INTO `t_user_filter_result` VALUES (157, 3, '13,8,12,11,14,9,16,15,10');
INSERT INTO `t_user_filter_result` VALUES (158, 4, '28,27,26,25,29,22,24,23');
INSERT INTO `t_user_filter_result` VALUES (159, 5, '23,20,21,18,8,24,22,25,19,7');
INSERT INTO `t_user_filter_result` VALUES (160, 6, '9,27,26,29,7,25,28,24,11,13');
INSERT INTO `t_user_filter_result` VALUES (161, 7, '8,28,27,9,26,12,11,7,29,25');
INSERT INTO `t_user_filter_result` VALUES (162, 8, '26,22,27,23,28,25,24,29');
INSERT INTO `t_user_filter_result` VALUES (163, 9, '27,29,1,26,28,2');
INSERT INTO `t_user_filter_result` VALUES (164, 10, '25,12');
INSERT INTO `t_user_filter_result` VALUES (165, 11, '13,8,17,12,14,16,7,9,15,10');
INSERT INTO `t_user_filter_result` VALUES (166, 12, '19,22,21,20,18,23,17,6,5');
INSERT INTO `t_user_filter_result` VALUES (167, 13, '21,7,22,23,6,5,20');
INSERT INTO `t_user_filter_result` VALUES (168, 14, '12,8,11,9,10');
INSERT INTO `t_user_filter_result` VALUES (169, 15, '13,20,17,14,21,18,16,19,15');
INSERT INTO `t_user_filter_result` VALUES (170, 16, '14,1,3,17,4,5,6,15,13,7');
INSERT INTO `t_user_filter_result` VALUES (171, 17, '26,27,23,29,28,25,24');
INSERT INTO `t_user_filter_result` VALUES (172, 18, '23,25,24');
INSERT INTO `t_user_filter_result` VALUES (173, 19, '20,16,21,18,22,23,19,17');
INSERT INTO `t_user_filter_result` VALUES (174, 20, '29,28,27,1,3,4,2');
INSERT INTO `t_user_filter_result` VALUES (175, 21, '13,1,27,29,14,28,16,15,2');
INSERT INTO `t_user_filter_result` VALUES (176, 22, '26,21,22,27,28,24,23,25,20');
INSERT INTO `t_user_filter_result` VALUES (177, 23, '22,15,19,17,20,21,16,18');
INSERT INTO `t_user_filter_result` VALUES (178, 24, '1,14,17,13,3,2,16,4,18,19');
INSERT INTO `t_user_filter_result` VALUES (179, 25, '21,17,7,13,3,14,8,10,6,9');
INSERT INTO `t_user_filter_result` VALUES (180, 26, '27,13,4,15,14,28,1,2,3,26');
INSERT INTO `t_user_filter_result` VALUES (181, 27, '27,13,1,29,4,14,28,16,15,2');
INSERT INTO `t_user_filter_result` VALUES (182, 28, '27,28,29,1,26,25,22,23,24');
INSERT INTO `t_user_filter_result` VALUES (183, 29, '14,17,13,28,27,16,26,24,19,2');
INSERT INTO `t_user_filter_result` VALUES (184, 30, '21,24,5,7,22,8,6,23,10,4');
INSERT INTO `t_user_filter_result` VALUES (185, 31, '17,20,22,21,18,19');

SET FOREIGN_KEY_CHECKS = 1;
