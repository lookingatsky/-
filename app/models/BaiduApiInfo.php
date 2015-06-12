<?php
use Phalcon\Mvc\Model\Relation;

class BaiduApiInfo extends Phalcon\Mvc\Model
{

    public $id;
    public $name;
    public $location_lng;
    public $location_lat;
    public $address;
	public $street_id;
	public $detail;
	public $uid;
	public $tag;
	public $telephone;
    public $type;
    public $detail_url;
    public $price;
	public $overall_rating;
	public $service_rating;
	public $facility_rating;
	public $hygiene_rating;
	public $environment_rating;
	public $image_num;
	public $comment_num;
	public $favorite_num;
	public $checkin_num;


	
    public function initialize()
    {
/* 		//建立联表	
        $this->hasOne('id', 'BaiduApiDetail', 'info_id', array(
        	'foreignKey' => array(
        		'action' => Relation::ACTION_CASCADE
        	)
        )); */
    }

}
