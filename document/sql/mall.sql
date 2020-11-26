/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50719
Source Host           : localhost:3306
Source Database       : mall

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2020-02-26 10:34:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cms_help
-- ----------------------------
DROP TABLE IF EXISTS `cms_help`;
CREATE TABLE `cms_help` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) DEFAULT NULL,
  `icon` varchar(500) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `show_status` int(1) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `read_count` int(1) DEFAULT NULL,
  `content` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='帮助表';

-- ----------------------------
-- Records of cms_help
-- ----------------------------

-- ----------------------------
-- Table structure for cms_help_category
-- ----------------------------
DROP TABLE IF EXISTS `cms_help_category`;
CREATE TABLE `cms_help_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `icon` varchar(500) DEFAULT NULL COMMENT '分类图标',
  `help_count` int(11) DEFAULT NULL COMMENT '专题数量',
  `show_status` int(2) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='帮助分类表';

-- ----------------------------
-- Records of cms_help_category
-- ----------------------------

-- ----------------------------
-- Table structure for cms_member_report
-- ----------------------------
DROP TABLE IF EXISTS `cms_member_report`;
CREATE TABLE `cms_member_report` (
  `id` bigint(20) DEFAULT NULL,
  `report_type` int(1) DEFAULT NULL COMMENT '举报类型：0->商品评价；1->话题内容；2->用户评论',
  `report_member_name` varchar(100) DEFAULT NULL COMMENT '举报人',
  `create_time` datetime DEFAULT NULL,
  `report_object` varchar(100) DEFAULT NULL,
  `report_status` int(1) DEFAULT NULL COMMENT '举报状态：0->未处理；1->已处理',
  `handle_status` int(1) DEFAULT NULL COMMENT '处理结果：0->无效；1->有效；2->恶意',
  `note` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户举报表';

-- ----------------------------
-- Records of cms_member_report
-- ----------------------------

-- ----------------------------
-- Table structure for cms_prefrence_area
-- ----------------------------
DROP TABLE IF EXISTS `cms_prefrence_area`;
CREATE TABLE `cms_prefrence_area` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `sub_title` varchar(255) DEFAULT NULL,
  `pic` varbinary(500) DEFAULT NULL COMMENT '展示图片',
  `sort` int(11) DEFAULT NULL,
  `show_status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='优选专区';



-- ----------------------------
-- Table structure for cms_prefrence_area_product_relation
-- ----------------------------
DROP TABLE IF EXISTS `cms_prefrence_area_product_relation`;
CREATE TABLE `cms_prefrence_area_product_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `prefrence_area_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='优选专区和产品关系表';


-- ----------------------------
-- Table structure for cms_subject
-- ----------------------------
DROP TABLE IF EXISTS `cms_subject`;
CREATE TABLE `cms_subject` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `pic` varchar(500) DEFAULT NULL COMMENT '专题主图',
  `product_count` int(11) DEFAULT NULL COMMENT '关联产品数量',
  `recommend_status` int(1) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `collect_count` int(11) DEFAULT NULL,
  `read_count` int(11) DEFAULT NULL,
  `comment_count` int(11) DEFAULT NULL,
  `album_pics` varchar(1000) DEFAULT NULL COMMENT '画册图片用逗号分割',
  `description` varchar(1000) DEFAULT NULL,
  `show_status` int(1) DEFAULT NULL COMMENT '显示状态：0->不显示；1->显示',
  `content` text,
  `forward_count` int(11) DEFAULT NULL COMMENT '转发数',
  `category_name` varchar(200) DEFAULT NULL COMMENT '专题分类名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='专题表';


-- ----------------------------
-- Table structure for cms_subject_category
-- ----------------------------
DROP TABLE IF EXISTS `cms_subject_category`;
CREATE TABLE `cms_subject_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `icon` varchar(500) DEFAULT NULL COMMENT '分类图标',
  `subject_count` int(11) DEFAULT NULL COMMENT '专题数量',
  `show_status` int(2) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='专题分类表';



-- ----------------------------
-- Table structure for cms_subject_comment
-- ----------------------------
DROP TABLE IF EXISTS `cms_subject_comment`;
CREATE TABLE `cms_subject_comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subject_id` bigint(20) DEFAULT NULL,
  `member_nick_name` varchar(255) DEFAULT NULL,
  `member_icon` varchar(255) DEFAULT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `show_status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='专题评论表';

-- ----------------------------
-- Records of cms_subject_comment
-- ----------------------------

-- ----------------------------
-- Table structure for cms_subject_product_relation
-- ----------------------------
DROP TABLE IF EXISTS `cms_subject_product_relation`;
CREATE TABLE `cms_subject_product_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subject_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COMMENT='专题商品关系表';


-- ----------------------------
-- Table structure for cms_topic
-- ----------------------------
DROP TABLE IF EXISTS `cms_topic`;
CREATE TABLE `cms_topic` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `attend_count` int(11) DEFAULT NULL COMMENT '参与人数',
  `attention_count` int(11) DEFAULT NULL COMMENT '关注人数',
  `read_count` int(11) DEFAULT NULL,
  `award_name` varchar(100) DEFAULT NULL COMMENT '奖品名称',
  `attend_type` varchar(100) DEFAULT NULL COMMENT '参与方式',
  `content` text COMMENT '话题内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='话题表';

-- ----------------------------
-- Records of cms_topic
-- ----------------------------

-- ----------------------------
-- Table structure for cms_topic_category
-- ----------------------------
DROP TABLE IF EXISTS `cms_topic_category`;
CREATE TABLE `cms_topic_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `icon` varchar(500) DEFAULT NULL COMMENT '分类图标',
  `subject_count` int(11) DEFAULT NULL COMMENT '专题数量',
  `show_status` int(2) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='话题分类表';

-- ----------------------------
-- Records of cms_topic_category
-- ----------------------------

-- ----------------------------
-- Table structure for cms_topic_comment
-- ----------------------------
DROP TABLE IF EXISTS `cms_topic_comment`;
CREATE TABLE `cms_topic_comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_nick_name` varchar(255) DEFAULT NULL,
  `topic_id` bigint(20) DEFAULT NULL,
  `member_icon` varchar(255) DEFAULT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `show_status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='专题评论表';

-- ----------------------------
-- Records of cms_topic_comment
-- ----------------------------

-- ----------------------------
-- Table structure for oms_cart_item
-- ----------------------------
DROP TABLE IF EXISTS `oms_cart_item`;
CREATE TABLE `oms_cart_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) DEFAULT NULL,
  `product_sku_id` bigint(20) DEFAULT NULL,
  `member_id` bigint(20) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL COMMENT '购买数量',
  `price` decimal(10,2) DEFAULT NULL COMMENT '添加到购物车的价格',
  `product_pic` varchar(1000) DEFAULT NULL COMMENT '商品主图',
  `product_name` varchar(500) DEFAULT NULL COMMENT '商品名称',
  `product_sub_title` varchar(500) DEFAULT NULL COMMENT '商品副标题（卖点）',
  `product_sku_code` varchar(200) DEFAULT NULL COMMENT '商品sku条码',
  `member_nickname` varchar(500) DEFAULT NULL COMMENT '会员昵称',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `modify_date` datetime DEFAULT NULL COMMENT '修改时间',
  `delete_status` int(1) DEFAULT '0' COMMENT '是否删除',
  `product_category_id` bigint(20) DEFAULT NULL COMMENT '商品分类',
  `product_brand` varchar(200) DEFAULT NULL,
  `product_sn` varchar(200) DEFAULT NULL,
  `product_attr` varchar(500) DEFAULT NULL COMMENT '商品销售属性:[{"key":"颜色","value":"颜色"},{"key":"容量","value":"4G"}]',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='购物车表';


-- ----------------------------
-- Table structure for oms_company_address
-- ----------------------------
DROP TABLE IF EXISTS `oms_company_address`;
CREATE TABLE `oms_company_address` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `address_name` varchar(200) DEFAULT NULL COMMENT '地址名称',
  `send_status` int(1) DEFAULT NULL COMMENT '默认发货地址：0->否；1->是',
  `receive_status` int(1) DEFAULT NULL COMMENT '是否默认收货地址：0->否；1->是',
  `name` varchar(64) DEFAULT NULL COMMENT '收发货人姓名',
  `phone` varchar(64) DEFAULT NULL COMMENT '收货人电话',
  `province` varchar(64) DEFAULT NULL COMMENT '省/直辖市',
  `city` varchar(64) DEFAULT NULL COMMENT '市',
  `region` varchar(64) DEFAULT NULL COMMENT '区',
  `detail_address` varchar(200) DEFAULT NULL COMMENT '详细地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='公司收发货地址表';


-- ----------------------------
-- Table structure for oms_order
-- ----------------------------
DROP TABLE IF EXISTS `oms_order`;
CREATE TABLE `oms_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `member_id` bigint(20) NOT NULL,
  `coupon_id` bigint(20) DEFAULT NULL,
  `order_sn` varchar(64) DEFAULT NULL COMMENT '订单编号',
  `create_time` datetime DEFAULT NULL COMMENT '提交时间',
  `member_username` varchar(64) DEFAULT NULL COMMENT '用户帐号',
  `total_amount` decimal(10,2) DEFAULT NULL COMMENT '订单总金额',
  `pay_amount` decimal(10,2) DEFAULT NULL COMMENT '应付金额（实际支付金额）',
  `freight_amount` decimal(10,2) DEFAULT NULL COMMENT '运费金额',
  `promotion_amount` decimal(10,2) DEFAULT NULL COMMENT '促销优化金额（促销价、满减、阶梯价）',
  `integration_amount` decimal(10,2) DEFAULT NULL COMMENT '积分抵扣金额',
  `coupon_amount` decimal(10,2) DEFAULT NULL COMMENT '优惠券抵扣金额',
  `discount_amount` decimal(10,2) DEFAULT NULL COMMENT '管理员后台调整订单使用的折扣金额',
  `pay_type` int(1) DEFAULT NULL COMMENT '支付方式：0->未支付；1->支付宝；2->微信',
  `source_type` int(1) DEFAULT NULL COMMENT '订单来源：0->PC订单；1->app订单',
  `status` int(1) DEFAULT NULL COMMENT '订单状态：0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭；5->无效订单',
  `order_type` int(1) DEFAULT NULL COMMENT '订单类型：0->正常订单；1->秒杀订单',
  `delivery_company` varchar(64) DEFAULT NULL COMMENT '物流公司(配送方式)',
  `delivery_sn` varchar(64) DEFAULT NULL COMMENT '物流单号',
  `auto_confirm_day` int(11) DEFAULT NULL COMMENT '自动确认时间（天）',
  `integration` int(11) DEFAULT NULL COMMENT '可以获得的积分',
  `growth` int(11) DEFAULT NULL COMMENT '可以活动的成长值',
  `promotion_info` varchar(100) DEFAULT NULL COMMENT '活动信息',
  `bill_type` int(1) DEFAULT NULL COMMENT '发票类型：0->不开发票；1->电子发票；2->纸质发票',
  `bill_header` varchar(200) DEFAULT NULL COMMENT '发票抬头',
  `bill_content` varchar(200) DEFAULT NULL COMMENT '发票内容',
  `bill_receiver_phone` varchar(32) DEFAULT NULL COMMENT '收票人电话',
  `bill_receiver_email` varchar(64) DEFAULT NULL COMMENT '收票人邮箱',
  `receiver_name` varchar(100) NOT NULL COMMENT '收货人姓名',
  `receiver_phone` varchar(32) NOT NULL COMMENT '收货人电话',
  `receiver_post_code` varchar(32) DEFAULT NULL COMMENT '收货人邮编',
  `receiver_province` varchar(32) DEFAULT NULL COMMENT '省份/直辖市',
  `receiver_city` varchar(32) DEFAULT NULL COMMENT '城市',
  `receiver_region` varchar(32) DEFAULT NULL COMMENT '区',
  `receiver_detail_address` varchar(200) DEFAULT NULL COMMENT '详细地址',
  `note` varchar(500) DEFAULT NULL COMMENT '订单备注',
  `confirm_status` int(1) DEFAULT NULL COMMENT '确认收货状态：0->未确认；1->已确认',
  `delete_status` int(1) NOT NULL DEFAULT '0' COMMENT '删除状态：0->未删除；1->已删除',
  `use_integration` int(11) DEFAULT NULL COMMENT '下单时使用的积分',
  `payment_time` datetime DEFAULT NULL COMMENT '支付时间',
  `delivery_time` datetime DEFAULT NULL COMMENT '发货时间',
  `receive_time` datetime DEFAULT NULL COMMENT '确认收货时间',
  `comment_time` datetime DEFAULT NULL COMMENT '评价时间',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='订单表';


-- ----------------------------
-- Table structure for oms_order_item
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_item`;
CREATE TABLE `oms_order_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `order_sn` varchar(64) DEFAULT NULL COMMENT '订单编号',
  `product_id` bigint(20) DEFAULT NULL,
  `product_pic` varchar(500) DEFAULT NULL,
  `product_name` varchar(200) DEFAULT NULL,
  `product_brand` varchar(200) DEFAULT NULL,
  `product_sn` varchar(64) DEFAULT NULL,
  `product_price` decimal(10,2) DEFAULT NULL COMMENT '销售价格',
  `product_quantity` int(11) DEFAULT NULL COMMENT '购买数量',
  `product_sku_id` bigint(20) DEFAULT NULL COMMENT '商品sku编号',
  `product_sku_code` varchar(50) DEFAULT NULL COMMENT '商品sku条码',
  `product_category_id` bigint(20) DEFAULT NULL COMMENT '商品分类id',
  `promotion_name` varchar(200) DEFAULT NULL COMMENT '商品促销名称',
  `promotion_amount` decimal(10,2) DEFAULT NULL COMMENT '商品促销分解金额',
  `coupon_amount` decimal(10,2) DEFAULT NULL COMMENT '优惠券优惠分解金额',
  `integration_amount` decimal(10,2) DEFAULT NULL COMMENT '积分优惠分解金额',
  `real_amount` decimal(10,2) DEFAULT NULL COMMENT '该商品经过优惠后的分解金额',
  `gift_integration` int(11) DEFAULT '0',
  `gift_growth` int(11) DEFAULT '0',
  `product_attr` varchar(500) DEFAULT NULL COMMENT '商品销售属性:[{"key":"颜色","value":"颜色"},{"key":"容量","value":"4G"}]',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COMMENT='订单中所包含的商品';


-- ----------------------------
-- Table structure for oms_order_operate_history
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_operate_history`;
CREATE TABLE `oms_order_operate_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `operate_man` varchar(100) DEFAULT NULL COMMENT '操作人：用户；系统；后台管理员',
  `create_time` datetime DEFAULT NULL COMMENT '操作时间',
  `order_status` int(1) DEFAULT NULL COMMENT '订单状态：0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭；5->无效订单',
  `note` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='订单操作历史记录';


-- ----------------------------
-- Table structure for oms_order_return_apply
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_return_apply`;
CREATE TABLE `oms_order_return_apply` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `company_address_id` bigint(20) DEFAULT NULL COMMENT '收货地址表id',
  `product_id` bigint(20) DEFAULT NULL COMMENT '退货商品id',
  `order_sn` varchar(64) DEFAULT NULL COMMENT '订单编号',
  `create_time` datetime DEFAULT NULL COMMENT '申请时间',
  `member_username` varchar(64) DEFAULT NULL COMMENT '会员用户名',
  `return_amount` decimal(10,2) DEFAULT NULL COMMENT '退款金额',
  `return_name` varchar(100) DEFAULT NULL COMMENT '退货人姓名',
  `return_phone` varchar(100) DEFAULT NULL COMMENT '退货人电话',
  `status` int(1) DEFAULT NULL COMMENT '申请状态：0->待处理；1->退货中；2->已完成；3->已拒绝',
  `handle_time` datetime DEFAULT NULL COMMENT '处理时间',
  `product_pic` varchar(500) DEFAULT NULL COMMENT '商品图片',
  `product_name` varchar(200) DEFAULT NULL COMMENT '商品名称',
  `product_brand` varchar(200) DEFAULT NULL COMMENT '商品品牌',
  `product_attr` varchar(500) DEFAULT NULL COMMENT '商品销售属性：颜色：红色；尺码：xl;',
  `product_count` int(11) DEFAULT NULL COMMENT '退货数量',
  `product_price` decimal(10,2) DEFAULT NULL COMMENT '商品单价',
  `product_real_price` decimal(10,2) DEFAULT NULL COMMENT '商品实际支付单价',
  `reason` varchar(200) DEFAULT NULL COMMENT '原因',
  `description` varchar(500) DEFAULT NULL COMMENT '描述',
  `proof_pics` varchar(1000) DEFAULT NULL COMMENT '凭证图片，以逗号隔开',
  `handle_note` varchar(500) DEFAULT NULL COMMENT '处理备注',
  `handle_man` varchar(100) DEFAULT NULL COMMENT '处理人员',
  `receive_man` varchar(100) DEFAULT NULL COMMENT '收货人',
  `receive_time` datetime DEFAULT NULL COMMENT '收货时间',
  `receive_note` varchar(500) DEFAULT NULL COMMENT '收货备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='订单退货申请';



