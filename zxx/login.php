<?php
namespace app\index\controller;
use think\Controller;
use think\Request;
use think\Db;
class Login extends Controller{
    public function login(){
        return $this->fetch('login/login');
    }
	public function doLogin(Request $request){
		$data = $request->post()['data'];
		$count = Db::table('tbuser')
        ->where([
		    'Name' => ['=',$data['Name']],
			'Password' => ['=', $data['Password']]
		])->count();
		if($count == 1){ //用户存在,且密码正确
			return json(['state'=>'ok','jump'=>'http://localhost//tp5/public/index/login/login']);
		}
		else{
			$count = Db::table('tbuser')
            ->where([ //仅用户存在
		        'Name' => ['=',$data['Name']] 
		    ])->count();
			if($count == 1){
				return json(['state'=>'error','message'=>'wrong password']);
			}
			else{
				return json(['state'=>'error','message'=>'no this user']);
			}
			
		}
	}
}
