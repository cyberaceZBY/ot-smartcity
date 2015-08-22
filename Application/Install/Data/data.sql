SET FOREIGN_KEY_CHECKS = 0;

DELETE FROM `document` WHERE `id` != 0;
DELETE FROM `category` WHERE `id` IN (1,2);
DROP TABLE IF EXISTS `document_download`;
DROP TABLE IF EXISTS `document_article`;
DELETE FROM `model` WHERE `id` IN (2,3);


INSERT INTO `slide` (`id`,`title`,`image`,`level`,`description`,`link`,`position`) VALUES
  (1,'inPlug硬糖无线Wifi智能家居插座手机远程控制定时开关',1001,0,'inPlug硬糖无线Wifi智能家居插座手机远程控制定时开关','','center'),
  (2,'inPlug硬糖无线Wifi智能家居插座手机远程控制定时开关',1002,0,'inPlug硬糖无线Wifi智能家居插座手机远程控制定时开关','','center');

INSERT INTO `picture` (`id`,`path`,`url`,`md5`,`sha1`,`status`,`create_time`) VALUES (1001,'/Public/static/imgdata/index-slide-1.png','','4cc1093cbf82719cd991a0d17aed1a01','a8693ae0c9a21a44ecec1885b22d0e9dfa9ebc4f',1,1420708500);
INSERT INTO `picture` (`id`,`path`,`url`,`md5`,`sha1`,`status`,`create_time`) VALUES (1002,'/Public/static/imgdata/index-slide-1.png','','59ec7cfebcb58b3b04b4f771b04d8a16','2835f8a17e66fe9124dc582bba063226d290184b',1,1420708529);
-- INSERT INTO `picture` (`id`,`path`,`url`,`md5`,`sha1`,`status`,`create_time`) VALUES (1003,'/Public/static/imgdata/index-slide-3.jpg','','3c52c3b4c1a495886efa5e0f7407edd6','02285e269f9b5e66362a295c17b6a618e61aaeeb',1,1420708549);

INSERT INTO `partner` (`id`,`name`,`image`,`level`,`link`) VALUES
  (1,'中国民生银行',1301,1,'http://www.cmbc.com.cn'),
  (2,'亚马逊（中国）',1302,1,'http://www.amazon.cn/'),
  (3,'美的',1303,1,'http://www.midea.com.cn/'),
  (4,'苏宁易购',1304,1,'http://www.suning.com');

INSERT INTO `picture` (`id`,`path`,`url`,`md5`,`sha1`,`status`,`create_time`) VALUES
(1301,'/Public/static/imgdata/partner-1.jpg','','4cc1093cbf82719cd991a0d17aed1a01','a8693ae0c9a21a44ecec1885b22d0e9dfa9ebc4f',1,1420708500),
(1302,'/Public/static/imgdata/partner-2.jpg','','4cc1093cbf82719cd991a0d17aed1a01','a8693ae0c9a21a44ecec1885b22d0e9dfa9ebc4f',1,1420708500),
(1303,'/Public/static/imgdata/partner-3.jpg','','4cc1093cbf82719cd991a0d17aed1a01','a8693ae0c9a21a44ecec1885b22d0e9dfa9ebc4f',1,1420708500),
(1304,'/Public/static/imgdata/partner-4.jpg','','4cc1093cbf82719cd991a0d17aed1a01','a8693ae0c9a21a44ecec1885b22d0e9dfa9ebc4f',1,1420708500);

INSERT INTO `recommend` (`id`, `title`, `image`, `link`, `level`, `intro`) VALUES (1, '智能系列', 2101, '', 1, '');
INSERT INTO `recommend` (`id`, `title`, `image`, `link`, `level`, `intro`) VALUES (2, '智能插座系列', 2102, '', 2, '');
INSERT INTO `recommend` (`id`, `title`, `image`, `link`, `level`, `intro`) VALUES (3, '智能Wifi', 2103, '', 3, '');

