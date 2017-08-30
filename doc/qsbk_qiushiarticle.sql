/*
Navicat MySQL Data Transfer

Source Server         : liuyc
Source Server Version : 50625
Source Host           : localhost:3306
Source Database       : onlinenotes

Target Server Type    : MYSQL
Target Server Version : 50625
File Encoding         : 65001

Date: 2017-08-30 21:44:07
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for qsbk_qiushiarticle
-- ----------------------------
DROP TABLE IF EXISTS `qsbk_qiushiarticle`;
CREATE TABLE `qsbk_qiushiarticle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author` varchar(200) NOT NULL,
  `content` longtext NOT NULL,
  `image` varchar(100) NOT NULL,
  `crawl_time` datetime(6) NOT NULL,
  `url` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=147 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qsbk_qiushiarticle
-- ----------------------------
INSERT INTO `qsbk_qiushiarticle` VALUES ('112', '狂妄.', '\n\n你说不能停就不能停，我会很没有面子的\n\n', 'full/f41eba815db457e7d1b4860b75bc5654ba7de348.jpg', '2017-08-30 21:29:18.004756', 'https://www.qiushibaike.com/article/117604280');
INSERT INTO `qsbk_qiushiarticle` VALUES ('113', '只好如此', '\n\n别摸了，这一切是真的发生了！\n\n', 'full/9d5c437787fad89e4acfab9664e80858d018355e.jpg', '2017-08-30 21:29:37.948872', 'https://www.qiushibaike.com/article/119488048');
INSERT INTO `qsbk_qiushiarticle` VALUES ('114', '不，良，人', '\n\n这名字，真邪性！！！\n\n', 'full/b05e0065c0f736233c571ee25de1da9f590f4f21.jpg', '2017-08-30 21:29:41.401955', 'https://www.qiushibaike.com/article/119488347');
INSERT INTO `qsbk_qiushiarticle` VALUES ('115', '洗尽铅华的心', '\n\n小兔崽子，你的对象是充气的吗？？？\n\n', 'full/fde05f25e98878a0062e9b5e7c9bd50cb6113e82.jpg', '2017-08-30 21:29:48.958039', 'https://www.qiushibaike.com/article/119488396');
INSERT INTO `qsbk_qiushiarticle` VALUES ('116', '刘小磊..', '\n\n不是不想长大。是不想你们慢慢老去。-致-妈妈爸爸\n\n', 'full/64f8627113bbc658fc5f1df50de62e66247e5833.jpg', '2017-08-30 21:29:59.671906', 'https://www.qiushibaike.com/article/117602963');
INSERT INTO `qsbk_qiushiarticle` VALUES ('117', '撸上你的床', '\n\n负债不到100万，你呢\n\n', 'full/c44b967342cb04661220cd61b421b67fe214b365.jpg', '2017-08-30 21:30:12.774630', 'https://www.qiushibaike.com/article/119451449');
INSERT INTO `qsbk_qiushiarticle` VALUES ('118', '杀上派出所', '\n\n哈哈哈哈哈哈哈哈哈\n\n', 'full/9f0ab619166353388125457f63621a36b3f07e33.jpg', '2017-08-30 21:30:46.108774', 'https://www.qiushibaike.com/article/118879062');
INSERT INTO `qsbk_qiushiarticle` VALUES ('119', '饮最烈的酒、艹最爱的人', '\n\n07.14\n\n', 'full/0195728a3d4560f95bbe690895681aebeb23020c.jpg', '2017-08-30 21:30:56.890501', 'https://www.qiushibaike.com/article/118547685');
INSERT INTO `qsbk_qiushiarticle` VALUES ('120', '小耳兔子', '\n\n我觉得这是爱情\n\n', 'full/3395ecd3f80c5f4b23cbfc7d30dda5df55bbab73.jpg', '2017-08-30 21:31:18.070062', 'https://www.qiushibaike.com/article/118610245');
INSERT INTO `qsbk_qiushiarticle` VALUES ('121', '哇噻福清人耶', '\n\n毁童年啊。\n\n', 'full/8c62f92d75eb23b643191febdbacada46ba87329.jpg', '2017-08-30 21:31:39.577150', 'https://www.qiushibaike.com/article/119426632');
INSERT INTO `qsbk_qiushiarticle` VALUES ('122', '搁浅凯迪', '\n\n和老公结婚8年了，现在天天吵架，好烦啊！已婚的人士和我一样吗？\n\n', 'full/9a4c965639a94ec6dbf30236f0aaf903d2fc264a.jpg', '2017-08-30 21:31:55.863511', 'https://www.qiushibaike.com/article/119440712');
INSERT INTO `qsbk_qiushiarticle` VALUES ('123', '財大器粗！', '\n\n高手在民间，汽车大灯不亮，审车过不去，千万别听修理厂的换总成，找个小厂子把泡沫打进去，用压缩空气一吹就好了，人才呀，长知识了\n\n', 'full/7809c64a17d7634949c9efe8f789ee0632e44765.jpg', '2017-08-30 21:32:00.202798', 'https://www.qiushibaike.com/article/118796230');
INSERT INTO `qsbk_qiushiarticle` VALUES ('124', '此处省约一万字', '\n\n这个可以有\n\n', 'full/0fb785341b5708dc8c8b28e554ca8e7930f6a96f.jpg', '2017-08-30 21:32:06.499078', 'https://www.qiushibaike.com/article/118720720');
INSERT INTO `qsbk_qiushiarticle` VALUES ('125', '支云', '\n\n看到这个图～想起了小学时一个小伙伴给我讲的：他割草时在水泥沟渠上看到两个狗狗在沟里连着屁股～他手贱用剪刀勾下去提了一下……那两个狗狗惨叫着就“东奔西跑”了～～～～～～好可怜的狗狗，——公狗必死～母狗不知道会怎么样……', 'full/dc1431001baef085dd549eafc291cc5bdabf5921.jpg', '2017-08-30 21:32:25.008490', 'https://www.qiushibaike.com/article/118511849');
INSERT INTO `qsbk_qiushiarticle` VALUES ('126', '遍体鳞伤够不够帅', '\n\n自从黄鳝火了以后，看到古装剧里的公公跟妃子们说，该用膳了，我就他妈邪恶了…………\n\n', 'full/b9e559ab038713d1a09157bfbe97315e20dea962.jpg', '2017-08-30 21:32:45.707477', 'https://www.qiushibaike.com/article/118785233');
INSERT INTO `qsbk_qiushiarticle` VALUES ('127', '喝不起，稀饭', '\n\n阵阵微风袭来，透露着一股决战的气息！\n\n', 'full/69834c00b07dbbdce0ab118f2d41992011d58f3b.jpg', '2017-08-30 21:32:48.374311', 'https://www.qiushibaike.com/article/118683076');
INSERT INTO `qsbk_qiushiarticle` VALUES ('128', '断东河吴', '\n\n你敢给笑脸，我就敢做。   来吧大佬们。能破千最好了。\n\n', 'full/67c519fc51d34f4e1a303c049a87d385d0da0425.jpg', '2017-08-30 21:32:54.162625', 'https://www.qiushibaike.com/article/119338717');
INSERT INTO `qsbk_qiushiarticle` VALUES ('129', '呵呵呵一气呵成', '\n\n这就尴尬了，娃儿爹出差三个多月，这几天就要到家了\n\n', 'full/01456997f44da6874823fd826863d32b1eb2e64b.jpg', '2017-08-30 21:33:13.981489', 'https://www.qiushibaike.com/article/119455113');
INSERT INTO `qsbk_qiushiarticle` VALUES ('130', '爱拼才会赢lalala', '\n\n差不多。。\n\n', 'full/281d641f13b48f3cb998ebfc8a5347c6cf5254b3.jpg', '2017-08-30 21:33:28.913660', 'https://www.qiushibaike.com/article/119455472');
INSERT INTO `qsbk_qiushiarticle` VALUES ('131', '双子男子', '\n\n看看有没有你家宝\n\n', 'full/c8d084511dd21fe1baeb2f121fbe023361f2f5eb.jpg', '2017-08-30 21:33:32.869465', 'https://www.qiushibaike.com/article/119462754');
INSERT INTO `qsbk_qiushiarticle` VALUES ('132', '氷藍', '\n\n我还能说什么，嗯哼\n\n', 'full/3fdbdc37b303f7e54008699a3dfe694359974c9a.jpg', '2017-08-30 21:33:36.847525', 'https://www.qiushibaike.com/article/118459113');
INSERT INTO `qsbk_qiushiarticle` VALUES ('133', '小鸡！炖木耳', '\n\nA是地主。地主先出。高手来。\n\n', 'full/48be887184535dcb5317b7bcff73c2a8509ac148.jpg', '2017-08-30 21:33:38.638596', 'https://www.qiushibaike.com/article/118802356');
INSERT INTO `qsbk_qiushiarticle` VALUES ('134', '人称老中医', '\n\n现在心情真实写照\n\n', 'full/1e95e2cd8f73356b5c35954654e6d0e19fbdd61d.jpg', '2017-08-30 21:34:08.689529', 'https://www.qiushibaike.com/article/118956671');
INSERT INTO `qsbk_qiushiarticle` VALUES ('135', '嗨不完夜纵不完情', '\n\n男人理想的身材\n\n', 'full/b4fab7328c7eaa604295b2c161c13e97c4846299.jpg', '2017-08-30 21:34:13.251499', 'https://www.qiushibaike.com/article/118850491');
INSERT INTO `qsbk_qiushiarticle` VALUES ('136', '我姓梁我伈凉', '\n\n真正的吃货。\n\n', 'full/b8c530f1b83e8afb66569700d97cceadabbd8ffd.jpg', '2017-08-30 21:34:20.424440', 'https://www.qiushibaike.com/article/118632153');
INSERT INTO `qsbk_qiushiarticle` VALUES ('137', '哋獄lǐの曼陀罗', '\n\n[捂脸][捂脸]\n\n', 'full/409fd37c52ed865a92fecee0b5e393a9fb7052d4.jpg', '2017-08-30 21:34:23.656751', 'https://www.qiushibaike.com/article/119433448');
INSERT INTO `qsbk_qiushiarticle` VALUES ('138', '林晓九', '\n\n他们说这是祭祖！我觉得是要炸坟呀～\n\n', 'full/4c67569d5e685d8d6ed5ce860f549e16559efbf5.jpg', '2017-08-30 21:34:28.054679', 'https://www.qiushibaike.com/article/118502453');
INSERT INTO `qsbk_qiushiarticle` VALUES ('139', '数度春秋', '\n\n先别看评论，直接写出答案，统计统计多少人数学是厨子教的\n\n', 'full/d2d56a32749923239d5cbca3ca6d2d142bde45d5.jpg', '2017-08-30 21:35:05.232416', 'https://www.qiushibaike.com/article/119368800');
INSERT INTO `qsbk_qiushiarticle` VALUES ('140', '小气球球', '\n\n送给自制力比较差的少男少女们！\n\n', 'full/29b2c9392be2a1c4dd4ac4f9fff45d3c91949129.jpg', '2017-08-30 21:35:35.828464', 'https://www.qiushibaike.com/article/118611305');
INSERT INTO `qsbk_qiushiarticle` VALUES ('141', '風輕雲淡-', '\n\n我已泪奔、\n\n', 'full/78c9f46eb9c7c0405ff64512d1e8aa3bf773d5f6.jpg', '2017-08-30 21:35:47.479444', 'https://www.qiushibaike.com/article/118735711');
INSERT INTO `qsbk_qiushiarticle` VALUES ('142', '爆你菊的好姑凉i', '\n\n老爸和老妈的差距\n\n', 'full/b68c61574c8056b6d7f78038bbb78ac854f7266e.jpg', '2017-08-30 21:35:54.842194', 'https://www.qiushibaike.com/article/118564646');
INSERT INTO `qsbk_qiushiarticle` VALUES ('143', '商河糗友', '\n\n七画是“男”', 'full/46a98a342aa4d6c33641391a4686f59a4cf34bd5.jpg', '2017-08-30 21:36:26.132474', 'https://www.qiushibaike.com/article/118876218');
INSERT INTO `qsbk_qiushiarticle` VALUES ('144', '狼若回头必有缘由', '\n\n没毛病………\n\n', 'full/9a9089b3e4e950142f2236fc102c642b3d8d449a.jpg', '2017-08-30 21:36:41.254901', 'https://www.qiushibaike.com/article/118711309');
INSERT INTO `qsbk_qiushiarticle` VALUES ('145', '污撸摸骑代言人', '\n\n千万不能这样做\n\n', 'full/959717004a19595b8b51231bc93b5ec242502c9d.jpg', '2017-08-30 21:36:44.460218', 'https://www.qiushibaike.com/article/118992088');
INSERT INTO `qsbk_qiushiarticle` VALUES ('146', '木棉花宝宝', '\n\n马上要生宝宝了双胞胎，老公姓李，本人姓孔，都是男孩，糗百人才多，求名字\n\n', 'full/142e0d4303193d46a088f9b113c52f944cc95df2.jpg', '2017-08-30 21:36:48.439396', 'https://www.qiushibaike.com/article/118922875');