-- ----------------------------
-- Table structure for oms_order_return_reason
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_return_reason`;
CREATE TABLE `oms_order_return_reason` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL COMMENT '退货类型',
  `sort` int(11) DEFAULT NULL,
  `status` int(1) DEFAULT NULL COMMENT '状态：0->不启用；1->启用',
  `create_time` datetime DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='退货原因表';


-- ----------------------------
-- Table structure for oms_order_setting
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_setting`;
CREATE TABLE `oms_order_setting` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `flash_order_overtime` int(11) DEFAULT NULL COMMENT '秒杀订单超时关闭时间(分)',
  `normal_order_overtime` int(11) DEFAULT NULL COMMENT '正常订单超时时间(分)',
  `confirm_overtime` int(11) DEFAULT NULL COMMENT '发货后自动确认收货时间（天）',
  `finish_overtime` int(11) DEFAULT NULL COMMENT '自动完成交易时间，不能申请售后（天）',
  `comment_overtime` int(11) DEFAULT NULL COMMENT '订单完成后自动好评时间（天）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='订单设置表';

-- ----------------------------
-- Records of oms_order_setting
-- ----------------------------
INSERT INTO `oms_order_setting` VALUES ('1', '60', '120', '15', '7', '7');

-- ----------------------------
-- Table structure for pms_album
-- ----------------------------
DROP TABLE IF EXISTS `pms_album`;
CREATE TABLE `pms_album` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `cover_pic` varchar(1000) DEFAULT NULL,
  `pic_count` int(11) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='相册表';

-- ----------------------------
-- Records of pms_album
-- ----------------------------

-- ----------------------------
-- Table structure for pms_album_pic
-- ----------------------------
DROP TABLE IF EXISTS `pms_album_pic`;
CREATE TABLE `pms_album_pic` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `album_id` bigint(20) DEFAULT NULL,
  `pic` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='画册图片表';

-- ----------------------------
-- Records of pms_album_pic
-- ----------------------------

-- ----------------------------
-- Table structure for pms_brand
-- ----------------------------
DROP TABLE IF EXISTS `pms_brand`;
CREATE TABLE `pms_brand` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `first_letter` varchar(8) DEFAULT NULL COMMENT '首字母',
  `sort` int(11) DEFAULT NULL,
  `factory_status` int(1) DEFAULT NULL COMMENT '是否为品牌制造商：0->不是；1->是',
  `show_status` int(1) DEFAULT NULL,
  `product_count` int(11) DEFAULT NULL COMMENT '产品数量',
  `product_comment_count` int(11) DEFAULT NULL COMMENT '产品评论数量',
  `logo` varchar(255) DEFAULT NULL COMMENT '品牌logo',
  `big_pic` varchar(255) DEFAULT NULL COMMENT '专区大图',
  `brand_story` text COMMENT '品牌故事',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 COMMENT='品牌表';


-- ----------------------------
-- Table structure for pms_comment
-- ----------------------------
DROP TABLE IF EXISTS `pms_comment`;
CREATE TABLE `pms_comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) DEFAULT NULL,
  `member_nick_name` varchar(255) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `star` int(3) DEFAULT NULL COMMENT '评价星数：0->5',
  `member_ip` varchar(64) DEFAULT NULL COMMENT '评价的ip',
  `create_time` datetime DEFAULT NULL,
  `show_status` int(1) DEFAULT NULL,
  `product_attribute` varchar(255) DEFAULT NULL COMMENT '购买时的商品属性',
  `collect_couont` int(11) DEFAULT NULL,
  `read_count` int(11) DEFAULT NULL,
  `content` text,
  `pics` varchar(1000) DEFAULT NULL COMMENT '上传图片地址，以逗号隔开',
  `member_icon` varchar(255) DEFAULT NULL COMMENT '评论用户头像',
  `replay_count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品评价表';

-- ----------------------------
-- Records of pms_comment
-- ----------------------------

-- ----------------------------
-- Table structure for pms_comment_replay
-- ----------------------------
DROP TABLE IF EXISTS `pms_comment_replay`;
CREATE TABLE `pms_comment_replay` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) DEFAULT NULL,
  `member_nick_name` varchar(255) DEFAULT NULL,
  `member_icon` varchar(255) DEFAULT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `type` int(1) DEFAULT NULL COMMENT '评论人员类型；0->会员；1->管理员',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品评价回复表';

-- ----------------------------
-- Records of pms_comment_replay
-- ----------------------------

-- ----------------------------
-- Table structure for pms_feight_template
-- ----------------------------
DROP TABLE IF EXISTS `pms_feight_template`;
CREATE TABLE `pms_feight_template` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `charge_type` int(1) DEFAULT NULL COMMENT '计费类型:0->按重量；1->按件数',
  `first_weight` decimal(10,2) DEFAULT NULL COMMENT '首重kg',
  `first_fee` decimal(10,2) DEFAULT NULL COMMENT '首费（元）',
  `continue_weight` decimal(10,2) DEFAULT NULL,
  `continme_fee` decimal(10,2) DEFAULT NULL,
  `dest` varchar(255) DEFAULT NULL COMMENT '目的地（省、市）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='运费模版';

-- ----------------------------
-- Records of pms_feight_template
-- ----------------------------

-- ----------------------------
-- Table structure for pms_member_price
-- ----------------------------
DROP TABLE IF EXISTS `pms_member_price`;
CREATE TABLE `pms_member_price` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) DEFAULT NULL,
  `member_level_id` bigint(20) DEFAULT NULL,
  `member_price` decimal(10,2) DEFAULT NULL COMMENT '会员价格',
  `member_level_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=252 DEFAULT CHARSET=utf8 COMMENT='商品会员价格表';


-- ----------------------------
-- Table structure for pms_product
-- ----------------------------
DROP TABLE IF EXISTS `pms_product`;
CREATE TABLE `pms_product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `brand_id` bigint(20) DEFAULT NULL,
  `product_category_id` bigint(20) DEFAULT NULL,
  `feight_template_id` bigint(20) DEFAULT NULL,
  `product_attribute_category_id` bigint(20) DEFAULT NULL,
  `name` varchar(64) NOT NULL,
  `pic` varchar(255) DEFAULT NULL,
  `product_sn` varchar(64) NOT NULL COMMENT '货号',
  `delete_status` int(1) DEFAULT NULL COMMENT '删除状态：0->未删除；1->已删除',
  `publish_status` int(1) DEFAULT NULL COMMENT '上架状态：0->下架；1->上架',
  `new_status` int(1) DEFAULT NULL COMMENT '新品状态:0->不是新品；1->新品',
  `recommand_status` int(1) DEFAULT NULL COMMENT '推荐状态；0->不推荐；1->推荐',
  `verify_status` int(1) DEFAULT NULL COMMENT '审核状态：0->未审核；1->审核通过',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `sale` int(11) DEFAULT NULL COMMENT '销量',
  `price` decimal(10,2) DEFAULT NULL,
  `promotion_price` decimal(10,2) DEFAULT NULL COMMENT '促销价格',
  `gift_growth` int(11) DEFAULT '0' COMMENT '赠送的成长值',
  `gift_point` int(11) DEFAULT '0' COMMENT '赠送的积分',
  `use_point_limit` int(11) DEFAULT NULL COMMENT '限制使用的积分数',
  `sub_title` varchar(255) DEFAULT NULL COMMENT '副标题',
  `description` text COMMENT '商品描述',
  `original_price` decimal(10,2) DEFAULT NULL COMMENT '市场价',
  `stock` int(11) DEFAULT NULL COMMENT '库存',
  `low_stock` int(11) DEFAULT NULL COMMENT '库存预警值',
  `unit` varchar(16) DEFAULT NULL COMMENT '单位',
  `weight` decimal(10,2) DEFAULT NULL COMMENT '商品重量，默认为克',
  `preview_status` int(1) DEFAULT NULL COMMENT '是否为预告商品：0->不是；1->是',
  `service_ids` varchar(64) DEFAULT NULL COMMENT '以逗号分割的产品服务：1->无忧退货；2->快速退款；3->免费包邮',
  `keywords` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `album_pics` varchar(255) DEFAULT NULL COMMENT '画册图片，连产品图片限制为5张，以逗号分割',
  `detail_title` varchar(255) DEFAULT NULL,
  `detail_desc` text,
  `detail_html` text COMMENT '产品详情网页内容',
  `detail_mobile_html` text COMMENT '移动端网页详情',
  `promotion_start_time` datetime DEFAULT NULL COMMENT '促销开始时间',
  `promotion_end_time` datetime DEFAULT NULL COMMENT '促销结束时间',
  `promotion_per_limit` int(11) DEFAULT NULL COMMENT '活动限购数量',
  `promotion_type` int(1) DEFAULT NULL COMMENT '促销类型：0->没有促销使用原价;1->使用促销价；2->使用会员价；3->使用阶梯价格；4->使用满减价格；5->限时购',
  `brand_name` varchar(255) DEFAULT NULL COMMENT '品牌名称',
  `product_category_name` varchar(255) DEFAULT NULL COMMENT '商品分类名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='商品信息';


