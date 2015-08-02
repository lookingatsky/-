<?php

use Phalcon\Mvc\Model\Criteria;
use Phalcon\Paginator\Adapter\Model as Paginator;

/**
 * ProductsController
 *
 * Manage CRUD operations for products
 */
class ActivityController extends ControllerBase
{
    public function initialize()
    {
        $this->tag->setTitle('活动');
        parent::initialize();
    }

    /**
     * Shows the index action
     */
    public function indexAction()
    {
        $this->session->conditions = null;
        $this->view->form = new ActivityForm;
    }
	
	public function addAction(){
		$this->view->form = new ActivityForm(null, array('edit' => true));
		$this->view->setVar('provinces',CityArea1::find());
	}
	
	public function mapAction($params){
		$this->view->cleanTemplateAfter('main');
		$this->view->setVar('location',$params);
	}
	
	public function areaAction(){
		$this->view->disable();
		$areaId = $this->request->getPost('id');
		$level = $this->request->getPost('level');
		if($level = 1){
			$areas = CityArea2::find("parent_id = '".$areaId."'");	
		}else if($level =2){
			
		}
		$areas = json_encode($areas->toArray());
		//$infos = BaiduApiInfo::findFirst($infoId);		
		echo $areas;
	}
/*	
	public function changeAction(){
		
	}

    public function searchAction()
    {
        $numberPage = 1;
        if ($this->request->isPost()) {
            $query = Criteria::fromInput($this->di, "Products", $this->request->getPost());
            $this->persistent->searchParams = $query->getParams();
        } else {
            $numberPage = $this->request->getQuery("page", "int");
        }

        $parameters = array();
        if ($this->persistent->searchParams) {
            $parameters = $this->persistent->searchParams;
        }

        $BaiduApiInfos = BaiduApiInfo::find($parameters);
        if (count($BaiduApiInfos) == 0) {
            $this->flash->notice("The search did not find any products");
            return $this->forward("products/index");
        }

        $paginator = new Paginator(array(
            "data"  => $BaiduApiInfos,
            "limit" => 5,
            "page"  => $numberPage
        ));	
		
        $this->view->page = $paginator->getPaginate();
    }

    public function newAction()
    {
        $this->view->form = new ProductsForm(null, array('edit' => true));
    }

    public function editAction($id)
    {
        if (!$this->request->isPost()) {

            $BaiduApiInfos = BaiduApiInfo::findFirstById($id);
            if (!$BaiduApiInfos) {
                $this->flash->error("没有对应记录");
                return $this->forward("products/index");
            }

            $this->view->form = new ProductsForm($BaiduApiInfos, array('edit' => true));
        }
    }

    public function createAction()
    {
        if (!$this->request->isPost()) {
            return $this->forward("products/index");
        }

        $form = new ProductsForm;
        $product = new Products();

        $data = $this->request->getPost();
        if (!$form->isValid($data, $product)) {
            foreach ($form->getMessages() as $message) {
                $this->flash->error($message);
            }
            return $this->forward('products/new');
        }

        if ($product->save() == false) {
            foreach ($product->getMessages() as $message) {
                $this->flash->error($message);
            }
            return $this->forward('products/new');
        }

        $form->clear();

        $this->flash->success("Product was created successfully");
        return $this->forward("products/index");
    }


    public function saveAction()
    {
        if (!$this->request->isPost()) {
            return $this->forward("products/index");
        }

        $id = $this->request->getPost("id", "int");

        $product = Products::findFirstById($id);
        if (!$product) {
            $this->flash->error("Product does not exist");
            return $this->forward("products/index");
        }

        $form = new ProductsForm;
        $this->view->form = $form;

        $data = $this->request->getPost();

        if (!$form->isValid($data, $product)) {
            foreach ($form->getMessages() as $message) {
                $this->flash->error($message);
            }
            return $this->forward('products/edit/' . $id);
        }

        if ($product->save() == false) {
            foreach ($product->getMessages() as $message) {
                $this->flash->error($message);
            }
            return $this->forward('products/edit/' . $id);
        }

        $form->clear();

        $this->flash->success("Product was updated successfully");
        return $this->forward("products/index");
    }


    public function deleteAction($id)
    {
        $products = Products::findFirstById($id);
        if (!$products) {
            $this->flash->error("Product was not found");
            return $this->forward("products/index");
        }

        if (!$products->delete()) {
            foreach ($products->getMessages() as $message) {
                $this->flash->error($message);
            }
            return $this->forward("products/search");
        }

        $this->flash->success("Product was deleted");
        return $this->forward("products/index");
    }
	
	public function changelocationAction(){
		$this->view->disable();
		$infoId = $this->request->getPost('id');
		$infos = BaiduApiInfo::findFirst($infoId);
		
		$infos->location_lng = $this->request->getPost('lng');
		$infos->location_lat = $this->request->getPost('lat');
		$infos->save();
	}
*/	
}
