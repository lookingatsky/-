<?php

use Phalcon\Mvc\Model\Criteria;
use Phalcon\Paginator\Adapter\Model as Paginator;

/**
 * ProductsController
 *
 * Manage CRUD operations for products
 */
class ProductsController extends ControllerBase
{
    public function initialize()
    {
        $this->tag->setTitle('Manage your products');
        parent::initialize();
    }

    /**
     * Shows the index action
     */
    public function indexAction()
    {
        $this->session->conditions = null;
        $this->view->form = new ProductsForm;
    }

    /**
     * Search products based on current criteria
     */
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

    /**
     * Shows the form to create a new product
     */
    public function newAction()
    {
        $this->view->form = new ProductsForm(null, array('edit' => true));
    }

    /**
     * Edits a product based on its id
     */
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

    /**
     * Creates a new product
     */
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

    /**
     * Saves current product in screen
     *
     * @param string $id
     */
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

    /**
     * Deletes a product
     *
     * @param string $id
     */
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
}
