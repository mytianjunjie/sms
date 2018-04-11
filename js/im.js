// XMPP服务器BOSH地址
//var BOSH_SERVICE = 'ws://172.23.6.21:5290';
// XMPP连接
var connection = null;
// 当前状态是否连接
var connected = false;
// 当前登录的JID
//var jid = "";

imConnect();

function imConnect() {
    $.ajax({
        type: "GET",
        url: "/base/base/get-im-secret-key",
        data: {},
        dataType: 'json',
        success: function (result) {
//        console.log(result);
            if (result.status == 1) {
                //var data = JSON.parse(result.data);
                var data = result.data;
                if (data != null && data != 'undefined') {
                    if (!connected) {
                        connection = new Strophe.Connection("ws://" + data.im_ip + ":" + data.im_port);
                        connection.connect(data.im_user_name, data.im_token, onConnect);
                        console.log(data);
                    }
                } else {
                    parent.App.errorTips('提示信息：', '获取消息服务信息失败，请刷新浏览器重试');
                    return false;
                }
            } else {
                parent.App.errorTips('提示信息：', result.msg);
                return false;
            }
        },
        error: function (result) {
            console.log(result);
            return false;
        }
    });
}

// 连接状态改变的事件
function onConnect(status) {
    console.log(connection);
    if (status == Strophe.Status.CONNFAIL) {
        App.errorTips('提示信息：', "消息服务器连接失败，将无法收到系统推送消息，请刷新页面重试");
        console.log(unixToTime($.now()/1000, true, 8) + " 消息服务器连接失败，将无法收到系统推送消息，请刷新页面重试");
    } else if (status == Strophe.Status.AUTHFAIL) {
        App.errorTips('提示信息：', "消息服务器验证失败，将无法收到系统推送消息，请联系系统管理员");
        console.log(unixToTime($.now()/1000, true, 8) + " 消息服务器验证失败，将无法收到系统推送消息，请联系系统管理员");
    } else if (status == Strophe.Status.DISCONNECTED) {
        console.log(unixToTime($.now()/1000, true, 8) + " 消息服务器连接断开，正在为您重连，请耐心等待");
        reConnect();
    } else if (status == Strophe.Status.CONNECTED) {
        console.log(unixToTime($.now()/1000, true, 8) + " 消息服务器连接成功");
        connected = true;
        // 当接收到<message>节，调用onMessage回调函数
        connection.addHandler(onMessage, null, 'message', null, null, null);
        // 首先要发送一个<presence>给服务器（initial presence）
        connection.send($pres().tree());
        //获取好友列表
        getRoster(connection);
    }
}

function reConnect() {
    connected = false;
//    App.infoTips('提示信息：',"消息服务器连接断开，正在为您重连，请耐心等待");
//    console.log("消息服务器连接断开，正在为您重连，请耐心等待");
    imConnect();
}
var audio;
// 接收到<message>
function onMessage(msg) {
    console.log(msg);
//    var from = msg.getAttribute('from');
//    var type = msg.getAttribute('type');
//    var elems = msg.getElementsByTagName('body');
//    if(type == 'headline' && elems.length > 0){
//        var data = JSON.parse(elems[0].innerHTML);
//        if(data.busitype == 'inquiry'){
//            App.infoTips('提示信息：', '您有新的询价单待处理');
//            refresh('/unipei/proxy/todo-inquiries');
//        }
//    }
    var from = msg.getAttribute('from');
    var type = msg.getAttribute('type');
    var elems = msg.getElementsByTagName('event');
    for (var i = 0; i < elems.length; i++) {
        var items = elems[i].getElementsByTagName('items');
        for (var j = 0; j < items.length; j++) {
            var item = items[j];
            var content = item.getElementsByTagName('content');
            content = JSON.parse(content[0].innerHTML);
//            console.log(content);
            if (content.busiType == 'unp_s_1') {
                $.webnotice('提示信息：', {body: content.content});
                refresh('/unp/dispatch/dlr-dspts');
                refresh('/unp/dispatch/dlr-dspts-test');
            }else if(content.busiType == 'nopayorder'){
//                $.webnotice('提示信息：', {body:'您有新的支付超时订单待处理'});
                $.webnotice('提示信息：', {body: content.content});
                refresh('/unp/order/orders');
            }
            if (!audio) {
                audio = new JpAudio();
            }
            audio.play({url: Yii_themeUrl + '/js/audio/office.mp3'});
        }
    }
    return true;
}

function unixToTime(unixTime, isFull, timeZone) {
    if (typeof (timeZone) == 'number')
    {
        unixTime = parseInt(unixTime) + parseInt(timeZone) * 60 * 60;
    }
    var time = new Date(unixTime * 1000);
    var ymdhis = "";
    ymdhis += time.getUTCFullYear() + "-";
    ymdhis += (time.getUTCMonth()+1) + "-";
    ymdhis += time.getUTCDate();
    if (isFull === true)
    {
        ymdhis += " " + time.getUTCHours() + ":";
        ymdhis += time.getUTCMinutes() + ":";
        ymdhis += time.getUTCSeconds();
    }
    return ymdhis;
}