-- ----------------------------
-- Table structure for pms_product_attribute
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_attribute`;
CREATE TABLE `pms_product_attribute` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_attribute_category_id` bigint(20) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `select_type` int(1) DEFAULT NULL COMMENT '属性选择类型：0->唯一；1->单选；2->多选',
  `input_type` int(1) DEFAULT NULL COMMENT '属性录入方式：0->手工录入；1->从列表中选取',
  `input_list` varchar(255) DEFAULT NULL COMMENT '可选值列表，以逗号隔开',
  `sort` int(11) DEFAULT NULL COMMENT '排序字段：最高的可以单独上传图片',
  `filter_type` int(1) DEFAULT NULL COMMENT '分类筛选样式：1->普通；1->颜色',
  `search_type` int(1) DEFAULT NULL COMMENT '检索类型；0->不需要进行检索；1->关键字检索；2->范围检索',
  `related_status` int(1) DEFAULT NULL COMMENT '相同属性产品是否关联；0->不关联；1->关联',
  `hand_add_status` int(1) DEFAULT NULL COMMENT '是否支持手动新增；0->不支持；1->支持',
  `type` int(1) DEFAULT NULL COMMENT '属性的类型；0->规格；1->参数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COMMENT='商品属性参数表';


-- ----------------------------
-- Table structure for pms_product_attribute_category
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_attribute_category`;
CREATE TABLE `pms_product_attribute_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `attribute_count` int(11) DEFAULT '0' COMMENT '属性数量',
  `param_count` int(11) DEFAULT '0' COMMENT '参数数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='产品属性分类表';


-- ----------------------------
-- Table structure for pms_product_attribute_value
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_attribute_value`;
CREATE TABLE `pms_product_attribute_value` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) DEFAULT NULL,
  `product_attribute_id` bigint(20) DEFAULT NULL,
  `value` varchar(64) DEFAULT NULL COMMENT '手动添加规格或参数的值，参数单值，规格有多个时以逗号隔开',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=275 DEFAULT CHARSET=utf8 COMMENT='存储产品参数信息的表';


-- ----------------------------
-- Table structure for pms_product_category
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_category`;
CREATE TABLE `pms_product_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '上机分类的编号：0表示一级分类',
  `name` varchar(64) DEFAULT NULL,
  `level` int(1) DEFAULT NULL COMMENT '分类级别：0->1级；1->2级',
  `product_count` int(11) DEFAULT NULL,
  `product_unit` varchar(64) DEFAULT NULL,
  `nav_status` int(1) DEFAULT NULL COMMENT '是否显示在导航栏：0->不显示；1->显示',
  `show_status` int(1) DEFAULT NULL COMMENT '显示状态：0->不显示；1->显示',
  `sort` int(11) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL COMMENT '图标',
  `keywords` varchar(255) DEFAULT NULL,
  `description` text COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COMMENT='产品分类';


-- ----------------------------
-- Table structure for pms_product_category_attribute_relation
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_category_attribute_relation`;
CREATE TABLE `pms_product_category_attribute_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_category_id` bigint(20) DEFAULT NULL,
  `product_attribute_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='产品的分类和属性的关系表，用于设置分类筛选条件（只支持一级分类）';


-- ----------------------------
-- Table structure for pms_product_full_reduction
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_full_reduction`;
CREATE TABLE `pms_product_full_reduction` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) DEFAULT NULL,
  `full_price` decimal(10,2) DEFAULT NULL,
  `reduce_price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8 COMMENT='产品满减表(只针对同商品)';


-- ----------------------------
-- Table structure for pms_product_ladder
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_ladder`;
CREATE TABLE `pms_product_ladder` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) DEFAULT NULL,
  `count` int(11) DEFAULT NULL COMMENT '满足的商品数量',
  `discount` decimal(10,2) DEFAULT NULL COMMENT '折扣',
  `price` decimal(10,2) DEFAULT NULL COMMENT '折后价格',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8 COMMENT='产品阶梯价格表(只针对同商品)';


-- ----------------------------
-- Table structure for pms_product_operate_log
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_operate_log`;
CREATE TABLE `pms_product_operate_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) DEFAULT NULL,
  `price_old` decimal(10,2) DEFAULT NULL,
  `price_new` decimal(10,2) DEFAULT NULL,
  `sale_price_old` decimal(10,2) DEFAULT NULL,
  `sale_price_new` decimal(10,2) DEFAULT NULL,
  `gift_point_old` int(11) DEFAULT NULL COMMENT '赠送的积分',
  `gift_point_new` int(11) DEFAULT NULL,
  `use_point_limit_old` int(11) DEFAULT NULL,
  `use_point_limit_new` int(11) DEFAULT NULL,
  `operate_man` varchar(64) DEFAULT NULL COMMENT '操作人',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pms_product_operate_log
-- ----------------------------

-- ----------------------------
-- Table structure for pms_product_vertify_record
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_vertify_record`;
CREATE TABLE `pms_product_vertify_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `vertify_man` varchar(64) DEFAULT NULL COMMENT '审核人',
  `status` int(1) DEFAULT NULL,
  `detail` varchar(255) DEFAULT NULL COMMENT '反馈详情',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='商品审核记录';

-- ----------------------------
-- Records of pms_product_vertify_record
-- ----------------------------
INSERT INTO `pms_product_vertify_record` VALUES ('1', '1', '2018-04-27 16:36:41', 'test', '1', '验证通过');
INSERT INTO `pms_product_vertify_record` VALUES ('2', '2', '2018-04-27 16:36:41', 'test', '1', '验证通过');

-- ----------------------------
-- Table structure for pms_sku_stock
-- ----------------------------
DROP TABLE IF EXISTS `pms_sku_stock`;
CREATE TABLE `pms_sku_stock` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) DEFAULT NULL,
  `sku_code` varchar(64) NOT NULL COMMENT 'sku编码',
  `price` decimal(10,2) DEFAULT NULL,
  `stock` int(11) DEFAULT '0' COMMENT '库存',
  `low_stock` int(11) DEFAULT NULL COMMENT '预警库存',
  `pic` varchar(255) DEFAULT NULL COMMENT '展示图片',
  `sale` int(11) DEFAULT NULL COMMENT '销量',
  `promotion_price` decimal(10,2) DEFAULT NULL COMMENT '单品促销价格',
  `lock_stock` int(11) DEFAULT '0' COMMENT '锁定库存',
  `sp_data` varchar(500) DEFAULT NULL COMMENT '商品销售属性，json格式',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=179 DEFAULT CHARSET=utf8 COMMENT='sku的库存';


