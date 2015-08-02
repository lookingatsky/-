<?php

use \Phalcon\Http\Response;
/**
 * SessionController
 *
 * Allows to register new users
 */
class RegisterController extends ControllerBase
{
    public function initialize()
    {
        $this->tag->setTitle('登录/注册');
        parent::initialize();
    }

    /**
     * 注册新用户
     */
    public function indexAction()
    {
        $form = new RegisterForm;
        $this->view->form = $form;
    }
		
	public function sendemailAction(){
        if ($this->request->isPost()) {
            $email = $this->request->getPost('email', 'email');
			
			$time = time();		
			$emailContent = "亲爱的".$email."： \r\n";
 			$emailContent .= "欢迎您来到维肯小屋！ \r\n";
			$emailContent .= "请马上点击以下链接完成注册 \r\n";
			$emailContent .= "http://test0.com/register/verifyemail/".md5($time."+".$email)."\r\n";
			$emailContent .= "(如果该链接无法点击，请将它完成复制并粘贴至浏览器的地址栏中访问)\r\n\r\n\r\n";
			$emailContent .= "这是一封系统自动发出的邮件，请不要直接回复。\r\n";
			$emailContent .= "如有疑问可发送邮件至lookingatsky@126.com。\r\n\r\n";
			$emailContent .= "维肯小屋\r\n";
			$emailContent .= "http://www.viconhouse.com";
			$mail = new Mail();
			$result = $mail->smtp($email,'请验证您的邮箱（自：维肯小屋——欢乐家园）',$emailContent);
			//$result = true;
			$this->view->setVar("email", $email);
			$results = VerifyEmail::Find("email = '".$email."'");
			foreach($results as $result){
				if($result->delete() == false){
					//存log
					foreach ($result->getMessages() as $message) {
						
					}
				}else{
					//存log
				}
			}
			
			$verifyEmail = new VerifyEmail();
			$verifyEmail->email = $email;
			$verifyEmail->time = $time;
			$verifyEmail->verifyCode = md5($time."+".$email);	
			$verifyEmail->active = 'Y';
			if ($verifyEmail->save() == false) {
                foreach ($user->getMessages() as $message) {
                    $this->flash->error((string) $message);
                }						
			}else{
				if($result){	
					$arrRs = explode('@',$email);
					$mailLink = 'http://mail.'.$arrRs[1];
					$this->view->setVar("mailLink", $mailLink);
					$this->flash->success('邮件已发送至您的邮箱，请查收！');
				}else{
					$this->flash->error('发送失败！');	
					$this->forward('register/index');
				} 				
			}
			
/*             $user = new Users();
            $user->username = $username;
            $user->password = sha1($password);
            $user->name = $name;
            $user->email = $email;
            $user->created_at = new Phalcon\Db\RawValue('now()');
            $user->active = 'Y';
			
            if ($user->save() == false) {
                foreach ($user->getMessages() as $message) {
                    $this->flash->error((string) $message);
                }
            } else {
                $this->tag->setDefault('email', '');
                $this->tag->setDefault('password', '');
                $this->flash->success('Thanks for sign-up, please log-in to start generating invoices');
                return $this->forward('session/index');
            } 
			$this->persistent->verifyemail = true;
			*/
        }else{
			$this->response->redirect("index/index");
		}
		
	}
	
	public function verifyemailAction($code){
		if($code){
			$results = VerifyEmail::FindFirst("verifyCode = '".$code."'");			
			$form = new RegisterForm;
			if(isset($results) && $results != ''){
				if($results->active == 'Y'){
					if(md5($results->time.'+'.$results->email) == $code){
						$this->view->form = $form;
						$this->view->setVar("email", $results->email);
					}else{
						$this->flash->error('邮箱验证错误！');
						$this->response->redirect("register/index");					
					}					
				}else{
					$this->flash->error('邮箱已经验证通过，请登录！');
					$this->response->redirect("session/index");
				}
			}else{
				$this->flash->error('验证码已过期！');
				$this->response->redirect("register/index"); 
			}
		}else{
			$this->response->redirect("index/index");
		}
	}

 	public function registerAction(){
		
		if ($this->request->isPost()) {
			$email = $this->request->getPost('email');	
			$username = $this->request->getPost('username');
			$password = $this->request->getPost('password');
			$user = new Users();
            $user->username = $username;
            $user->password = sha1($password);
            $user->email = $email;
            $user->created_at = new Phalcon\Db\RawValue('now()');
            $user->active = 'Y';

			
			
			
            if ($user->save() == false) {
                foreach ($user->getMessages() as $message) {
                    $this->flash->error((string) $message);
                }
            } else {
				$verifyEmail = VerifyEmail::FindFirst("email = '".$email."'");
				$verifyEmail->active = 'N';
				$verifyEmail->save();
				
                $this->tag->setDefault('email', '');
                $this->tag->setDefault('password', '');
                $this->flash->success('感谢您注册维肯小屋，登录即可进入小屋!');
                return $this->forward('session/index');
            } 
		}		
	}	 
}
