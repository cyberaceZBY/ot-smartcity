SET FOREIGN_KEY_CHECKS = 0;

INSERT INTO `category` (`id`, `name`, `title`, `pid`, `sort`, `list_row`, `meta_title`, `keywords`, `description`, `template_index`, `template_lists`, `template_detail`, `template_edit`, `model`, `type`, `link_id`, `allow_publish`, `display`, `reply`, `check`, `reply_model`, `extend`, `create_time`, `update_time`, `status`, `icon`)
VALUES
	(110, 'announcement', '通知公告', 300, 2, 10, '', '', '', '', '', '', '', '1200', '3', 0, 1, 1, 1, 0, '', '', 1439023485, 1440484346, 1, 0),
	(120, 'partner', '合作伙伴', 100, 2, 10, '', '', '', '', '', '', '', '1400', '3', 0, 1, 1, 1, 0, '', '', 1420612735, 1420612765, 1, 0),
	(130, 'slide', '幻灯片', 100, 3, 10, '', '', '', '', '', '', '', '1100', '3', 0, 1, 1, 1, 0, '', '', 1420612735, 1420612765, 1, 0),
	(100, 'index', '首页', 0, 0, 10, '', '', '', '', '', '', '', '', '1', 0, 0, 1, 1, 0, '', '', 1420439663, 1420439663, 1, 0),
	(200, 'survey', '中心概况', 0, 1, 10, '', '', '', '', '', '', '', '1200', '1', 0, 1, 1, 1, 0, '', '', 1420612697, 1420612808, 1, 0),
	(300, 'news', '新闻动态', 0, 3, 10, '', '', '', '', '', '', '', '', '1', 0, 0, 1, 1, 0, '', '', 1420439663, 1420439663, 1, 0),
	(310, 'our_news', '中心动态', 300, 1, 10, '', '', '', '', '', '', '', '1200', '1', 0, 1, 1, 1, 0, '', '', 1420612697, 1420612808, 1, 0),
	(320, 'field_news', '行业资讯', 300, 3, 10, '', '', '', '', '', '', '', '1200', '1', 0, 1, 1, 1, 0, '', '', 1420612697, 1440484359, 1, 0),
	(400, 'creative', '创新研究', 0, 4, 10, '', '', '', '', '', '', '', '1200', '1', 0, 1, 1, 1, 0, '', '', 1420612697, 1420612808, 1, 0),
	(410, 'findings', '科研成果', 400, 3, 10, '', '', '', '', '', '', '', '1200', '1', 0, 1, 1, 1, 0, '', '', 1420612697, 1420612808, 1, 0),
	(500, 'team', '师资团队', 0, 5, 10, '', '', '', '', '', '', '', '', '1', 0, 0, 1, 1, 0, '', '', 1420612697, 1420612808, 1, 0),
	(510, 'research_team', '研究队伍', 500, 1, 10, '', '', '', '', '', '', '', '1300', '1', 0, 1, 1, 1, 0, '', '', 1420612697, 1420612808, 1, 0),
	(520, 'visitor', '访问学者', 500, 2, 10, '', '', '', '', '', '', '', '1300', '1', 0, 1, 1, 1, 0, '', '', 1420612697, 1420612808, 1, 0),
	(600, 'training', '人才培养', 0, 6, 10, '', '', '', '', '', '', '', '1200', '1', 0, 1, 1, 1, 0, '', '', 1420612697, 1420612808, 1, 0),
	(700, 'cooperate', '合作交流', 0, 7, 10, '', '', '', '', '', '', '', '1200', '1', 0, 1, 1, 1, 0, '', '', 1420612697, 1420612808, 1, 0),
	(800, 'join_us', '加入我们', 0, 8, 10, '', '', '', '', '', '', '', '1200', '1', 0, 1, 1, 1, 0, '', '', 1420612697, 1420612808, 1, 0);

--
-- 首页幻灯片模型
--
DROP TABLE IF EXISTS `slide`;
CREATE TABLE `slide` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `image` int(10) unsigned NOT NULL COMMENT '图片',
  `level` int(10) unsigned NOT NULL COMMENT '排序',
  `description` text NOT NULL COMMENT '描述',
  `link` varchar(255) NOT NULL COMMENT '链接',
  `position` char(50) NOT NULL DEFAULT 'left' COMMENT '内容位置',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

INSERT INTO `model` VALUES (1100,'slide','幻灯片',0,'',1,'{\"1\":[\"1101\",\"1102\",\"1103\",\"1104\",\"1105\",\"1106\"]}','1:基础','','','','','id:编号\r\ntitle:标题\r\nimage:图片\r\ndescription:描述\r\nlink:链接\r\nlevel:排序',10,'','',1420438352,1424018624,1,'MyISAM');

