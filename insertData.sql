
-- --用户数据
INSERT INTO `TBUser` (`ID`, `Name`, `Password`, `Role`,`Online`) VALUES (NULL, 'zxx', 'zxx', 'student','no');
INSERT INTO `TBUser` (`ID`, `Name`, `Password`, `Role`,`Online`) VALUES (NULL, 'lhl', 'lhl', 'student','no');
INSERT INTO `TBUser` (`ID`, `Name`, `Password`, `Role`,`Online`) VALUES (NULL, 'sp', 'sp', 'student','no');
INSERT INTO `TBUser` (`ID`, `Name`, `Password`, `Role`,`Online`) VALUES (NULL, 'glc', 'glc', 'student','no');
INSERT INTO `TBUser` (`ID`, `Name`, `Password`, `Role`,`Online`) VALUES (NULL, 'cxh', 'cxh', 'student','no');
INSERT INTO `TBUser` (`ID`, `Name`, `Password`, `Role`,`Online`) VALUES (NULL, 'xz', 'xz', 'student','no');
INSERT INTO `TBUser` (`ID`, `Name`, `Password`, `Role`,`Online`) VALUES (NULL, 'mjj', 'mjj', 'student','no');
INSERT INTO `TBUser` (`ID`, `Name`, `Password`, `Role`,`Online`) VALUES (NULL, 'lzx', 'lzx', 'student','no');
INSERT INTO `TBUser` (`ID`, `Name`, `Password`, `Role`,`Online`) VALUES (NULL, 'pyq', 'pyq', 'teacher','no');