-- ----------------------------
-- Table structure for sms_coupon
-- ----------------------------
DROP TABLE IF EXISTS `sms_coupon`;
CREATE TABLE `sms_coupon` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` int(1) DEFAULT NULL COMMENT '优惠券类型；0->全场赠券；1->会员赠券；2->购物赠券；3->注册赠券',
  `name` varchar(100) DEFAULT NULL,
  `platform` int(1) DEFAULT NULL COMMENT '使用平台：0->全部；1->移动；2->PC',
  `count` int(11) DEFAULT NULL COMMENT '数量',
  `amount` decimal(10,2) DEFAULT NULL COMMENT '金额',
  `per_limit` int(11) DEFAULT NULL COMMENT '每人限领张数',
  `min_point` decimal(10,2) DEFAULT NULL COMMENT '使用门槛；0表示无门槛',
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `use_type` int(1) DEFAULT NULL COMMENT '使用类型：0->全场通用；1->指定分类；2->指定商品',
  `note` varchar(200) DEFAULT NULL COMMENT '备注',
  `publish_count` int(11) DEFAULT NULL COMMENT '发行数量',
  `use_count` int(11) DEFAULT NULL COMMENT '已使用数量',
  `receive_count` int(11) DEFAULT NULL COMMENT '领取数量',
  `enable_time` datetime DEFAULT NULL COMMENT '可以领取的日期',
  `code` varchar(64) DEFAULT NULL COMMENT '优惠码',
  `member_level` int(1) DEFAULT NULL COMMENT '可领取的会员类型：0->无限时',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='优惠券表';


-- ----------------------------
-- Table structure for sms_coupon_history
-- ----------------------------
DROP TABLE IF EXISTS `sms_coupon_history`;
CREATE TABLE `sms_coupon_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `member_id` bigint(20) DEFAULT NULL,
  `coupon_code` varchar(64) DEFAULT NULL,
  `member_nickname` varchar(64) DEFAULT NULL COMMENT '领取人昵称',
  `get_type` int(1) DEFAULT NULL COMMENT '获取类型：0->后台赠送；1->主动获取',
  `create_time` datetime DEFAULT NULL,
  `use_status` int(1) DEFAULT NULL COMMENT '使用状态：0->未使用；1->已使用；2->已过期',
  `use_time` datetime DEFAULT NULL COMMENT '使用时间',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单编号',
  `order_sn` varchar(100) DEFAULT NULL COMMENT '订单号码',
  PRIMARY KEY (`id`),
  KEY `idx_member_id` (`member_id`) USING BTREE,
  KEY `idx_coupon_id` (`coupon_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='优惠券使用、领取历史表';


-- ----------------------------
-- Table structure for sms_coupon_product_category_relation
-- ----------------------------
DROP TABLE IF EXISTS `sms_coupon_product_category_relation`;
CREATE TABLE `sms_coupon_product_category_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `product_category_id` bigint(20) DEFAULT NULL,
  `product_category_name` varchar(200) DEFAULT NULL COMMENT '产品分类名称',
  `parent_category_name` varchar(200) DEFAULT NULL COMMENT '父分类名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='优惠券和产品分类关系表';

-- ----------------------------
-- Records of sms_coupon_product_category_relation
-- ----------------------------
INSERT INTO `sms_coupon_product_category_relation` VALUES ('4', '19', '30', '手机配件', '手机数码');

-- ----------------------------
-- Table structure for sms_coupon_product_relation
-- ----------------------------
DROP TABLE IF EXISTS `sms_coupon_product_relation`;
CREATE TABLE `sms_coupon_product_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `product_name` varchar(500) DEFAULT NULL COMMENT '商品名称',
  `product_sn` varchar(200) DEFAULT NULL COMMENT '商品编码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='优惠券和产品的关系表';

-- ----------------------------
-- Records of sms_coupon_product_relation
-- ----------------------------
INSERT INTO `sms_coupon_product_relation` VALUES ('9', '21', '33', '小米（MI）小米电视4A ', '4609652');

-- ----------------------------
-- Table structure for sms_flash_promotion
-- ----------------------------
DROP TABLE IF EXISTS `sms_flash_promotion`;
CREATE TABLE `sms_flash_promotion` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL,
  `start_date` date DEFAULT NULL COMMENT '开始日期',
  `end_date` date DEFAULT NULL COMMENT '结束日期',
  `status` int(1) DEFAULT NULL COMMENT '上下线状态',
  `create_time` datetime DEFAULT NULL COMMENT '秒杀时间段名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='限时购表';

-- ----------------------------
-- Records of sms_flash_promotion
-- ----------------------------
/*INSERT INTO `sms_flash_promotion` VALUES ('2', '春季家电家具疯狂秒杀1', '2018-11-12', '2018-11-23', '1', '2018-11-16 11:12:13');
INSERT INTO `sms_flash_promotion` VALUES ('3', '手机特卖', '2018-11-03', '2018-11-10', '1', '2018-11-16 11:11:31');
INSERT INTO `sms_flash_promotion` VALUES ('4', '春季家电家具疯狂秒杀3', '2018-11-24', '2018-11-25', '1', '2018-11-16 11:12:19');
INSERT INTO `sms_flash_promotion` VALUES ('5', '春季家电家具疯狂秒杀4', '2018-11-16', '2018-11-16', '1', '2018-11-16 11:12:24');
INSERT INTO `sms_flash_promotion` VALUES ('6', '春季家电家具疯狂秒杀5', '2018-11-16', '2018-11-16', '1', '2018-11-16 11:12:31');
INSERT INTO `sms_flash_promotion` VALUES ('7', '春季家电家具疯狂秒杀6', '2018-11-16', '2018-11-16', '1', '2018-11-16 11:12:35');
INSERT INTO `sms_flash_promotion` VALUES ('8', '春季家电家具疯狂秒杀7', '2018-11-16', '2018-11-16', '0', '2018-11-16 11:12:39');
INSERT INTO `sms_flash_promotion` VALUES ('9', '春季家电家具疯狂秒杀8', '2018-11-16', '2018-11-16', '0', '2018-11-16 11:12:42');
INSERT INTO `sms_flash_promotion` VALUES ('13', '测试', '2018-11-01', '2018-11-30', '0', '2018-11-19 10:34:24');*/

-- ----------------------------
-- Table structure for sms_flash_promotion_log
-- ----------------------------
DROP TABLE IF EXISTS `sms_flash_promotion_log`;
CREATE TABLE `sms_flash_promotion_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `member_phone` varchar(64) DEFAULT NULL,
  `product_name` varchar(100) DEFAULT NULL,
  `subscribe_time` datetime DEFAULT NULL COMMENT '会员订阅时间',
  `send_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='限时购通知记录';

-- ----------------------------
-- Records of sms_flash_promotion_log
-- ----------------------------

-- ----------------------------
-- Table structure for sms_flash_promotion_product_relation
-- ----------------------------
DROP TABLE IF EXISTS `sms_flash_promotion_product_relation`;
CREATE TABLE `sms_flash_promotion_product_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `flash_promotion_id` bigint(20) DEFAULT NULL,
  `flash_promotion_session_id` bigint(20) DEFAULT NULL COMMENT '编号',
  `product_id` bigint(20) DEFAULT NULL,
  `flash_promotion_price` decimal(10,2) DEFAULT NULL COMMENT '限时购价格',
  `flash_promotion_count` int(11) DEFAULT NULL COMMENT '限时购数量',
  `flash_promotion_limit` int(11) DEFAULT NULL COMMENT '每人限购数量',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='商品限时购与商品关系表';

-- ----------------------------
-- Records of sms_flash_promotion_product_relation
-- ----------------------------
/*INSERT INTO `sms_flash_promotion_product_relation` VALUES ('1', '2', '1', '26', '3000.00', '10', '1', '0');
INSERT INTO `sms_flash_promotion_product_relation` VALUES ('2', '2', '1', '27', '2000.00', '10', '1', '20');
INSERT INTO `sms_flash_promotion_product_relation` VALUES ('3', '2', '1', '28', '599.00', '19', '1', '0');
INSERT INTO `sms_flash_promotion_product_relation` VALUES ('4', '2', '1', '29', '4999.00', '10', '1', '100');
INSERT INTO `sms_flash_promotion_product_relation` VALUES ('9', '2', '2', '26', '2999.00', '100', '1', '0');
INSERT INTO `sms_flash_promotion_product_relation` VALUES ('10', '2', '2', '27', null, null, null, null);
INSERT INTO `sms_flash_promotion_product_relation` VALUES ('11', '2', '2', '28', null, null, null, null);
INSERT INTO `sms_flash_promotion_product_relation` VALUES ('12', '2', '2', '29', null, null, null, null);
INSERT INTO `sms_flash_promotion_product_relation` VALUES ('13', '2', '2', '30', null, null, null, null);
INSERT INTO `sms_flash_promotion_product_relation` VALUES ('14', '2', '3', '31', null, null, null, null);
INSERT INTO `sms_flash_promotion_product_relation` VALUES ('15', '2', '3', '32', null, null, null, null);
INSERT INTO `sms_flash_promotion_product_relation` VALUES ('16', '2', '4', '33', null, null, null, null);
INSERT INTO `sms_flash_promotion_product_relation` VALUES ('17', '2', '4', '34', null, null, null, null);
INSERT INTO `sms_flash_promotion_product_relation` VALUES ('18', '2', '5', '36', null, null, null, null);
INSERT INTO `sms_flash_promotion_product_relation` VALUES ('19', '2', '6', '33', null, null, null, null);
INSERT INTO `sms_flash_promotion_product_relation` VALUES ('20', '2', '6', '34', null, null, null, null);*/

-- ----------------------------
-- Table structure for sms_flash_promotion_session
-- ----------------------------
DROP TABLE IF EXISTS `sms_flash_promotion_session`;
CREATE TABLE `sms_flash_promotion_session` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(200) DEFAULT NULL COMMENT '场次名称',
  `start_time` time DEFAULT NULL COMMENT '每日开始时间',
  `end_time` time DEFAULT NULL COMMENT '每日结束时间',
  `status` int(1) DEFAULT NULL COMMENT '启用状态：0->不启用；1->启用',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='限时购场次表';

-- ----------------------------
-- Records of sms_flash_promotion_session
-- ----------------------------
/*INSERT INTO `sms_flash_promotion_session` VALUES ('1', '8:00', '08:00:29', '09:00:33', '1', '2018-11-16 13:22:17');
INSERT INTO `sms_flash_promotion_session` VALUES ('2', '10:00', '10:00:33', '11:00:33', '1', '2018-11-16 13:22:34');
INSERT INTO `sms_flash_promotion_session` VALUES ('3', '12:00', '12:00:00', '13:00:22', '1', '2018-11-16 13:22:37');
INSERT INTO `sms_flash_promotion_session` VALUES ('4', '14:00', '14:00:00', '15:00:00', '1', '2018-11-16 13:22:41');
INSERT INTO `sms_flash_promotion_session` VALUES ('5', '16:00', '16:00:00', '17:00:00', '1', '2018-11-16 13:22:45');
INSERT INTO `sms_flash_promotion_session` VALUES ('6', '18:00', '18:00:00', '19:00:00', '1', '2018-11-16 13:21:34');
INSERT INTO `sms_flash_promotion_session` VALUES ('7', '20:00', '20:00:33', '21:00:33', '0', '2018-11-16 13:22:55');*/

-- ----------------------------
-- Table structure for sms_home_advertise
-- ----------------------------
DROP TABLE IF EXISTS `sms_home_advertise`;
CREATE TABLE `sms_home_advertise` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `type` int(1) DEFAULT NULL COMMENT '轮播位置：0->PC首页轮播；1->app首页轮播',
  `pic` varchar(500) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `status` int(1) DEFAULT NULL COMMENT '上下线状态：0->下线；1->上线',
  `click_count` int(11) DEFAULT NULL COMMENT '点击数',
  `order_count` int(11) DEFAULT NULL COMMENT '下单数',
  `url` varchar(500) DEFAULT NULL COMMENT '链接地址',
  `note` varchar(500) DEFAULT NULL COMMENT '备注',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='首页轮播广告表';

-- ----------------------------
-- Records of sms_home_advertise
-- ----------------------------
/*INSERT INTO `sms_home_advertise` VALUES ('2', '夏季大热促销', '1', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '2018-11-01 14:01:37', '2018-11-15 14:01:37', '1', '0', '0', null, '夏季大热促销', '0');
INSERT INTO `sms_home_advertise` VALUES ('3', '夏季大热促销1', '1', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '2018-11-13 14:01:37', '2018-11-13 14:01:37', '0', '0', '0', null, '夏季大热促销1', '0');
INSERT INTO `sms_home_advertise` VALUES ('4', '夏季大热促销2', '1', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '2018-11-13 14:01:37', '2018-11-13 14:01:37', '1', '0', '0', null, '夏季大热促销2', '0');
INSERT INTO `sms_home_advertise` VALUES ('9', '电影推荐广告', '1', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20181113/movie_ad.jpg', '2018-11-01 00:00:00', '2018-11-24 00:00:00', '1', '0', '0', 'www.baidu.com', '电影推荐广告', '100');
INSERT INTO `sms_home_advertise` VALUES ('10', '汽车促销广告', '1', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20181113/car_ad.jpg', '2018-11-13 00:00:00', '2018-11-24 00:00:00', '1', '0', '0', 'xxx', null, '99');
INSERT INTO `sms_home_advertise` VALUES ('11', '汽车推荐广告', '1', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20181113/car_ad2.jpg', '2018-11-13 00:00:00', '2018-11-30 00:00:00', '1', '0', '0', 'xxx', null, '98');*/

-- ----------------------------
-- Table structure for sms_home_brand
-- ----------------------------
DROP TABLE IF EXISTS `sms_home_brand`;
CREATE TABLE `sms_home_brand` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `brand_id` bigint(20) DEFAULT NULL,
  `brand_name` varchar(64) DEFAULT NULL,
  `recommend_status` int(1) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COMMENT='首页推荐品牌表';

-- ----------------------------
-- Records of sms_home_brand
-- ----------------------------
/*INSERT INTO `sms_home_brand` VALUES ('1', '1', '万和', '1', '200');
INSERT INTO `sms_home_brand` VALUES ('2', '2', '三星', '1', '0');
INSERT INTO `sms_home_brand` VALUES ('6', '6', '小米', '1', '300');
INSERT INTO `sms_home_brand` VALUES ('8', '5', '方太', '1', '100');
INSERT INTO `sms_home_brand` VALUES ('31', '49', '七匹狼', '0', '0');
INSERT INTO `sms_home_brand` VALUES ('32', '50', '海澜之家', '1', '0');
INSERT INTO `sms_home_brand` VALUES ('33', '51', '苹果', '1', '0');
INSERT INTO `sms_home_brand` VALUES ('34', '2', '三星', '0', '0');
INSERT INTO `sms_home_brand` VALUES ('35', '3', '华为', '1', '0');
INSERT INTO `sms_home_brand` VALUES ('36', '4', '格力', '1', '0');
INSERT INTO `sms_home_brand` VALUES ('37', '5', '方太', '1', '0');
INSERT INTO `sms_home_brand` VALUES ('38', '1', '万和', '1', '0');
INSERT INTO `sms_home_brand` VALUES ('39', '21', 'OPPO', '1', '0');*/

-- ----------------------------
-- Table structure for sms_home_new_product
-- ----------------------------
DROP TABLE IF EXISTS `sms_home_new_product`;
CREATE TABLE `sms_home_new_product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) DEFAULT NULL,
  `product_name` varchar(64) DEFAULT NULL,
  `recommend_status` int(1) DEFAULT NULL,
  `sort` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='新鲜好物表';

-- ----------------------------
-- Records of sms_home_new_product
-- ----------------------------
/*INSERT INTO `sms_home_new_product` VALUES ('2', '27', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '1', '200');
INSERT INTO `sms_home_new_product` VALUES ('8', '26', '华为 HUAWEI P20 ', '0', '0');
INSERT INTO `sms_home_new_product` VALUES ('9', '27', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '1', '0');
INSERT INTO `sms_home_new_product` VALUES ('10', '28', '小米 红米5A 全网通版 3GB+32GB 香槟金 移动联通电信4G手机 双卡双待', '1', '0');
INSERT INTO `sms_home_new_product` VALUES ('11', '29', 'Apple iPhone 8 Plus 64GB 红色特别版 移动联通电信4G手机', '1', '0');
INSERT INTO `sms_home_new_product` VALUES ('12', '30', 'HLA海澜之家简约动物印花短袖T恤', '1', '0');*/

-- ----------------------------
-- Table structure for sms_home_recommend_product
-- ----------------------------
DROP TABLE IF EXISTS `sms_home_recommend_product`;
CREATE TABLE `sms_home_recommend_product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) DEFAULT NULL,
  `product_name` varchar(64) DEFAULT NULL,
  `recommend_status` int(1) DEFAULT NULL,
  `sort` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='人气推荐商品表';

-- ----------------------------
-- Records of sms_home_recommend_product
-- ----------------------------
/*INSERT INTO `sms_home_recommend_product` VALUES ('3', '26', '华为 HUAWEI P20 ', '1', '0');
INSERT INTO `sms_home_recommend_product` VALUES ('4', '27', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '1', '0');
INSERT INTO `sms_home_recommend_product` VALUES ('5', '28', '小米 红米5A 全网通版 3GB+32GB 香槟金 移动联通电信4G手机 双卡双待', '1', '0');
INSERT INTO `sms_home_recommend_product` VALUES ('6', '29', 'Apple iPhone 8 Plus 64GB 红色特别版 移动联通电信4G手机', '1', '0');
INSERT INTO `sms_home_recommend_product` VALUES ('7', '30', 'HLA海澜之家简约动物印花短袖T恤', '1', '100');*/