INSERT INTO `attribute` VALUES
  (1101,'title','标题','varchar(255) NOT NULL','string','','',1,'',1100,1,1,1420438379,1420438379,'',3,'','regex','',3,'function'),
  (1102,'image','图片','int(10) UNSIGNED NOT NULL','picture','','请上传1100x500像素的图片',1,'',1100,1,1,1420458191,1420458191,'',3,'','regex','',3,'function'),
  (1103,'description','描述','text NOT NULL','textarea','','',1,'',1100,1,1,1424018241,1424018241,'',3,'','regex','',3,'function'),
  (1104,'link','链接','varchar(255) NOT NULL','string','','',1,'',1100,1,1,1424018350,1424018350,'',3,'','regex','',3,'function'),
  (1105,'position','内容位置','char(50) NOT NULL','select','left','',1,'left:左\r\ncenter:中\r\nright:右',1100,1,1,1424018531,1424018531,'',3,'','regex','',3,'function'),
  (1106,'level','排序','int(10) UNSIGNED NOT NULL','num','0','',1,'',1100,0,1,1420612173,1420612173,'',3,'','regex','',3,'function');

--
-- 成员模型
--
DROP TABLE IF EXISTS `people`;
CREATE TABLE `people` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) NOT NULL COMMENT '用户名字',
  `school` varchar(255) NOT NULL COMMENT '单位',
  `job` varchar(255) NOT NULL COMMENT '职称',
  `image` int(10) unsigned NOT NULL COMMENT '图片',
  `level` int(10) unsigned NOT NULL COMMENT '排序',
  `description` text NOT NULL COMMENT '描述',
  `category_id` int(10) unsigned NOT NULL COMMENT '所属分类',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

INSERT INTO `model` VALUES (1300,'people','团队成员',0,'',1,'{\"1\":[\"1301\",\"1306\",\"1302\",\"1303\",\"1304\",\"1305\"]}','1:基础','','','','','id:编号\r\nname:用户名字\r\nschool:单位\r\njob:职称\r\nimage:图片\r\ndescription:描述\r\nlevel:排序',10,'','',1420438352,1424018624,1,'MyISAM');

INSERT INTO `attribute` VALUES
  (1301,'name','用户名字','varchar(255) NOT NULL','string','','',1,'',1300,1,1,1420438379,1420438379,'',3,'','regex','',3,'function'),
  (1306,'school','单位','varchar(255) NOT NULL','string','','',1,'',1300,1,1,1420438379,1420438379,'',3,'','regex','',3,'function'),
  (1302,'job','职业','varchar(255) NOT NULL','string','','',1,'',1300,1,1,1420438379,1420438379,'',3,'','regex','',3,'function'),
  (1303,'image','图片','int(10) UNSIGNED NOT NULL','picture','','请上传200x200像素以上的图片',1,'',1300,1,1,1420458191,1420458191,'',3,'','regex','',3,'function'),
  (1304,'description','描述','text NOT NULL','editor','','',1,'',1300,1,1,1424018241,1424018241,'',3,'','regex','',3,'function'),
  (1305,'level','排序','int(10) UNSIGNED NOT NULL','num','0','',1,'',1300,0,1,1420612173,1420612173,'',3,'','regex','',3,'function');

--
-- 首页友情链接模型
--
DROP TABLE IF EXISTS `partner`;
CREATE TABLE `partner` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) NOT NULL COMMENT '名字',
  `link` varchar(255) NOT NULL COMMENT '订购链接',
  `level` int(10) unsigned NOT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

INSERT INTO `model` VALUES (1400,'partner','友情链接',0,'',1,'{\"1\":[\"1401\",\"1402\",\"1403\",\"1404\"]}','1:基础','','','','','id:编号\r\nname:名字\r\nlink:链接\r\nlevel:排序',10,'','',1420438352,1424018624,1,'MyISAM');

INSERT INTO `attribute` VALUES
  (1401,'name','名字','varchar(255) NOT NULL','string','','',1,'',1400,1,1,1420438379,1420438379,'',3,'','regex','',3,'function'),
  (1403,'link','链接','varchar(255)','string','','',1,'',1400,1,1,1424018241,1424018241,'',3,'','regex','',3,'function'),
  (1404,'level','排序','int(10) UNSIGNED NOT NULL','num','0','',1,'',1400,0,1,1420612173,1420612173,'',3,'','regex','',3,'function');

