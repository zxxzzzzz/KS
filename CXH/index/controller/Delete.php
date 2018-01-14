<?php
namespace app\index\controller;
use think\Controller;
use think\Request;
use think\Db;
class Delete extends Controller{
    public function delete(){
        return $this->fetch('delete/delete');
	}
	public function deleteHomework(Request $request){
		$data = $request->post()['data'];
		if($data['Name']==''){
			return json(['message' => '未输入作业名']);
		}
		$count1 = Db::table('TBCourseHomework')
				->where([
					'ID' => ['=',$data['ID']]
				])->count();
		if($count1 == 1){ 
			$dbdata = Db::table('TBCourseHomework')
                ->where([
					'ID' => ['=',$data['ID']]
				])->delete();
			return json(['message'=>'删除成功']);
		}		
		return json(['message'=>'查找不到该课程']);
	}
	public function returnUp(Request $request){
		$data = $request->post()['data'];
		return json(['jump'=> '/tp5/public/index/homework/teacher?courseid='.$data['courseid'].'&userid='.$data['userid']]);
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