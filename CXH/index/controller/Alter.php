<?php
namespace app\index\controller;
use think\Controller;
use think\Request;
use think\Db;
class Alter extends Controller{
    public function alter(){
        return $this->fetch('alter/alter');
	}
	
	
	public function returnUp(Request $request){
		$data = $request->post()['data'];
		return json(['jump'=> '/tp5/public/index/homework/teacher?courseid='.$data['courseid'].'&userid='.$data['userid']]);
	}

	//更改作业
	public function alterHomework(Request $request){
		$data = $request->post()['data'];
		$count1 = Db::table('TBCourseHomework')
				->where([
					'ID' => ['=',$data['ID']]
				])->count();
		if($data['Name']==''){
			return json(['message' => '未输入作业名']);
		}
		if($count1 == 1){ 
			if($data['Detail'] ==''){
				return json(['message'=>'未输入作业详情']);
			}
			$dbdata = Db::table('TBCourseHomework')
					->where([
						'courseid' => ['=',$data['courseid']],
						'ID' => ['=',$data['ID']]
					])->update(['Detail'=>$data['Detail']
			]);
			return json(['message'=>'修改成功']);
		}
		return json(['message'=>'查找失败']);
	}

	public function getCourse(Request $request){
		$data = $request->post()['data'];
		$dbdata = Db::table('TBCourseHomework')
		->where([
			'Name' => ['=',$data['Name']]
		])->select();
		$returnData = [];
		foreach ($dbdata as $elem) {
			if($elem['CourseID'] == $data['courseid']){
				array_push($returnData,$elem);
			}
		}
		return json($returnData);
	}
}