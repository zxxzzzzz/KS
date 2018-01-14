<?php
namespace app\index\controller;
use think\Controller;
use think\Request;
use think\Db;
class Teacher extends Controller{
    public function teacher(){
        return $this->fetch('teacher/teacher');
    }
    public function getMessages(Request $request){
		$data = $request->post()['data'];
		$dbdata = Db::table('tbmessage')
                ->where([
		    'ReceiveUserID' => ['=',$data['UserID']],
		])->select();
		for ($i=0; $i < count($dbdata); $i++) {
			$elem = $dbdata[$i];
			$fuckvar = Db::table('tbuser')
			->where([
				'ID' => ['=',$elem['SendUserID']],
			])->select();
			$dbdata[$i]['Name'] = $fuckvar[0]['Name'];
		}
		return json($dbdata);
	}
    public function getInformation(Request $request){
		$data = $request->post()['data'];
		$get = [];
		$getInformation = [];
		$dbdata = Db::table('tbuser')
                ->where([
		    'ID' => ['=',$data['UserID']],
		])->select();
		$get['userID'] = $dbdata[0]['ID'];
		$get['userName'] = $dbdata[0]['Name'];
		$get['userRole'] = $dbdata[0]['Role'];
        array_push($getInformation,$get);
        return json($getInformation);
	}
	public function getMessage(Request $request){
		$data = $request->post()['data'];
		$dbdata = Db::table('tbmessage')
                ->where([
		    'SendUserID' => ['=',$data['UserID']],
		])->select();
		for ($i=0; $i < count($dbdata); $i++) {
			$elem = $dbdata[$i];
			$fuckvar = Db::table('tbuser')
			->where([
				'ID' => ['=',$elem['ReceiveUserID']],
			])->select();
			$dbdata[$i]['Name'] = $fuckvar[0]['Name'];
		}
		return json($dbdata);
	}

	public function getUser(Request $request){
		$data = $request->post()['data'];
		$dbdata = Db::table('tbuser')
				->select();
		$returnData = [];
		foreach ($dbdata as $elem) {
			if($elem['ID'] != $data['UserID']){
				array_push($returnData,$elem);
			}
		}
		return json($returnData);
	}

	public function sendMessage(Request $request){
		$data = $request->post()['data'];
		$dbdata = Db::table('tbmessage')
				->insert(['SendUserID'=>$data['SendUserID'],
							'ReceiveUserID'=>$data['ReceiveUserID'],
							'Detail'=>$data['Detail'],
							'Time'=>$data['Time']]);
		return json(['state'=>'ok']);
	}

	public function getCourse(Request $request){
		$data = $request->post()['data'];
		$getname = Db::table('tbuser')
		->where([
			'ID' => ['=',$data['UserID']]
		])->select();
		$dbdata = Db::table('tbcourse')
		 ->where([
		 	'TeacherID' => ['=',$getname[0]['Name']],
		 ])->select();
		 $get = [];
		 $getCourse = [];
		 for ($i=0; $i < count($dbdata); $i++) {
		 $getCourse['Name'] = $dbdata[$i]['Name'];
		 $getCourse['CourseID'] = $dbdata[$i]['ID'];
		 array_push($get,$getCourse);
		}
		return  json($get);
	}
}
