<?php
namespace app\index\controller;
use think\Controller;
use think\Request;
use think\Db;
class Show extends Controller{
    public function show(){
        return $this->fetch('show/show');
	}
	//显示所有作业
	public function showAllHomework(Request $request){
		$data = $request->post()['data'];
		$dbdata = Db::table('TBCourseHomework')
				->select();
		return json($dbdata);
	}
	
	public function returnUp(Request $request){
		$data = $request->post()['data'];
		return json(['jump'=> '/tp5/public/index/homework/teacher?courseid='.$data['courseid'].'&userid='.$data['userid']]);
	}
	
	public function getCourse(Request $request){
		$data = $request->post()['data'];
		$dbdata = Db::table('TBCourseHomework')
				->select();
		$returnData = [];
		foreach ($dbdata as $elem) {
			if($elem['CourseID'] == $data['courseid']){
				array_push($returnData,$elem);
			}
		}
		return json($returnData);
	}
}