--
-- 新闻模型
--
DROP TABLE IF EXISTS `document_news`;
CREATE TABLE `document_news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `content` text NOT NULL COMMENT '内容',
  `relation` text NOT NULL COMMENT '相关新闻',
--   `index_type` text NOT NULL COMMENT '新闻分类',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

INSERT INTO `model` VALUES (1200,'news','新闻',1,'',1,'{"1":["3","5","1201","19","1202"],"2":["2","9","10","11","14","12","17","13","20","16"]}','1:基础,2:扩展','','','','','id:编号\r\ntitle:标题:/Home/News/detail/id/[id].html',10,'','',1420439221,1420439621,1,'MyISAM');

INSERT INTO `attribute` VALUES
  (1201,'content','内容','text NOT NULL','editor','','',1,'',1200,1,1,1420439409,1420439409,'',3,'','regex','',3,'function'),
  (1202,'relation','相关新闻','text NOT NULL','string','','',1,'',1200,0,1,1420612173,1420612173,'',3,'','regex','',3,'function');
--   (1203, 'index_type', '新闻分类', 'char(10) NOT NULL', 'radio', '', '', 1, '中心概况;中心动态;行业资讯;创新研究;师资团队;人才培养;合作交流;加入我们', 1200, 1, 1, 1431405289, 1431405289, '', 3, '', 'regex', '', 3, 'function');

--
-- 媒体报道
--
-- DROP TABLE IF EXISTS `report`;
-- CREATE TABLE `report` (
--   `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
--   `title` varchar(255) NOT NULL COMMENT '标题',
--   `link` varchar(255) NOT NULL COMMENT '链接',
--   `time` varchar(255) NOT NULL COMMENT '发布时间',
--   `level` int(10) unsigned NOT NULL COMMENT '排序',
--   PRIMARY KEY (`id`)
-- ) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
--
-- INSERT INTO `model` (`id`, `name`, `title`, `extend`, `relation`, `need_pk`, `field_sort`, `field_group`, `attribute_list`, `template_list`, `template_add`, `template_edit`, `list_grid`, `list_row`, `search_key`, `search_list`, `create_time`, `update_time`, `status`, `engine_type`)
-- VALUES
-- 	(5001, 'report', '媒体报道', 0, '', 1, '{\"1\":[\"5011\",\"5012\",\"5013\",\"5014\"]}', '1:基础', '', '', '', '', 'id:编号\r\ntitle:标题\r\nlink:链接\r\ntime:发布时间\r\nlevel:排序', 10, '', '', 1431420466, 1431420466, 1, 'MyISAM');
--
-- INSERT INTO `attribute` (`id`, `name`, `title`, `field`, `type`, `value`, `remark`, `is_show`, `extra`, `model_id`, `is_must`, `status`, `update_time`, `create_time`, `validate_rule`, `validate_time`, `error_info`, `validate_type`, `auto_rule`, `auto_time`, `auto_type`)
-- VALUES
-- 	(5011, 'title', '标题', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 5001, 1, 1, 1431420537, 1431420537, '', 3, '', 'regex', '', 3, 'function'),
-- 	(5012, 'link', '链接', 'varchar(255) NOT NULL','string', '0', '', 1, '', 5001, 1, 1, 1431420572, 1431420572, '', 3, '', 'regex', '', 3, 'function'),
-- 	(5013, 'level', '排序', 'int(10) UNSIGNED NOT NULL','num', '', '', 1, '', 5001, 1, 1, 1431420537, 1431420537, '', 3, '', 'regex', '', 3, 'function'),
-- 	(5014,'time','发布时间','varchar(255) NOT NULL','string','','',1,'',5001,1,1,1422854249,1422854249,'',3,'','regex','',3,'function');


