<?php

/**
 * BaiduMaApi
 *
 * 调用百度地图接口，查询地图信息
 */
class BaiduMapApi
{
	public $query;
	public $tag;
	public $output = "json";	
	public $scope = 2;	
	public $filter;	
	public $page_size = 20;	
	public $page_num = 0;	
	public $ak = "u3wn5UIKKoI8TUDUhbtb1I0E";	
	public $sn;	
	public $timestamp;	
	public $region = "北京";	
	private $url = 'http://api.map.baidu.com/place/v2/search';
	
	
	public function getInfos()
	{	
		$getInfoUrl = $this->url;
		$getInfoUrl .= '?ak='.$this->ak;
		$getInfoUrl .= '&output='.$this->output;
		$getInfoUrl .= '&scope='.$this->scope;
		
		$keywords = explode(' ',trim($this->query));
		foreach($keywords as $k=>$v){
			if($v != ''){
				$queryKeyword[] = $v;
			}
		}
		
		$queryKeywords = urlencode(implode('',$queryKeyword));
		
		if($queryKeywords != ''){
			$getInfoUrl .= '&query='.$queryKeywords;
		}else{
			return false;
		}
		
		
		if($this->tag != ''){
			$getInfoUrl .= '&tag='.$this->tag;			
		}
		
		$getInfoUrl .= '&page_num='.$this->page_num;			
		
		
		if($this->page_size != ''){
			$getInfoUrl .= '&page_size='.$this->page_size;			
		}
		
		if($this->filter != ''){
			$getInfoUrl .= '&filter='.$this->filter;			
		}
		
		if($this->sn != ''){
			$getInfoUrl .= '&sn='.$this->sn;
			if($this->timestamp != ''){
				$getInfoUrl .= '&timestamp='.$this->timestamp;
			}else{
				return false;
			}	
		}
		
		if($this->region != ''){
			$getInfoUrl .= '&region='.urlencode($this->region);			
		}
		
		$infoArr = file_get_contents($getInfoUrl);
		return $infoArr;
/* 		if (!isset($this->persistent->acl)) {

			$acl = new AclList();

			$acl->setDefaultAction(Acl::DENY);

			
			$roles = array(
				'users'  => new Role('Users'),
				'guests' => new Role('Guests')
			);
			foreach ($roles as $role) {
				$acl->addRole($role);
			}

			
			$privateResources = array(
				'companies'    => array('index', 'search', 'new', 'edit', 'save', 'create', 'delete'),
				'products'     => array('index', 'search', 'new', 'edit', 'save', 'create', 'delete'),
				'producttypes' => array('index', 'search', 'new', 'edit', 'save', 'create', 'delete'),
				'invoices'     => array('index', 'profile')
			);
			foreach ($privateResources as $resource => $actions) {
				$acl->addResource(new Resource($resource), $actions);
			}

			
			$publicResources = array(
				'index'      => array('index'),
				'about'      => array('index'),
				'register'   => array('index'),
				'errors'     => array('show401', 'show404', 'show500'),
				'session'    => array('index', 'register', 'start', 'end'),
				'contact'    => array('index', 'send')
			);
			foreach ($publicResources as $resource => $actions) {
				$acl->addResource(new Resource($resource), $actions);
			}

			
			foreach ($roles as $role) {
				foreach ($publicResources as $resource => $actions) {
					foreach ($actions as $action){
						$acl->allow($role->getName(), $resource, $action);
					}
				}
			}

			
			foreach ($privateResources as $resource => $actions) {
				foreach ($actions as $action){
					$acl->allow('Users', $resource, $action);
				}
			}

			
			$this->persistent->acl = $acl;
		}

		return $this->persistent->acl; */
	}
	
	
/* 	public function beforeDispatch(Event $event, Dispatcher $dispatcher)
	{

		$auth = $this->session->get('auth');
		if (!$auth){
			$role = 'Guests';
		} else {
			$role = 'Users';
		}

		$controller = $dispatcher->getControllerName();
		$action = $dispatcher->getActionName();

		$acl = $this->getAcl();

		$allowed = $acl->isAllowed($role, $controller, $action);
		if ($allowed != Acl::ALLOW) {
			$dispatcher->forward(array(
				'controller' => 'errors',
				'action'     => 'show401'
			));
                        $this->session->destroy();
			return false;
		}
	} */
}