INSERT INTO `picture` (`id`,`path`,`url`,`md5`,`sha1`,`status`,`create_time`) VALUES (2101,'/Public/static/imgdata/type-1.jpg','','4cc1093cbf82719cd991a0d17aed1a01','a8693ae0c9a21a44ecec1885b22d0e9dfa9ebc4f',1,1420708500);
INSERT INTO `picture` (`id`,`path`,`url`,`md5`,`sha1`,`status`,`create_time`) VALUES (2102,'/Public/static/imgdata/type-2.jpg','','59ec7cfebcb58b3b04b4f771b04d8a16','2835f8a17e66fe9124dc582bba063226d290184b',1,1420708529);
INSERT INTO `picture` (`id`,`path`,`url`,`md5`,`sha1`,`status`,`create_time`) VALUES (2103,'/Public/static/imgdata/type-3.jpg','','3c52c3b4c1a495886efa5e0f7407edd6','02285e269f9b5e66362a295c17b6a618e61aaeeb',1,1420708549);

INSERT INTO `promotion` (`id`,`title`,`description`,`image`,`link`,`position`) VALUES (2,'关于硬糖2','关于硬糖2关于硬糖2，关于硬糖2关于硬糖2关于硬糖2。关于硬糖2，关于硬糖2关于硬糖2，关于硬糖2关于硬糖2\r\n',2302,'#','left');
INSERT INTO `promotion` (`id`,`title`,`description`,`image`,`link`,`position`) VALUES (3,'关于硬糖1','关于硬糖1关于硬糖1，关于硬糖1关于硬糖1关于硬糖1。关于硬糖1，关于硬糖1关于硬糖1，关于硬糖1关于硬糖1。\r\n',2303,'#','right');

INSERT INTO `picture` (`id`,`path`,`url`,`md5`,`sha1`,`status`,`create_time`) VALUES (2301,'/Public/static/imgdata/product-promo-1.png','','4cc1093cbf82719cd991a0d17aed1a01','a8693ae0c9a21a44ecec1885b22d0e9dfa9ebc4f',1,1420708500);
INSERT INTO `picture` (`id`,`path`,`url`,`md5`,`sha1`,`status`,`create_time`) VALUES (2302,'/Public/static/imgdata/product-promo-1.png','','59ec7cfebcb58b3b04b4f771b04d8a16','2835f8a17e66fe9124dc582bba063226d290184b',1,1420708529);
INSERT INTO `picture` (`id`,`path`,`url`,`md5`,`sha1`,`status`,`create_time`) VALUES (2303,'/Public/static/imgdata/product-promo-1.png','','3c52c3b4c1a495886efa5e0f7407edd6','02285e269f9b5e66362a295c17b6a618e61aaeeb',1,1420708549);

INSERT INTO `groups` (`id`,`name`,`level`,`group_id`) VALUES (2,'智能开关',2,274877925996);
INSERT INTO `groups` (`id`,`name`,`level`,`group_id`) VALUES (1,'智能插座',1,274877925988);

INSERT INTO `report` (`id`, `title`, `link`,`time`) VALUES (1, 'inPlug硬糖智能插座:全球最小的智能插座_网易数码', 'http://digi.163.com/14/0530/16/9TGPC9U50016686Q.html','2014/05/30');

INSERT INTO `document` (`id`, `uid`, `name`, `title`, `category_id`, `description`, `root`, `pid`, `model_id`, `type`, `position`, `link_id`, `cover_id`, `display`, `deadline`, `attach`, `view`, `comment`, `extend`, `level`, `create_time`, `update_time`, `status`)
VALUES
	(4, 1, '', '中心简介', 200, '', 0, 0, 1200, 2, 0, 0, 0, 1, 0, 0, 2, 0, 0, 1, 1438246860, 1438247292, 1),
	(6, 1, '', '发展战略', 200, '', 0, 0, 1200, 2, 0, 0, 0, 1, 0, 0, 1, 0, 0, 3, 1438247220, 1439021049, 1),
	(8, 1, '', '中心宗旨', 200, '', 0, 0, 1200, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 2, 1439021242, 1439021242, 1),
	(9, 1, '', '培育过程', 200, '', 0, 0, 1200, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 4, 1439021275, 1439021275, 1),
	(10, 1, '', '组织机构', 200, '', 0, 0, 1200, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 5, 1439021299, 1439021299, 1),
	(11, 1, '', '团队介绍', 200, '', 0, 0, 1200, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 6, 1439021312, 1439021312, 1),
	(12, 1, '', '中心环境', 200, '', 0, 0, 1200, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 7, 1439021331, 1439021331, 1),
	(13, 1, '', '研究领域', 400, '', 0, 0, 1200, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1439021589, 1439021589, 1),
	(14, 1, '', '科研平台', 400, '', 0, 0, 1200, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1439021606, 1439021606, 1),
	(15, 1, '', '科研成果', 400, '', 0, 0, 1200, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 2, 1439021580, 1439021636, 1);