-- -- 产品种类模型
-- --
-- DROP TABLE IF EXISTS `type`;
-- CREATE TABLE `type` (
--   `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
--   `name` varchar(255) NOT NULL COMMENT '种类名称',
--   `image` int(10) unsigned NOT NULL COMMENT '种类图片',
--   `level` int(10) unsigned NOT NULL COMMENT '排序',
--   `type_id` bigint unsigned not null comment '类别',
--   `intro` text NOT NULL COMMENT '简介',
--   PRIMARY KEY (`id`)
-- ) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
--
--
-- INSERT INTO `model` VALUES (2100,'type','产品类别',0,'',1,'{\"1\":[\"2101\",\"2102\",\"2103\",\"2104\"]}','1:基础','','','','','id:编号\r\nname:种类名称\r\nimage:种类图片\r\nlevel:排序',10,'','',1420611947,1420612279,1,'MyISAM');
--
-- INSERT INTO `attribute` VALUES
--   (2104,'name','名称','varchar(255) NOT NULL','string','','',1,'',2100,1,1,1420612006,1420611988,'',3,'','regex','',3,'function'),
--   (2102,'image','图片','int(10) UNSIGNED NOT NULL','picture','','请上传160x120像素的图片',1,'',2100,1,1,1420612051,1420612051,'',3,'','regex','',3,'function'),
--   (2103,'level','排序','int(10) UNSIGNED NOT NULL','num','0','',1,'',2100,0,1,1420612173,1420612173,'',3,'','regex','',3,'function'),
--   (2101,'type_id','类别','bigint UNSIGNED NOT NULL','num','0','',1,'',2100,0,1,1420612173,1420612173,'',3,'','regex','',3,'function'),
--   (2105,'intro','简介','text NOT NULL','textarea','','',1,'',2100,1,1,1420612006,1420611988,'',3,'','regex','',3,'function');
  
-- --
-- -- 首页推荐模型
-- --
-- DROP TABLE IF EXISTS `recommend`;
-- CREATE TABLE `recommend` (
--   `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
--   `title` varchar(255) NOT NULL COMMENT '种类名称',
--   `image` int(10) unsigned NOT NULL COMMENT '推荐图片',
--   `link` varchar(255) NOT NULL COMMENT '链接',
--   `level` int(10) unsigned NOT NULL COMMENT '排序',
--   `intro` text NOT NULL COMMENT '简介',
--   PRIMARY KEY (`id`)
-- ) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
--
--
-- INSERT INTO `model` VALUES (2400,'recommend','首页推荐',0,'',1,'{\"1\":[\"2101\",\"2102\",\"2103\",\"2104\"]}','1:基础','','','','','id:编号\r\ntitle:名称\r\nimage:图片\r\nlink:链接\r\nlevel:排序',10,'','',1420611947,1420612279,1,'MyISAM');
--
-- INSERT INTO `attribute` VALUES
--   (2401,'title','名称','varchar(255) NOT NULL','string','','',1,'',2400,1,1,1420612006,1420611988,'',3,'','regex','',3,'function'),
--   (2402,'image','图片','int(10) UNSIGNED NOT NULL','picture','','请上传350x284像素的图片',1,'',2400,1,1,1420612051,1420612051,'',3,'','regex','',3,'function'),
--   (2403, 'link', '链接', 'varchar(255) NOT NULL','string', '0', '', 1, '', 2400, 0, 1, 1431420572, 1431420572, '', 3, '', 'regex', '', 3, 'function'),
--   (2404,'level','排序','int(10) UNSIGNED NOT NULL','num','0','',1,'',2400,0,1,1420612173,1420612173,'',3,'','regex','',3,'function');
-- --   (2405,'intro','简介','text NOT NULL','textarea','','',1,'',2400,1,1,1420612006,1420611988,'',3,'','regex','',3,'function');


-- --
-- -- 关于我们模型
-- --
-- DROP TABLE IF EXISTS `aboutus`;
-- CREATE TABLE `aboutus` (
--   `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
--   `sub_title` varchar(255) NOT NULL COMMENT '子标题',
--   `content` text NOT NULL COMMENT '内容',
--   `level` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
--   PRIMARY KEY (`id`)
-- ) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
--
-- INSERT INTO `model` (`id`, `name`, `title`, `extend`, `relation`, `need_pk`, `field_sort`, `field_group`, `attribute_list`, `template_list`, `template_add`, `template_edit`, `list_grid`, `list_row`, `search_key`, `search_list`, `create_time`, `update_time`, `status`, `engine_type`)
-- VALUES
-- 	(5002, 'aboutus', '关于硬糖', 0, '', 1, '{\"1\":[\"5015\",\"5016\",\"5017\"]}', '1:基础', '', '', '', '', 'id:编号\r\nsub_title:子标题\r\ncontent:内容\r\nlevel:排序', 10, '', '', 1431508616, 1431508616, 1, 'MyISAM');
--
-- INSERT INTO `attribute` (`id`, `name`, `title`, `field`, `type`, `value`, `remark`, `is_show`, `extra`, `model_id`, `is_must`, `status`, `update_time`, `create_time`, `validate_rule`, `validate_time`, `error_info`, `validate_type`, `auto_rule`, `auto_time`, `auto_type`)
-- VALUES
-- 	(5015, 'sub_title', '子标题', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 5002, 1, 1, 1431508663, 1431508663, '', 3, '', 'regex', '', 3, 'function'),
-- 	(5016, 'content', '内容', 'text NOT NULL', 'editor', '', '', 1, '', 5002, 0, 1, 1431508716, 1431508716, '', 3, '', 'regex', '', 3, 'function'),
-- 	(5017, 'level', '排序', 'int(10) UNSIGNED NOT NULL', 'num', '0', '', 1, '', 5002, 0, 1, 1431508752, 1431508752, '', 3, '', 'regex', '', 3, 'function');


