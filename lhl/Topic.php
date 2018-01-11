<?php
namespace app\index\controller;
use think\Controller;
use think\Request;
use think\Db;
class Topic extends Controller{
	public function topic(){
        return $this->fetch('topic/topic');
    }
	public function insert (Request $request){
		$data = $request->post()['data'];
		$count = Db::table('tbcoursetopic')
		->where(['ID' =>['=',$data['Number']]])
		->count();
		if($data['Number'] == NULL){
			return json(['state1'=>'error']);
		}
		else if($data['Course'] == NULL){
			return json(['state2'=>'error']);
		}
		else if($data['Sort'] == NULL){
			return json(['state3'=>'error']);
		}
		else if($data['Topic'] == NULL){
			return json(['state4'=>'error']);
		}
		else if($data['Answer'] == NULL){
			return json(['state5'=>'error']);
		}
		else if($count == 1){
			return json(['state'=>'error']);
		}
		else{
			$dbdata = Db::table('tbcoursetopic')
			->insert(['ID' => $data['Number'],
				  	'CourseID' => $data['Course'],
				  	'Tag' => $data['Sort'],
				  	'Detail' => $data['Topic'],
				  	'Answer' => $data['Answer']
			]);
			return json(['state'=>'ok']);
		}
	}
	public function select (Request $request){
		$data = $request->post()['data'];
		 $dbdata = Db::table('tbcoursetopic')
		 ->where([
		 	'CourseID' => ['=',$data['CourseID']],
		 ])->select();
		 $get = [];
		 $getdata = [];
		 for ($i=0; $i < count($dbdata); $i++) {
		 	$get['ID'] = $dbdata[$i]['ID'] ;
		 	$get['Detail'] = $dbdata[$i]['Detail'] ;
		 	$get['Answer'] = $dbdata[$i]['Answer'] ;
		 	array_push($getdata,$get);
		 }
		 return json($getdata);
	}
	public function update (Request $request){
		$data = $request->post()['data'];
		$count = Db::table('tbcoursetopic')
		->where(['ID' => ['=',$data['Number']]])
		->count();
		if($data['Number'] == NULL){
			return json(['state1'=>'error']);
		}
		else if($data['Course'] == NULL){
			return json(['state2'=>'error']);
		}
		else if($data['Sort'] == NULL){
			return json(['state3'=>'error']);
		}
		else if($data['Topic'] == NULL){
			return json(['state4'=>'error']);
		}
		else if($data['Answer'] == NULL){
			return json(['state5'=>'error']);
		}
		if($count == 1){
			$dbdata = Db::table('tbcoursetopic')
			->where([
		 		'ID' => ['=',$data['Number']],
			])->update([
				'CourseID' => $data['Course'],
				'Tag' => $data['Sort'],
				'Detail' => $data['Topic'],
				'Answer' => $data['Answer']
			]);
			return json(['state'=>'ok']);
		}
		else{
			return json(['state'=>'error']);
		}

	}
	public function del (Request $request){
		$data = $request->post()['data'];
		$count = Db::table('tbcoursetopic')
		->where(['ID' => ['=',$data['Number']]])
		->count();
		if($count == 1){
			$dbdata = Db::table('tbcoursetopic')
			->where([
				'ID' => ['=',$data['Number']],
			])->delete();
			return json(['state'=>'ok']);
		}
		else{
			return json(['state'=>'error']);
		}

	}
}
