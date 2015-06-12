<?php
use Phalcon\Mvc\Model\Criteria;
use Phalcon\Paginator\Adapter\Model as Paginator;

class IndexController extends ControllerBase
{
    public function initialize()
    {
        $this->tag->setTitle('Welcome');
        parent::initialize();
    }

    public function indexAction()
    {	
        if (!$this->request->isPost()){
            $this->flash->notice('欢迎来到维肯小屋');
        }	
	}
    
	
	//搜索结果信息列表
	public function listAction($id=1)
	{	
		if (!$this->request->isPost()) {
			$this->flash->notice('您可以搜索生活,酒店,饭店,企业等等');
		}else{
			$searchInfos = $this->request->getPost();
			//return true;
			if(trim($searchInfos['keywords']) != '' && trim($searchInfos['keywords'] != '搜索一下')){
				$this->view->searchWords = $searchInfos['keywords'];	
				$mapApi = new BaiduMapApi();
				$mapApi->query = $searchInfos['keywords'];	
				if(!isset($id)){
					$id = 1;	
				};
				$mapApi->page_num = (int)$id - 1;
				$mapInfos = $mapApi->getInfos();
				$mapInfos = json_decode($mapInfos,true);
						
				foreach($mapInfos['results'] as $key=>$val){
					//BaiduApiInfo  储存搜索结果
					$insertInfo = new BaiduApiInfo();
					$isInsert = BaiduApiInfo::FindFirst("uid = '".$val['uid']."'");
					if(!isset($isInsert->uid) || $isInsert->uid == ''){
						foreach($val as $key1 => $val1){
							if(!is_array($val1)){
								$insertInfo->$key1 = $val1;	
							}elseif($key1 == 'detail_info'){
								foreach($val1 as $key1_1 => $val1_1){
									if(!is_array($val1_1)){
										$insertInfo->$key1_1 = $val1_1;
									}	
								}
							}
						}
						$insertInfo->location_lng = $val['location']['lng'];
						$insertInfo->location_lat = $val['location']['lat'];
						
						if(!$insertInfo->save()){
							foreach ($insertInfo->getMessages() as $message) {
								$this->flash->error((string) $message);
							}
						}
					}	
				}
				
				//分页
				
				$listPager['index'] = $id;
				$listPager['total'] = ceil($mapInfos['total']/20);
				$this->view->listPager = $listPager;	
				
				if(isset($mapInfos['status']) &&  $mapInfos['status'] == 0){
					$this->view->mapDatas = $mapInfos;						
				}else{
					$this->flash->error('对不起，搜索有误！');	
				}				
			}else{
				$this->flash->notice('请输入关键词！');
			}
		}
	}
	
	//搜索结果信息地图列表
	public function mapAction(){
		
		
		
	}
}
