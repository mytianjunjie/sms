<?php
/**
 * Created by PhpStorm.
 * User: tianjj
 * Date: 2018/4/10 0010
 * Time: 上午 11:31
 */
include_once "Sms.php";
include_once "SmsAdapter.php";
include_once "Curl.php";
include_once "Mcwx.php";

$sms = new \sms\SmsAdapter(new \sms\Mcwx());
$result = $sms->send();
echo '<pre>';
print_r($result);
exit;