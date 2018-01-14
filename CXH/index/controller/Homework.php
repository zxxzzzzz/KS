<?php
namespace app\index\controller;
use think\Controller;
use think\Request;
use think\Db;
class Homework extends Controller{
    public function teacher(){
        return $this->fetch('homework/homework');
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

	public function searchCourseID(Request $request){
		$data = $request->post()['data'];
		if($data['userid']==''){
			return json(['message' => '未输入学生学号']);
		}
		if($data['courseid']==''){
			return json(['message' => '未输入课程号']);
		}
		$count1 = Db::table('TBUser')
				->where([
				'ID' => ['=',$data['userid']]
		])->count();

		$count2 = Db::table('TBCourse')
                ->where([
		    	'ID' => ['=',$data['courseid']]
		])->count();

		$count3 = Db::table('TBCourseMap')
                ->where([
				'CourseID' => ['=',$data['courseid']],
				'UserID' => ['=',$data['userid']]
		])->count();
	
		if($count3 == 1){ //--------------------------跳到http://localhost/index/course/checkedcourse?userid=xxx&courseid=xxx
				return json(['state'=>'all right','message'=>'学生已选择该课程，接下来显示课程','jump'=> '/tp5/public/index/course/checkedcourse?userid='.$data['userid'].'&courseid='.$data['courseid']]);
		}

		if($count2 == 1){//--------------------------跳到http://localhost/index/course/uncheckedcourse?userid=xxx&courseid=xxx
				return json(['state'=>'right courseid','message'=>'学生未选择该课程，接下来显示课程','jump'=> '/tp5/public/index/course/uncheckedcourse?userid='.$data['userid'].'&courseid='.$data['courseid']]);
		}
		else{
			return json(['state'=>'error','message'=>'没有该课程']);
		}
	}

	public function searchCourseName(Request $request){
		$data = $request->post()['data'];
		if($data['userid']==''){
			return json(['message' => '未输入学生学号']);
		}
		if($data['name']==''){
			return json(['message' => '未输入课程名']);
		}
		$count1 = Db::table('TBUser')
				->where([
				'ID' => ['=',$data['userid']]
		])->count();

		$dbdata = Db::table('TBCourse')
                ->where([
		    	'Name' => ['=',$data['name']]
		])->select();
		if(count($dbdata) != 0){
			foreach ($dbdata as $elem) {
				$count3 = Db::table('TBCourseMap')
                ->where([
						'CourseID' => ['=',$elem['ID']],
						'UserID' => ['=',$data['userid']]
				])->count();
				if($count3 != 0){ //--------------------------跳到http://localhost/index/course/checkedcourse?userid=xxx&courseid=xxx
					return json(['message'=>'学生已选择该课程，接下来显示课程','jump'=> '/tp5/public/index/course/checkedcourse?userid='.$data['userid'].'&courseid='.$elem['ID']]);
				}
		
				if($count3 == 0){//--------------------------跳到http://localhost/index/course/uncheckedcourse?userid=xxx&courseid=xxx
						return json(['message'=>'学生未选择该课程，接下来显示课程','jump'=> '/tp5/public/index/course/uncheckedcourse?userid='.$data['userid'].'&courseid='.$elem['ID']]);
				}
			}
		}
		else{
			return json(['state'=>'error','message'=>'没有该课程']);
		}
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
		return json(['jump'=> '/tp5/public/index/course/teacher?courseid='.$data['courseid'].'&userid='.$data['userid']]);
	}
	public function showURL(Request $request){
		$data = $request->post()['data'];
		return json(['jump'=> '/tp5/public/index/show/show?userid='.$data['userid'].'&courseid='.$data['courseid']]);
	}

	public function addURL(Request $request){
		$data = $request->post()['data'];
		return json(['jump'=> '/tp5/public/index/add/add?userid='.$data['userid'].'&courseid='.$data['courseid']]);
	}
	public function deleteURL(Request $request){
		$data = $request->post()['data'];
		return json(['jump'=> '/tp5/public/index/delete/delete?userid='.$data['userid'].'&courseid='.$data['courseid']]);
	}
	public function alterURL(Request $request){
		$data = $request->post()['data'];
		return json(['jump'=> '/tp5/public/index/alter/alter?userid='.$data['userid'].'&courseid='.$data['courseid']]);
	}
	public function correctURL(Request $request){
		$data = $request->post()['data'];
		return json(['jump'=> '/tp5/public/index/correct/correct?userid='.$data['userid'].'&courseid='.$data['courseid']]);
	}

}