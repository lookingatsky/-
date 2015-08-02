<?php

use Phalcon\Flash;
use Phalcon\Session;

class InvoicesController extends ControllerBase
{
    public function initialize()
    {
        $this->tag->setTitle('Manage your Invoices');
        parent::initialize();
    }

    public function indexAction()
    {
    }

    /**
     * Edit the active user profile
     *
     */ 
    public function profileAction()
    {
        //Get session info
        $auth = $this->session->get('auth');

        //Query the active user
        $user = Users::findFirst($auth['id']);
        if ($user == false) {
            return $this->_forward('index/index');
        }

        if (!$this->request->isPost()) {				
			$this->view->setVar("id", $auth['id']);	
			$this->view->setVar("email", $user->email);
			$this->view->setVar("username",$user->username);
			$this->view->setVar("imgSrc",$user->imgSrc);
        } else {

            $name = $this->request->getPost('name', array('string', 'striptags'));
            $email = $this->request->getPost('email', 'email');

            $user->name = $name;
            $user->email = $email;
            if($user->save() == false) {
                foreach ($user->getMessages() as $message) {
                    $this->flash->error((string) $message);
                }
            }else{
                $this->flash->success('您的信息更新完毕！');
            }
        }
    }
	
	public function changeimageAction(){
		$this->view->disable();
		$userId = $this->request->getPost('id');
		$user = Users::findFirst($userId);
		$user->imgSrc = $this->request->getPost('imgsrc');
		$user->save();
	}
}