INSERT INTO `document_news` (`id`, `content`, `relation`)
VALUES
	(4, '<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;color:#404040;font-family:SimSun, Helvetica, Tahoma, Arial, \'Hiragino Sans GB\', \'Hiragino Sans GB W3\', STXihei, STHeiti, \'Microsoft YaHei\', Heiti, SimSun, sans-serif;font-size:13px;line-height:normal;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"font-family:微软雅黑, 宋体;line-height:24px;color:#666666;font-size:16px;\">硬糖（inplug）是一家智能家居平台解决方案提供商，于2014年下半年获得美国高通公司的战略投资，其关键技术是利用软件定义网络的虚拟化技术，实现家庭网络的智能化综合管控。</span> \r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;color:#404040;font-family:SimSun, Helvetica, Tahoma, Arial, \'Hiragino Sans GB\', \'Hiragino Sans GB W3\', STXihei, STHeiti, \'Microsoft YaHei\', Heiti, SimSun, sans-serif;font-size:13px;line-height:normal;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"font-family:微软雅黑, 宋体;line-height:24px;color:#666666;font-size:14px;\"><br />\r\n</span> \r\n</p>\r\n<p style=\"margin-top:0px;margin-bottom:0px;padding:0px;color:#404040;font-family:SimSun, Helvetica, Tahoma, Arial, \'Hiragino Sans GB\', \'Hiragino Sans GB W3\', STXihei, STHeiti, \'Microsoft YaHei\', Heiti, SimSun, sans-serif;font-size:13px;line-height:normal;white-space:normal;background-color:#FFFFFF;\">\r\n	<span style=\"font-family:微软雅黑, 宋体;line-height:24px;color:#666666;font-size:16px;\">已推出系列智能家居单品包括智能插座</span><span style=\"font-family:微软雅黑, 宋体;line-height:24px;color:#666666;font-size:16px;\">、智能开关以及红外贴等。硬糖将于投资者及合作伙伴共同成长，致力于成为互联网时代最有价值的高新技术企业。</span><span style=\"font-family:微软雅黑, 宋体;line-height:23px;text-align:justify;color:#666666;font-size:16px;\">硬糖以业界领先的研发水平、优秀的产品品质及设计，在行业内获得了极高评价，先后获得了中国互联网协会颁发的“中国创造新动力”奖，创新中国优胜企业奖等，并获得了321国家科技领军人才项目资助，成为从中国制造到中国创造的代表性品牌。</span> \r\n</p>', ''),
	(6, '<h3 style=\"margin:14px 0px 0px;padding:0px;font-size:16px;color:#404040;font-family:微软雅黑;line-height:27.2000007629395px;white-space:normal;background-color:#FFFFFF;\">\r\n	[ 主要特性 ]\r\n</h3>\r\n<ol style=\"margin:0px;padding:0px 0px 0px 20px;color:#404040;font-family:微软雅黑;font-size:16px;line-height:27.2000007629395px;white-space:normal;background-color:#FFFFFF;\">\r\n	<li style=\"margin:0px;padding:0px;\">\r\n		基于ThinkPHP最新3.2版本。\r\n	</li>\r\n	<li style=\"margin:0px;padding:0px;\">\r\n		模块化：全新的架构和模块化的开发机制，便于灵活扩展和二次开发。\r\n	</li>\r\n	<li style=\"margin:0px;padding:0px;\">\r\n		文档模型/分类体系：通过和文档模型绑定，以及不同的文档类型，不同分类可以实现差异化的功能，轻松实现诸如资讯、下载、讨论和图片等功能。\r\n	</li>\r\n	<li style=\"margin:0px;padding:0px;\">\r\n		开源免费：OneThink遵循Apache2开源协议,免费提供使用。\r\n	</li>\r\n	<li style=\"margin:0px;padding:0px;\">\r\n		用户行为：支持自定义用户行为，可以对单个用户或者群体用户的行为进行记录及分享，为您的运营决策提供有效参考数据。\r\n	</li>\r\n	<li style=\"margin:0px;padding:0px;\">\r\n		云端部署：通过驱动的方式可以轻松支持平台的部署，让您的网站无缝迁移，内置已经支持SAE和BAE3.0。\r\n	</li>\r\n	<li style=\"margin:0px;padding:0px;\">\r\n		云服务支持：即将启动支持云存储、云安全、云过滤和云统计等服务，更多贴心的服务让您的网站更安心。\r\n	</li>\r\n	<li style=\"margin:0px;padding:0px;\">\r\n		安全稳健：提供稳健的安全策略，包括备份恢复、容错、防止恶意攻击登录，网页防篡改等多项安全管理功能，保证系统安全，可靠、稳定的运行。\r\n	</li>\r\n	<li style=\"margin:0px;padding:0px;\">\r\n		应用仓库：官方应用仓库拥有大量来自第三方插件和应用模块、模板主题，有众多来自开源社区的贡献，让您的网站“One”美无缺。\r\n	</li>\r\n</ol>', ''),
	(8, 'to do', ''),
	(9, 'to do', ''),
	(10, 'TODO', ''),
	(11, 'TODO', ''),
	(12, 'TODO', ''),
	(13, 'TODO', ''),
	(14, 'TODO', ''),
	(15, 'TODO', '');

