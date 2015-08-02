<?php

use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Textarea;
use Phalcon\Forms\Element\Hidden;
use Phalcon\Forms\Element\Select;
use Phalcon\Validation\Validator\PresenceOf;
use Phalcon\Validation\Validator\Email;
use Phalcon\Validation\Validator\Numericality;

class ActivityForm extends Form
{


    public function initialize($entity = null, $options = array())
    {
        if (!isset($options['edit'])) {
            $element = new Text("id");
            $this->add($element->setLabel("Id"));
        } else {
            $this->add(new Hidden("id"));
        }
        $info_id = new Hidden("info_id");
        $this->add($info_id);
		
        $title = new Text("title");
        $title->setLabel("标题");
        $title->setFilters(array('striptags', 'string'));
        $title->addValidators(array(
            new PresenceOf(array(
                'message' => '请输入活动标题'
            ))
        ));
        $this->add($title);

        $address = new Textarea("address");
        $address->setLabel("地址");
        $address->setFilters(array('striptags', 'string'));
        $address->addValidators(array(
            new PresenceOf(array(
                'message' => '请输入地址'
            ))
        ));
        $this->add($address);		
		
        $time = new Text("time");
        $time->setLabel("活动时间");
        $time->setFilters(array('striptags', 'string'));
        $time->addValidators(array(
            new PresenceOf(array(
                'message' => '请输入电话'
            ))
        ));
        $this->add($time);		
		
        $requirement = new Text("requirement");
        $requirement->setLabel("条件");
        $requirement->setFilters(array('striptags', 'string'));
        $requirement->addValidators(array(
            new PresenceOf(array(
                'message' => '请输入电话'
            ))
        ));
        $this->add($requirement);		
		
        $arrangement = new Textarea("arrangement");
        $arrangement->setLabel("活动安排");
        $arrangement->setFilters(array('striptags', 'string'));
        $arrangement->addValidators(array(
            new PresenceOf(array(
                'message' => '请输入电话'
            ))
        ));
        $this->add($arrangement);		
		
        $contacts = new Text("contacts");
        $contacts->setLabel("联系人");
        $contacts->setFilters(array('striptags', 'string'));
        $contacts->addValidators(array(
            new PresenceOf(array(
                'message' => '请输入电话'
            ))
        ));
        $this->add($contacts);		
		
        $phone = new Text("phone");
        $phone->setLabel("联系人电话");
        $phone->setFilters(array('striptags', 'string'));
        $phone->addValidators(array(
            new PresenceOf(array(
                'message' => '请输入电话'
            ))
        ));
        $this->add($phone);		
/*		
        $tag = new Text("tag");
        $tag->setLabel("类别");
        $tag->setFilters(array('striptags', 'string'));
        $tag->addValidators(array(
            new PresenceOf(array(
                'message' => '请输入类别'
            ))
        ));
        $this->add($tag);		
*/		
/*         $type = new Select('product_types_id', ProductTypes::find(), array(
            'using'      => array('id', 'name'),
            'useEmpty'   => true,
            'emptyText'  => '...',
            'emptyValue' => ''
        ));
        $type->setLabel('Type');
        $this->add($type);
		
        $price->setLabel("Price");
        $price->setFilters(array('float'));
        $price->addValidators(array(
            new PresenceOf(array(
                'message' => 'Price is required'
            )),
            new Numericality(array(
                'message' => 'Price is required'
            ))
        ));
        $this->add($price); */
    }
}