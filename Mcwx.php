<?php
/**
 * Created by PhpStorm.
 * User: tianjj
 * Date: 2018/4/10 0010
 * Time: 上午 11:29
 */

namespace sms;

/**
 * 名传无线短信
 * Class Mcwx
 * @package sms
 */
class Mcwx implements Sms
{
    protected $url = '';

    public function send()
    {
        $data = [];
        $curlObject = new Curl($this->url, $data);
        return $curlObject->post();
    }

    public function getData()
    {
        
    }
}