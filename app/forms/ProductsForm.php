<?php

use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Textarea;
use Phalcon\Forms\Element\Hidden;
use Phalcon\Forms\Element\Select;
use Phalcon\Validation\Validator\PresenceOf;
use Phalcon\Validation\Validator\Email;
use Phalcon\Validation\Validator\Numericality;

class ProductsForm extends Form
{

    /**
     * Initialize the products form
     */
    public function initialize($entity = null, $options = array())
    {

        if (!isset($options['edit'])) {
            $element = new Text("id");
            $this->add($element->setLabel("Id"));
        } else {
            $this->add(new Hidden("id"));
        }

/*         $name = new Text("name");
        $name->setLabel("Name");
        $name->setFilters(array('striptags', 'string'));
        $name->addValidators(array(
            new PresenceOf(array(
                'message' => '请输入标题'
            ))
        ));
        $this->add($name); */

        $name = new Text("name");
        $name->setLabel("标题");
        $name->setFilters(array('striptags', 'string'));
        $name->addValidators(array(
            new PresenceOf(array(
                'message' => '请输入标题'
            ))
        ));
        $this->add($name);

        $address = new Textarea("address");
        $address->setLabel("地址");
        $address->setFilters(array('striptags', 'string'));
        $address->addValidators(array(
            new PresenceOf(array(
                'message' => '请输入地址'
            ))
        ));
        $this->add($address);		
		
        $telephone = new Text("telephone");
        $telephone->setLabel("电话");
        $telephone->setFilters(array('striptags', 'string'));
        $telephone->addValidators(array(
            new PresenceOf(array(
                'message' => '请输入电话'
            ))
        ));
        $this->add($telephone);		
		
        $tag = new Text("tag");
        $tag->setLabel("类别");
        $tag->setFilters(array('striptags', 'string'));
        $tag->addValidators(array(
            new PresenceOf(array(
                'message' => '请输入类别'
            ))
        ));
        $this->add($tag);		
		
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