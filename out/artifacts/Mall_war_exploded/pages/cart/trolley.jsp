<%--
  Created by IntelliJ IDEA.
  User: loongchan
  Date: 2022/5/8
  Time: 15:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>我的购物车</title>
    <%@ include file="/pages/common/head.jsp"%>
    <link rel="stylesheet" href="static/css/index.css">
</head>
<body>
<div class="order_head">
    <div class="head_background">
        <div class="head_box">
            <a href="index.html" class="head_left_a"><img src="static/img/logo.jpg" alt="" class="head_left_p"></a>
            <h1 class="head_h1">我的购物车</h1>
            <div class="head_right">
                <span class="head_right_in">1412625918 ∨</span>
                <span class="head_right_in">|</span>
                <a href="order.html" class="head_right_in">我的订单</a>
            </div>

        </div>
    </div>
</div>
<div class="trolley_background">
    <div class="trolley_background_in">
        <div class="tro_tab_h">
            <div class="col tro_tab_check">
                <h1 class="tro_tab_check_p">√</h1>
                <span class="tro_tab_check_sp">全选</span>

            </div>
            <div class="col tro_tab_img">

            </div>
            <p class="col tro_tab_name">商品名称</p>
            <div class="col tro_tab_price">单价</div>
            <div class="col tro_tab_num">数量</div>
            <div class="col tro_tab_total">小计</div>
            <div class="col tro_tab_action">操作</div>

        </div>
        <div class="tro_tab_h1">
            <div class="col tro_tab_check">
                <h1 class="tro_tab_check_p">√</h1>
                <span class="tro_tab_check_sp"></span>

            </div>
            <div class="col tro_tab_img">
                <img src="static/img/app_04.jpg" alt="">

            </div>
            <div class="col tro_tab_name">
                <!--<h2 tro_tab_name_h2>小米电视4A 32英寸 黑色 32英寸</h2>-->
                <li class="tro_tab_name_li1">小米电视4A 32英寸 黑色 32英寸</li>
                <li class="tro_tab_name_li2">适配机型:小米电视</li>

            </div>
            <div class="col tro_tab_price">
                <span  id="price">999</span><span>元</span>
            </div>
            <div class="col tro_tab_num">
                <a class="tro_tab_num_p1" id="subtract" href="javascript:;">-</a>
                <input type="text" value="1" id="num">
                <a class="tro_tab_num_p2" id="plus" href="javascript:;">+</a>
            </div>
            <div class="col tro_tab_total "><span class="tro_tab_total_value" id="prices" >999</span>元

            </div>
            <div class="col tro_tab_action">x</div>

        </div>
        <div class="tro_item">
            <p class="tro_item_box">+</p>
            <p class="tro_item_p">影视会员年卡199元 <span style="color: #ff6700">(省299元)</span></p>

        </div>
        <div class="tro_item">
            <p class="tro_item_box">+</p>
            <p class="tro_item_p">电视安装服务费70元 <span style="color: #ff6700"></span></p>

        </div>
    </div>
    <div class="tro_item_bot">
        <p class="tro_bot_ppp">+</p>
        <p class="tro_item_p ">1000mAh小米移动电源2 74元 <span style="color: #ff6700"></span></p>

    </div>
    <div class="tro_close_bot ">
        <!--<p class="tro_bot_ppp">+</p>-->
        <p class="tro_close_p ">继续购物 | 共<span>1</span>件,已选择了<span>1</span>件<span style="color: #ff6700"></span></p>

        <p class="tro_close_p_r">去结算</p>
        <p class="tro_close_p_c">合计:<span id="close">999</span>元</p>
    </div>

</div>


<div class="foot">
    <ul class="foot_ul">
        <li class="foot_li">预约维修服务</li>
        <li class="foot_li">7天无理由退货</li>
        <li class="foot_li">15天免费换货</li>
        <li class="foot_li">满15元包邮</li>
        <li class="foot_li foot_fot">520余家售后网点</li>
    </ul>
    <div class="foot_center">
        <div class="foot_cen_left">
            <dl class="foot_dl">
                <dt class="foot_dt">帮助中心</dt>
                <dd class="foot_dd"><a>账户管理</a></dd>
                <dd class="foot_dd"><a>购物指南</a></dd>
                <dd class="foot_dd"><a>订单操作</a></dd>
            </dl>
            <dl class="foot_dl">
                <dt class="foot_dt">帮助中心</dt>
                <dd class="foot_dd"><a>账户管理</a></dd>
                <dd class="foot_dd"><a>购物指南</a></dd>
                <dd class="foot_dd"><a>订单操作</a></dd>
            </dl>
            <dl class="foot_dl">
                <dt class="foot_dt">帮助中心</dt>
                <dd class="foot_dd"><a>账户管理</a></dd>
                <dd class="foot_dd"><a>购物指南</a></dd>
                <dd class="foot_dd"><a>订单操作</a></dd>
            </dl>
            <dl class="foot_dl">
                <dt class="foot_dt">帮助中心</dt>
                <dd class="foot_dd"><a>账户管理</a></dd>
                <dd class="foot_dd"><a>购物指南</a></dd>
                <dd class="foot_dd"><a>订单操作</a></dd>
            </dl>
            <dl class="foot_dl">
                <dt class="foot_dt">帮助中心</dt>
                <dd class="foot_dd"><a>账户管理</a></dd>
                <dd class="foot_dd"><a>购物指南</a></dd>
                <dd class="foot_dd"><a>订单操作</a></dd>
            </dl>
            <dl class="foot_dl">
                <dt class="foot_dt">帮助中心</dt>
                <dd class="foot_dd"><a>账户管理</a></dd>
                <dd class="foot_dd"><a>购物指南</a></dd>
                <dd class="foot_dd"><a>订单操作</a></dd>
            </dl>
        </div>
        <div class="foot_cen_right">
            <p class="foot-phone">400-100-5678</p>
            <p class="foot-right-center">周一至周日 8:00-18:00<br>（仅收市话费)</p>
            <a class="foot-right-bottmo" href="">联系客服</a>
        </div>
    </div>
