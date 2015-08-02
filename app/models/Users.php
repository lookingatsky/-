<?php

use Phalcon\Mvc\Model;
use Phalcon\Mvc\Model\Validator\Email as EmailValidator;
use Phalcon\Mvc\Model\Validator\Uniqueness as UniquenessValidator;

class Users extends Model
{
    public function validation()
    {
        $this->validate(new EmailValidator(array(
            'field' => 'email'
        )));
        $this->validate(new UniquenessValidator(array(
            'field' => 'email',
            'message' => '该邮箱已经注册'
        )));
        $this->validate(new UniquenessValidator(array(
            'field' => 'username',
            'message' => '该用户名已经注册'
        )));
        if ($this->validationHasFailed() == true) {
            return false;
        }
    }
}
