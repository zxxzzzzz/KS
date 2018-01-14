<?php
namespace app\index\controller;
use think\Controller;
use think\Request;
use think\Db;
class Correct extends Controller{
    public function correct(){
        return $this->fetch('correct/correct');
	}
	public function returnUp(Request $request){
		$data = $request->post()['data'];
		return json(['jump'=> '/tp5/public/index/homework/teacher?courseid='.$data['courseid'].'&userid='.$data['userid']]);
	}

	//批改作业 
	public function correctHomework(Request $request){
		$data = $request->post()['data'];
		if($data['HomeworkID']==''){
			return json(['message' => '未输入作业号']);
		}
		if($data['Score']==''){
			return json(['message' => '未输入成绩']);
		}
		$dbdata = Db::table('TBCourseHomeworkMap')
				->where([
				'CourseID' => ['=',$data['courseid']],
				'HomeworkID' => ['=',$data['HomeworkID']],
				'UserID' => ['=',$data['userid']]
		])->update(['Score'=>$data['Score']]);
		return json(['message'=>'修改成功']);
	}

	public function getHomeworkMap(Request $request){
		$data = $request->post()['data'];
		if($data['HomeworkID']==''){
			return json(['message' => '未输入作业号']);
		}
		$dbdata = Db::table('TBCourseHomeworkMap')
		->where([
			'HomeworkID' => ['=',$data['HomeworkID']]
		])->select();
		$returnData = [];
		foreach ($dbdata as $elem) {
			if($elem['CourseID'] == $data['courseid']  ){
				array_push($returnData,$elem);
			}
		}
		return json($returnData);
	}

	public function getUserHomework(Request $request){
		$data = $request->post()['data'];
		$data0 = 0;
		$dbdata = Db::table('TBCourseHomeworkMap')
		->where([
			'CourseID' => ['=',$data['courseid']],
			'HomeworkID' => ['=',$data['HomeworkID']],
			'Score' => ['=',$data0]
		])->limit(1)->select();
		return json($dbdata);
	}

	public function getID(Request $request){
		$data = $request->post()['data'];
		
		$dbdata = Db::table('TBCourseHomework')
				->select();
		$returnData = [];
		foreach ($dbdata as $elem){
			if($elem['ID'] != $data['id']){
				array_push($returnData,$elem);
			}
		}
		return json($returnData);
	}
}