</div>
<div class="fot_bot_max">
    <div class="fot_bot">
        <img src="static/img/logo.jpg" class="fot_bot_logo" >
        <div class="fot_bot_text">
            <p class="fot_bot_p">
                <a class="fot_bot_a" href="">小米商城</a>
                <span class="fot_bot_span">|</span>
                <a class="fot_bot_a" href="">MIUI</a>
                <span class="fot_bot_span">|</span>
                <a class="fot_bot_a" href="">米家</a>
                <span class="fot_bot_span">|</span>
                <a class="fot_bot_a" href="">米聊</a>
                <span class="fot_bot_span">|</span>
                <a class="fot_bot_a" href="">多看</a>
                <span class="fot_bot_span">|</span>
                <a class="fot_bot_a" href="">游戏</a>
                <span class="fot_bot_span">|</span>
                <a class="fot_bot_a" href="">路由器</a>
                <span class="fot_bot_span">|</span>
                <a class="fot_bot_a" href="">米粉卡</a>
                <span class="fot_bot_span">|</span>
                <a class="fot_bot_a" href="">政企服务</a>
                <span class="fot_bot_span">|</span>
                <a class="fot_bot_a" href="">小米天猫店</a>
                <span class="fot_bot_span">|</span>
                <a class="fot_bot_a" href="">隐私政策</a>
                <span class="fot_bot_span">|</span>
                <a class="fot_bot_a" href="">问题反馈</a>
                <span class="fot_bot_span">|</span>
                <a class="fot_bot_a" href="">廉政举报</a>
                <span class="fot_bot_span">|</span>
                <a class="fot_bot_a" href="">Select Region</a>
            </p>
            <p class="fot_bot_p fot_bot_a1">
                "©"
                <a class="fot_bot_a1" href="">mi.con</a>
                " 京ICP证110507号"
                <a class="fot_bot_a1" href="">京ICP备10046444号</a>
                <a class="fot_bot_a1" href="">京公网安备11010802020134号</a>
                <a class="fot_bot_a1" href="">京网文[2017]1530-131号</a>
                "<br>违法和不良信息举报电话：185-0130-1238，本网站所列数据，除特殊说明，所有数据均出自我司实验室测试"



            </p>
        </div>
        <div class="fot_bot_right">
            <a href="" class="fot_bot_right_img"><img src="static/img/foot_01.png" alt=""></a>
            <a href="" class="fot_bot_right_img"><img src="static/img/foot_02.png" alt=""></a>
            <a href="" class="fot_bot_right_img"><img src="static/img/foot_03.png" alt=""></a>
            <a href="" class="fot_bot_right_img"><img src="static/img/foot_04.png" alt=""></a>
            <a href="" class="fot_bot_right_img"><img src="static/img/foot_05.png" alt=""></a>
        </div>

    </div>
    <img class="fot_bottom_img" src="static/img/foot_06.png">
</div>

<script>
    var price = document.getElementById("price").innerHTML;
    console.log(price);
    var numElement = document.getElementById("num");
    var num = 1;
    numElement.onblur = function () {
        num = numElement.value;
        if(!regxep1.test(num)){
            num =1;
            alert("输入的数量只能是数字！")

        }else {
            if(Number(num) < 1){
                num =1;
                alert("该商品数量不能小于0")
            }else if(Number(num) > 5){
                num = 5;
                alert("该商品数量不能大于5")
            }
        }
        document.getElementById("num").value=num

        sums = price*num;
        close.innerHTML=sums
        prices.innerHTML=sums;


    }

    var prices = document.getElementById("prices");
    console.log("prices值:"+prices);
    var plus = document.getElementById("plus");
    var subtract = document.getElementById("subtract");
    var close = document.getElementById("close");
    console.log("close值:"+close);
    var regxep1= /\d/;
    var sum1 =0;


    plus.onclick = function(){
        num = Number(num)+1;

        if(Number(num) >=1 && Number(num) <= 5){
            console.log("num:"+num);
            console.log(num);
            sum = price*num;
            document.getElementById("num").value=num;
            prices.innerHTML=sum;
            close.innerHTML=sum;
        }else if(Number(num) >= 5){
            alert("该商品数量不能大于5")
            num = Number(num)-1;
        }


//            sum(num);
    }
    subtract.onclick = function(){
        num --;
        if(Number(num) >= 1 && Number(num) <= 5){
            console.log("num:"+num);
            sum = price*num;
            document.getElementById("num").value=num;
            prices.innerHTML=sum;
            close.innerHTML=sum;
        }else  if(Number(num) <= 1){
            alert("该商品数量不能小于0")
            num = Number(num)+1;
        }


//            sum(num);
    }
    function sum(num) {
        sum1 = price*num;
        document.getElementById("num").value=num;
        prices.innerHTML=sum1;
        close.innerHTML=sum1;
    }



</script>
</body>
</html>
