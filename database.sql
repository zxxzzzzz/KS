
CREATE DATABASE  `KS`
CHARACTER SET 'utf8'
COLLATE 'utf8_general_ci';
USE `KS`;
-- ----------------简化了角色的管理，原本课设要求的角色管理过于复杂。role字段表示该用户扮演角色，诸如教师，管理员，学生。
-- ----------------该字段只能设置一个角色，去除了课设要求里的一人任多职的要求。
-- ----------------online表示在线，用于实现限制重复登录。当online=yes ,表示已有人登录该账号，不能再登。
DROP TABLE IF EXISTS `TBUser`;
CREATE TABLE `TBUser`(
`ID` INT(11) NOT NULL AUTO_INCREMENT,
`Name` VARCHAR(255) NOT NULL COMMENT '用户名称',
`Password` VARCHAR(255) NOT NULL COMMENT '密码',
`Role` VARCHAR(255) NOT NULL COMMENT '扮演的角色', -- --诸如：教师/学生/管理员
`Online` VARCHAR(10) NOT NULL COMMENT '是否在线（yes/no）',
PRIMARY KEY (`ID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- ----------------------------------------------------------------------------------------------------用户



-- ---------------------------------课程模块
DROP TABLE IF EXISTS `TBCourse`;
CREATE TABLE `TBCourse`(
`ID` INT(11) NOT NULL AUTO_INCREMENT COMMENT '课程id,唯一且自增，不用管',
`Name` VARCHAR(255) NOT NULL COMMENT '课程名称',
`TeacherID` VARCHAR(255) NOT NULL COMMENT '教师id,指向user里的id',
`CoursePic` VARCHAR(255) NOT NULL COMMENT '课程图片地址,诸如https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=3902168736,1556323406&fm=58',
`Detail` VARCHAR(255) NOT NULL COMMENT '课程简介',
`Score` INT(11) NOT NULL COMMENT '课程评分', -- --学生对该课的打分（0-100）
`Check` VARCHAR(255) NOT NULL COMMENT '考核方法', -- --考察，考试之类的
`UnitList` VARCHAR(1000) NOT NULL COMMENT '章节目录', -- ---这里做了简化，把单元目录直接按文本写进去。诸如 "第一单元xxx,第二单元xxx"
`Percent` VARCHAR(255) NOT NULL COMMENT '成绩比例', -- ---类似 "0.3,0.4,0.3" 用来计算总分的依据
PRIMARY KEY (`ID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `TBCourseMap`; -- ---课程表
CREATE TABLE `TBCourseMap`(
`ID` INT(11) NOT NULL AUTO_INCREMENT,
`CourseID` INT(11) NOT NULL COMMENT'课程名称',
`UserID` INT(11)  NOT NULL COMMENT '选这课的人的编号',
`CourseScore` INT(11)  NOT NULL COMMENT '该学生对该课的评分',
`Length` INT(11)  NOT NULL COMMENT '学习时长',
`UnitScore` INT(11)  NOT NULL COMMENT '单元测试成绩',   --  ---该成绩来源  作业成绩，为了应付难以实现的单元测试成绩
`Score` INT(11)  NOT NULL COMMENT '期末成绩', 
`Percent` INT(11) NOT NULL comment '学习进度', -- --通过 学习时长/课程时长  期末考试后都100%
PRIMARY KEY (`ID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `TBCourseData`; -- --学习资料
CREATE TABLE `TBCourseData`(
`ID` INT(11) NOT NULL AUTO_INCREMENT,
`CourseID` VARCHAR(255) NOT NULL COMMENT'所属课程名称',
`Name` VARCHAR(255) NOT NULL COMMENT'资料名称',
`Src` INT(11)  NOT NULL COMMENT '资料地址',
PRIMARY KEY (`ID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `TBCourseComment`; -- --课程评论
CREATE TABLE `TBCourseComment`(
`ID` INT(11) NOT NULL AUTO_INCREMENT,
`CourseID` INT(11) NOT NULL COMMENT'所属课程名称',
`UserID` INT(11) NOT NULL COMMENT'评论的人的id',
`Detail` INT(11)  NOT NULL COMMENT '评论详情', -- -- 诸如 "这课很烂"
`Time` DATETIME NOT NULL COMMENT '评论时间',
PRIMARY KEY (`ID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `TBCourseTopic`; -- --课程题库
CREATE TABLE `TBCourseTopic`(
`ID` INT(11) NOT NULL AUTO_INCREMENT,
`CourseID` INT(11) NOT NULL COMMENT '所属课程id',
`Tag` VARCHAR(11) NOT NULL COMMENT '题目标签，"选择题/填空题"',
`Detail` VARCHAR(255)  NOT NULL COMMENT '题目详情', -- --诸如 "天上七个猴，地上一个猴，问几猴"
`Answer` VARCHAR(255)  NOT NULL COMMENT '题目答案', -- --诸如a,诸如2个猴
PRIMARY KEY (`ID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `TBCourseTest`; -- --课程试卷
CREATE TABLE `TBCourseTest`(
`ID` INT(11) NOT NULL AUTO_INCREMENT,
`CourseID` INT(11) NOT NULL COMMENT '所属课程id',
`Detail` VARCHAR(255)  NOT NULL COMMENT '试卷详情', -- --TBCourseTopic的id集，诸如 1001,1009,1887',
`BeginTime` DATETIME NOT NULL COMMENT '该试卷开始时间', -- --类似2017-12-19 9:9:9
`EndTime` DATETIME NOT NULL COMMENT '该试卷结束时间', -- --
`Length` INT(11) NOT NULL COMMENT '该考试时长 单位min', -- --60 = 60 min 67 = 67min
PRIMARY KEY (`ID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `TBCourseTestMap`; -- --课程试卷表
CREATE TABLE `TBCourseTestMap`(
`ID` INT(11) NOT NULL AUTO_INCREMENT,
`CourseID` INT(11) NOT NULL COMMENT '所属课程id',
`TestID` INT(11)  NOT NULL COMMENT '所属试卷id', 
`UserID` INT(11)  NOT NULL COMMENT '所属用户id',
`BeginTime` DATETIME NOT NULL COMMENT '该学生做这试卷的开始时间', -- --该学生做这试卷的开始时间
`EndTime` DATETIME NOT NULL COMMENT '该学生做这试卷的结束时间', -- --该学生做这试卷的结束时间
`Score` INT(11) NOT NULL COMMENT '成绩', 
PRIMARY KEY (`ID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `TBCourseHomework`; -- --课程作业
CREATE TABLE `TBCourseHomework`(
`ID` INT(11) NOT NULL AUTO_INCREMENT,
`CourseID` INT(11) NOT NULL COMMENT '所属课程id',
`Name` VARCHAR(255)  NOT NULL COMMENT '作业名称',
`Detail` VARCHAR(511)  NOT NULL COMMENT '作业详情', -- -- 诸如 "天上七个猴，地上一个猴，问几猴"
PRIMARY KEY (`ID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `TBCourseHomeworkMap`; -- --课程作业表
CREATE TABLE `TBCourseHomeworkMap`(
`ID` INT(11) NOT NULL AUTO_INCREMENT,
`CourseID` INT(11) NOT NULL COMMENT '所属课程id',
`HomeworkID` INT(11)  NOT NULL COMMENT '作业id', -- -- 诸如 "天上七个猴，地上一个猴，问几猴"
`UserID` INT(11)  NOT NULL COMMENT '学生id',
`Answer` VARCHAR(511)  NOT NULL COMMENT '学生的答案',
`Score` INT(11) NOT NULL COMMENT '作业成绩',
PRIMARY KEY (`ID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- -------------------------------消息模块
DROP TABLE IF EXISTS `TBMessage`; -- --消息表
CREATE TABLE `TBMessage`(
`ID` INT(11) NOT NULL AUTO_INCREMENT,
`SendUserID` INT(11) NOT NULL COMMENT '发送用户id',
`ReceiveUserID` INT(11)  NOT NULL COMMENT '接受用户id', 
`Detail` VARCHAR(255)  NOT NULL COMMENT '消息内容', -- -- 诸如"你吃了么"
`Time` DATETIME NOT NULL COMMENT '发送消息时间',
PRIMARY KEY (`ID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;