INSERT INTO `aboutus` (`id`, `sub_title`, `content`, `level`)
VALUES
	(1, '关于我们', '<p>\r\n	<span style=\"font-family:微软雅黑, 宋体;line-height:21.6000003814697px;white-space:normal;color:#666666;font-size:16px;background-color:#FFFFFF;\">我们是一群热爱生活的年轻人。</span>\r\n</p>\r\n<p>\r\n	<span style=\"font-family:微软雅黑, 宋体;line-height:21.6000003814697px;white-space:normal;color:#666666;font-size:16px;background-color:#FFFFFF;\"><br />\r\n</span>\r\n</p>\r\n<p>\r\n	<span style=\"font-family:微软雅黑, 宋体;line-height:21.6000003814697px;white-space:normal;color:#666666;font-size:16px;background-color:#FFFFFF;\">名校和大公司的经历让我们更加懂得: 在这个世界上，牛人很多，聪明人也很多，只有怀抱一颗谦卑的心，脚踏实地才能做出真正的好产品。我们记得创业路上的每一次挑战，每一次日以继夜不眠不休地调试，每一个突如其来的坏消息，一次次把我们拉到谷底，又因为不气馁</span><span style=\"font-family:微软雅黑, 宋体;white-space:normal;font-size:16px;color:#666666;background-color:#FFFFFF;\">、</span><span style=\"font-family:微软雅黑, 宋体;line-height:21.6000003814697px;white-space:normal;color:#666666;font-size:16px;background-color:#FFFFFF;\">不言败而一次次成功地化险为夷。</span>\r\n</p>\r\n<p>\r\n	<span style=\"font-family:微软雅黑, 宋体;line-height:21.6000003814697px;white-space:normal;color:#666666;font-size:16px;background-color:#FFFFFF;\"><br />\r\n</span>\r\n</p>\r\n<p>\r\n	<span style=\"font-family:微软雅黑, 宋体;line-height:21.6000003814697px;white-space:normal;color:#666666;font-size:16px;background-color:#FFFFFF;\">在跌宕起伏的创业路上，我们变得越来越坚强，越来越坚定，也渐渐学会了一件事，只有张开翅膀，才能感觉到风的存在，只要行动起来，上帝都会来帮你。我们深深相信，一个好产品应该能够向这个世界表达最大的善意，因为我们怀着最大的耐心，完善每一个细节。</span>\r\n</p>\r\n<p>\r\n	<span style=\"font-family:微软雅黑, 宋体;line-height:21.6000003814697px;white-space:normal;color:#666666;font-size:16px;background-color:#FFFFFF;\"><br />\r\n</span>\r\n</p>\r\n<p>\r\n	<span style=\"font-family:微软雅黑, 宋体;line-height:21.6000003814697px;white-space:normal;color:#666666;font-size:16px;background-color:#FFFFFF;\">如果您能感受到我们的诚意，请支持我们，给我们力量！</span>\r\n</p>', 1),
	(2, '公司简介', '<p>\r\n	<span style=\"font-family:微软雅黑, 宋体;white-space:normal;line-height:24px;color:#666666;font-size:16px;background-color:#FFFFFF;\">硬糖（inplug）是一家智能家居平台解决方案提供商，于2014年下半年获得美国高通公司的战略投资，其关键技术是利用软件定义网络的虚拟化技术，实现家庭网络的智能化综合管控。</span> \r\n</p>\r\n<p>\r\n	<span style=\"font-family:微软雅黑, 宋体;white-space:normal;line-height:24px;color:#666666;font-size:14px;background-color:#FFFFFF;\"><br />\r\n</span> \r\n</p>\r\n<p>\r\n	<span style=\"font-family:微软雅黑, 宋体;white-space:normal;line-height:24px;color:#666666;font-size:16px;background-color:#FFFFFF;\">已推出系列智能家居单品包括智能插座</span><span style=\"font-family:微软雅黑, 宋体;white-space:normal;line-height:24px;color:#666666;font-size:16px;background-color:#FFFFFF;\">、智能开关以及红外贴等。硬糖将于投资者及合作伙伴共同成长，致力于成为互联网时代最有价值的高新技术企业。</span><span style=\"font-family:微软雅黑, 宋体;white-space:normal;line-height:23px;text-align:justify;color:#666666;font-size:16px;background-color:#FFFFFF;\">硬糖以业界领先的研发水平、优秀的产品品质及设计，在行业内获得了极高评价，先后获得了中国互联网协会颁发的“中国创造新动力”奖，创新中国优胜企业奖等，并获得了321国家科技领军人才项目资助，成为从中国制造到中国创造的代表性品牌。</span> \r\n</p>', 2);


