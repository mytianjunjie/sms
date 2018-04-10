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
    /**
     * 请求方法
     * @var
     */
    protected $requestMethod;

    /**
     * 传输数据
     * @var
     */
    public $data;

    /**
     * 请求地址
     * @var
     */
    public $url;

    /**
     * Curl constructor.
     * @param $url
     * @param $data
     */
    public function __construct($url, $data)
    {
        $this->url = $url;
        $this->data = $data;
    }

    /**
     * GET
     * @return mixed
     */
    public function get()
    {
        return $this->request();
    }

    /**
     * POST
     * @return mixed
     */
    public function post()
    {
        $this->requestMethod = CURLOPT_POST;
        return $this->request();
    }

    protected function request()
    {
        $curl = curl_init();
        //设置抓取的url
        curl_setopt($curl, CURLOPT_URL, 'http://www.baidu.com');
        //设置头文件的信息作为数据流输出
        curl_setopt($curl, CURLOPT_HEADER, 1);
        //设置获取的信息以文件流的形式返回，而不是直接输出。
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
        if ($this->requestMethod) {
            curl_setopt($curl, $this->requestMethod, 1);
            curl_setopt($curl, CURLOPT_POSTFIELDS, $this->data);
        }
        //执行命令
        $result = curl_exec($curl);
        //关闭URL请求
        curl_close($curl);
        return $result;
    }
}