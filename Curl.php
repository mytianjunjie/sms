<?php
/**
 * Created by PhpStorm.
 * User: tianjj
 * Date: 2018/4/10 0010
 * Time: 上午 11:26
 */

namespace sms;


class Curl
{
    public function get()
    {
        return $this->request();
    }

    public function post()
    {
        return $this->request();
    }

    public function request()
    {
        return __METHOD__;
    }
}