INSERT INTO `partner` (`id`, `name`, `link`, `level`)
VALUES
	(4, '未来媒体网络协同创新中心', 'http://cmic.sjtu.edu.cn/CN/Default.aspx', 1);


-- INSERT INTO `store` (`id`, `name`, `address`, `phone`, `map`, `level`)
-- VALUES
-- 	(1, '北京', '北京市海淀区中关村东路财智国际大厦A座1106', '400-0432-580； 商务合作：010-82600353', '<iframe src=\'/Public/static/kindeditor/plugins/baidumap/index.html?center=116.340458%2C39.993727&zoom=19&width=450&height=320&markers=116.340458%2C39.993727&markerStyles=l%2CA\' frameborder=\'0\' style=\'width:452px;height:322px;\'></iframe>', 0);

INSERT INTO `picture` (`id`,`path`,`url`,`md5`,`sha1`,`status`,`create_time`) VALUES (4001,'/Public/static/imgdata/store-1.png','','4cc1093cbf82719cd991a0d17aed1a01','a8693ae0c9a21a44ecec1885b22d0e9dfa9ebc4f',1,1420708500);
-- INSERT INTO `picture` (`id`,`path`,`url`,`md5`,`sha1`,`status`,`create_time`) VALUES (4002,'/Public/static/imgdata/store-1.png','','4cc1093cbf82719cd991a0d17aed1a01','a8693ae0c9a21a44ecec1885b22d0e9dfa9ebc4f',1,1420708500);


--CHANGE--

INSERT INTO `custom` (`id`, `title`, `category`, `content`)
VALUES
	(1, '插座', '1', ''),
	(3, '更新工具下载', '0', ''),
	(4, 'App下载', '0', ''),
	(2, '开关', '1', '');
