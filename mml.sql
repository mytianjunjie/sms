/*
Navicat MySQL Data Transfer

Source Server         : jiaparts
Source Server Version : 50623
Source Host           : 172.23.16.30:3306
Source Database       : mml

Target Server Type    : MYSQL
Target Server Version : 50623
File Encoding         : 65001

Date: 2018-04-10 13:54:10
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for ad
-- ----------------------------
DROP TABLE IF EXISTS `ad`;
CREATE TABLE `ad` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `Summary` varchar(255) NOT NULL DEFAULT '' COMMENT '概述',
  `Content` longtext,
  `PcImgPath` varchar(255) NOT NULL DEFAULT '' COMMENT 'PC图片地址',
  `AppImgPath` varchar(255) NOT NULL DEFAULT '' COMMENT 'app图片地址',
  `IsTop` tinyint(4) unsigned NOT NULL DEFAULT '1' COMMENT '是否置顶（1-非置顶；2-置顶）',
  `IsLink` tinyint(4) unsigned NOT NULL DEFAULT '1' COMMENT '是否有链接（1-无；2-有）',
  `Sort` tinyint(6) unsigned NOT NULL DEFAULT '0' COMMENT '显示顺序',
  `IsDeleted` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除（0-有效；1-删除）',
  `StartTime` int(10) unsigned NOT NULL DEFAULT '0',
  `EndTime` int(10) unsigned NOT NULL DEFAULT '0',
  `CreateUID` int(11) unsigned NOT NULL DEFAULT '0',
  `CreateTime` int(10) unsigned NOT NULL DEFAULT '0',
  `UpdateUID` int(11) unsigned NOT NULL DEFAULT '0',
  `UpdateTime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `idx_istop` (`IsTop`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='广告表';

-- ----------------------------
-- Table structure for app_version
-- ----------------------------
DROP TABLE IF EXISTS `app_version`;
CREATE TABLE `app_version` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `OsType` varchar(64) DEFAULT '' COMMENT '操作系统(win_xp、win、android、ios）',
  `AppCode` varchar(50) NOT NULL DEFAULT '' COMMENT '应用编码（MML）',
  `VersionCode` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '内部版本号',
  `VersionName` varchar(20) NOT NULL DEFAULT '' COMMENT '外部版本号',
  `DownloadPath` varchar(255) NOT NULL DEFAULT '' COMMENT '最新版本下载地址',
  `PartDownloadPath` varchar(255) NOT NULL DEFAULT '' COMMENT '升级包下载地址',
  `PackageSize` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '安装包大小（以字节为单位）',
  `PartPackageSize` int(11) DEFAULT NULL COMMENT '升级包大小（以字节为单位）',
  `IsForcible` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '升级包是否强制升级（0-非强制；1-强制）',
  `Description` varchar(1000) NOT NULL DEFAULT '' COMMENT '升级信息描述',
  `OriImgPath` varchar(255) NOT NULL DEFAULT '' COMMENT '二维码图片地址',
  `ThumbImgPath` varchar(255) NOT NULL DEFAULT '' COMMENT '二维码图片缩略图地址',
  `Status` tinyint(4) unsigned NOT NULL DEFAULT '1' COMMENT '是否启用（1-启用；0-未启用）',
  `Rule` text COMMENT '灰度发布规则（以SQL形式描述）',
  PRIMARY KEY (`ID`),
  KEY `idx_appcode` (`AppCode`),
  KEY `idx_versioncode` (`VersionCode`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='客户端版本信息表';

-- ----------------------------
-- Table structure for beforehand_apply
-- ----------------------------
DROP TABLE IF EXISTS `beforehand_apply`;
CREATE TABLE `beforehand_apply` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `ApplyTyep` tinyint(4) NOT NULL DEFAULT '0' COMMENT '申请类型1、机构好友 2、联盟好友',
  `ApplyUID` int(11) NOT NULL DEFAULT '0' COMMENT '申请发起人',
  `ApplyOrganID` int(11) NOT NULL DEFAULT '0' COMMENT '申请发起机构',
  `ApplyUnionID` int(11) NOT NULL DEFAULT '0' COMMENT '申请发起联盟',
  `ReceiveObjectID` varchar(64) NOT NULL DEFAULT '' COMMENT '申请接收对象',
  `Status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='预申请表';

-- ----------------------------
-- Table structure for cim_customer
-- ----------------------------
DROP TABLE IF EXISTS `cim_customer`;
CREATE TABLE `cim_customer` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `OrganName` varchar(256) NOT NULL DEFAULT '' COMMENT '机构名称',
  `Telephone` varchar(128) NOT NULL DEFAULT '' COMMENT '联系电话',
  `Describe` varchar(1024) NOT NULL DEFAULT '' COMMENT '描述',
  `CreateOID` int(11) NOT NULL DEFAULT '0' COMMENT '创建机构ID',
  `CreateUID` int(11) NOT NULL DEFAULT '0' COMMENT '创建人用户ID',
  `CreateTime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `UpdateUID` int(11) NOT NULL DEFAULT '0' COMMENT '最后修改人用户ID',
  `UpdateTime` int(11) NOT NULL DEFAULT '0' COMMENT '最后修改时间',
  `IsDelete` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除标识(0-否；1-是)',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8 COMMENT='CIM客户表';

-- ----------------------------
-- Table structure for employee_label_relation
-- ----------------------------
DROP TABLE IF EXISTS `employee_label_relation`;
CREATE TABLE `employee_label_relation` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `EmployeeID` int(11) NOT NULL DEFAULT '0' COMMENT '员工ID',
  `LabelID` int(11) NOT NULL DEFAULT '0' COMMENT '标签ID',
  `CreateUID` int(11) NOT NULL DEFAULT '0' COMMENT '创建人用户ID',
  `CreateTime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `UpdateUID` int(11) NOT NULL DEFAULT '0' COMMENT '最后修改人用户ID',
  `UpdateTime` int(11) NOT NULL DEFAULT '0' COMMENT '最后修改时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='员工标签关系';

-- ----------------------------
-- Table structure for employee_tools_limit
-- ----------------------------
DROP TABLE IF EXISTS `employee_tools_limit`;
CREATE TABLE `employee_tools_limit` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `ToolsID` int(11) NOT NULL DEFAULT '0' COMMENT '工具集ID',
  `EmployeeID` int(11) NOT NULL DEFAULT '0' COMMENT '员工ID',
  `CreateUID` int(11) NOT NULL DEFAULT '0' COMMENT '创建人用户ID',
  `CreateTime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `UpdateUID` int(11) NOT NULL DEFAULT '0' COMMENT '最后修改人用户ID',
  `UpdateTime` int(11) NOT NULL DEFAULT '0' COMMENT '最后修改时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='员工工具集限制';

-- ----------------------------
-- Table structure for evaluation_tools
-- ----------------------------
DROP TABLE IF EXISTS `evaluation_tools`;
CREATE TABLE `evaluation_tools` (
  `OrganID` int(11) NOT NULL COMMENT '机构ID',
  `UserID` int(11) NOT NULL COMMENT '用户ID',
  `EvaluationMore` int(11) NOT NULL DEFAULT '0' COMMENT '配件查询总数',
  PRIMARY KEY (`OrganID`,`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='配件配置表';

-- ----------------------------
-- Table structure for label_organ_info
-- ----------------------------
DROP TABLE IF EXISTS `label_organ_info`;
CREATE TABLE `label_organ_info` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `LabelID` int(11) NOT NULL DEFAULT '0' COMMENT '标签ID',
  `OrganID` int(11) NOT NULL DEFAULT '0' COMMENT '机构ID',
  `UnionID` int(11) DEFAULT '0' COMMENT '联盟ID',
  `CreateUID` int(11) NOT NULL DEFAULT '0' COMMENT '创建人id',
  `CreateTime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1022 DEFAULT CHARSET=utf8 COMMENT='机构标签详情信息';

-- ----------------------------
-- Table structure for notify_log
-- ----------------------------
DROP TABLE IF EXISTS `notify_log`;
CREATE TABLE `notify_log` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `TargetBuiD` varchar(32) NOT NULL COMMENT '目标方BUID',
  `TargetPhone` varchar(32) NOT NULL COMMENT '目标方手机号码',
  `BusiType` varchar(64) NOT NULL DEFAULT '' COMMENT '业务类型码',
  `Seq` varchar(64) NOT NULL DEFAULT '' COMMENT '批次号',
  `Content` text NOT NULL COMMENT '发送内容',
  `ImStatus` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态（0-未送达、1-已送达）',
  `PushStatus` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态（0-未送达、1-已送达）',
  `BnsImResp` varchar(256) DEFAULT '' COMMENT 'BNS返回',
  `BnsPushResp` varchar(256) DEFAULT '' COMMENT 'BNS返回',
  `ReCount` int(11) NOT NULL DEFAULT '0' COMMENT '重发次数',
  `CreateTime` int(11) DEFAULT NULL COMMENT '创建时间',
  `NotifyTime` int(11) DEFAULT NULL COMMENT '发送时间',
  `BackStatus` tinyint(4) NOT NULL DEFAULT '1' COMMENT '回调状态（1-无需回调、2-等待回调、3-回调完成、4-回调失败）',
  `BackTime` int(11) DEFAULT NULL COMMENT '回调时间',
  `NextTime` int(11) NOT NULL DEFAULT '0' COMMENT '下次执行时间',
  `MaxReCount` int(11) NOT NULL DEFAULT '0' COMMENT '最大重发次数',
  `RsInterval` int(11) NOT NULL DEFAULT '0' COMMENT '重发间隔 单位:秒',
  PRIMARY KEY (`ID`),
  KEY `Idx_TargetBuiD` (`TargetBuiD`) USING BTREE,
  KEY `Idx_TargetPhone` (`TargetPhone`) USING BTREE,
  KEY `Idx_Seq` (`Seq`) USING BTREE,
  KEY `Idx_BackStatus` (`BackStatus`),
  KEY `Idx_NextTime` (`NextTime`)
) ENGINE=InnoDB AUTO_INCREMENT=20277 DEFAULT CHARSET=utf8 COMMENT='通知任务表';

-- ----------------------------
-- Table structure for notify_template
-- ----------------------------
DROP TABLE IF EXISTS `notify_template`;
CREATE TABLE `notify_template` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `Type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '消息类型 1、推送消息 2、透传消息',
  `BusiType` varchar(32) NOT NULL DEFAULT '' COMMENT '业务类型码',
  `Trigger` varchar(255) DEFAULT '' COMMENT '触发场景',
  `Receiving` varchar(255) DEFAULT '' COMMENT '接收对象',
  `Content` varchar(120) NOT NULL DEFAULT '' COMMENT '内容',
  `Operation` varchar(255) DEFAULT '' COMMENT '后续操作',
  `Title` varchar(32) NOT NULL DEFAULT '' COMMENT '标题',
  `Params` varchar(120) NOT NULL DEFAULT '' COMMENT '参数规范',
  `Status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态（0-失效、1-生效）',
  `IsBack` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否需要回调（0-不需要，1-需要）',
  `ContentStyle` varchar(120) NOT NULL DEFAULT '' COMMENT '内容样式',
  `SendMode` tinyint(4) NOT NULL DEFAULT '0' COMMENT '推送方式 （0-IM、第三方推送；1-IM推送；2-第三方推送）',
  `RsCount` int(11) NOT NULL DEFAULT '0' COMMENT '重发次数',
  `RsInterval` int(11) NOT NULL DEFAULT '0' COMMENT '重发间隔 单位:秒',
  `TimeoutSeconds` int(11) NOT NULL DEFAULT '-1' COMMENT '离线超时时间单位（秒）',
  PRIMARY KEY (`ID`),
  KEY `Idx_BusiType` (`BusiType`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8 COMMENT='通知模版';

-- ----------------------------
-- Table structure for operation_log
-- ----------------------------
DROP TABLE IF EXISTS `operation_log`;
CREATE TABLE `operation_log` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `AppCode` varchar(255) NOT NULL DEFAULT '' COMMENT '应用编码（android/ios/pc/web）',
  `AppVersion` varchar(255) NOT NULL DEFAULT '' COMMENT '应用版本号',
  `OSType` varchar(255) NOT NULL DEFAULT '' COMMENT '操作系统类型',
  `OSVersion` varchar(255) NOT NULL DEFAULT '' COMMENT '操作系统版本',
  `PhoneBrand` varchar(255) NOT NULL DEFAULT '' COMMENT '手机品牌',
  `PhoneModel` varchar(255) NOT NULL DEFAULT '' COMMENT '手机型号',
  `IMEI` varchar(255) NOT NULL DEFAULT '' COMMENT 'imei码',
  `Browser` varchar(255) NOT NULL DEFAULT '' COMMENT '浏览器名称',
  `BrowserVersion` varchar(255) NOT NULL DEFAULT '' COMMENT '浏览器版本',
  `ExtInfo` varchar(1000) NOT NULL DEFAULT '1' COMMENT '其他信息',
  `CreateTime` bigint(13) unsigned NOT NULL DEFAULT '0' COMMENT '操作时间',
  `Ip` varchar(20) NOT NULL DEFAULT '' COMMENT '登录ip',
  `Type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '类型(1-安装日志；2-打开注册页面的日志；3-打开登录页面的日志）',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6586 DEFAULT CHARSET=utf8 COMMENT='用户操作日志表';

-- ----------------------------
-- Table structure for organ
-- ----------------------------
DROP TABLE IF EXISTS `organ`;
CREATE TABLE `organ` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `OrganName` varchar(64) NOT NULL DEFAULT '' COMMENT '机构名称',
  `OrganAbbr` varchar(64) NOT NULL DEFAULT '' COMMENT '机构简称',
  `BossName` varchar(32) NOT NULL DEFAULT '' COMMENT '老板名称',
  `BossCellphone` char(11) NOT NULL DEFAULT '0' COMMENT '老板电话',
  `LogoPath` varchar(1024) NOT NULL DEFAULT '' COMMENT 'LOGO',
  `Telephone` varchar(128) NOT NULL DEFAULT '' COMMENT '联系电话',
  `Mmbno` varchar(64) NOT NULL DEFAULT '' COMMENT '收付嘉会员号',
  `Linkman` varchar(64) NOT NULL DEFAULT '' COMMENT '联系人',
  `BizTelephone` varchar(256) NOT NULL DEFAULT '' COMMENT '业务电话',
  `BusineScope` varchar(1024) NOT NULL DEFAULT '' COMMENT '经营范围',
  `QQ` varchar(32) NOT NULL DEFAULT '' COMMENT 'QQ号',
  `Fax` varchar(128) NOT NULL DEFAULT '' COMMENT '传真',
  `Email` varchar(64) NOT NULL DEFAULT '' COMMENT '邮箱',
  `ZipCode` varchar(32) NOT NULL DEFAULT '' COMMENT '邮编',
  `Province` int(11) NOT NULL DEFAULT '0' COMMENT '省份ID',
  `City` int(11) NOT NULL DEFAULT '0' COMMENT '城市ID',
  `District` int(11) NOT NULL DEFAULT '0' COMMENT '区县ID',
  `Address` varchar(256) NOT NULL DEFAULT '' COMMENT '详细地址',
  `Status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '冻结标识(0- 正常；1-冻结)',
  `IsDelete` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除标识(0-否；1-是)',
  `Referrer` varchar(128) NOT NULL DEFAULT '' COMMENT '推荐人',
  `IsTaxpayer` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否是纳税人',
  `Introduction` text COMMENT '机构介绍',
  `Pitches` text COMMENT '宣传语',
  `WeChat` varchar(64) NOT NULL DEFAULT '' COMMENT '微信',
  `BusinessLicence` varchar(64) NOT NULL DEFAULT '' COMMENT '机构营业执照号',
  `CreateUID` int(11) NOT NULL DEFAULT '0' COMMENT '创建人用户ID',
  `CreateTime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `UpdateUID` int(11) NOT NULL DEFAULT '0' COMMENT '最后修改人用户ID',
  `UpdateTime` int(11) NOT NULL DEFAULT '0' COMMENT '最后修改时间',
  `OrganTypes` varchar(255) NOT NULL DEFAULT '' COMMENT '机构类型多个,号分割',
  `EvaluationMore` int(11) NOT NULL DEFAULT '-1' COMMENT '可估价数量',
  `ProductNum` int(11) NOT NULL DEFAULT '0' COMMENT '商品数量',
  `CompeteRule` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否开启竞争对手功能（0-未开启、1-开启）',
  `IsFixed` tinyint(4) NOT NULL DEFAULT '0' COMMENT '常驻标识(0-否；1-是)',
  `IsPerfect` tinyint(4) NOT NULL DEFAULT '0' COMMENT '信息是否完善（0-否、1-是）',
  `PinYin` varchar(64) NOT NULL DEFAULT '' COMMENT '拼音',
  `LoginTime` int(11) NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `IsCertified` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否认真（0未认证1申请提交认证2已认证）',
  PRIMARY KEY (`ID`),
  KEY `Idx_OrganName` (`OrganName`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=175186 DEFAULT CHARSET=utf8 COMMENT='机构';

-- ----------------------------
-- Table structure for organ_activity
-- ----------------------------
DROP TABLE IF EXISTS `organ_activity`;
CREATE TABLE `organ_activity` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `Title` varchar(100) NOT NULL COMMENT '资讯标题',
  `OrganID` int(11) NOT NULL DEFAULT '0' COMMENT '发布机构',
  `Content` varchar(300) NOT NULL DEFAULT '' COMMENT '资讯内容',
  `Status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态（0发布，1草稿）',
  `IsOpen` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否公开（0公开，1不公开）',
  `Type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '资讯类型（0机构创建，1广告）',
  `Groups` varchar(255) NOT NULL DEFAULT '' COMMENT '设置联盟可见以,隔开（冗余）',
  `ForwardID` int(11) NOT NULL DEFAULT '0' COMMENT '转发资讯ID',
  `Forward` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否为转发（0-否；1-是）',
  `IsDelete` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否删除（0否，1是）',
  `Sort` int(11) NOT NULL DEFAULT '999' COMMENT '排序',
  `AOrganID` int(11) NOT NULL DEFAULT '0' COMMENT '咨询所属机构（默认是发布机构，转发的为资讯所属机构）',
  `Encryption` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否加密（0-否；1-是）',
  `Stime` int(11) NOT NULL DEFAULT '0' COMMENT '开始时间',
  `Etime` int(11) NOT NULL DEFAULT '0' COMMENT '截止时间',
  `CreateUID` int(11) NOT NULL DEFAULT '0' COMMENT '创建人用户ID',
  `CreateTime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `UpdateUID` int(11) NOT NULL DEFAULT '0' COMMENT '最后修改人用户ID',
  `UpdateTime` int(11) NOT NULL DEFAULT '0' COMMENT '最后修改时间',
  `VisibleRang` tinyint(4) NOT NULL DEFAULT '1' COMMENT '可见范围(0所有好友可见1部分好友可见)',
  `ClassifyName` varchar(64) NOT NULL DEFAULT '' COMMENT '分类名称',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=276 DEFAULT CHARSET=utf8 COMMENT='机构资讯信息表';

-- ----------------------------
-- Table structure for organ_activity_append
-- ----------------------------
DROP TABLE IF EXISTS `organ_activity_append`;
CREATE TABLE `organ_activity_append` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `Aid` int(11) NOT NULL COMMENT '资讯ID',
  `FileName` varchar(128) NOT NULL DEFAULT '' COMMENT '附件名',
  `FileUrl` varchar(128) NOT NULL DEFAULT '' COMMENT '附件地址',
  `FileSize` double(18,2) NOT NULL DEFAULT '0.00' COMMENT '附件大小',
  `FileType` varchar(128) NOT NULL DEFAULT '' COMMENT '附件类型',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8 COMMENT='资讯附件信息';

-- ----------------------------
-- Table structure for organ_activity_classify
-- ----------------------------
DROP TABLE IF EXISTS `organ_activity_classify`;
CREATE TABLE `organ_activity_classify` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `OrganID` int(11) NOT NULL DEFAULT '0' COMMENT '机构ID',
  `Sort` int(11) NOT NULL DEFAULT '999' COMMENT '排序号',
  `ClassifyName` varchar(64) NOT NULL DEFAULT '' COMMENT '分类名称',
  `CreateUID` int(11) NOT NULL DEFAULT '0' COMMENT '创建人用户ID',
  `CreateTime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `UpdateUID` int(11) NOT NULL DEFAULT '0' COMMENT '最后修改人用户ID',
  `UpdateTime` int(11) NOT NULL DEFAULT '0' COMMENT '最后修改时间',
  PRIMARY KEY (`ID`),
  KEY `Idx_OrganID` (`OrganID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COMMENT='机构资讯分类表';

-- ----------------------------
-- Table structure for organ_activity_classify_group
-- ----------------------------
DROP TABLE IF EXISTS `organ_activity_classify_group`;
CREATE TABLE `organ_activity_classify_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `GroupID` int(11) NOT NULL DEFAULT '0' COMMENT '分组ID',
  `CreateUID` int(11) NOT NULL DEFAULT '0' COMMENT '创建人id',
  `CreateTime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `ClassifyID` int(11) NOT NULL DEFAULT '0' COMMENT '分类ID',
  PRIMARY KEY (`ID`),
  KEY `Idx_ClassifyID` (`ClassifyID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8 COMMENT='机构分类分组详情信息';

-- ----------------------------
-- Table structure for organ_activity_collect
-- ----------------------------
DROP TABLE IF EXISTS `organ_activity_collect`;
CREATE TABLE `organ_activity_collect` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `CollectName` varchar(128) NOT NULL DEFAULT '' COMMENT '收藏夹名称',
  `OrganID` int(11) NOT NULL DEFAULT '0' COMMENT '机构ID',
  `CreateUID` int(11) NOT NULL DEFAULT '0' COMMENT '创建人用户ID',
  `CreateTime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `UpdateUID` int(11) NOT NULL DEFAULT '0' COMMENT '最后修改人用户ID',
  `UpdateTime` int(11) NOT NULL DEFAULT '0' COMMENT '最后修改时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COMMENT='资讯收藏表';

-- ----------------------------
-- Table structure for organ_activity_collect_info
-- ----------------------------
DROP TABLE IF EXISTS `organ_activity_collect_info`;
CREATE TABLE `organ_activity_collect_info` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `OrganID` int(11) NOT NULL DEFAULT '0' COMMENT '机构ID',
  `Cid` int(11) NOT NULL DEFAULT '0' COMMENT '收藏夹ID',
  `Aid` int(11) NOT NULL DEFAULT '0' COMMENT '资讯ID',
  `CreateUID` int(11) NOT NULL DEFAULT '0' COMMENT '创建人用户ID',
  `CreateTime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8 COMMENT='资讯收藏明细表';

-- ----------------------------
-- Table structure for organ_activity_permit
-- ----------------------------
DROP TABLE IF EXISTS `organ_activity_permit`;
CREATE TABLE `organ_activity_permit` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `OrganID` int(11) NOT NULL DEFAULT '0' COMMENT '可见机构id',
  `Aid` int(11) NOT NULL DEFAULT '0' COMMENT '资讯ID',
  `GroupID` int(11) NOT NULL DEFAULT '0' COMMENT '分组ID',
  `CreateUID` int(11) NOT NULL DEFAULT '0' COMMENT '创建人用户ID',
  `CreateTime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1784 DEFAULT CHARSET=utf8 COMMENT='资讯查看权限表';

-- ----------------------------
-- Table structure for organ_activity_permit_snapshot
-- ----------------------------
DROP TABLE IF EXISTS `organ_activity_permit_snapshot`;
CREATE TABLE `organ_activity_permit_snapshot` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `OrganID` int(11) NOT NULL DEFAULT '0' COMMENT '可见机构id',
  `Aid` int(11) NOT NULL DEFAULT '0' COMMENT '资讯ID',
  `UnionID` int(11) NOT NULL DEFAULT '0' COMMENT '分组ID',
  `CreateUID` int(11) NOT NULL DEFAULT '0' COMMENT '创建人用户ID',
  `CreateTime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`ID`),
  KEY `Idx_Aid` (`Aid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COMMENT='资讯查看权限快照表';

-- ----------------------------
-- Table structure for organ_category
-- ----------------------------
DROP TABLE IF EXISTS `organ_category`;
CREATE TABLE `organ_category` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `OrganID` int(11) NOT NULL DEFAULT '0' COMMENT '机构ID',
  `CategoryID` int(11) NOT NULL DEFAULT '0' COMMENT '品类ID',
  `CategoryName` varchar(128) NOT NULL DEFAULT '' COMMENT '品类名称',
  `Sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序号',
  `CreateUID` int(11) NOT NULL DEFAULT '0' COMMENT '创建人用户ID',
  `CreateTime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `UpdateUID` int(11) NOT NULL DEFAULT '0' COMMENT '最后修改人用户ID',
  `UpdateTime` int(11) NOT NULL DEFAULT '0' COMMENT '最后修改时间',
  PRIMARY KEY (`ID`),
  KEY `Idx_OrganID` (`OrganID`) USING BTREE,
  KEY `Idx_CategoryID` (`CategoryID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=60000254 DEFAULT CHARSET=utf8 COMMENT='机构主营品类';

-- ----------------------------
-- Table structure for organ_channel
-- ----------------------------
DROP TABLE IF EXISTS `organ_channel`;
CREATE TABLE `organ_channel` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `OrganID` int(11) NOT NULL DEFAULT '0' COMMENT '渠道商机构ID',
  `Province` int(11) NOT NULL DEFAULT '0' COMMENT '省ID',
  `City` int(11) NOT NULL DEFAULT '0' COMMENT '市ID',
  `IsDelete` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除标识(0-否；1-是)',
  `Industry` varchar(255) NOT NULL DEFAULT '' COMMENT '所属行业',
  `CreateTime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `CreateUID` int(11) NOT NULL DEFAULT '0' COMMENT '创建人',
  `UpdateTime` int(11) NOT NULL DEFAULT '0' COMMENT '修改时间',
  `UpdateUID` int(11) NOT NULL DEFAULT '0' COMMENT '修改人',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8 COMMENT='渠道商机构信息表';

-- ----------------------------
-- Table structure for organ_compete
-- ----------------------------
DROP TABLE IF EXISTS `organ_compete`;
CREATE TABLE `organ_compete` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `OrganID` int(11) NOT NULL DEFAULT '0' COMMENT '机构ID',
  `CompetePhone` char(11) NOT NULL DEFAULT '' COMMENT '竞争对手手机号码',
  `CompeteOrganID` int(11) NOT NULL DEFAULT '0' COMMENT '竞争对手机构ID',
  `CreateUID` int(11) NOT NULL DEFAULT '0' COMMENT '创建人用户ID',
  `CreateTime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `UpdateUID` int(11) NOT NULL DEFAULT '0' COMMENT '最后修改人用户ID',
  `UpdateTime` int(11) NOT NULL DEFAULT '0' COMMENT '最后修改时间',
  PRIMARY KEY (`ID`),
  KEY `Idx_OrganID` (`OrganID`) USING BTREE,
  KEY `Idx_CompeteOrganID` (`CompeteOrganID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8 COMMENT='机构竞争对手';

-- ----------------------------
-- Table structure for organ_developed
-- ----------------------------
DROP TABLE IF EXISTS `organ_developed`;
CREATE TABLE `organ_developed` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `OrganID` int(11) NOT NULL DEFAULT '0' COMMENT '机构ID',
  `EmployeeId` int(11) NOT NULL DEFAULT '0' COMMENT '员工ID',
  `DevelopedOrganID` int(11) NOT NULL DEFAULT '0' COMMENT '发展机构',
  `Status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `CreateUID` int(11) NOT NULL DEFAULT '0' COMMENT '创建人用户ID',
  `IsInvalid` tinyint(4) NOT NULL DEFAULT '0' COMMENT '失效标识(0-否；1-是)',
  `CreateTime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `UpdateUID` int(11) NOT NULL DEFAULT '0' COMMENT '最后修改人用户ID',
  `UpdateTime` int(11) NOT NULL DEFAULT '0' COMMENT '最后修改时间',
  `IsVisibleShare` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否可见共享好友（0否1是）',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Idx_OrganID_Developed` (`DevelopedOrganID`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8 COMMENT='发展机构';

-- ----------------------------
-- Table structure for organ_developed_code
-- ----------------------------
DROP TABLE IF EXISTS `organ_developed_code`;
CREATE TABLE `organ_developed_code` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `OrganID` int(11) NOT NULL DEFAULT '0' COMMENT '机构ID',
  `InvitationCode` varchar(64) NOT NULL DEFAULT '' COMMENT '邀请码',
  `Status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `DevelopedOrganID` int(11) NOT NULL DEFAULT '0' COMMENT '发展机构',
  `CreateTime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `CreateOID` int(11) NOT NULL DEFAULT '0' COMMENT '创建机构ID',
  `UpdateUID` int(11) NOT NULL DEFAULT '0' COMMENT '最后修改人用户ID',
  `UpdateTime` int(11) NOT NULL DEFAULT '0' COMMENT '最后修改时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8 COMMENT='发展人邀请码';

-- ----------------------------
-- Table structure for organ_employee
-- ----------------------------
DROP TABLE IF EXISTS `organ_employee`;
CREATE TABLE `organ_employee` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `OrganID` int(11) NOT NULL DEFAULT '0' COMMENT '机构ID',
  `UserID` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `Department` varchar(64) NOT NULL DEFAULT '' COMMENT '部门',
  `Position` varchar(64) NOT NULL DEFAULT '' COMMENT '职位',
  `EmployeeCode` varchar(64) NOT NULL DEFAULT '' COMMENT '工号',
  `OnlySeeEmployee` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否只看同事(0-否；1-是)',
  `IsHide` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否限制对外可见(0-否；1-是)',
  `IsDelete` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除标识(0-否；1-是)',
  `CreateUID` int(11) NOT NULL DEFAULT '0' COMMENT '创建人用户ID',
  `CreateTime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `UpdateUID` int(11) NOT NULL DEFAULT '0' COMMENT '最后修改人用户ID',
  `UpdateTime` int(11) NOT NULL DEFAULT '0' COMMENT '最后修改时间',
  `IsMain` tinyint(4) NOT NULL DEFAULT '0' COMMENT '主帐号标识(0-否；1-是)',
  `Telephone` varchar(128) NOT NULL DEFAULT '' COMMENT '联系电话',
  `Remarks` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `IsUpay` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否使用对账(0-否；1-是)',
  `Status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '冻结标识(0- 正常；1-冻结)',
  `BindStatus` tinyint(4) NOT NULL DEFAULT '0' COMMENT '绑定状态（0-已绑定；1-已解绑）',
  PRIMARY KEY (`ID`),
  KEY `Idx_OrganID` (`OrganID`) USING BTREE,
  KEY `Idx_UserID` (`UserID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=519 DEFAULT CHARSET=utf8 COMMENT='机构员工表';

-- ----------------------------
-- Table structure for organ_fix_limit
-- ----------------------------
DROP TABLE IF EXISTS `organ_fix_limit`;
CREATE TABLE `organ_fix_limit` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `UnionID` int(11) NOT NULL DEFAULT '0' COMMENT '联盟ID',
  `LimitType` tinyint(4) NOT NULL DEFAULT '0' COMMENT '限制类型(1-联盟好友；2-联盟成员)',
  `OrganID` int(11) NOT NULL DEFAULT '0' COMMENT '机构ID',
  `FixOrganID` int(11) NOT NULL DEFAULT '0' COMMENT '常驻机构ID',
  `IsDelete` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除标识(0-否；1-是)',
  `CreateUID` int(11) NOT NULL DEFAULT '0' COMMENT '创建人用户ID',
  `CreateTime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `UpdateUID` int(11) NOT NULL DEFAULT '0' COMMENT '最后修改人用户ID',
  `UpdateTime` int(11) NOT NULL DEFAULT '0' COMMENT '最后修改时间',
  PRIMARY KEY (`ID`),
  KEY `Idx_OrganID` (`OrganID`) USING BTREE,
  KEY `Idx_UnionID` (`UnionID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='常驻机构联盟限制';

-- ----------------------------
-- Table structure for organ_friends
-- ----------------------------
DROP TABLE IF EXISTS `organ_friends`;
CREATE TABLE `organ_friends` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `OrganID` int(11) NOT NULL DEFAULT '0' COMMENT '机构ID',
  `FriendOrganID` int(11) NOT NULL DEFAULT '0' COMMENT '好友机构ID',
  `ApplyUID` int(11) NOT NULL DEFAULT '0' COMMENT '申请人用户ID',
  `AgreeUID` int(11) NOT NULL DEFAULT '0' COMMENT '同意人用户ID',
  `ApplyTime` int(11) NOT NULL DEFAULT '0' COMMENT '申请时间',
  `AgreeTime` int(11) NOT NULL DEFAULT '0' COMMENT '同意时间',
  `IsShare` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否给发展的机构共享好友 0 不共享 1共享',
  `TradeRelation` tinyint(2) NOT NULL DEFAULT '0' COMMENT '交易关系（0其它1供应商2客户3同行）',
  PRIMARY KEY (`ID`),
  KEY `Idx_OrganID` (`OrganID`) USING BTREE,
  KEY `Idx_FriendOrganID` (`FriendOrganID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=432 DEFAULT CHARSET=utf8 COMMENT='机构好友';

-- ----------------------------
-- Table structure for organ_friends_apply
-- ----------------------------
DROP TABLE IF EXISTS `organ_friends_apply`;
CREATE TABLE `organ_friends_apply` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `FromUID` int(11) NOT NULL DEFAULT '0' COMMENT '发起请求的用户ID',
  `FromOrganID` int(11) NOT NULL DEFAULT '0' COMMENT '发起请求的机构ID',
  `ToOrganID` int(11) NOT NULL DEFAULT '0' COMMENT '请求的机构ID',
  `Status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `approver` int(11) NOT NULL DEFAULT '0' COMMENT '处理人',
  `CreateTime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `UpdateTime` int(11) NOT NULL DEFAULT '0' COMMENT '最后修改时间',
  `TradeRelation` tinyint(2) NOT NULL DEFAULT '0' COMMENT '交易关系（0其它1供应商2客户3同行）',
  PRIMARY KEY (`ID`),
  KEY `Idx_FromOrganID` (`FromOrganID`) USING BTREE,
  KEY `Idx_ToOrganID` (`ToOrganID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=268 DEFAULT CHARSET=utf8 COMMENT='机构好友申请表';

-- ----------------------------
-- Table structure for organ_friends_share
-- ----------------------------
DROP TABLE IF EXISTS `organ_friends_share`;
CREATE TABLE `organ_friends_share` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `ShareOrganID` int(11) NOT NULL DEFAULT '0' COMMENT '共享机构',
  `OrganID` int(11) NOT NULL DEFAULT '0' COMMENT '机构ID',
  `FriendOrganID` int(11) NOT NULL DEFAULT '0' COMMENT '好友机构ID',
  `CreateTime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`ID`),
  KEY `Idx_OrganID` (`OrganID`) USING BTREE,
  KEY `Idx_FriendOrganID` (`FriendOrganID`) USING BTREE,
  KEY `Idx_ShareOrganID` (`ShareOrganID`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8 COMMENT='机构好友共享表';

-- ----------------------------
-- Table structure for organ_group
-- ----------------------------
DROP TABLE IF EXISTS `organ_group`;
CREATE TABLE `organ_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `OrganID` int(11) NOT NULL DEFAULT '0' COMMENT '机构ID',
  `Sort` int(11) NOT NULL DEFAULT '999' COMMENT '排序号',
  `GroupName` varchar(64) NOT NULL DEFAULT '' COMMENT '分组名称',
  `CreateUID` int(11) NOT NULL DEFAULT '0' COMMENT '创建人用户ID',
  `CreateTime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `UpdateUID` int(11) NOT NULL DEFAULT '0' COMMENT '最后修改人用户ID',
  `UpdateTime` int(11) NOT NULL DEFAULT '0' COMMENT '最后修改时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=216 DEFAULT CHARSET=utf8 COMMENT='机构分组表';

-- ----------------------------
-- Table structure for organ_group_info
-- ----------------------------
DROP TABLE IF EXISTS `organ_group_info`;
CREATE TABLE `organ_group_info` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `GroupID` int(11) NOT NULL DEFAULT '0' COMMENT '分组ID',
  `OrganID` int(11) NOT NULL DEFAULT '0' COMMENT '机构ID',
  `CreateUID` int(11) NOT NULL DEFAULT '0' COMMENT '创建人id',
  `CreateTime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `UnionID` int(11) NOT NULL DEFAULT '0' COMMENT '联盟ID',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Inx_Group_Organ_Union` (`GroupID`,`OrganID`,`UnionID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1121 DEFAULT CHARSET=utf8 COMMENT='机构分组详情信息';

-- ----------------------------
-- Table structure for organ_intent_logistics
-- ----------------------------
DROP TABLE IF EXISTS `organ_intent_logistics`;
CREATE TABLE `organ_intent_logistics` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `OrganID` int(11) NOT NULL DEFAULT '0' COMMENT '机构ID',
  `Name` varchar(20) NOT NULL DEFAULT '' COMMENT '物流名称',
  `TelPhone` varchar(11) NOT NULL DEFAULT '' COMMENT '联系电话',
  `CreateUID` int(11) NOT NULL DEFAULT '0' COMMENT '创建人用户ID',
  `CreateTime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `UpdateUID` int(11) NOT NULL DEFAULT '0' COMMENT '最后修改人用户ID',
  `UpdateTime` int(11) NOT NULL DEFAULT '0' COMMENT '最后修改时间',
  PRIMARY KEY (`ID`),
  KEY `Idx_OrganID` (`OrganID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8 COMMENT='机构意向物流表';

-- ----------------------------
-- Table structure for organ_invoice_info
-- ----------------------------
DROP TABLE IF EXISTS `organ_invoice_info`;
CREATE TABLE `organ_invoice_info` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `OrganID` int(11) NOT NULL DEFAULT '0' COMMENT '机构ID',
  `CreditCode` varchar(64) NOT NULL DEFAULT '' COMMENT '企业统一社会信用代码',
  `BankCardNum` varchar(64) NOT NULL DEFAULT '' COMMENT '银卡开户账号',
  `BankName` varchar(64) NOT NULL DEFAULT '' COMMENT '银行开户行',
  `TaxpayerNum` varchar(64) NOT NULL DEFAULT '' COMMENT '纳税人识别号',
  `Province` int(11) NOT NULL DEFAULT '0' COMMENT '省份ID',
  `City` int(11) NOT NULL DEFAULT '0' COMMENT '城市ID',
  `District` int(11) NOT NULL DEFAULT '0' COMMENT '区县ID',
  `Address` varchar(256) NOT NULL DEFAULT '' COMMENT '详细地址',
  `IsDefault` tinyint(4) NOT NULL DEFAULT '0' COMMENT '默认标识(0-否；1-是)',
  `IsDelete` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除标识(0-否；1-是)',
  `CreateUID` int(11) NOT NULL DEFAULT '0' COMMENT '创建人用户ID',
  `CreateTime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `UpdateUID` int(11) NOT NULL DEFAULT '0' COMMENT '最后修改人用户ID',
  `UpdateTime` int(11) NOT NULL DEFAULT '0' COMMENT '最后修改时间',
  PRIMARY KEY (`ID`),
  KEY `Idx_OrganID` (`OrganID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='机构开票信息';

-- ----------------------------
-- Table structure for organ_label
-- ----------------------------
DROP TABLE IF EXISTS `organ_label`;
CREATE TABLE `organ_label` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `OrganID` int(11) NOT NULL DEFAULT '0' COMMENT '机构ID',
  `IsDefault` tinyint(4) NOT NULL DEFAULT '0' COMMENT '默认标识(0-否；1-是)',
  `LabelName` varchar(64) NOT NULL DEFAULT '' COMMENT '标签名称',
  `CreateUID` int(11) NOT NULL DEFAULT '0' COMMENT '创建人用户ID',
  `CreateTime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `UpdateUID` int(11) NOT NULL DEFAULT '0' COMMENT '最后修改人用户ID',
  `UpdateTime` int(11) NOT NULL DEFAULT '0' COMMENT '最后修改时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=194 DEFAULT CHARSET=utf8 COMMENT='机构定义标签';

-- ----------------------------
-- Table structure for organ_mmb
-- ----------------------------
DROP TABLE IF EXISTS `organ_mmb`;
CREATE TABLE `organ_mmb` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `OrganID` int(11) NOT NULL DEFAULT '0' COMMENT '机构ID',
  `Grade` int(11) NOT NULL DEFAULT '0' COMMENT '等级（0-注册企业；20-微型企业；30-小型企业；40-中型企业；50-大型企业）',
  `Ending` varchar(64) NOT NULL DEFAULT '' COMMENT '截至日期 yyyy-MM-dd',
  `AutoFee` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否开通自动续费（0-否；1-是）',
  `ChildTotal` int(11) NOT NULL DEFAULT '-1' COMMENT '后台设置子帐号数量（-1：未设置）',
  `ChildNlTotal` int(11) NOT NULL DEFAULT '-1' COMMENT '后台设置非冻结子帐号数量（-1：未设置）',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Idx_OrganID` (`OrganID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=229 DEFAULT CHARSET=utf8 COMMENT='机构会员信息表';

-- ----------------------------
-- Table structure for organ_mmb_cfg
-- ----------------------------
DROP TABLE IF EXISTS `organ_mmb_cfg`;
CREATE TABLE `organ_mmb_cfg` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `Grade` int(11) NOT NULL DEFAULT '0' COMMENT '等级（0-注册企业；20-微型企业；30-小型企业；40-中型企业；50-大型企业）',
  `GradeName` varchar(64) NOT NULL DEFAULT '' COMMENT '等级名称',
  `GradeDesc` varchar(225) NOT NULL DEFAULT '',
  `Fee` int(11) NOT NULL DEFAULT '0' COMMENT '嘉豆费率',
  `MonthDays` int(11) NOT NULL DEFAULT '0' COMMENT '自然月折合天数',
  `ChildTotal` int(11) NOT NULL DEFAULT '0' COMMENT '子帐号总数量（冻结+非冻结）',
  `ChildNlTotal` int(11) NOT NULL DEFAULT '0' COMMENT '子帐号正常数量（非冻结）',
  `Give` tinyint(4) NOT NULL DEFAULT '0' COMMENT '赠送开关（0-否；1-开）',
  `GiveMode` tinyint(4) NOT NULL DEFAULT '0' COMMENT '赠送方式（1-新用户注册）',
  `GiveMonths` int(11) NOT NULL DEFAULT '0' COMMENT '赠送月份',
  `CreateUID` int(11) NOT NULL DEFAULT '0' COMMENT '创建人用户ID',
  `CreateTime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `UpdateUID` int(11) NOT NULL DEFAULT '0' COMMENT '最后修改人用户ID',
  `UpdateTime` int(11) NOT NULL DEFAULT '0' COMMENT '最后修改时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='会员配置';

-- ----------------------------
-- Table structure for organ_mmb_history
-- ----------------------------
DROP TABLE IF EXISTS `organ_mmb_history`;
CREATE TABLE `organ_mmb_history` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `OrganID` int(11) NOT NULL DEFAULT '0' COMMENT '机构ID',
  `OrderID` int(11) NOT NULL DEFAULT '0' COMMENT '订单ID',
  `Grade` int(11) NOT NULL DEFAULT '0' COMMENT '等级（0-注册企业；20-微型企业；30-小型企业；40-中型企业；50-大型企业）',
  `Mode` tinyint(4) NOT NULL DEFAULT '0' COMMENT '方式（1-赠送；2-自动；3-操作；4-后台）',
  `Type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '类型（1-升级；2-降级）',
  `CreateUID` int(11) NOT NULL DEFAULT '0' COMMENT '创建人用户ID',
  `CreateTime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`ID`),
  KEY `Idx_OrganID` (`OrganID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=474 DEFAULT CHARSET=utf8 COMMENT='机构会员历史表';

-- ----------------------------
-- Table structure for organ_mmb_order
-- ----------------------------
DROP TABLE IF EXISTS `organ_mmb_order`;
CREATE TABLE `organ_mmb_order` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `OrderType` tinyint(4) NOT NULL DEFAULT '0' COMMENT '订单类型(1-续费订单；2-升级订单；3-续费&升级订单；4-降级订单)',
  `Grade` int(11) NOT NULL DEFAULT '0' COMMENT '当前等级（0-注册企业；20-微型企业；30-小型企业；40-中型企业；50-大型企业）',
  `NewGrade` int(11) NOT NULL DEFAULT '0' COMMENT '目标等级（0-注册企业；20-微型企业；30-小型企业；40-中型企业；50-大型企业）',
  `OrganID` int(11) NOT NULL DEFAULT '0' COMMENT '机构ID',
  `OrderSN` varchar(64) NOT NULL DEFAULT '' COMMENT '订单号',
  `TradeNo` varchar(64) NOT NULL DEFAULT '' COMMENT '收付嘉交易号',
  `TradeStatus` tinyint(4) NOT NULL DEFAULT '0' COMMENT '交易状态（0-待交易；1-交易成功；2-交易失败）',
  `OrderFee` int(11) NOT NULL DEFAULT '0' COMMENT '订单费率(嘉豆)',
  `Mode` tinyint(4) NOT NULL DEFAULT '0' COMMENT '方式（1-赠送；2-自动；3-操作）',
  `Months` int(11) NOT NULL DEFAULT '0' COMMENT '月数',
  `Days` int(11) NOT NULL DEFAULT '0' COMMENT '天数',
  `Remarks` varchar(255) NOT NULL DEFAULT '' COMMENT '订单备注',
  `CreateUID` int(11) NOT NULL DEFAULT '0' COMMENT '创建人用户ID',
  `CreateTime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`ID`),
  KEY `Idx_OrganID` (`OrganID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=296 DEFAULT CHARSET=utf8 COMMENT='机构会员订单';

-- ----------------------------
-- Table structure for organ_mmb_replace
-- ----------------------------
DROP TABLE IF EXISTS `organ_mmb_replace`;
CREATE TABLE `organ_mmb_replace` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `Type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '类型(1-续费；2-升级；3-续费&升级)',
  `Grade` int(11) NOT NULL DEFAULT '0' COMMENT '当前等级（0-注册企业；20-微型企业；30-小型企业；40-中型企业；50-大型企业）',
  `NewGrade` int(11) NOT NULL DEFAULT '0' COMMENT '目标等级（0-注册企业；20-微型企业；30-小型企业；40-中型企业；50-大型企业）',
  `Months` int(11) NOT NULL DEFAULT '0' COMMENT '月数',
  `UserID` int(11) NOT NULL DEFAULT '0' COMMENT '代付创建用户',
  `OrganID` int(11) NOT NULL DEFAULT '0' COMMENT '代付创建机构',
  `RUserID` int(11) NOT NULL DEFAULT '0' COMMENT '代付目标用户',
  `ROrganID` int(11) NOT NULL DEFAULT '0' COMMENT '代付目标机构',
  `OrderSN` varchar(64) NOT NULL DEFAULT '' COMMENT '对应订单号',
  `Fee` int(11) NOT NULL DEFAULT '0' COMMENT '费率快照(嘉豆)',
  `Describe` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `Status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态（0-未代付；1-已代付；8-失效）',
  `CreateTime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `InvalidTime` int(11) NOT NULL DEFAULT '0' COMMENT '失效时间',
  `PayFee` int(11) NOT NULL DEFAULT '0' COMMENT '支付费率',
  PRIMARY KEY (`ID`),
  KEY `Idx_OrganID` (`OrganID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='机构会员代付记录';

-- ----------------------------
-- Table structure for organ_module_visible
-- ----------------------------
DROP TABLE IF EXISTS `organ_module_visible`;
CREATE TABLE `organ_module_visible` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `OrganID` int(11) NOT NULL DEFAULT '0' COMMENT '机构ID',
  `Type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '可见功能（1我发展的用户2我共享的好友3我的竞争对手）',
  `CreateUID` int(11) NOT NULL DEFAULT '0' COMMENT '创建人用户ID',
  `CreateTime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`ID`),
  KEY `Idx_OrganID` (`OrganID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='机构可见功能设置表';

-- ----------------------------
-- Table structure for organ_photo
-- ----------------------------
DROP TABLE IF EXISTS `organ_photo`;
CREATE TABLE `organ_photo` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `OrganID` int(11) NOT NULL DEFAULT '0' COMMENT '机构ID',
  `PhotoType` tinyint(4) NOT NULL DEFAULT '0' COMMENT '图片类型（1-营业执照图片；2-门店图片）',
  `Path` varchar(256) NOT NULL DEFAULT '' COMMENT '路径',
  `ThumbPath` varchar(256) NOT NULL DEFAULT '' COMMENT '缩略图路径',
  `IsDelete` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除标识(0-否；1-是)',
  `IsCloud` tinyint(4) NOT NULL DEFAULT '0' COMMENT '云存储标识(0-否；1-是)',
  PRIMARY KEY (`ID`),
  KEY `Idx_OrganID` (`OrganID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=580 DEFAULT CHARSET=utf8 COMMENT='机构图片';

-- ----------------------------
-- Table structure for organ_receive_address
-- ----------------------------
DROP TABLE IF EXISTS `organ_receive_address`;
CREATE TABLE `organ_receive_address` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `OrganID` int(11) NOT NULL DEFAULT '0' COMMENT '机构ID',
  `Province` int(11) NOT NULL DEFAULT '0' COMMENT '省份ID',
  `City` int(11) NOT NULL DEFAULT '0' COMMENT '城市ID',
  `District` int(11) NOT NULL DEFAULT '0' COMMENT '区县ID',
  `ZipCode` varchar(32) NOT NULL DEFAULT '' COMMENT '邮编',
  `Address` varchar(256) NOT NULL DEFAULT '' COMMENT '详细地址',
  `IsDefault` tinyint(4) NOT NULL DEFAULT '0' COMMENT '默认标识(0-否；1-是)',
  `IsDelete` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除标识(0-否；1-是)',
  `CreateUID` int(11) NOT NULL DEFAULT '0' COMMENT '创建人用户ID',
  `CreateTime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `UpdateUID` int(11) NOT NULL DEFAULT '0' COMMENT '最后修改人用户ID',
  `UpdateTime` int(11) NOT NULL DEFAULT '0' COMMENT '最后修改时间',
  `Contact` varchar(20) NOT NULL DEFAULT '' COMMENT '联系人',
  `TelPhone` varchar(11) NOT NULL DEFAULT '' COMMENT '联系电话',
  `AddrAlias` varchar(128) NOT NULL DEFAULT '' COMMENT '地址别名',
  PRIMARY KEY (`ID`),
  KEY `Idx_OrganID` (`OrganID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8 COMMENT='机构收货地址';

-- ----------------------------
-- Table structure for organ_register_log
-- ----------------------------
DROP TABLE IF EXISTS `organ_register_log`;
CREATE TABLE `organ_register_log` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `AppCode` varchar(255) NOT NULL DEFAULT '' COMMENT '应用编码（android/ios/pc/web）',
  `AppVersion` varchar(255) NOT NULL DEFAULT '' COMMENT '应用版本号',
  `OSType` varchar(255) NOT NULL DEFAULT '' COMMENT '操作系统类型',
  `OSVersion` varchar(255) NOT NULL DEFAULT '' COMMENT '操作系统版本',
  `PhoneBrand` varchar(255) NOT NULL DEFAULT '' COMMENT '手机品牌',
  `PhoneModel` varchar(255) NOT NULL DEFAULT '' COMMENT '手机型号',
  `IMEI` varchar(255) NOT NULL DEFAULT '' COMMENT 'imei码',
  `Browser` varchar(255) NOT NULL DEFAULT '' COMMENT '浏览器名称',
  `BrowserVersion` varchar(255) NOT NULL DEFAULT '' COMMENT '浏览器版本',
  `ExtInfo` varchar(1000) NOT NULL DEFAULT '1' COMMENT '其他信息',
  `CreateTime` bigint(13) unsigned NOT NULL DEFAULT '0' COMMENT '操作时间',
  `Ip` varchar(20) NOT NULL DEFAULT '' COMMENT '登录ip',
  `RegisterStatus` tinyint(4) NOT NULL DEFAULT '0' COMMENT '注册状态（0-注册失败、1-注册成功）',
  `RegisterType` tinyint(4) NOT NULL DEFAULT '0' COMMENT '暂无',
  `RegisterInfo` varchar(1024) NOT NULL DEFAULT '' COMMENT '注册信息',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COMMENT='用户注册日志表';

-- ----------------------------
-- Table structure for organ_root_relation
-- ----------------------------
DROP TABLE IF EXISTS `organ_root_relation`;
CREATE TABLE `organ_root_relation` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `OrganID` int(11) NOT NULL DEFAULT '0' COMMENT '机构ID',
  `RootID` int(11) NOT NULL DEFAULT '0' COMMENT 'RootID',
  `CreateUID` int(11) NOT NULL DEFAULT '0' COMMENT '创建人用户ID',
  `CreateTime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `UpdateUID` int(11) NOT NULL DEFAULT '0' COMMENT '最后修改人用户ID',
  `UpdateTime` int(11) NOT NULL DEFAULT '0' COMMENT '最后修改时间',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Idx_OrganID_RootID` (`OrganID`,`RootID`) USING BTREE,
  KEY `Idx_OrganID` (`OrganID`) USING BTREE,
  KEY `Idx_RootID` (`RootID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1821 DEFAULT CHARSET=utf8 COMMENT='机构工具集关系';

-- ----------------------------
-- Table structure for organ_tools_relation
-- ----------------------------
DROP TABLE IF EXISTS `organ_tools_relation`;
CREATE TABLE `organ_tools_relation` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `OrganID` int(11) NOT NULL DEFAULT '0' COMMENT '机构ID',
  `Code` varchar(64) NOT NULL DEFAULT '' COMMENT 'Code',
  `Type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '类型（0-工具集；1-工具集类型）',
  `Sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序号',
  `CreateUID` int(11) NOT NULL DEFAULT '0' COMMENT '创建人用户ID',
  `CreateTime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `UpdateUID` int(11) NOT NULL DEFAULT '0' COMMENT '最后修改人用户ID',
  `UpdateTime` int(11) NOT NULL DEFAULT '0' COMMENT '最后修改时间',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Idx_oct` (`OrganID`,`Code`,`Type`),
  KEY `Idx_OrganID` (`OrganID`) USING BTREE,
  KEY `Idx_ToolsID` (`Code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=262947 DEFAULT CHARSET=utf8 COMMENT='机构工具集关系';

-- ----------------------------
-- Table structure for organ_tools_relation_bak
-- ----------------------------
DROP TABLE IF EXISTS `organ_tools_relation_bak`;
CREATE TABLE `organ_tools_relation_bak` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `OrganID` int(11) NOT NULL DEFAULT '0' COMMENT '机构ID',
  `ToolsID` int(11) NOT NULL DEFAULT '0' COMMENT '工具集ID',
  `Sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序号',
  `CreateUID` int(11) NOT NULL DEFAULT '0' COMMENT '创建人用户ID',
  `CreateTime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `UpdateUID` int(11) NOT NULL DEFAULT '0' COMMENT '最后修改人用户ID',
  `UpdateTime` int(11) NOT NULL DEFAULT '0' COMMENT '最后修改时间',
  PRIMARY KEY (`ID`),
  KEY `Idx_OrganID` (`OrganID`) USING BTREE,
  KEY `Idx_ToolsID` (`ToolsID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1865 DEFAULT CHARSET=utf8 COMMENT='机构工具集关系';

-- ----------------------------
-- Table structure for organ_vehicle
-- ----------------------------
DROP TABLE IF EXISTS `organ_vehicle`;
CREATE TABLE `organ_vehicle` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `OrganID` int(11) NOT NULL DEFAULT '0' COMMENT '机构ID',
  `BrandID` int(11) DEFAULT '0' COMMENT '品牌ID',
  `BrandName` varchar(256) NOT NULL DEFAULT '' COMMENT '品牌名称',
  `MakeID` int(11) NOT NULL DEFAULT '0' COMMENT '厂家ID',
  `MakeName` varchar(256) NOT NULL DEFAULT '' COMMENT '厂家名称',
  `SeriesID` int(11) NOT NULL DEFAULT '0' COMMENT '车系ID',
  `SeriesName` varchar(256) NOT NULL DEFAULT '' COMMENT '车系名称',
  `CreateUID` int(11) NOT NULL DEFAULT '0' COMMENT '创建人用户ID',
  `CreateTime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `UpdateUID` int(11) NOT NULL DEFAULT '0' COMMENT '最后修改人用户ID',
  `UpdateTime` int(11) NOT NULL DEFAULT '0' COMMENT '最后修改时间',
  PRIMARY KEY (`ID`),
  KEY `Idx_OrganID` (`OrganID`) USING BTREE,
  KEY `Idx_BrandID` (`BrandID`) USING BTREE,
  KEY `Idx_SeriesID` (`SeriesID`) USING BTREE,
  KEY `Idx_MakeID` (`MakeID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=673 DEFAULT CHARSET=utf8 COMMENT='机构主营车系';

-- ----------------------------
-- Table structure for rights_access
-- ----------------------------
DROP TABLE IF EXISTS `rights_access`;
CREATE TABLE `rights_access` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `AppType` tinyint(4) NOT NULL DEFAULT '0' COMMENT '等级（1-app；2-pc）',
  `AccessType` tinyint(4) NOT NULL DEFAULT '0' COMMENT '入口类型（1-简洁版；2-完整版；3-注册企业；4-微型企业；5-小型企业；6-中型企业；7-大型企业）',
  `CodeID` int(11) NOT NULL DEFAULT '0' COMMENT 'CodeID（0-所有）',
  `CreateUID` int(11) NOT NULL DEFAULT '0' COMMENT '创建人用户ID',
  `CreateTime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `UpdateUID` int(11) NOT NULL DEFAULT '0' COMMENT '最后修改人用户ID',
  `UpdateTime` int(11) NOT NULL DEFAULT '0' COMMENT '最后修改时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=486 DEFAULT CHARSET=utf8 COMMENT='应用入口权限配置';

-- ----------------------------
-- Table structure for rights_path
-- ----------------------------
DROP TABLE IF EXISTS `rights_path`;
CREATE TABLE `rights_path` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `AppType` tinyint(4) NOT NULL DEFAULT '0' COMMENT '等级（1-app；2-pc）',
  `Code` varchar(64) NOT NULL DEFAULT '' COMMENT '路径代码',
  `CodeDesc` varchar(225) NOT NULL DEFAULT '' COMMENT '路径描述',
  `Type` int(11) NOT NULL DEFAULT '0' COMMENT '类型（1-入口；2-页面；3-按钮）',
  `ParentID` int(11) NOT NULL DEFAULT '0' COMMENT '上级ID',
  `Remarks` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `Sort` int(11) NOT NULL DEFAULT '999' COMMENT '排序',
  `CreateUID` int(11) NOT NULL DEFAULT '0' COMMENT '创建人用户ID',
  `CreateTime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `UpdateUID` int(11) NOT NULL DEFAULT '0' COMMENT '最后修改人用户ID',
  `UpdateTime` int(11) NOT NULL DEFAULT '0' COMMENT '最后修改时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='应用入口配置';

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `Durl` varchar(255) DEFAULT NULL,
  `Application` varchar(50) DEFAULT NULL,
  `InterfaceName` varchar(50) DEFAULT NULL,
  `Version` varchar(50) DEFAULT NULL,
  `Method` varchar(50) DEFAULT NULL,
  `RetCode` varchar(50) DEFAULT NULL,
  `Req` varchar(2000) DEFAULT NULL,
  `Resp` varchar(2000) DEFAULT NULL,
  `BeginTime` varchar(20) DEFAULT NULL,
  `EndTime` varchar(20) DEFAULT NULL,
  `HandleTime` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tools
-- ----------------------------
DROP TABLE IF EXISTS `tools`;
CREATE TABLE `tools` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `ToolsName` varchar(64) NOT NULL DEFAULT '' COMMENT '工具集名称',
  `ToolsCode` varchar(64) NOT NULL DEFAULT '' COMMENT '工具集编码',
  `Icon` varchar(255) NOT NULL DEFAULT '' COMMENT '图标',
  `Link` varchar(128) NOT NULL DEFAULT '' COMMENT '链接',
  `TypeCode` varchar(64) NOT NULL DEFAULT '' COMMENT '类型代码',
  `IsFixed` tinyint(4) NOT NULL DEFAULT '0' COMMENT '常驻标识(0-否；1-是) 如为是，不允许管理',
  `IsOrganLimit` tinyint(4) NOT NULL DEFAULT '0' COMMENT '机构限制标识(0-否；1-是)如为1用户不允许自己管理',
  `IsEmployeeLimit` tinyint(4) NOT NULL DEFAULT '0' COMMENT '员工限制标识(0-否；1-是)1-只能老板可见',
  `IsFollowType` tinyint(4) NOT NULL DEFAULT '0' COMMENT '自由跟随类型（0-否；1-是）',
  `IsSimple` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否简洁版（0-否；1-是）',
  `IsHandleLimit` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否限制用户操作（0-否；1-是）',
  `Exclude` varchar(1024) NOT NULL DEFAULT '' COMMENT '排斥(类型-代码。多个;分割)',
  `Sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序号',
  `Explain` varchar(1024) NOT NULL DEFAULT '' COMMENT '工具集说明',
  `Describe` varchar(1024) NOT NULL DEFAULT '' COMMENT '描述',
  `CreateUID` int(11) NOT NULL DEFAULT '0' COMMENT '创建人用户ID',
  `CreateTime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `UpdateUID` int(11) NOT NULL DEFAULT '0' COMMENT '最后修改人用户ID',
  `UpdateTime` int(11) NOT NULL DEFAULT '0' COMMENT '最后修改时间',
  `AppCode` varchar(64) NOT NULL DEFAULT '' COMMENT '应用代码',
  `IsQuick` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否快捷工具（0-否；1-是）',
  PRIMARY KEY (`ID`),
  KEY `Idx_ToolsTypeID` (`TypeCode`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8 COMMENT='工具集';

-- ----------------------------
-- Table structure for tools_bak
-- ----------------------------
DROP TABLE IF EXISTS `tools_bak`;
CREATE TABLE `tools_bak` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `ToolsName` varchar(64) NOT NULL DEFAULT '' COMMENT '工具集名称',
  `ToolsCode` varchar(64) NOT NULL DEFAULT '' COMMENT '工具集编码',
  `Icon` varchar(255) NOT NULL DEFAULT '' COMMENT '图标',
  `Link` varchar(128) NOT NULL DEFAULT '' COMMENT '链接',
  `ToolsTypeID` int(11) NOT NULL DEFAULT '0' COMMENT '工具集类型ID',
  `IsFixed` tinyint(4) NOT NULL DEFAULT '0' COMMENT '常驻标识(0-否；1-是)',
  `IsOrganLimit` tinyint(4) NOT NULL DEFAULT '0' COMMENT '机构限制标识(0-否；1-是)',
  `IsEmployeeLimit` tinyint(4) NOT NULL DEFAULT '0' COMMENT '员工限制标识(0-否；1-是)',
  `Sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序号',
  `Describe` varchar(1024) NOT NULL DEFAULT '' COMMENT '描述',
  `CreateUID` int(11) NOT NULL DEFAULT '0' COMMENT '创建人用户ID',
  `CreateTime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `UpdateUID` int(11) NOT NULL DEFAULT '0' COMMENT '最后修改人用户ID',
  `UpdateTime` int(11) NOT NULL DEFAULT '0' COMMENT '最后修改时间',
  `AppCode` varchar(64) NOT NULL DEFAULT '' COMMENT '应用代码',
  `RootID` int(11) DEFAULT NULL,
  `Simple` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否简单版（0-否；1-是）',
  PRIMARY KEY (`ID`),
  KEY `Idx_ToolsTypeID` (`ToolsTypeID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COMMENT='工具集';

-- ----------------------------
-- Table structure for tools_root
-- ----------------------------
DROP TABLE IF EXISTS `tools_root`;
CREATE TABLE `tools_root` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `RootName` varchar(64) NOT NULL DEFAULT '' COMMENT 'Root名称',
  `RootCode` varchar(255) NOT NULL DEFAULT '' COMMENT 'Root代码',
  `CreateUID` int(11) NOT NULL DEFAULT '0' COMMENT '创建人用户ID',
  `CreateTime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `UpdateUID` int(11) NOT NULL DEFAULT '0' COMMENT '最后修改人用户ID',
  `UpdateTime` int(11) NOT NULL DEFAULT '0' COMMENT '最后修改时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='工具入口';

-- ----------------------------
-- Table structure for tools_type
-- ----------------------------
DROP TABLE IF EXISTS `tools_type`;
CREATE TABLE `tools_type` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `TypeCode` varchar(64) NOT NULL DEFAULT '' COMMENT '类型代码',
  `TypeName` varchar(64) NOT NULL DEFAULT '' COMMENT '类型名称',
  `Icon` varchar(255) NOT NULL DEFAULT '' COMMENT '图标',
  `Sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序号',
  `Explain` varchar(1024) NOT NULL DEFAULT '' COMMENT '说明',
  `CreateUID` int(11) NOT NULL DEFAULT '0' COMMENT '创建人用户ID',
  `CreateTime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `UpdateUID` int(11) NOT NULL DEFAULT '0' COMMENT '最后修改人用户ID',
  `UpdateTime` int(11) NOT NULL DEFAULT '0' COMMENT '最后修改时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='工具集类型';

-- ----------------------------
-- Table structure for tools_type_bak
-- ----------------------------
DROP TABLE IF EXISTS `tools_type_bak`;
CREATE TABLE `tools_type_bak` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `TypeName` varchar(64) NOT NULL DEFAULT '' COMMENT '类型名称',
  `Icon` varchar(255) NOT NULL DEFAULT '' COMMENT '图标',
  `Sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序号',
  `CreateUID` int(11) NOT NULL DEFAULT '0' COMMENT '创建人用户ID',
  `CreateTime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `UpdateUID` int(11) NOT NULL DEFAULT '0' COMMENT '最后修改人用户ID',
  `UpdateTime` int(11) NOT NULL DEFAULT '0' COMMENT '最后修改时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='工具集类型';

-- ----------------------------
-- Table structure for union
-- ----------------------------
DROP TABLE IF EXISTS `union`;
CREATE TABLE `union` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `UnionType` tinyint(4) NOT NULL DEFAULT '0' COMMENT '联盟类型(1-买家联盟；2-卖家联盟)',
  `UnionCode` varchar(64) NOT NULL DEFAULT '' COMMENT '联盟代码',
  `UnionName` varchar(64) NOT NULL DEFAULT '' COMMENT '联盟名称',
  `Telephone` varchar(128) NOT NULL DEFAULT '' COMMENT '联系电话',
  `LogoPath` varchar(1024) NOT NULL DEFAULT '' COMMENT 'LOGO',
  `UnionOrganID` int(11) NOT NULL DEFAULT '0' COMMENT '联盟所属机构ID',
  `UnionUserID` int(11) NOT NULL DEFAULT '0' COMMENT '联盟所属机构主帐号(已废弃)',
  `SecretaryUserID` int(11) NOT NULL DEFAULT '0' COMMENT '联盟秘书长用户ID',
  `UnionStatus` int(11) NOT NULL DEFAULT '0' COMMENT '联盟状态(0-待审核；1-审核通过)',
  `Status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '冻结标识(0- 正常；1-冻结)',
  `IsDelete` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除标识(0-否；1-是)',
  `CreateUID` int(11) NOT NULL DEFAULT '0' COMMENT '创建人用户ID',
  `CreateOID` int(11) NOT NULL DEFAULT '0' COMMENT '创建机构ID',
  `CreateTime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `UpdateUID` int(11) NOT NULL DEFAULT '0' COMMENT '最后修改人用户ID',
  `UpdateTime` int(11) NOT NULL DEFAULT '0' COMMENT '最后修改时间',
  `Introduction` text COMMENT '介绍',
  `UnionPicture` varchar(1024) NOT NULL DEFAULT '' COMMENT '联盟图片(多个,分割)',
  `IsUnityPayment` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否统一支付（0-否、1-是）',
  `PinYin` varchar(64) NOT NULL DEFAULT '' COMMENT '拼音',
  `IsHide` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否可见（0可见1不可见）',
  PRIMARY KEY (`ID`),
  KEY `Idx_UnionOrganID` (`UnionOrganID`) USING BTREE,
  KEY `Idx_SecretaryUserID` (`SecretaryUserID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8 COMMENT='联盟表';

-- ----------------------------
-- Table structure for union_apply
-- ----------------------------
DROP TABLE IF EXISTS `union_apply`;
CREATE TABLE `union_apply` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `UnionID` int(11) NOT NULL DEFAULT '0' COMMENT '联盟ID',
  `UnionType` tinyint(4) NOT NULL DEFAULT '0' COMMENT '联盟类型(1-买家联盟；2-卖家联盟)',
  `UnionName` varchar(64) NOT NULL DEFAULT '' COMMENT '联盟名称',
  `Telephone` varchar(128) NOT NULL DEFAULT '' COMMENT '联系电话',
  `LogoPath` varchar(1024) NOT NULL DEFAULT '' COMMENT 'LOGO',
  `Introduction` text COMMENT '介绍',
  `UnionOrganID` int(11) NOT NULL DEFAULT '0' COMMENT '联盟所属机构ID',
  `UnionStatus` int(11) NOT NULL DEFAULT '0' COMMENT '联盟状态(0-待审核；1-审核通过)',
  `IsDelete` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除标识(0-否；1-是)',
  `CreateOID` int(11) NOT NULL DEFAULT '0' COMMENT '创建机构ID',
  `CreateUID` int(11) NOT NULL DEFAULT '0' COMMENT '创建人用户ID',
  `CreateTime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `Approver` int(11) NOT NULL DEFAULT '0' COMMENT '处理人（后台处理人）',
  `UpdateTime` int(11) NOT NULL DEFAULT '0' COMMENT '最后修改时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8 COMMENT='联盟申请表';

-- ----------------------------
-- Table structure for union_friends
-- ----------------------------
DROP TABLE IF EXISTS `union_friends`;
CREATE TABLE `union_friends` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `OrganID` int(11) NOT NULL DEFAULT '0' COMMENT '机构ID',
  `FriendUnionID` int(11) NOT NULL DEFAULT '0' COMMENT '好友联盟ID',
  `CreateUID` int(11) NOT NULL DEFAULT '0' COMMENT '创建人用户ID',
  `CreateTime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`ID`),
  KEY `Idx_OrganID` (`OrganID`) USING BTREE,
  KEY `Idx_FriendUnionID` (`FriendUnionID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=186 DEFAULT CHARSET=utf8 COMMENT='联盟好友';

-- ----------------------------
-- Table structure for union_friends_apply
-- ----------------------------
DROP TABLE IF EXISTS `union_friends_apply`;
CREATE TABLE `union_friends_apply` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `FromUID` int(11) NOT NULL DEFAULT '0' COMMENT '发起请求的用户ID',
  `FromOrganID` int(11) NOT NULL DEFAULT '0' COMMENT '发起请求的机构ID',
  `FromUnionID` int(11) NOT NULL DEFAULT '0' COMMENT '发起请求的联盟ID',
  `ToOrganID` int(11) NOT NULL DEFAULT '0' COMMENT '请求的机构ID',
  `Status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `Approver` int(11) NOT NULL DEFAULT '0' COMMENT '处理人',
  `CreateTime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `UpdateTime` int(11) NOT NULL DEFAULT '0' COMMENT '最后修改时间',
  `MakeID` varchar(512) NOT NULL DEFAULT '' COMMENT '联盟主营车系MakeID集合，以,隔开',
  PRIMARY KEY (`ID`),
  KEY `Idx_FromOrganID` (`FromOrganID`) USING BTREE,
  KEY `Idx_ToOrganID` (`ToOrganID`) USING BTREE,
  KEY `Idx_FromUnionID` (`FromUnionID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8 COMMENT='联盟好友申请表';

-- ----------------------------
-- Table structure for union_member
-- ----------------------------
DROP TABLE IF EXISTS `union_member`;
CREATE TABLE `union_member` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `UnionID` int(11) NOT NULL DEFAULT '0' COMMENT '联盟ID',
  `UnionCode` varchar(64) NOT NULL DEFAULT '' COMMENT '联盟代码',
  `OrganID` int(11) NOT NULL DEFAULT '0' COMMENT '机构ID',
  `CreateUID` int(11) NOT NULL DEFAULT '0' COMMENT '创建人用户ID',
  `CreateTime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `UpdateUID` int(11) NOT NULL DEFAULT '0' COMMENT '最后修改人用户ID',
  `UpdateTime` int(11) NOT NULL DEFAULT '0' COMMENT '最后修改时间',
  PRIMARY KEY (`ID`),
  KEY `Idx_UnionID` (`UnionID`) USING BTREE,
  KEY `Idx_OrganID` (`OrganID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=397 DEFAULT CHARSET=utf8 COMMENT='联盟成员表';

-- ----------------------------
-- Table structure for union_member_apply
-- ----------------------------
DROP TABLE IF EXISTS `union_member_apply`;
CREATE TABLE `union_member_apply` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `FromOrganID` int(11) NOT NULL DEFAULT '0' COMMENT '发起请求的机构ID',
  `FromUID` int(11) NOT NULL DEFAULT '0' COMMENT '发起请求的用户ID',
  `FromUnionID` int(11) NOT NULL DEFAULT '0' COMMENT '发起请求的联盟ID',
  `ToOrganID` int(11) NOT NULL DEFAULT '0' COMMENT '请求的机构ID',
  `Status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `CreateTime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `Approver` int(11) NOT NULL DEFAULT '0' COMMENT '处理人',
  `UpdateTime` int(11) NOT NULL DEFAULT '0' COMMENT '最后修改时间',
  PRIMARY KEY (`ID`),
  KEY `Idx_FromOrganID` (`FromOrganID`) USING BTREE,
  KEY `Idx_ToOrganID` (`ToOrganID`) USING BTREE,
  KEY `Idx_FromUnionID` (`FromUnionID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='联盟成员申请表';

-- ----------------------------
-- Table structure for union_organ_vehicle
-- ----------------------------
DROP TABLE IF EXISTS `union_organ_vehicle`;
CREATE TABLE `union_organ_vehicle` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `UnionID` int(11) NOT NULL DEFAULT '0' COMMENT '联盟ID',
  `OrganID` int(11) NOT NULL DEFAULT '0' COMMENT '机构ID',
  `Type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '类型（1联盟好友2联盟成员）',
  `BrandID` int(11) NOT NULL DEFAULT '0' COMMENT '品牌ID',
  `BrandName` varchar(256) NOT NULL DEFAULT '' COMMENT '品牌名称',
  `MakeID` int(11) NOT NULL DEFAULT '0' COMMENT '厂家ID',
  `MakeName` varchar(256) NOT NULL DEFAULT '' COMMENT '厂家名称',
  `SeriesID` int(11) NOT NULL DEFAULT '0' COMMENT '车系ID',
  `SeriesName` varchar(256) NOT NULL DEFAULT '' COMMENT '车系名称',
  `CreateUID` int(11) NOT NULL DEFAULT '0' COMMENT '创建人用户ID',
  `CreateTime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `UpdateUID` int(11) NOT NULL DEFAULT '0' COMMENT '最后修改人用户ID',
  `UpdateTime` int(11) NOT NULL DEFAULT '0' COMMENT '最后修改时间',
  PRIMARY KEY (`ID`),
  KEY `Idx_OrganID` (`OrganID`) USING BTREE,
  KEY `Idx_UnionID` (`UnionID`) USING BTREE,
  KEY `Idx_MakeID` (`MakeID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=993 DEFAULT CHARSET=utf8 COMMENT='联盟机构主营车系';

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `UserName` varchar(64) NOT NULL DEFAULT '' COMMENT '用户名',
  `PassWord` varchar(128) NOT NULL DEFAULT '' COMMENT '密码',
  `BindPhone` char(11) NOT NULL DEFAULT '0' COMMENT '绑定手机',
  `OrganID` int(11) NOT NULL DEFAULT '0' COMMENT '机构ID',
  `Avatar` varchar(128) NOT NULL DEFAULT '' COMMENT '头像',
  `IsMain` tinyint(4) NOT NULL DEFAULT '0' COMMENT '主帐号标识(0-否；1-是)',
  `Status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '冻结标识(0- 正常；1-冻结)',
  `IsDelete` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除标识(0-否；1-是)',
  `StaffName` varchar(64) NOT NULL DEFAULT '' COMMENT '姓名',
  `Birthday` varchar(64) NOT NULL DEFAULT '' COMMENT '生日',
  `Gender` tinyint(4) NOT NULL DEFAULT '0' COMMENT '性别',
  `Remarks` varchar(256) NOT NULL DEFAULT '' COMMENT '备注',
  `QQ` varchar(32) NOT NULL DEFAULT '' COMMENT 'QQ号',
  `Email` varchar(64) NOT NULL DEFAULT '' COMMENT '邮箱',
  `WeChat` varchar(64) NOT NULL DEFAULT '' COMMENT '微信',
  `BnsNo` varchar(64) NOT NULL DEFAULT '' COMMENT 'BNS号',
  `JID` varchar(64) NOT NULL DEFAULT '' COMMENT '用户JID',
  `OrganName` varchar(256) NOT NULL DEFAULT '' COMMENT '机构名称',
  `Telephone` varchar(128) NOT NULL DEFAULT '' COMMENT '联系电话',
  `NickName` varchar(64) NOT NULL DEFAULT '' COMMENT '昵称',
  `BuID` varchar(64) NOT NULL DEFAULT '' COMMENT 'BuID',
  `IsStaticNode` tinyint(4) NOT NULL DEFAULT '0' COMMENT '加入静态节点标识(0-否；1-是)',
  `InvitationCode` varchar(64) NOT NULL DEFAULT '' COMMENT '邀请码',
  `WorkStatus` tinyint(4) NOT NULL DEFAULT '1' COMMENT '工作状态（0-离线；1-在线；2-离开；3-忙碌）',
  `InvitationInfo` varchar(128) NOT NULL DEFAULT '' COMMENT '邀请信息描述    类型=参数',
  `Simple` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否简单版（0-否；1-是）',
  `PinYin` varchar(64) NOT NULL DEFAULT '' COMMENT '拼音',
  `LoginTime` int(11) NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  PRIMARY KEY (`ID`),
  KEY `Idx_OrganID` (`OrganID`) USING BTREE,
  KEY `Idx_BindPhone` (`BindPhone`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6286 DEFAULT CHARSET=utf8 COMMENT='用户';

-- ----------------------------
-- Table structure for user_login_log
-- ----------------------------
DROP TABLE IF EXISTS `user_login_log`;
CREATE TABLE `user_login_log` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `AppCode` varchar(255) NOT NULL DEFAULT '' COMMENT '应用编码（android/ios/pc/web）',
  `AppVersion` varchar(255) NOT NULL DEFAULT '' COMMENT '应用版本号',
  `OSType` varchar(255) NOT NULL DEFAULT '' COMMENT '操作系统类型',
  `OSVersion` varchar(255) NOT NULL DEFAULT '' COMMENT '操作系统版本',
  `PhoneBrand` varchar(255) NOT NULL DEFAULT '' COMMENT '手机品牌',
  `PhoneModel` varchar(255) NOT NULL DEFAULT '' COMMENT '手机型号',
  `IMEI` varchar(255) NOT NULL DEFAULT '' COMMENT 'imei码',
  `Browser` varchar(255) NOT NULL DEFAULT '' COMMENT '浏览器名称',
  `BrowserVersion` varchar(255) NOT NULL DEFAULT '' COMMENT '浏览器版本',
  `ExtInfo` varchar(1000) NOT NULL DEFAULT '1' COMMENT '其他信息',
  `Token` varchar(200) NOT NULL DEFAULT '',
  `CreateTime` bigint(13) unsigned NOT NULL DEFAULT '0' COMMENT '操作时间',
  `Ip` varchar(20) NOT NULL DEFAULT '' COMMENT '登录ip',
  `UserID` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `LoginStatus` tinyint(4) NOT NULL DEFAULT '0' COMMENT '登录状态（0-登录失败、1-登录成功）',
  `LoginType` tinyint(4) NOT NULL DEFAULT '0' COMMENT '登录方式（1-账户登录；2-手机验证码登录；3-token登录）',
  `LoginAccounts` varchar(255) NOT NULL DEFAULT '' COMMENT '登录帐号',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5594 DEFAULT CHARSET=utf8 COMMENT='用户登录日志表';
