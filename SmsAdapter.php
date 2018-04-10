<?php
namespace sms;

class SmsAdapter implements Sms
{
    /**
     * @var 短信操作实例
     */
    private $smsObject;

    /**
     * 构造函数
     * SmsAdapter constructor.
     * @param $smsObject
     */
    public function __construct($smsObject)
    {
        $this->smsObject = $smsObject;
    }

    /**
     * 短信发送
     * @return mixed
     */
    public function send()
    {
        return $this->smsObject->send();
    }
}