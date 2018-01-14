<?php
namespace app\index\controller;
use think\Controller;
use think\Request;
use think\Db;
class Search extends Controller{
    public function search(){
        return $this->fetch('search/search');
	}
	//显示所有作业
	public function showAllHomework(Request $request){
		$data = $request->post()['data'];
		$dbdata = Db::table('TBCourseHomework')
				->select();
		return json($dbdata);
		//dump($dbdata);
	}

	public function searchCourseID(Request $request){
		$data = $request->post()['data'];
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
				if($count3 > 0){ //--------------------------跳到http://localhost/index/course/checkedcourse?userid=xxx&courseid=xxx
					return json([['state'=>'学生已选择该课程','name'=>$data['name'],'id'=>$elem['ID'],'message'=>'学生已选择该课程，接下来显示课程','jump'=> '/tp5/public/index/course/checkedcourse?userid='.$data['userid'].'&courseid='.$elem['ID']]]);
				}
		
				if($count3 == 0){//--------------------------跳到http://localhost/index/course/uncheckedcourse?userid=xxx&courseid=xxx
						return json([['state'=>'学生未选择该课程','name'=>$data['name'],'id'=>$elem['ID'],'message'=>'学生未选择该课程，接下来显示课程','jump'=> '/tp5/public/index/course/uncheckedcourse?userid='.$data['userid'].'&courseid='.$elem['ID']]]);
				}
			}
		}
		else{
			return json(['state'=>'error','message'=>'没有该课程']);
		}
	}
}