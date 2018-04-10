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

    public function send()
    {
        $curlObject = new Curl();
        return $curlObject->post();
    }
}