-- --课程数据
INSERT INTO `TBCourse` (`ID`, `Name`, `TeacherID`, `CoursePic`,`Detail`,`Score`,`Check`,`UnitList`,`Percent`) VALUES (NULL, '学做菜', 'pyq', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1515462979&di=4d477f39934b98fe0044be4dc138d099&imgtype=jpg&er=1&src=http%3A%2F%2Fs2.sinaimg.cn%2Fmiddle%2F4b91df71g832d484a1851%26amp%3B690','教你做菜，包教包不会，因为老师自己也不会',0,'考查','章节1:学做炒饭;章节2:学做麻婆豆腐;章节3:学做满汉全席','0.3,0.3,0.4');
INSERT INTO `TBCourse` (`ID`, `Name`, `TeacherID`, `CoursePic`,`Detail`,`Score`,`Check`,`UnitList`,`Percent`) VALUES (NULL, '学种地', 'pyq', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1515463802&di=d7ab764db83cc3919a9e6b43b2b2afa9&imgtype=jpg&er=1&src=http%3A%2F%2Fwww.my0832.com%2Fattachments%2Fbbs%2F20170403%2F20174316371666033_740_555.jpg','教你种地，包教包会，因为种地谁都会种的',0,'考查','章节1:学种地瓜;章节2:学种土豆;章节3:学种哈密瓜','0.1,0.1,0.8');
INSERT INTO `TBCourse` (`ID`, `Name`, `TeacherID`, `CoursePic`,`Detail`,`Score`,`Check`,`UnitList`,`Percent`) VALUES (NULL, '学装修', 'pyq', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1515464077&di=110404da45dc69871f8b407885db96ec&imgtype=jpg&er=1&src=http%3A%2F%2Fhome.fcwlm.cn%2Fpicb%2F10004%2F10004467.jpg','教你装修，包教包收钱，什么年代了还自己装修',0,'考试','章节1:学砌墙;章节2:学铺地砖;章节3:学请装修公司','0.5,0.2,0.3');

-- --课程表数据
INSERT INTO `TBCourseMap` (`ID`, `CourseID`, `UserID`, `CourseScore`,`Length`,`UnitScore`,`Score`,`Percent`) VALUES (NULL, 1, 1, 89,100,0,0,56);
INSERT INTO `TBCourseMap` (`ID`, `CourseID`, `UserID`, `CourseScore`,`Length`,`UnitScore`,`Score`,`Percent`) VALUES (NULL, 1, 2, 89,100,0,0,56);
INSERT INTO `TBCourseMap` (`ID`, `CourseID`, `UserID`, `CourseScore`,`Length`,`UnitScore`,`Score`,`Percent`) VALUES (NULL, 1, 3, 89,100,0,0,56);
INSERT INTO `TBCourseMap` (`ID`, `CourseID`, `UserID`, `CourseScore`,`Length`,`UnitScore`,`Score`,`Percent`) VALUES (NULL, 1, 4, 89,100,0,0,56);
INSERT INTO `TBCourseMap` (`ID`, `CourseID`, `UserID`, `CourseScore`,`Length`,`UnitScore`,`Score`,`Percent`) VALUES (NULL, 2, 5, 89,100,0,0,56);
INSERT INTO `TBCourseMap` (`ID`, `CourseID`, `UserID`, `CourseScore`,`Length`,`UnitScore`,`Score`,`Percent`) VALUES (NULL, 2, 6, 89,100,0,0,56);
INSERT INTO `TBCourseMap` (`ID`, `CourseID`, `UserID`, `CourseScore`,`Length`,`UnitScore`,`Score`,`Percent`) VALUES (NULL, 2, 7, 89,100,0,0,56);
INSERT INTO `TBCourseMap` (`ID`, `CourseID`, `UserID`, `CourseScore`,`Length`,`UnitScore`,`Score`,`Percent`) VALUES (NULL, 2, 8, 89,100,0,0,56);
INSERT INTO `TBCourseMap` (`ID`, `CourseID`, `UserID`, `CourseScore`,`Length`,`UnitScore`,`Score`,`Percent`) VALUES (NULL, 3, 1, 89,100,0,0,56);
INSERT INTO `TBCourseMap` (`ID`, `CourseID`, `UserID`, `CourseScore`,`Length`,`UnitScore`,`Score`,`Percent`) VALUES (NULL, 3, 2, 89,100,0,0,56);
INSERT INTO `TBCourseMap` (`ID`, `CourseID`, `UserID`, `CourseScore`,`Length`,`UnitScore`,`Score`,`Percent`) VALUES (NULL, 3, 3, 89,100,0,0,56);
INSERT INTO `TBCourseMap` (`ID`, `CourseID`, `UserID`, `CourseScore`,`Length`,`UnitScore`,`Score`,`Percent`) VALUES (NULL, 3, 4, 89,100,0,0,56);
INSERT INTO `TBCourseMap` (`ID`, `CourseID`, `UserID`, `CourseScore`,`Length`,`UnitScore`,`Score`,`Percent`) VALUES (NULL, 3, 5, 89,100,0,0,56);
INSERT INTO `TBCourseMap` (`ID`, `CourseID`, `UserID`, `CourseScore`,`Length`,`UnitScore`,`Score`,`Percent`) VALUES (NULL, 3, 6, 89,100,0,0,56);
INSERT INTO `TBCourseMap` (`ID`, `CourseID`, `UserID`, `CourseScore`,`Length`,`UnitScore`,`Score`,`Percent`) VALUES (NULL, 3, 7, 89,100,0,0,56);
INSERT INTO `TBCourseMap` (`ID`, `CourseID`, `UserID`, `CourseScore`,`Length`,`UnitScore`,`Score`,`Percent`) VALUES (NULL, 3, 8, 89,100,0,0,56);

-- --学习资料
INSERT INTO `TBCourseData` (`ID`, `CourseID`, `Name`, `Src`) VALUES (NULL, 1, '做菜大全.jpg', 'www.baidu.com');
INSERT INTO `TBCourseData` (`ID`, `CourseID`, `Name`, `Src`) VALUES (NULL, 1, '做菜小全.jpg', 'www.baidu.com');
INSERT INTO `TBCourseData` (`ID`, `CourseID`, `Name`, `Src`) VALUES (NULL, 2, '种地大全.jpg', 'www.baidu.com');
INSERT INTO `TBCourseData` (`ID`, `CourseID`, `Name`, `Src`) VALUES (NULL, 2, '种地小全.jpg', 'www.baidu.com');
INSERT INTO `TBCourseData` (`ID`, `CourseID`, `Name`, `Src`) VALUES (NULL, 3, '装修大全.jpg', 'www.baidu.com');
INSERT INTO `TBCourseData` (`ID`, `CourseID`, `Name`, `Src`) VALUES (NULL, 3, '装修小全.jpg', 'www.baidu.com');

-- --课程评论数据
INSERT INTO `TBCourseComment` (`ID`, `CourseID`, `UserID`, `Detail`,`Time`) VALUES (NULL, 1, 1, '什么时候上课啊','2018-1-1 09:09:09');
INSERT INTO `TBCourseComment` (`ID`, `CourseID`, `UserID`, `Detail`,`Time`) VALUES (NULL, 1, 2, '不知道','2018-1-1 09:09:10');
INSERT INTO `TBCourseComment` (`ID`, `CourseID`, `UserID`, `Detail`,`Time`) VALUES (NULL, 1, 3, '什么时候下课啊','2018-1-1 09:09:11');
INSERT INTO `TBCourseComment` (`ID`, `CourseID`, `UserID`, `Detail`,`Time`) VALUES (NULL, 1, 4, '不知道','2018-1-1 09:09:12');
INSERT INTO `TBCourseComment` (`ID`, `CourseID`, `UserID`, `Detail`,`Time`) VALUES (NULL, 2, 5, '什么时候上课啊','2018-1-1 09:09:13');
INSERT INTO `TBCourseComment` (`ID`, `CourseID`, `UserID`, `Detail`,`Time`) VALUES (NULL, 2, 6, '肚子好饿','2018-1-1 09:09:14');
INSERT INTO `TBCourseComment` (`ID`, `CourseID`, `UserID`, `Detail`,`Time`) VALUES (NULL, 2, 7, '想吃饺子','2018-1-1 09:09:15');
INSERT INTO `TBCourseComment` (`ID`, `CourseID`, `UserID`, `Detail`,`Time`) VALUES (NULL, 2, 8, '想回家过年','2018-1-1 09:09:16');
INSERT INTO `TBCourseComment` (`ID`, `CourseID`, `UserID`, `Detail`,`Time`) VALUES (NULL, 3, 1, '黄河黄','2018-1-1 09:09:17');
INSERT INTO `TBCourseComment` (`ID`, `CourseID`, `UserID`, `Detail`,`Time`) VALUES (NULL, 3, 2, '长江长','2018-1-1 09:09:18');
INSERT INTO `TBCourseComment` (`ID`, `CourseID`, `UserID`, `Detail`,`Time`) VALUES (NULL, 3, 3, '楼上在干什么啊','2018-1-1 09:09:19');
INSERT INTO `TBCourseComment` (`ID`, `CourseID`, `UserID`, `Detail`,`Time`) VALUES (NULL, 3, 4, '安静点可以吗','2018-1-1 09:09:20');
INSERT INTO `TBCourseComment` (`ID`, `CourseID`, `UserID`, `Detail`,`Time`) VALUES (NULL, 3, 5, '楼上多管闲事','2018-1-1 09:09:21');
INSERT INTO `TBCourseComment` (`ID`, `CourseID`, `UserID`, `Detail`,`Time`) VALUES (NULL, 3, 6, '你不也是么，楼上','2018-1-1 09:09:22');
INSERT INTO `TBCourseComment` (`ID`, `CourseID`, `UserID`, `Detail`,`Time`) VALUES (NULL, 3, 7, '什么时候下课啊','2018-1-1 09:09:23');
INSERT INTO `TBCourseComment` (`ID`, `CourseID`, `UserID`, `Detail`,`Time`) VALUES (NULL, 3, 8, '什么时候上课啊','2018-1-1 09:09:09');

-- --课程题库
INSERT INTO `TBCourseTopic` (`ID`, `CourseID`, `Tag`, `Detail`,`Answer`) VALUES (NULL, 1, '填空题', '酱油是老抽上色还是生抽（老/生）','老');
INSERT INTO `TBCourseTopic` (`ID`, `CourseID`, `Tag`, `Detail`,`Answer`) VALUES (NULL, 1, '选择题', '恒顺酱醋厂在哪里a:南京，b:镇江，c:北海道','a');
INSERT INTO `TBCourseTopic` (`ID`, `CourseID`, `Tag`, `Detail`,`Answer`) VALUES (NULL, 1, '填空题', '猪肉要逆纹理切还是顺纹理（顺/逆）','逆');
INSERT INTO `TBCourseTopic` (`ID`, `CourseID`, `Tag`, `Detail`,`Answer`) VALUES (NULL, 2, '填空题', '地瓜长在树上还是地里（树/地）','地');
INSERT INTO `TBCourseTopic` (`ID`, `CourseID`, `Tag`, `Detail`,`Answer`) VALUES (NULL, 2, '填空题', '地瓜好不好吃（好吃）','好吃');
INSERT INTO `TBCourseTopic` (`ID`, `CourseID`, `Tag`, `Detail`,`Answer`) VALUES (NULL, 2, '填空题', '种地能拿国家补贴么（不知道）','不知道');
INSERT INTO `TBCourseTopic` (`ID`, `CourseID`, `Tag`, `Detail`,`Answer`) VALUES (NULL, 3, '填空题', '火线带电么（带/不带）','带');
INSERT INTO `TBCourseTopic` (`ID`, `CourseID`, `Tag`, `Detail`,`Answer`) VALUES (NULL, 3, '填空题', '能不能用脚去踩水泥（能/不能）','能');
INSERT INTO `TBCourseTopic` (`ID`, `CourseID`, `Tag`, `Detail`,`Answer`) VALUES (NULL, 3, '填空题', '装修什么是北欧风格','极简');

-- --考试
INSERT INTO `TBCourseTest` (`ID`, `CourseID`, `Detail`, `BeginTime`,`EndTime`,`Length`) VALUES (NULL, 1, '1,2', '2018-1-1 02:02:02','2019-1-1 02:02:02', 300);
INSERT INTO `TBCourseTest` (`ID`, `CourseID`, `Detail`, `BeginTime`,`EndTime`,`Length`) VALUES (NULL, 1, '1,2,3', '2018-1-1 02:02:02','2019-1-1 02:02:02', 300);
INSERT INTO `TBCourseTest` (`ID`, `CourseID`, `Detail`, `BeginTime`,`EndTime`,`Length`) VALUES (NULL, 2, '4,6', '2018-1-1 02:02:02','2019-1-1 02:02:02', 300);
INSERT INTO `TBCourseTest` (`ID`, `CourseID`, `Detail`, `BeginTime`,`EndTime`,`Length`) VALUES (NULL, 2, '5,6', '2018-1-1 02:02:02','2019-1-1 02:02:02', 300);
INSERT INTO `TBCourseTest` (`ID`, `CourseID`, `Detail`, `BeginTime`,`EndTime`,`Length`) VALUES (NULL, 3, '7,8', '2018-1-1 02:02:02','2019-1-1 02:02:02', 300);
INSERT INTO `TBCourseTest` (`ID`, `CourseID`, `Detail`, `BeginTime`,`EndTime`,`Length`) VALUES (NULL, 3, '7,8,9', '2018-1-1 02:02:02','2019-1-1 02:02:02', 300);


