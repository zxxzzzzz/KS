<?php
namespace app\index\controller;
use think\Controller;
use think\Request;
use think\Db;
class Add extends Controller{
    public function add(){
        return $this->fetch('add/add');
	}
	
	//添加作业   
	public function addHomework(Request $request){
		$data = $request->post()['data'];
		if($data['Name']==''){
			return json(['message' => '未输入作业名']);
		}
		if($data['Detail']==''){
			return json(['message' => '未输入作业详情']);
		}
		$dbdata = Db::table('TBCourseHomework')
				->where([
					'CourseID' => ['=',$data['courseid']]
				])
				->insert(['CourseID'=>$data['courseid'],
				'Name'=>$data['Name'],
				'Detail'=>$data['Detail']]);
		return json(['message' => '添加成功']);
	}
	
	public function returnUp(Request $request){
		$data = $request->post()['data'];
		return json(['jump'=> '/tp5/public/index/homework/teacher?courseid='.$data['courseid'].'&userid='.$data['userid']]);
	}

	public function getCourse(Request $request){
		$data = $request->post()['data'];
		/*return json($data);*/
		
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
	
	public function getID(Request $request){
		$data = $request->post()['data'];
		/*return json($data);*/
		
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