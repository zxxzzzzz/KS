
DROP DATABASE IF  EXISTS `roadLampControl`;
CREATE DATABASE  `roadLampControl`
CHARACTER SET 'utf8'
COLLATE 'utf8_general_ci';

USE `roadLampControl`;
-- -------------------------------------------------------------------------------------角色 权限 用户
DROP TABLE IF EXISTS `TBRole`;
CREATE TABLE `TBRole`(
`ID` INT(11) NOT NULL AUTO_INCREMENT,
`Name` VARCHAR(255) NOT NULL COMMENT '角色名称',
PRIMARY KEY (`ID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '角色';

DROP TABLE IF EXISTS `TBOperation`;
CREATE TABLE `TBOperation` (
`ID` INT(11) NOT NULL AUTO_INCREMENT,
`Name` VARCHAR(255) NOT NULL COMMENT '操作名称',
PRIMARY KEY (`ID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '操作权限';

DROP TABLE IF EXISTS `TBUser`;
CREATE TABLE `TBUser`(
`ID` INT(11) NOT NULL AUTO_INCREMENT,
`Name` VARCHAR(255) NOT NULL COMMENT '用户名称',
`Password` VARCHAR(255) NOT NULL COMMENT '密码',
PRIMARY KEY (`ID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '用户';

DROP TABLE IF EXISTS `TBRole2Operation`;
CREATE TABLE `TBRole2Operation`(
`ID` INT(11) NOT NULL AUTO_INCREMENT,
`RoleID` INT(11) NOT NULL COMMENT '角色编号',
`OperationID` INT(11) NOT NULL COMMENT '操作编号',
PRIMARY KEY (`ID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '角色操作对照表';

DROP TABLE IF EXISTS `TBUser2Role`;
CREATE TABLE `TBUser2Role`(
`ID` INT(11) NOT NULL AUTO_INCREMENT,
`UserID` INT(11)  NOT NULL COMMENT '用户编号',
`RoleID` INT(11)  NOT NULL COMMENT '角色编号',
PRIMARY KEY (`ID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '用户角色对照表';



-- ------------------------------------------------------------------------------------------------------角色 权限 用户



-- ------------------------------------------------------------------------------------------------------省 市 县


DROP TABLE IF EXISTS `TBProvince`;
CREATE TABLE `TBProvince`(
`ID` INT(11) NOT NULL ,
`Name` VARCHAR(255) NOT NULL COMMENT'省的名称',
PRIMARY KEY (`ID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `TBCity`;
CREATE TABLE `TBCity`(
`ID` INT(11) NOT NULL ,
`Name` VARCHAR(255) NOT NULL COMMENT'市的名称',
`ProvinceID` INT(11)  NOT NULL COMMENT '所属省编号',
PRIMARY KEY (`ID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `TBCounty`;
CREATE TABLE `TBCounty`(
`ID` INT(11) NOT NULL ,
`Name` VARCHAR(255) NOT NULL COMMENT'县的名称',
`CityID` INT(11)  NOT NULL COMMENT '所属市编号',
PRIMARY KEY (`ID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- -------------------------------------------------------------------------------------------------------省 市 县

-- 输入项目名称  、负责人、电话、邮箱、地点（要求确定到市或者县）、数据库记录项目创建日期。
-- --------------------------------------------------------------------联系人
DROP TABLE IF EXISTS `TBContactPerson`;
CREATE TABLE `TBContactPerson`(
`ID` INT(11) NOT NULL AUTO_INCREMENT,
`Name` VARCHAR(255) NOT NULL COMMENT'名字',
`Phone` VARCHAR(255) NOT NULL COMMENT'联系电话',
`Mail` VARCHAR(255)  COMMENT'邮箱地址',
PRIMARY KEY (`ID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '联系人';
-- --------------------------------------------------------------------联系人



-- ---------------------------------------------------------------------项目
DROP TABLE IF EXISTS `TBProject`;
CREATE TABLE `TBProject`(
`ID` INT(11) NOT NULL AUTO_INCREMENT,
`Name` VARCHAR(255) NOT NULL COMMENT'项目名称',
`ContactPersonID` INT(11) NOT NULL COMMENT'所属联系人id',
`CountyID` INT(11) NOT NULL COMMENT'所属县id',
`CreateTime` DATETIME NOT NULL COMMENT'项目创建时间',
PRIMARY KEY (`ID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '项目';
-- --------------------------------------------------------------------------项目

-- ---------------------------------------------------------------------------线路
DROP TABLE IF EXISTS `TBRoute`;
CREATE TABLE `TBRoute`(
`ID` INT(11) NOT NULL AUTO_INCREMENT COMMENT '自增长id',
`Name` VARCHAR(255) NOT NULL COMMENT '路线名称',
`ContactPersonID` INT(11)  NOT NULL COMMENT '所属联系人编号',
`ProjectID` INT(11)  NOT NULL COMMENT '所属项目编号',
PRIMARY KEY (`ID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '线路';

-- ----------------------------------------------------------------------线路

-- -------------------------------------------------------------------集中器
--7-30 潘雨青修改增加参数
DROP TABLE IF EXISTS `TBConcentrator`;
CREATE TABLE `TBConcentrator`(
`ID` INT(11)  NOT NULL COMMENT '设备编号',
`RouteID` INT(11)  NOT NULL COMMENT '所属路线编号',
`Version`  VARCHAR(255)  NOT NULL COMMENT '版本号',
`Name` VARCHAR(255)  NOT NULL COMMENT '设备名称，服务器可以修改',
`Password`  VARCHAR(255)  NOT NULL COMMENT '设备密码',
`Longitude` DECIMAL(9,6) NOT NULL COMMENT '经度，服务器可以修改',
`Laitude` DECIMAL(9,6) NOT NULL COMMENT '纬度，服务器可以修改',
`APNType` TINYINT UNSIGNED  NOT NULL COMMENT 'apn类型',
`LongPassWay` TINYINT UNSIGNED  NOT NULL COMMENT '远传方式',
`LongPassProtocol` TINYINT UNSIGNED  NOT NULL COMMENT '远传协议',
`UpInterval` TINYINT UNSIGNED  NOT NULL COMMENT '数据上传间隔，服务器可以修改',
`UpDelay` TINYINT UNSIGNED  NOT NULL COMMENT '数据上传延时长度，服务器可以修改',
`UpRepeat` TINYINT UNSIGNED  NOT NULL COMMENT '数据重传次数，服务器可以修改',
`UpDelayAdmin` TINYINT UNSIGNED  NOT NULL COMMENT '延时上传计时长度',
`IPProject`  VARCHAR(255)  NOT NULL COMMENT '项目IP',
`PortProject`  VARCHAR(255)  NOT NULL COMMENT '项目端口',
`Encryption`   TINYINT UNSIGNED  NOT NULL COMMENT '加密标志',
`KeyProject`  VARCHAR(255)  NOT NULL COMMENT '密钥',
`EncryptionAdmin` TINYINT UNSIGNED  NOT NULL COMMENT '管理服务器加密标志',
`KeyAdmin`  VARCHAR(255)  NOT NULL COMMENT '密钥',
`HeartBeat` TINYINT UNSIGNED  NOT NULL COMMENT '心跳',
`HeartBeatMin` TINYINT UNSIGNED  NOT NULL COMMENT '心跳时序',
`IPAdmin`  VARCHAR(255)  NOT NULL COMMENT '管理IP',
`PortAdmin`  VARCHAR(255)  NOT NULL COMMENT '管理端口',
`IPWay` TINYINT UNSIGNED  NOT NULL COMMENT '本地ip指定方式',
`IP`  VARCHAR(255)  NOT NULL COMMENT '本地IP',
`Port`  VARCHAR(255)  NOT NULL COMMENT '本地端口',
`Gateway`  VARCHAR(255)  NOT NULL COMMENT '本地网关',
`DNS`  VARCHAR(255)  NOT NULL COMMENT '本地DNS',
`ReservePassword`  VARCHAR(255)  NOT NULL COMMENT '备用设备密码',
`SystemControlMode` TINYINT UNSIGNED  NOT NULL COMMENT '系统控制方式',
`Location` VARCHAR(255)   COMMENT '地点',
`Remarks` VARCHAR(255)   COMMENT '备注',
PRIMARY KEY (`ID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '集中器';



DROP TABLE IF EXISTS `TBConcentratorState`;
CREATE TABLE `TBConcentratorState`(
`ID` INT(11) NOT NULL AUTO_INCREMENT COMMENT '自增长id',
`ConcentratorID` INT(11)  NOT NULL COMMENT '所属集中器编号',
`ControllerAmount` INT  NOT NULL COMMENT '控制器数量',
`CollectTime` DATETIME  NOT NULL COMMENT '采集时间',
`Longitude` DECIMAL(9,6) NOT NULL COMMENT '经度',
`Laitude` DECIMAL(9,6) NOT NULL COMMENT '纬度',
`PartsEnableState` TINYINT UNSIGNED NOT NULL COMMENT '部件使能状态',
`CircuitState` TINYINT UNSIGNED NOT NULL COMMENT '8个回路的状态',
`Illuminance` TINYINT UNSIGNED NOT NULL COMMENT '照度值',
`Fault` TINYINT UNSIGNED  NOT NULL COMMENT '集中器故障', -- 0-255
`TotalPower` REAL  NOT NULL COMMENT '有功总电能',
`APhaseVolt` REAL NOT NULL COMMENT 'A相电压',
`BPhaseVolt` REAL NOT NULL COMMENT 'B相电压',
`CPhaseVolt` REAL NOT NULL COMMENT 'C相电压',
`ABPhaseCurrent` REAL NOT NULL COMMENT 'A相电流',
`BCPhaseCurrent` REAL NOT NULL COMMENT 'B相电流',
`ACPhaseCurrent` REAL NOT NULL COMMENT 'C相电流',
PRIMARY KEY (`ID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '集中器状态数据';


--2017-7-30潘雨青修改 增加回路编号
DROP TABLE IF EXISTS `TBConcentratorCircuit`;
CREATE TABLE `TBConcentratorCircuit`(
`ID` INT(11) NOT NULL AUTO_INCREMENT COMMENT '自增长id',
`IDNum` VARCHAR(11) NOT NULL COMMENT '回路编号',   --增加的
`Name` VARCHAR(255)  COMMENT '回路名称',
`ConcentratorID` INT(11)  NOT NULL COMMENT '所属集中器编号',
PRIMARY KEY (`ID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '集中器回路';

--2017-7-30潘雨青修改 增加回路组编号
DROP TABLE IF EXISTS `TBConcentratorCircuitGroup`;
CREATE TABLE `TBConcentratorCircuitGroup`(
`ID` INT(11) NOT NULL AUTO_INCREMENT COMMENT '自增长id',
`IDNum` VARCHAR(11) NOT NULL COMMENT '回路的组的编号',  --增加的
`Name` VARCHAR(255) NOT NULL COMMENT '回路的组的名称',
`ConcentratorCircuitID` INT(11)  NOT NULL COMMENT '所属回路编号',
PRIMARY KEY (`ID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '集中器回路的组';
-- ----------------------------------------------------------------------集中器



-- ------------------------------------------------------------------------电表
DROP TABLE IF EXISTS `TBElectricityMeter`;
CREATE TABLE `TBElectricityMeter`(
`ID` INT(11) NOT NULL AUTO_INCREMENT COMMENT '自增长id',
`Type` VARCHAR(255) NOT NULL COMMENT '电表类型',
`ConcentratorID` INT(11)  NOT NULL COMMENT '所属集中器编号',
PRIMARY KEY (`ID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '集中器的电表';



DROP TABLE IF EXISTS `TBElectricityMeterBase`;
CREATE TABLE `TBElectricityMeterBase`(
`ID` INT(11) NOT NULL AUTO_INCREMENT COMMENT '自增长id',
`Type` VARCHAR(255) NOT NULL COMMENT '电表类型',
`Remarks` VARCHAR(255)  COMMENT '备注',
`Picture` VARCHAR(255) NOT NULL COMMENT '电表照片',
PRIMARY KEY (`ID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '电表库';
-- ---------------------------------------------------------------------------电表



-- ------------------------------------------------------------------------------------控制器
DROP TABLE IF EXISTS `TBLampBase`;
CREATE TABLE `TBLampBase`(
`ID` INT(11) NOT NULL AUTO_INCREMENT COMMENT '自增长id',
`Type` VARCHAR(255) NOT NULL COMMENT '路灯类型',
`Maker` VARCHAR(255) NOT NULL COMMENT '厂家',
`Power` REAL NOT NULL COMMENT '功率',
`Picture` VARCHAR(255) NOT NULL COMMENT '路灯照片',
`Remarks` VARCHAR(255)  COMMENT '备注',
PRIMARY KEY (`ID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '路灯库';

DROP TABLE IF EXISTS `TBControllerBase`;
CREATE TABLE `TBControllerBase`(
`ID` INT(11) NOT NULL AUTO_INCREMENT COMMENT '自增长id',
`Name` VARCHAR(255) NOT NULL COMMENT '控制器名称',
`Power` REAL NOT NULL COMMENT '功率',
`Picture` VARCHAR(255) NOT NULL COMMENT '控制器照片',
`Remarks` VARCHAR(255)  COMMENT '备注',
PRIMARY KEY (`ID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '控制器库';

DROP TABLE IF EXISTS `TBController`;
CREATE TABLE `TBController`(
`ID` INT(11) NOT NULL COMMENT '长id',
`Number` INT NOT NULL COMMENT '组内序号,短id',
`Name` VARCHAR(255) NOT NULL COMMENT '控制器名称',
`Longitude` DECIMAL(9,6) NOT NULL COMMENT '经度',
`Laitude` DECIMAL(9,6) NOT NULL COMMENT '纬度',
`TypeID` INT(11) NOT NULL COMMENT '所属控制器类型编号',  
`LampTypeID` INT(11) NOT NULL COMMENT '所属路灯类型编号',
`RouteID` INT(11)  NOT NULL COMMENT '所属线路编号',
`ConcentratorID` INT(11)  NOT NULL COMMENT '所属集中器编号',
`ConcentratorCircuitID` INT(11)  NOT NULL COMMENT '所属回路编号',
`ConcentratorCircuitGroupID` INT(11)  NOT NULL COMMENT '所属组编号',
`RenewTime` DATETIME   COMMENT '更换时间',
`Remarks` VARCHAR(255)  COMMENT '备注',
`Location` VARCHAR(255)   COMMENT '地点',
PRIMARY KEY (`ID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '控制器';

--潘雨青2017-7-30 增加控制器和组关联表  多对多
DROP TABLE IF EXISTS `TBController2Group`;
CREATE TABLE `TBController2Group`(
`ID` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
`ControllerID` INT(11) NOT NULL COMMENT '长id',
`RouteID` INT(11)  NOT NULL COMMENT '所属线路编号',
`ConcentratorID` INT(11)  NOT NULL COMMENT '所属集中器编号',
`ConcentratorCircuitID` INT(11)  NOT NULL COMMENT '所属回路编号',
`ConcentratorCircuitGroupID` INT(11)  NOT NULL COMMENT '所属组编号',
PRIMARY KEY (`ID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '组与控制器';





DROP TABLE IF EXISTS `TBControllerState`;
CREATE TABLE `TBControllerState`(
`ID` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
`ControllerID` INT(11) NOT NULL COMMENT '所属控制器id',
`Lumalevel` TINYINT UNSIGNED  NOT NULL COMMENT '亮度级别', -- 0-255
`Current` REAL  NOT NULL COMMENT '单灯电流',
`Voltage` REAL  NOT NULL COMMENT '单灯电压',
`Fault` TINYINT UNSIGNED  NOT NULL COMMENT '单灯故障', -- 0-255
PRIMARY KEY (`ID`) 
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '控制器状态数据';
-- ------------------------------------------------------------------------------------------------控制器








-- --------------------------------------------------------------------报警
DROP TABLE IF EXISTS `TBAlarmType`;
CREATE TABLE `TBAlarmType`(
`ID` INT(11) NOT NULL AUTO_INCREMENT COMMENT '自增长id',
`Name` DATETIME  NOT NULL COMMENT '报警类型名称',
PRIMARY KEY (`ID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '报警类型';

DROP TABLE IF EXISTS `TBAlarm`;
CREATE TABLE `TBAlarm`(
`ID` INT(11) NOT NULL AUTO_INCREMENT COMMENT '自增长id',
`Time` DATETIME  NOT NULL COMMENT '报警时间',
`AlarmTypeID` INT(11) NOT NULL COMMENT '报警类型编号',
-- `ConcentratorName` VARCHAR(255) NOT NULL COMMENT '集中器名称',
`ConcentratorID` INT(11) NOT NULL COMMENT '集中器编号',
`Device` VARCHAR(255) NOT NULL COMMENT '报警设备',
`Remarks` VARCHAR(255)  COMMENT '备注',
`flag` BOOLEAN NOT NULL COMMENT '是否处理',
PRIMARY KEY (`ID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '报警';

-- -------------------------------------------------------------------报警




-- -----------------------------------------------------------------------------------------用户区域对照表
DROP TABLE IF EXISTS `TBUser2Route`;
CREATE TABLE `TBUser2Route`(
`ID` INT(11) NOT NULL AUTO_INCREMENT COMMENT '自增长id',
`UserID` INT(11)  NOT NULL COMMENT '用户编号',
`RouteID` INT(11)  NOT NULL COMMENT '线路编号',
PRIMARY KEY (`ID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '用户线路对照表';
-- -----------------------------------------------------------------------------------------------用户区域对照表




-- ----------------------------------------------------------------------策略
DROP TABLE IF EXISTS `TBPolice`;
CREATE TABLE `TBPolice`(
`ID` INT(11) NOT NULL AUTO_INCREMENT COMMENT '自增长id',
`Calendar` INT  NOT NULL COMMENT '历法',
`Cycle` INT  NOT NULL COMMENT '周期',
`OnMonth` INT  NOT NULL COMMENT '月',
`OnDay` INT  NOT NULL COMMENT '日',
`OnTime` TIME  NOT NULL COMMENT '时间',
`OffMonth` INT  NOT NULL COMMENT '月',
`OffDay` INT  NOT NULL COMMENT '日',
`OffTime` TIME NOT NULL COMMENT '时间',
`Lumalevel` TINYINT UNSIGNED  NOT NULL COMMENT '亮度级别', -- 0-255
PRIMARY KEY (`ID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '策略表';




DROP TABLE IF EXISTS `TBDoPolice`;
CREATE TABLE `TBDoPolice`(
`ID` INT(11) NOT NULL AUTO_INCREMENT COMMENT '自增长id',
`DeviceTypeID` INT(11) NOT NULL COMMENT '所属设施类型id',
`DeviceID` INT(11) NOT NULL COMMENT '所属设施id',
`PoliceID` INT(11) NOT NULL COMMENT '所属策略id',
PRIMARY KEY (`ID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '要实施的策略';


DROP TABLE IF EXISTS `TBOrder`;
CREATE TABLE `TBOrder`(
`ID` INT(11) NOT NULL AUTO_INCREMENT COMMENT '自增长id',
`ReleaseTime` DATETIME NOT NULL COMMENT '发布时间',
`DoneTime` DATETIME NOT NULL COMMENT '执行时间',
`UserID` INT(11) NOT NULL COMMENT '发布用户id',
`OrderType` VARCHAR(255) NOT NULL COMMENT '命令类型',
`DeviceTypeID` INT(11) NOT NULL COMMENT '设施类型id',
`DeviceID` INT(11) NOT NULL COMMENT '设施id',
PRIMARY KEY (`ID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '要实施的命令';




DROP TABLE IF EXISTS `TBOrderHistory`;
CREATE TABLE `TBOrderHistory`(
`ID` INT(11) NOT NULL AUTO_INCREMENT COMMENT '自增长id',
`ReleaseTime` DATETIME NOT NULL COMMENT '发布时间',
`DoneTime` DATETIME NOT NULL COMMENT '执行时间',
`UserID` INT(11) NOT NULL COMMENT '发布用户id',
`OrderType` VARCHAR(255) NOT NULL COMMENT '命令类型',
`DeviceTypeID` INT(11) NOT NULL COMMENT '设施类型id',
`DeviceID` INT(11) NOT NULL COMMENT '设施id',
`Done` INT NOT NULL COMMENT '是否实施成功',
PRIMARY KEY (`ID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '历史命令';




DROP TABLE IF EXISTS `TBTurnOrder`;
CREATE TABLE `TBTurnOrder`(
`ID` INT(11) NOT NULL AUTO_INCREMENT COMMENT '自增长id',
`OnDate` DATETIME  NOT NULL COMMENT '开时间',
`OffDate` DATETIME NOT NULL COMMENT '关时间',
`Lumalevel` TINYINT UNSIGNED  NOT NULL COMMENT '亮度级别', -- 0-255
`DeviceTypeID` INT(11) NOT NULL COMMENT '设施类型id',
`DeviceID` INT(11) NOT NULL COMMENT '设施id',
`UserID` INT(11) NOT NULL COMMENT '发布用户id',
PRIMARY KEY (`ID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '直接开关灯命令';


DROP TABLE IF EXISTS `TBTurnOrderHistory`;
CREATE TABLE `TBTurnOrderHistory`(
`ID` INT(11) NOT NULL AUTO_INCREMENT COMMENT '自增长id',
`OnDate` DATETIME  NOT NULL COMMENT '开时间',
`OffDate` DATETIME NOT NULL COMMENT '关时间',
`Lumalevel` TINYINT UNSIGNED  NOT NULL COMMENT '亮度级别', -- 0-255
`DeviceTypeID` INT(11) NOT NULL COMMENT '设施类型id',
`DeviceID` INT(11) NOT NULL COMMENT '设施id',
`UserID` INT(11) NOT NULL COMMENT '发布用户id',
`Done` INT NOT NULL COMMENT '是否实施成功',
PRIMARY KEY (`ID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '直接开关灯命令历史';



DROP TABLE IF EXISTS `TBDeviceType`;
CREATE TABLE `TBDeviceType`(
`ID` INT(11) NOT NULL AUTO_INCREMENT COMMENT '自增长id',
`Type` VARCHAR(255)  NOT NULL COMMENT '设备类型',
PRIMARY KEY (`ID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '设备类型';




DROP TABLE IF EXISTS `TBCalendar`;
CREATE TABLE `TBCalendar`(
`ID` INT(11) NOT NULL AUTO_INCREMENT COMMENT '自增长id',
`Type` VARCHAR(255)  NOT NULL COMMENT '历法类型',
PRIMARY KEY (`ID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '历法类型';


DROP TABLE IF EXISTS `TBCycle`;
CREATE TABLE `TBCycle`(
`ID` INT(11) NOT NULL AUTO_INCREMENT COMMENT '自增长id',
`Type` VARCHAR(255)  NOT NULL COMMENT '周期类型',
PRIMARY KEY (`ID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '周期类型';



DROP TABLE IF EXISTS `TBOrderType`;
CREATE TABLE `TBOrderType`(
`ID` INT(11) NOT NULL AUTO_INCREMENT COMMENT '自增长id',
`Type` VARCHAR(255)  NOT NULL COMMENT '命令类型，码',
`Remark` VARCHAR(255)  NOT NULL COMMENT '说明',
PRIMARY KEY (`ID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '命令类型';

-- ----------------------------------------------------------------------策略

