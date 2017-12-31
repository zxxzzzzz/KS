<?php
namespace app\index\controller;
use think\Controller;
use think\Request;
use think\Db;
class Student extends Controller{
    public function student(){
        return $this->fetch('student/student');
    }
	public function getMessage(Request $request){
		$data = $request->post()['data'];
		$dbdata = Db::table('tbmessage')
                ->where([
		    'ReceiveUserID' => ['=',$data['UserID']],
		])->select();
		return json($dbdata);
	}
	public function getCourse(Request $request){
		$data = $request->post()['data'];
		$dbdata = Db::table('tbcoursemap')
                ->where([
		    'UserID' => ['=',$data['UserID']],
		])->select();
		$courseNames = [];
		foreach ($dbdata as $elem) {
			$name = Db::table('tbcourse')
			->where([
				'ID' => ['=',$elem['CourseID']],
			])->select();
			$fuckvar = [];
			$fuckvar['Name'] = $name[0]['Name'];
			$fuckvar['Teacher'] = $name[0]['TeacherID'];
			$fuckvar['CourseID'] = $elem['CourseID'];
			$fuckvar['UserID'] = $data['UserID'];
			array_push($courseNames,$fuckvar);
		}
		return  json($courseNames);
	}
}