-- ----------------------------
-- Table structure for sms_home_recommend_subject
-- ----------------------------
DROP TABLE IF EXISTS `sms_home_recommend_subject`;
CREATE TABLE `sms_home_recommend_subject` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subject_id` bigint(20) DEFAULT NULL,
  `subject_name` varchar(64) DEFAULT NULL,
  `recommend_status` int(1) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='首页推荐专题表';

-- ----------------------------
-- Records of sms_home_recommend_subject
-- ----------------------------
/*INSERT INTO `sms_home_recommend_subject` VALUES ('14', '1', 'polo衬衫的也时尚', '1', '0');
INSERT INTO `sms_home_recommend_subject` VALUES ('15', '2', '大牌手机低价秒', '1', '0');
INSERT INTO `sms_home_recommend_subject` VALUES ('16', '3', '晓龙845新品上市', '1', '0');
INSERT INTO `sms_home_recommend_subject` VALUES ('17', '4', '夏天应该穿什么', '1', '0');
INSERT INTO `sms_home_recommend_subject` VALUES ('18', '5', '夏季精选', '1', '100');
INSERT INTO `sms_home_recommend_subject` VALUES ('19', '6', '品牌手机降价', '1', '0');*/

-- ----------------------------
-- Table structure for ums_admin
-- ----------------------------
DROP TABLE IF EXISTS `ums_admin`;
CREATE TABLE `ums_admin` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `icon` varchar(500) DEFAULT NULL COMMENT '头像',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `nick_name` varchar(200) DEFAULT NULL COMMENT '昵称',
  `note` varchar(500) DEFAULT NULL COMMENT '备注信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `login_time` datetime DEFAULT NULL COMMENT '最后登录时间',
  `status` int(1) DEFAULT '1' COMMENT '帐号启用状态：0->禁用；1->启用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='后台用户表';

-- ----------------------------
-- Records of ums_admin
-- ----------------------------
INSERT INTO `ums_admin` VALUES ('1', 'test', '$2a$10$SDSRmw.l3aff88Glo3/L/eFsDUw7TnIyWYggJgIHILL7Sm/Rr3lBe', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/timg.jpg', 'test@qq.com', '测试账号', null, '2018-09-29 13:55:30', '2018-09-29 13:55:39', '1');
INSERT INTO `ums_admin` VALUES ('3', 'admin', '$2a$10$SDSRmw.l3aff88Glo3/L/eFsDUw7TnIyWYggJgIHILL7Sm/Rr3lBe', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/timg.jpg', 'admin@163.com', '系统管理员', '系统管理员', '2018-10-08 13:32:47', '2019-04-20 12:45:16', '1');
INSERT INTO `ums_admin` VALUES ('4', 'macro', '$2a$10$SDSRmw.l3aff88Glo3/L/eFsDUw7TnIyWYggJgIHILL7Sm/Rr3lBe', 'string', 'macro@qq.com', 'macro', 'macro专用', '2019-10-06 15:53:51', '2020-02-03 14:55:55', '1');
INSERT INTO `ums_admin` VALUES ('6', 'productAdmin', '$2a$10$SDSRmw.l3aff88Glo3/L/eFsDUw7TnIyWYggJgIHILL7Sm/Rr3lBe', null, 'product@qq.com', '商品管理员', '只有商品权限', '2020-02-07 16:15:08', null, '1');
INSERT INTO `ums_admin` VALUES ('7', 'orderAdmin', '$2a$10$SDSRmw.l3aff88Glo3/L/eFsDUw7TnIyWYggJgIHILL7Sm/Rr3lBe', null, 'order@qq.com', '订单管理员', '只有订单管理权限', '2020-02-07 16:15:50', null, '1');

-- ----------------------------
-- Table structure for ums_admin_login_log
-- ----------------------------
DROP TABLE IF EXISTS `ums_admin_login_log`;
CREATE TABLE `ums_admin_login_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `admin_id` bigint(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `ip` varchar(64) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `user_agent` varchar(100) DEFAULT NULL COMMENT '浏览器登录类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=196 DEFAULT CHARSET=utf8 COMMENT='后台用户登录日志表';

/*-- ----------------------------
-- Records of ums_admin_login_log
-- ----------------------------
INSERT INTO `ums_admin_login_log` VALUES ('1', '3', '2018-12-23 14:27:00', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('2', '3', '2019-04-07 16:04:39', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('3', '3', '2019-04-08 21:47:52', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('4', '3', '2019-04-08 21:48:18', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('5', '3', '2019-04-18 22:18:40', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('6', '3', '2019-04-20 12:45:16', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('7', '3', '2019-05-19 14:52:12', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('8', '3', '2019-05-25 15:00:17', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('9', '3', '2019-06-19 20:11:42', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('10', '3', '2019-06-30 10:33:48', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('11', '3', '2019-06-30 10:34:31', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('12', '3', '2019-06-30 10:35:34', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('13', '3', '2019-07-27 17:11:01', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('14', '3', '2019-07-27 17:13:18', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('15', '3', '2019-07-27 17:15:35', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('16', '3', '2019-07-27 17:17:11', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('17', '3', '2019-07-27 17:18:34', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('18', '3', '2019-07-27 21:21:52', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('19', '3', '2019-07-27 21:34:29', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('20', '3', '2019-07-27 21:35:17', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('21', '3', '2019-07-27 21:35:48', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('22', '3', '2019-07-27 21:40:33', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('23', '3', '2019-08-18 16:00:38', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('24', '3', '2019-08-18 16:01:06', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('25', '3', '2019-08-18 16:47:01', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('26', '3', '2019-10-06 15:54:23', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('27', '3', '2019-10-06 16:03:28', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('28', '3', '2019-10-06 16:04:51', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('29', '3', '2019-10-06 16:06:44', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('30', '3', '2019-10-06 16:14:51', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('31', '1', '2019-10-06 16:15:09', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('32', '1', '2019-10-06 16:16:14', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('33', '3', '2019-10-06 16:16:35', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('34', '3', '2019-10-06 16:16:42', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('35', '3', '2019-10-07 15:20:48', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('36', '3', '2019-10-07 15:40:07', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('37', '3', '2019-10-07 16:34:15', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('38', '3', '2019-10-09 21:19:08', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('39', '4', '2019-10-09 21:30:35', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('40', '4', '2019-10-09 21:31:30', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('41', '4', '2019-10-09 21:32:39', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('42', '4', '2019-10-09 21:33:27', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('43', '4', '2019-10-09 21:33:50', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('44', '3', '2019-10-20 16:02:53', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('45', '3', '2019-10-23 21:20:55', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('46', '3', '2019-10-27 21:41:45', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('47', '3', '2019-11-09 16:44:57', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('48', '3', '2019-11-09 16:46:56', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('49', '3', '2019-11-09 16:49:55', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('50', '3', '2019-11-23 14:17:16', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('51', '6', '2019-11-23 14:52:30', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('52', '3', '2019-11-23 15:07:24', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('53', '3', '2019-11-30 21:25:30', '192.168.3.185', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('54', '3', '2019-11-30 21:27:54', '192.168.3.185', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('55', '3', '2019-12-28 15:23:01', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('56', '3', '2020-01-01 15:21:46', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('57', '3', '2020-01-04 16:00:54', '192.168.3.185', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('58', '3', '2020-02-01 15:05:19', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('59', '3', '2020-02-01 15:36:05', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('60', '3', '2020-02-01 15:36:36', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('61', '3', '2020-02-01 15:37:30', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('62', '3', '2020-02-01 15:37:46', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('63', '3', '2020-02-01 15:38:20', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('64', '3', '2020-02-01 15:38:33', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('65', '3', '2020-02-01 15:39:06', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('66', '3', '2020-02-01 15:41:31', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('67', '3', '2020-02-01 15:43:17', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('68', '3', '2020-02-01 15:44:34', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('69', '3', '2020-02-01 15:45:10', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('70', '3', '2020-02-01 15:46:04', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('71', '3', '2020-02-01 15:48:33', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('72', '3', '2020-02-01 16:00:07', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('73', '3', '2020-02-01 16:07:25', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('74', '3', '2020-02-01 16:08:22', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('75', '3', '2020-02-02 15:28:13', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('76', '3', '2020-02-02 15:44:37', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('77', '3', '2020-02-02 15:45:25', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('78', '3', '2020-02-02 15:52:32', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('79', '3', '2020-02-02 15:53:44', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('80', '3', '2020-02-02 15:54:36', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('81', '3', '2020-02-02 16:01:00', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('82', '3', '2020-02-02 16:05:19', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('83', '3', '2020-02-02 16:06:31', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('84', '3', '2020-02-02 16:17:26', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('85', '3', '2020-02-02 16:18:45', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('86', '3', '2020-02-02 16:19:05', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('87', '3', '2020-02-02 16:19:23', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('88', '3', '2020-02-02 16:22:27', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('89', '3', '2020-02-02 16:23:30', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('90', '3', '2020-02-02 16:23:48', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('91', '3', '2020-02-02 16:24:38', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('92', '3', '2020-02-02 16:25:22', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('93', '3', '2020-02-02 16:26:19', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('94', '3', '2020-02-02 16:26:31', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('95', '3', '2020-02-02 16:27:08', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('96', '3', '2020-02-02 16:31:02', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('97', '3', '2020-02-02 16:31:08', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('98', '3', '2020-02-02 16:31:25', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('99', '3', '2020-02-02 16:31:50', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('100', '3', '2020-02-02 16:33:22', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('101', '3', '2020-02-02 16:33:41', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('102', '3', '2020-02-02 16:34:58', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('103', '3', '2020-02-02 16:38:42', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('104', '3', '2020-02-02 16:39:41', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('105', '3', '2020-02-02 16:42:22', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('106', '3', '2020-02-02 16:46:21', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('107', '3', '2020-02-02 16:50:23', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('108', '3', '2020-02-02 16:51:11', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('109', '3', '2020-02-02 16:51:22', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('110', '3', '2020-02-02 16:52:00', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('111', '3', '2020-02-02 17:01:05', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('112', '3', '2020-02-03 10:43:22', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('113', '3', '2020-02-03 10:45:29', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('114', '3', '2020-02-03 10:46:33', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('115', '3', '2020-02-03 10:54:33', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('116', '3', '2020-02-03 14:24:47', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('117', '3', '2020-02-03 14:25:38', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('118', '5', '2020-02-03 15:22:28', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('119', '5', '2020-02-03 15:23:00', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('120', '5', '2020-02-03 15:24:29', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('121', '3', '2020-02-03 15:24:50', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('122', '5', '2020-02-03 15:27:18', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('123', '3', '2020-02-03 15:27:33', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('124', '3', '2020-02-03 15:29:06', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('125', '5', '2020-02-03 15:33:25', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('126', '3', '2020-02-03 15:33:51', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('127', '1', '2020-02-03 15:34:35', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('128', '3', '2020-02-03 15:34:47', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('129', '3', '2020-02-04 14:14:46', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('130', '3', '2020-02-05 10:33:35', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('131', '3', '2020-02-05 10:36:21', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('132', '3', '2020-02-05 16:34:37', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('133', '4', '2020-02-05 16:58:37', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('134', '3', '2020-02-05 16:59:03', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('135', '3', '2020-02-06 10:25:02', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('136', '3', '2020-02-07 14:34:34', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('137', '3', '2020-02-07 14:36:20', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('138', '1', '2020-02-07 14:43:34', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('139', '3', '2020-02-07 15:18:06', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('140', '3', '2020-02-07 15:20:07', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('141', '3', '2020-02-07 15:22:20', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('142', '3', '2020-02-07 15:22:28', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('143', '3', '2020-02-07 15:55:11', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('144', '3', '2020-02-07 15:56:04', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('145', '3', '2020-02-07 15:58:49', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('146', '6', '2020-02-07 16:16:21', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('147', '7', '2020-02-07 16:16:37', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('148', '3', '2020-02-07 16:18:39', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('149', '7', '2020-02-07 16:20:06', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('150', '3', '2020-02-07 16:20:44', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('151', '3', '2020-02-07 16:32:31', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('152', '3', '2020-02-07 19:32:34', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('153', '3', '2020-02-07 19:32:48', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('154', '3', '2020-02-07 19:33:01', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('155', '3', '2020-02-07 19:33:06', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('156', '3', '2020-02-07 19:33:21', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('157', '3', '2020-02-07 19:35:33', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('158', '3', '2020-02-07 19:37:10', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('159', '3', '2020-02-07 19:37:14', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('160', '3', '2020-02-07 19:37:25', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('161', '3', '2020-02-07 19:45:41', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('162', '3', '2020-02-07 19:47:45', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('163', '3', '2020-02-07 20:02:25', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('164', '6', '2020-02-07 20:10:55', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('165', '6', '2020-02-07 20:11:02', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('166', '6', '2020-02-07 20:13:44', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('167', '6', '2020-02-07 20:17:14', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('168', '3', '2020-02-07 20:17:44', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('169', '6', '2020-02-07 20:18:13', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('170', '3', '2020-02-10 10:28:14', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('171', '3', '2020-02-10 10:45:15', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('172', '3', '2020-02-10 10:57:46', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('173', '3', '2020-02-10 10:59:06', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('174', '3', '2020-02-10 11:04:19', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('175', '3', '2020-02-10 11:05:55', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('176', '3', '2020-02-10 11:06:45', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('177', '3', '2020-02-10 11:07:41', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('178', '3', '2020-02-10 11:08:13', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('179', '3', '2020-02-10 11:10:02', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('180', '6', '2020-02-10 14:25:17', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('181', '6', '2020-02-10 14:29:14', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('182', '3', '2020-02-10 16:09:16', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('183', '3', '2020-02-20 14:39:19', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('184', '8', '2020-02-20 17:14:58', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('185', '8', '2020-02-20 17:17:04', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('186', '8', '2020-02-20 17:17:42', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('187', '8', '2020-02-21 10:26:56', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('188', '8', '2020-02-21 10:28:54', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('189', '8', '2020-02-21 10:32:25', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('190', '8', '2020-02-21 10:33:41', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('191', '8', '2020-02-21 10:35:58', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('192', '8', '2020-02-21 10:36:49', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('193', '3', '2020-02-21 11:10:11', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('194', '3', '2020-02-25 16:11:13', '0:0:0:0:0:0:0:1', null, null);
INSERT INTO `ums_admin_login_log` VALUES ('195', '3', '2020-02-25 16:46:29', '0:0:0:0:0:0:0:1', null, null);*/

-- ----------------------------
-- Table structure for ums_admin_permission_relation
-- ----------------------------
DROP TABLE IF EXISTS `ums_admin_permission_relation`;
CREATE TABLE `ums_admin_permission_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `admin_id` bigint(20) DEFAULT NULL,
  `permission_id` bigint(20) DEFAULT NULL,
  `type` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='后台用户和权限关系表(除角色中定义的权限以外的加减权限)';

-- ----------------------------
-- Records of ums_admin_permission_relation
-- ----------------------------

-- ----------------------------
-- Table structure for ums_admin_role_relation
-- ----------------------------
DROP TABLE IF EXISTS `ums_admin_role_relation`;
CREATE TABLE `ums_admin_role_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `admin_id` bigint(20) DEFAULT NULL,
  `role_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='后台用户和角色关系表';

-- ----------------------------
-- Records of ums_admin_role_relation
-- ----------------------------
INSERT INTO `ums_admin_role_relation` VALUES ('26', '3', '5');
INSERT INTO `ums_admin_role_relation` VALUES ('27', '6', '1');
INSERT INTO `ums_admin_role_relation` VALUES ('28', '7', '2');
INSERT INTO `ums_admin_role_relation` VALUES ('29', '1', '5');
INSERT INTO `ums_admin_role_relation` VALUES ('30', '4', '5');

-- ----------------------------
-- Table structure for ums_growth_change_history
-- ----------------------------
DROP TABLE IF EXISTS `ums_growth_change_history`;
CREATE TABLE `ums_growth_change_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_id` bigint(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `change_type` int(1) DEFAULT NULL COMMENT '改变类型：0->增加；1->减少',
  `change_count` int(11) DEFAULT NULL COMMENT '积分改变数量',
  `operate_man` varchar(100) DEFAULT NULL COMMENT '操作人员',
  `operate_note` varchar(200) DEFAULT NULL COMMENT '操作备注',
  `source_type` int(1) DEFAULT NULL COMMENT '积分来源：0->购物；1->管理员修改',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='成长值变化历史记录表';

-- ----------------------------
-- Records of ums_growth_change_history
-- ----------------------------
INSERT INTO `ums_growth_change_history` VALUES ('1', '1', '2018-08-29 17:16:35', '0', '1000', 'test', '测试使用', '1');

-- ----------------------------
-- Table structure for ums_integration_change_history
-- ----------------------------
DROP TABLE IF EXISTS `ums_integration_change_history`;
CREATE TABLE `ums_integration_change_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_id` bigint(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `change_type` int(1) DEFAULT NULL COMMENT '改变类型：0->增加；1->减少',
  `change_count` int(11) DEFAULT NULL COMMENT '积分改变数量',
  `operate_man` varchar(100) DEFAULT NULL COMMENT '操作人员',
  `operate_note` varchar(200) DEFAULT NULL COMMENT '操作备注',
  `source_type` int(1) DEFAULT NULL COMMENT '积分来源：0->购物；1->管理员修改',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='积分变化历史记录表';

-- ----------------------------
-- Records of ums_integration_change_history
-- ----------------------------

-- ----------------------------
-- Table structure for ums_integration_consume_setting
-- ----------------------------
DROP TABLE IF EXISTS `ums_integration_consume_setting`;
CREATE TABLE `ums_integration_consume_setting` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `deduction_per_amount` int(11) DEFAULT NULL COMMENT '每一元需要抵扣的积分数量',
  `max_percent_per_order` int(11) DEFAULT NULL COMMENT '每笔订单最高抵用百分比',
  `use_unit` int(11) DEFAULT NULL COMMENT '每次使用积分最小单位100',
  `coupon_status` int(1) DEFAULT NULL COMMENT '是否可以和优惠券同用；0->不可以；1->可以',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='积分消费设置';

-- ----------------------------
-- Records of ums_integration_consume_setting
-- ----------------------------
INSERT INTO `ums_integration_consume_setting` VALUES ('1', '100', '50', '100', '1');

-- ----------------------------
-- Table structure for ums_member
-- ----------------------------
DROP TABLE IF EXISTS `ums_member`;
CREATE TABLE `ums_member` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_level_id` bigint(20) DEFAULT NULL,
  `username` varchar(64) DEFAULT NULL COMMENT '用户名',
  `password` varchar(64) DEFAULT NULL COMMENT '密码',
  `nickname` varchar(64) DEFAULT NULL COMMENT '昵称',
  `phone` varchar(64) DEFAULT NULL COMMENT '手机号码',
  `status` int(1) DEFAULT NULL COMMENT '帐号启用状态:0->禁用；1->启用',
  `create_time` datetime DEFAULT NULL COMMENT '注册时间',
  `icon` varchar(500) DEFAULT NULL COMMENT '头像',
  `gender` int(1) DEFAULT NULL COMMENT '性别：0->未知；1->男；2->女',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `city` varchar(64) DEFAULT NULL COMMENT '所做城市',
  `job` varchar(100) DEFAULT NULL COMMENT '职业',
  `personalized_signature` varchar(200) DEFAULT NULL COMMENT '个性签名',
  `source_type` int(1) DEFAULT NULL COMMENT '用户来源',
  `integration` int(11) DEFAULT NULL COMMENT '积分',
  `growth` int(11) DEFAULT NULL COMMENT '成长值',
  `luckey_count` int(11) DEFAULT NULL COMMENT '剩余抽奖次数',
  `history_integration` int(11) DEFAULT NULL COMMENT '历史积分数量',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_username` (`username`),
  UNIQUE KEY `idx_phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='会员表';

-- ----------------------------
-- Records of ums_member
-- ----------------------------
/*INSERT INTO `ums_member` VALUES ('1', '4', 'test', '$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/F.mXDbjZJi9HF0YCVG', 'windir', '18061581849', '1', '2018-08-02 10:35:44', null, '1', '2009-06-01', '上海', '学生', 'test', null, '5000', null, null, null);
INSERT INTO `ums_member` VALUES ('3', '4', 'windy', '$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/F.mXDbjZJi9HF0YCVG', 'windy', '18061581848', '1', '2018-08-03 16:46:38', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `ums_member` VALUES ('4', '4', 'zhengsan', '$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/F.mXDbjZJi9HF0YCVG', 'zhengsan', '18061581847', '1', '2018-11-12 14:12:04', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `ums_member` VALUES ('5', '4', 'lisi', '$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/F.mXDbjZJi9HF0YCVG', 'lisi', '18061581841', '1', '2018-11-12 14:12:38', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `ums_member` VALUES ('6', '4', 'wangwu', '$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/F.mXDbjZJi9HF0YCVG', 'wangwu', '18061581842', '1', '2018-11-12 14:13:09', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `ums_member` VALUES ('7', '4', 'lion', '$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/F.mXDbjZJi9HF0YCVG', 'lion', '18061581845', '1', '2018-11-12 14:21:39', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `ums_member` VALUES ('8', '4', 'shari', '$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/F.mXDbjZJi9HF0YCVG', 'shari', '18061581844', '1', '2018-11-12 14:22:00', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `ums_member` VALUES ('9', '4', 'aewen', '$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/F.mXDbjZJi9HF0YCVG', 'aewen', '18061581843', '1', '2018-11-12 14:22:55', null, null, null, null, null, null, null, null, null, null, null);*/

-- ----------------------------
-- Table structure for ums_member_level
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_level`;
CREATE TABLE `ums_member_level` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `growth_point` int(11) DEFAULT NULL,
  `default_status` int(1) DEFAULT NULL COMMENT '是否为默认等级：0->不是；1->是',
  `free_freight_point` decimal(10,2) DEFAULT NULL COMMENT '免运费标准',
  `comment_growth_point` int(11) DEFAULT NULL COMMENT '每次评价获取的成长值',
  `priviledge_free_freight` int(1) DEFAULT NULL COMMENT '是否有免邮特权',
  `priviledge_sign_in` int(1) DEFAULT NULL COMMENT '是否有签到特权',
  `priviledge_comment` int(1) DEFAULT NULL COMMENT '是否有评论获奖励特权',
  `priviledge_promotion` int(1) DEFAULT NULL COMMENT '是否有专享活动特权',
  `priviledge_member_price` int(1) DEFAULT NULL COMMENT '是否有会员价格特权',
  `priviledge_birthday` int(1) DEFAULT NULL COMMENT '是否有生日特权',
  `note` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='会员等级表';

-- ----------------------------
-- Records of ums_member_level
-- ----------------------------
/*INSERT INTO `ums_member_level` VALUES ('1', '黄金会员', '1000', '0', '199.00', '5', '1', '1', '1', '1', '1', '1', null);
INSERT INTO `ums_member_level` VALUES ('2', '白金会员', '5000', '0', '99.00', '10', '1', '1', '1', '1', '1', '1', null);
INSERT INTO `ums_member_level` VALUES ('3', '钻石会员', '15000', '0', '69.00', '15', '1', '1', '1', '1', '1', '1', null);
INSERT INTO `ums_member_level` VALUES ('4', '普通会员', '1', '1', '199.00', '20', '1', '1', '1', '1', '0', '0', null);*/

-- ----------------------------
-- Table structure for ums_member_login_log
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_login_log`;
CREATE TABLE `ums_member_login_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_id` bigint(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `ip` varchar(64) DEFAULT NULL,
  `city` varchar(64) DEFAULT NULL,
  `login_type` int(1) DEFAULT NULL COMMENT '登录类型：0->PC；1->android;2->ios;3->小程序',
  `province` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员登录记录';

-- ----------------------------
-- Records of ums_member_login_log
-- ----------------------------

-- ----------------------------
-- Table structure for ums_member_member_tag_relation
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_member_tag_relation`;
CREATE TABLE `ums_member_member_tag_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_id` bigint(20) DEFAULT NULL,
  `tag_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户和标签关系表';

-- ----------------------------
-- Records of ums_member_member_tag_relation
-- ----------------------------

-- ----------------------------
-- Table structure for ums_member_product_category_relation
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_product_category_relation`;
CREATE TABLE `ums_member_product_category_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_id` bigint(20) DEFAULT NULL,
  `product_category_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员与产品分类关系表（用户喜欢的分类）';

-- ----------------------------
-- Records of ums_member_product_category_relation
-- ----------------------------

-- ----------------------------
-- Table structure for ums_member_receive_address
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_receive_address`;
CREATE TABLE `ums_member_receive_address` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_id` bigint(20) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL COMMENT '收货人名称',
  `phone_number` varchar(64) DEFAULT NULL,
  `default_status` int(1) DEFAULT NULL COMMENT '是否为默认',
  `post_code` varchar(100) DEFAULT NULL COMMENT '邮政编码',
  `province` varchar(100) DEFAULT NULL COMMENT '省份/直辖市',
  `city` varchar(100) DEFAULT NULL COMMENT '城市',
  `region` varchar(100) DEFAULT NULL COMMENT '区',
  `detail_address` varchar(128) DEFAULT NULL COMMENT '详细地址(街道)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='会员收货地址表';

-- ----------------------------
-- Records of ums_member_receive_address
-- ----------------------------
/*INSERT INTO `ums_member_receive_address` VALUES ('1', '1', '大梨', '18033441849', '0', '518000', '广东省', '深圳市', '南山区', '科兴科学园');
INSERT INTO `ums_member_receive_address` VALUES ('3', '1', '大梨', '18033441849', '0', '518000', '广东省', '深圳市', '福田区', '清水河街道');
INSERT INTO `ums_member_receive_address` VALUES ('4', '1', '大梨', '18033441849', '1', '518000', '广东省', '深圳市', '福田区', '东晓街道');*/

-- ----------------------------
-- Table structure for ums_member_rule_setting
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_rule_setting`;
CREATE TABLE `ums_member_rule_setting` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `continue_sign_day` int(11) DEFAULT NULL COMMENT '连续签到天数',
  `continue_sign_point` int(11) DEFAULT NULL COMMENT '连续签到赠送数量',
  `consume_per_point` decimal(10,2) DEFAULT NULL COMMENT '每消费多少元获取1个点',
  `low_order_amount` decimal(10,2) DEFAULT NULL COMMENT '最低获取点数的订单金额',
  `max_point_per_order` int(11) DEFAULT NULL COMMENT '每笔订单最高获取点数',
  `type` int(1) DEFAULT NULL COMMENT '类型：0->积分规则；1->成长值规则',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员积分成长规则表';

-- ----------------------------
-- Records of ums_member_rule_setting
-- ----------------------------

-- ----------------------------
-- Table structure for ums_member_statistics_info
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_statistics_info`;
CREATE TABLE `ums_member_statistics_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_id` bigint(20) DEFAULT NULL,
  `consume_amount` decimal(10,2) DEFAULT NULL COMMENT '累计消费金额',
  `order_count` int(11) DEFAULT NULL COMMENT '订单数量',
  `coupon_count` int(11) DEFAULT NULL COMMENT '优惠券数量',
  `comment_count` int(11) DEFAULT NULL COMMENT '评价数',
  `return_order_count` int(11) DEFAULT NULL COMMENT '退货数量',
  `login_count` int(11) DEFAULT NULL COMMENT '登录次数',
  `attend_count` int(11) DEFAULT NULL COMMENT '关注数量',
  `fans_count` int(11) DEFAULT NULL COMMENT '粉丝数量',
  `collect_product_count` int(11) DEFAULT NULL,
  `collect_subject_count` int(11) DEFAULT NULL,
  `collect_topic_count` int(11) DEFAULT NULL,
  `collect_comment_count` int(11) DEFAULT NULL,
  `invite_friend_count` int(11) DEFAULT NULL,
  `recent_order_time` datetime DEFAULT NULL COMMENT '最后一次下订单时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员统计信息';

-- ----------------------------
-- Records of ums_member_statistics_info
-- ----------------------------

-- ----------------------------
-- Table structure for ums_member_tag
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_tag`;
CREATE TABLE `ums_member_tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `finish_order_count` int(11) DEFAULT NULL COMMENT '自动打标签完成订单数量',
  `finish_order_amount` decimal(10,2) DEFAULT NULL COMMENT '自动打标签完成订单金额',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户标签表';

-- ----------------------------
-- Records of ums_member_tag
-- ----------------------------

-- ----------------------------
-- Table structure for ums_member_task
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_task`;
CREATE TABLE `ums_member_task` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `growth` int(11) DEFAULT NULL COMMENT '赠送成长值',
  `intergration` int(11) DEFAULT NULL COMMENT '赠送积分',
  `type` int(1) DEFAULT NULL COMMENT '任务类型：0->新手任务；1->日常任务',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员任务表';

-- ----------------------------
-- Records of ums_member_task
-- ----------------------------

-- ----------------------------
-- Table structure for ums_menu
-- ----------------------------
DROP TABLE IF EXISTS `ums_menu`;
CREATE TABLE `ums_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父级ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `title` varchar(100) DEFAULT NULL COMMENT '菜单名称',
  `level` int(4) DEFAULT NULL COMMENT '菜单级数',
  `sort` int(4) DEFAULT NULL COMMENT '菜单排序',
  `name` varchar(100) DEFAULT NULL COMMENT '前端名称',
  `icon` varchar(200) DEFAULT NULL COMMENT '前端图标',
  `hidden` int(1) DEFAULT NULL COMMENT '前端隐藏',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='后台菜单表';

-- ----------------------------
-- Records of ums_menu
-- ----------------------------
INSERT INTO `ums_menu` VALUES ('1', '0', '2020-02-02 14:50:36', '商品', '0', '0', 'pms', 'product', '0');
INSERT INTO `ums_menu` VALUES ('2', '1', '2020-02-02 14:51:50', '商品列表', '1', '0', 'product', 'product-list', '0');
INSERT INTO `ums_menu` VALUES ('3', '1', '2020-02-02 14:52:44', '添加商品', '1', '0', 'addProduct', 'product-add', '0');
INSERT INTO `ums_menu` VALUES ('4', '1', '2020-02-02 14:53:51', '商品分类', '1', '0', 'productCate', 'product-cate', '0');
INSERT INTO `ums_menu` VALUES ('5', '1', '2020-02-02 14:54:51', '商品类型', '1', '0', 'productAttr', 'product-attr', '0');
INSERT INTO `ums_menu` VALUES ('6', '1', '2020-02-02 14:56:29', '品牌管理', '1', '0', 'brand', 'product-brand', '0');
INSERT INTO `ums_menu` VALUES ('7', '0', '2020-02-02 16:54:07', '订单', '0', '0', 'oms', 'order', '0');
INSERT INTO `ums_menu` VALUES ('8', '7', '2020-02-02 16:55:18', '订单列表', '1', '0', 'order', 'product-list', '0');
INSERT INTO `ums_menu` VALUES ('9', '7', '2020-02-02 16:56:46', '订单设置', '1', '0', 'orderSetting', 'order-setting', '0');
INSERT INTO `ums_menu` VALUES ('10', '7', '2020-02-02 16:57:39', '退货申请处理', '1', '0', 'returnApply', 'order-return', '0');
INSERT INTO `ums_menu` VALUES ('11', '7', '2020-02-02 16:59:40', '退货原因设置', '1', '0', 'returnReason', 'order-return-reason', '0');
INSERT INTO `ums_menu` VALUES ('12', '0', '2020-02-04 16:18:00', '营销', '0', '0', 'sms', 'sms', '0');
INSERT INTO `ums_menu` VALUES ('13', '12', '2020-02-04 16:19:22', '秒杀活动列表', '1', '0', 'flash', 'sms-flash', '0');
INSERT INTO `ums_menu` VALUES ('14', '12', '2020-02-04 16:20:16', '优惠券列表', '1', '0', 'coupon', 'sms-coupon', '0');
INSERT INTO `ums_menu` VALUES ('16', '12', '2020-02-07 16:22:38', '品牌推荐', '1', '0', 'homeBrand', 'product-brand', '0');
INSERT INTO `ums_menu` VALUES ('17', '12', '2020-02-07 16:23:14', '新品推荐', '1', '0', 'homeNew', 'sms-new', '0');
INSERT INTO `ums_menu` VALUES ('18', '12', '2020-02-07 16:26:38', '人气推荐', '1', '0', 'homeHot', 'sms-hot', '0');
INSERT INTO `ums_menu` VALUES ('19', '12', '2020-02-07 16:28:16', '专题推荐', '1', '0', 'homeSubject', 'sms-subject', '0');
INSERT INTO `ums_menu` VALUES ('20', '12', '2020-02-07 16:28:42', '广告列表', '1', '0', 'homeAdvertise', 'sms-ad', '0');
INSERT INTO `ums_menu` VALUES ('21', '0', '2020-02-07 16:29:13', '权限', '0', '0', 'ums', 'ums', '0');
INSERT INTO `ums_menu` VALUES ('22', '21', '2020-02-07 16:29:51', '用户列表', '1', '0', 'admin', 'ums-admin', '0');
INSERT INTO `ums_menu` VALUES ('23', '21', '2020-02-07 16:30:13', '角色列表', '1', '0', 'role', 'ums-role', '0');
INSERT INTO `ums_menu` VALUES ('24', '21', '2020-02-07 16:30:53', '菜单列表', '1', '0', 'menu', 'ums-menu', '0');
INSERT INTO `ums_menu` VALUES ('25', '21', '2020-02-07 16:31:13', '资源列表', '1', '0', 'resource', 'ums-resource', '0');

-- ----------------------------
-- Table structure for ums_permission
-- ----------------------------
DROP TABLE IF EXISTS `ums_permission`;
CREATE TABLE `ums_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pid` bigint(20) DEFAULT NULL COMMENT '父级权限id',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `value` varchar(200) DEFAULT NULL COMMENT '权限值',
  `icon` varchar(500) DEFAULT NULL COMMENT '图标',
  `type` int(1) DEFAULT NULL COMMENT '权限类型：0->目录；1->菜单；2->按钮（接口绑定权限）',
  `uri` varchar(200) DEFAULT NULL COMMENT '前端资源路径',
  `status` int(1) DEFAULT NULL COMMENT '启用状态；0->禁用；1->启用',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='后台用户权限表';

-- ----------------------------
-- Records of ums_permission
-- ----------------------------
INSERT INTO `ums_permission` VALUES ('1', '0', '商品', null, null, '0', null, '1', '2018-09-29 16:15:14', '0');
INSERT INTO `ums_permission` VALUES ('2', '1', '商品列表', 'pms:product:read', null, '1', '/pms/product/index', '1', '2018-09-29 16:17:01', '0');
INSERT INTO `ums_permission` VALUES ('3', '1', '添加商品', 'pms:product:create', null, '1', '/pms/product/add', '1', '2018-09-29 16:18:51', '0');
INSERT INTO `ums_permission` VALUES ('4', '1', '商品分类', 'pms:productCategory:read', null, '1', '/pms/productCate/index', '1', '2018-09-29 16:23:07', '0');
INSERT INTO `ums_permission` VALUES ('5', '1', '商品类型', 'pms:productAttribute:read', null, '1', '/pms/productAttr/index', '1', '2018-09-29 16:24:43', '0');
INSERT INTO `ums_permission` VALUES ('6', '1', '品牌管理', 'pms:brand:read', null, '1', '/pms/brand/index', '1', '2018-09-29 16:25:45', '0');
INSERT INTO `ums_permission` VALUES ('7', '2', '编辑商品', 'pms:product:update', null, '2', '/pms/product/updateProduct', '1', '2018-09-29 16:34:23', '0');
INSERT INTO `ums_permission` VALUES ('8', '2', '删除商品', 'pms:product:delete', null, '2', '/pms/product/delete', '1', '2018-09-29 16:38:33', '0');
INSERT INTO `ums_permission` VALUES ('9', '4', '添加商品分类', 'pms:productCategory:create', null, '2', '/pms/productCate/create', '1', '2018-09-29 16:43:23', '0');
INSERT INTO `ums_permission` VALUES ('10', '4', '修改商品分类', 'pms:productCategory:update', null, '2', '/pms/productCate/update', '1', '2018-09-29 16:43:55', '0');
INSERT INTO `ums_permission` VALUES ('11', '4', '删除商品分类', 'pms:productCategory:delete', null, '2', '/pms/productAttr/delete', '1', '2018-09-29 16:44:38', '0');
INSERT INTO `ums_permission` VALUES ('12', '5', '添加商品类型', 'pms:productAttribute:create', null, '2', '/pms/productAttr/create', '1', '2018-09-29 16:45:25', '0');
INSERT INTO `ums_permission` VALUES ('13', '5', '修改商品类型', 'pms:productAttribute:update', null, '2', '/pms/productAttr/update', '1', '2018-09-29 16:48:08', '0');
INSERT INTO `ums_permission` VALUES ('14', '5', '删除商品类型', 'pms:productAttribute:delete', null, '2', '/pms/productAttr/delete', '1', '2018-09-29 16:48:44', '0');
INSERT INTO `ums_permission` VALUES ('15', '6', '添加品牌', 'pms:brand:create', null, '2', '/pms/brand/add', '1', '2018-09-29 16:49:34', '0');
INSERT INTO `ums_permission` VALUES ('16', '6', '修改品牌', 'pms:brand:update', null, '2', '/pms/brand/update', '1', '2018-09-29 16:50:55', '0');
INSERT INTO `ums_permission` VALUES ('17', '6', '删除品牌', 'pms:brand:delete', null, '2', '/pms/brand/delete', '1', '2018-09-29 16:50:59', '0');
INSERT INTO `ums_permission` VALUES ('18', '0', '首页', null, null, '0', null, '1', '2018-09-29 16:51:57', '0');

-- ----------------------------
-- Table structure for ums_resource
-- ----------------------------
DROP TABLE IF EXISTS `ums_resource`;
CREATE TABLE `ums_resource` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `name` varchar(200) DEFAULT NULL COMMENT '资源名称',
  `url` varchar(200) DEFAULT NULL COMMENT '资源URL',
  `description` varchar(500) DEFAULT NULL COMMENT '描述',
  `category_id` bigint(20) DEFAULT NULL COMMENT '资源分类ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='后台资源表';

-- ----------------------------
-- Records of ums_resource
-- ----------------------------
INSERT INTO `ums_resource` VALUES ('1', '2020-02-04 17:04:55', '商品品牌管理', '/brand/**', null, '1');
INSERT INTO `ums_resource` VALUES ('2', '2020-02-04 17:05:35', '商品属性分类管理', '/productAttribute/**', null, '1');
INSERT INTO `ums_resource` VALUES ('3', '2020-02-04 17:06:13', '商品属性管理', '/productAttribute/**', null, '1');
INSERT INTO `ums_resource` VALUES ('4', '2020-02-04 17:07:15', '商品分类管理', '/productCategory/**', null, '1');
INSERT INTO `ums_resource` VALUES ('5', '2020-02-04 17:09:16', '商品管理', '/product/**', null, '1');
INSERT INTO `ums_resource` VALUES ('6', '2020-02-04 17:09:53', '商品库存管理', '/sku/**', null, '1');
INSERT INTO `ums_resource` VALUES ('8', '2020-02-05 14:43:37', '订单管理', '/order/**', '', '2');
INSERT INTO `ums_resource` VALUES ('9', '2020-02-05 14:44:22', ' 订单退货申请管理', '/returnApply/**', '', '2');
INSERT INTO `ums_resource` VALUES ('10', '2020-02-05 14:45:08', '退货原因管理', '/returnReason/**', '', '2');
INSERT INTO `ums_resource` VALUES ('11', '2020-02-05 14:45:43', '订单设置管理', '/orderSetting/**', '', '2');
INSERT INTO `ums_resource` VALUES ('12', '2020-02-05 14:46:23', '收货地址管理', '/companyAddress/**', '', '2');
INSERT INTO `ums_resource` VALUES ('13', '2020-02-07 16:37:22', '优惠券管理', '/coupon/**', '', '3');
INSERT INTO `ums_resource` VALUES ('14', '2020-02-07 16:37:59', '优惠券领取记录管理', '/couponHistory/**', '', '3');
INSERT INTO `ums_resource` VALUES ('15', '2020-02-07 16:38:28', '限时购活动管理', '/flash/**', '', '3');
INSERT INTO `ums_resource` VALUES ('16', '2020-02-07 16:38:59', '限时购商品关系管理', '/flashProductRelation/**', '', '3');
INSERT INTO `ums_resource` VALUES ('17', '2020-02-07 16:39:22', '限时购场次管理', '/flashSession/**', '', '3');
INSERT INTO `ums_resource` VALUES ('18', '2020-02-07 16:40:07', '首页轮播广告管理', '/home/advertise/**', '', '3');
INSERT INTO `ums_resource` VALUES ('19', '2020-02-07 16:40:34', '首页品牌管理', '/home/brand/**', '', '3');
INSERT INTO `ums_resource` VALUES ('20', '2020-02-07 16:41:06', '首页新品管理', '/home/newProduct/**', '', '3');
INSERT INTO `ums_resource` VALUES ('21', '2020-02-07 16:42:16', '首页人气推荐管理', '/home/recommendProduct/**', '', '3');
INSERT INTO `ums_resource` VALUES ('22', '2020-02-07 16:42:48', '首页专题推荐管理', '/home/recommendSubject/**', '', '3');
INSERT INTO `ums_resource` VALUES ('23', '2020-02-07 16:44:56', ' 商品优选管理', '/prefrenceArea/**', '', '5');
INSERT INTO `ums_resource` VALUES ('24', '2020-02-07 16:45:39', '商品专题管理', '/subject/**', '', '5');
INSERT INTO `ums_resource` VALUES ('25', '2020-02-07 16:47:34', '后台用户管理', '/admin/**', '', '4');
INSERT INTO `ums_resource` VALUES ('26', '2020-02-07 16:48:24', '后台用户角色管理', '/role/**', '', '4');
INSERT INTO `ums_resource` VALUES ('27', '2020-02-07 16:48:48', '后台菜单管理', '/menu/**', '', '4');
INSERT INTO `ums_resource` VALUES ('28', '2020-02-07 16:49:18', '后台资源分类管理', '/resourceCategory/**', '', '4');
INSERT INTO `ums_resource` VALUES ('29', '2020-02-07 16:49:45', '后台资源管理', '/resource/**', '', '4');

-- ----------------------------
-- Table structure for ums_resource_category
-- ----------------------------
DROP TABLE IF EXISTS `ums_resource_category`;
CREATE TABLE `ums_resource_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `name` varchar(200) DEFAULT NULL COMMENT '分类名称',
  `sort` int(4) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='资源分类表';

-- ----------------------------
-- Records of ums_resource_category
-- ----------------------------
INSERT INTO `ums_resource_category` VALUES ('1', '2020-02-05 10:21:44', '商品模块', '0');
INSERT INTO `ums_resource_category` VALUES ('2', '2020-02-05 10:22:34', '订单模块', '0');
INSERT INTO `ums_resource_category` VALUES ('3', '2020-02-05 10:22:48', '营销模块', '0');
INSERT INTO `ums_resource_category` VALUES ('4', '2020-02-05 10:23:04', '权限模块', '0');
INSERT INTO `ums_resource_category` VALUES ('5', '2020-02-07 16:34:27', '内容模块', '0');
INSERT INTO `ums_resource_category` VALUES ('6', '2020-02-07 16:35:49', '其他模块', '0');

-- ----------------------------
-- Table structure for ums_role
-- ----------------------------
DROP TABLE IF EXISTS `ums_role`;
CREATE TABLE `ums_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `description` varchar(500) DEFAULT NULL COMMENT '描述',
  `admin_count` int(11) DEFAULT NULL COMMENT '后台用户数量',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `status` int(1) DEFAULT '1' COMMENT '启用状态：0->禁用；1->启用',
  `sort` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='后台用户角色表';

-- ----------------------------
-- Records of ums_role
-- ----------------------------
INSERT INTO `ums_role` VALUES ('1', '商品管理员', '只能查看及操作商品', '0', '2020-02-03 16:50:37', '1', '0');
INSERT INTO `ums_role` VALUES ('2', '订单管理员', '只能查看及操作订单', '0', '2018-09-30 15:53:45', '1', '0');
INSERT INTO `ums_role` VALUES ('5', '超级管理员', '拥有所有查看和操作功能', '0', '2020-02-02 15:11:05', '1', '0');

-- ----------------------------
-- Table structure for ums_role_menu_relation
-- ----------------------------
DROP TABLE IF EXISTS `ums_role_menu_relation`;
CREATE TABLE `ums_role_menu_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8 COMMENT='后台角色菜单关系表';

-- ----------------------------
-- Records of ums_role_menu_relation
-- ----------------------------
INSERT INTO `ums_role_menu_relation` VALUES ('33', '1', '1');
INSERT INTO `ums_role_menu_relation` VALUES ('34', '1', '2');
INSERT INTO `ums_role_menu_relation` VALUES ('35', '1', '3');
INSERT INTO `ums_role_menu_relation` VALUES ('36', '1', '4');
INSERT INTO `ums_role_menu_relation` VALUES ('37', '1', '5');
INSERT INTO `ums_role_menu_relation` VALUES ('38', '1', '6');
INSERT INTO `ums_role_menu_relation` VALUES ('53', '2', '7');
INSERT INTO `ums_role_menu_relation` VALUES ('54', '2', '8');
INSERT INTO `ums_role_menu_relation` VALUES ('55', '2', '9');
INSERT INTO `ums_role_menu_relation` VALUES ('56', '2', '10');
INSERT INTO `ums_role_menu_relation` VALUES ('57', '2', '11');
INSERT INTO `ums_role_menu_relation` VALUES ('72', '5', '1');
INSERT INTO `ums_role_menu_relation` VALUES ('73', '5', '2');
INSERT INTO `ums_role_menu_relation` VALUES ('74', '5', '3');
INSERT INTO `ums_role_menu_relation` VALUES ('75', '5', '4');
INSERT INTO `ums_role_menu_relation` VALUES ('76', '5', '5');
INSERT INTO `ums_role_menu_relation` VALUES ('77', '5', '6');
INSERT INTO `ums_role_menu_relation` VALUES ('78', '5', '7');
INSERT INTO `ums_role_menu_relation` VALUES ('79', '5', '8');
INSERT INTO `ums_role_menu_relation` VALUES ('80', '5', '9');
INSERT INTO `ums_role_menu_relation` VALUES ('81', '5', '10');
INSERT INTO `ums_role_menu_relation` VALUES ('82', '5', '11');
INSERT INTO `ums_role_menu_relation` VALUES ('83', '5', '12');
INSERT INTO `ums_role_menu_relation` VALUES ('84', '5', '13');
INSERT INTO `ums_role_menu_relation` VALUES ('85', '5', '14');
INSERT INTO `ums_role_menu_relation` VALUES ('86', '5', '16');
INSERT INTO `ums_role_menu_relation` VALUES ('87', '5', '17');
INSERT INTO `ums_role_menu_relation` VALUES ('88', '5', '18');
INSERT INTO `ums_role_menu_relation` VALUES ('89', '5', '19');
INSERT INTO `ums_role_menu_relation` VALUES ('90', '5', '20');
INSERT INTO `ums_role_menu_relation` VALUES ('91', '5', '21');
INSERT INTO `ums_role_menu_relation` VALUES ('92', '5', '22');
INSERT INTO `ums_role_menu_relation` VALUES ('93', '5', '23');
INSERT INTO `ums_role_menu_relation` VALUES ('94', '5', '24');
INSERT INTO `ums_role_menu_relation` VALUES ('95', '5', '25');

-- ----------------------------
-- Table structure for ums_role_permission_relation
-- ----------------------------
DROP TABLE IF EXISTS `ums_role_permission_relation`;
CREATE TABLE `ums_role_permission_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL,
  `permission_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='后台用户角色和权限关系表';

-- ----------------------------
-- Records of ums_role_permission_relation
-- ----------------------------
INSERT INTO `ums_role_permission_relation` VALUES ('1', '1', '1');
INSERT INTO `ums_role_permission_relation` VALUES ('2', '1', '2');
INSERT INTO `ums_role_permission_relation` VALUES ('3', '1', '3');
INSERT INTO `ums_role_permission_relation` VALUES ('4', '1', '7');
INSERT INTO `ums_role_permission_relation` VALUES ('5', '1', '8');
INSERT INTO `ums_role_permission_relation` VALUES ('6', '2', '4');
INSERT INTO `ums_role_permission_relation` VALUES ('7', '2', '9');
INSERT INTO `ums_role_permission_relation` VALUES ('8', '2', '10');
INSERT INTO `ums_role_permission_relation` VALUES ('9', '2', '11');
INSERT INTO `ums_role_permission_relation` VALUES ('10', '3', '5');
INSERT INTO `ums_role_permission_relation` VALUES ('11', '3', '12');
INSERT INTO `ums_role_permission_relation` VALUES ('12', '3', '13');
INSERT INTO `ums_role_permission_relation` VALUES ('13', '3', '14');
INSERT INTO `ums_role_permission_relation` VALUES ('14', '4', '6');
INSERT INTO `ums_role_permission_relation` VALUES ('15', '4', '15');
INSERT INTO `ums_role_permission_relation` VALUES ('16', '4', '16');
INSERT INTO `ums_role_permission_relation` VALUES ('17', '4', '17');

-- ----------------------------
-- Table structure for ums_role_resource_relation
-- ----------------------------
DROP TABLE IF EXISTS `ums_role_resource_relation`;
CREATE TABLE `ums_role_resource_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `resource_id` bigint(20) DEFAULT NULL COMMENT '资源ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=178 DEFAULT CHARSET=utf8 COMMENT='后台角色资源关系表';

-- ----------------------------
-- Records of ums_role_resource_relation
-- ----------------------------
INSERT INTO `ums_role_resource_relation` VALUES ('103', '2', '8');
INSERT INTO `ums_role_resource_relation` VALUES ('104', '2', '9');
INSERT INTO `ums_role_resource_relation` VALUES ('105', '2', '10');
INSERT INTO `ums_role_resource_relation` VALUES ('106', '2', '11');
INSERT INTO `ums_role_resource_relation` VALUES ('107', '2', '12');
INSERT INTO `ums_role_resource_relation` VALUES ('142', '5', '1');
INSERT INTO `ums_role_resource_relation` VALUES ('143', '5', '2');
INSERT INTO `ums_role_resource_relation` VALUES ('144', '5', '3');
INSERT INTO `ums_role_resource_relation` VALUES ('145', '5', '4');
INSERT INTO `ums_role_resource_relation` VALUES ('146', '5', '5');
INSERT INTO `ums_role_resource_relation` VALUES ('147', '5', '6');
INSERT INTO `ums_role_resource_relation` VALUES ('148', '5', '8');
INSERT INTO `ums_role_resource_relation` VALUES ('149', '5', '9');
INSERT INTO `ums_role_resource_relation` VALUES ('150', '5', '10');
INSERT INTO `ums_role_resource_relation` VALUES ('151', '5', '11');
INSERT INTO `ums_role_resource_relation` VALUES ('152', '5', '12');
INSERT INTO `ums_role_resource_relation` VALUES ('153', '5', '13');
INSERT INTO `ums_role_resource_relation` VALUES ('154', '5', '14');
INSERT INTO `ums_role_resource_relation` VALUES ('155', '5', '15');
INSERT INTO `ums_role_resource_relation` VALUES ('156', '5', '16');
INSERT INTO `ums_role_resource_relation` VALUES ('157', '5', '17');
INSERT INTO `ums_role_resource_relation` VALUES ('158', '5', '18');
INSERT INTO `ums_role_resource_relation` VALUES ('159', '5', '19');
INSERT INTO `ums_role_resource_relation` VALUES ('160', '5', '20');
INSERT INTO `ums_role_resource_relation` VALUES ('161', '5', '21');
INSERT INTO `ums_role_resource_relation` VALUES ('162', '5', '22');
INSERT INTO `ums_role_resource_relation` VALUES ('163', '5', '23');
INSERT INTO `ums_role_resource_relation` VALUES ('164', '5', '24');
INSERT INTO `ums_role_resource_relation` VALUES ('165', '5', '25');
INSERT INTO `ums_role_resource_relation` VALUES ('166', '5', '26');
INSERT INTO `ums_role_resource_relation` VALUES ('167', '5', '27');
INSERT INTO `ums_role_resource_relation` VALUES ('168', '5', '28');
INSERT INTO `ums_role_resource_relation` VALUES ('169', '5', '29');
INSERT INTO `ums_role_resource_relation` VALUES ('170', '1', '1');
INSERT INTO `ums_role_resource_relation` VALUES ('171', '1', '2');
INSERT INTO `ums_role_resource_relation` VALUES ('172', '1', '3');
INSERT INTO `ums_role_resource_relation` VALUES ('173', '1', '4');
INSERT INTO `ums_role_resource_relation` VALUES ('174', '1', '5');
INSERT INTO `ums_role_resource_relation` VALUES ('175', '1', '6');
INSERT INTO `ums_role_resource_relation` VALUES ('176', '1', '23');
INSERT INTO `ums_role_resource_relation` VALUES ('177', '1', '24');
