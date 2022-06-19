<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>后台管理系统</title>
    <%@ include file="/pages/common/head.jsp"%>
    <link type="text/css" rel="stylesheet" href="static/css/manager.css" />
    <script type="text/javascript" src="static/script/jquery-3.4.1.min.js"></script>
</head>
<body>
<%
//	if(session.getAttribute("username")==null || session.getAttribute("username").equals("")){
//		out.print("<script type='text/javascript'> alert('请先登录！');location.href='pages/user/login.jsp';</script>");
//	}else{
//		if(!session.getAttribute("username").equals("admin")){
//			out.print("<script type='text/javascript'> alert('请使用管理员账号登录!');location.href='pages/user/login.jsp';</script>");
//		}
//	}
%>
<div class="top"></div>
<div id="header">
	<div class="logo">钉子网后台管理系统</div>
	<div class="navigation">
		<ul>
		 	<li>欢迎您！</li>
			<li><a href="">admin</a></li>
			<li><a href="">修改密码</a></li>
			<li><a href="">设置</a></li>
			<li><a href="">退出</a></li>
		</ul>
	</div>
</div>
<div id="content">
	<div class="left_menu">
		<ul id="nav_dot">
			<li>
				<h4 class="M1"><a href="" target="right">系统管理</a></h4>
			</li>
			<li>
				<h4 class="M2"><a href="goodsServlet?action=showAllGoods&pageNo=1&pageSize=10&type=全部商品" target="right">商品管理</a></h4>
			</li>
			<li>
				<h4 class="M3"><a href="orderServlet?action=showAllOrder&pageNo=1&pageSize=10" target="right">订单管理</a></h4>
			</li>
			<li>
				<h4 class="M4"><a href="userServlet?action=showAllUser" target="right">用户管理</a></h4>
			</li>
			<li>
				<h4 class="M5"><a href="pages/manager/data_m.jsp" target="right">数据统计</a></h4>
			</li>
		</ul>
	</div>
		<div class="m-right">
			<div class="right-nav"></div>
			<div class="main">
				<iframe  height="100%" width="99.5%" name="right"><p>欢迎进入钉子网后台管理系统</p></iframe>
			</div>
		</div>
	</div>
<script>
    navList(12);
    //导航菜单
    function navList(id) {
        var $obj = $("#nav_dot"), $item = $("#J_nav_" + id);
        $item.addClass("on").parent().removeClass("none").parent().addClass("selected");
        $obj.find("h4").hover(function () {
            $(this).addClass("hover");
        }, function () {
            $(this).removeClass("hover");
        });
        $obj.find("p").hover(function () {
            if ($(this).hasClass("on")) { return; }
            $(this).addClass("hover");
        }, function () {
            if ($(this).hasClass("on")) { return; }
            $(this).removeClass("hover");
        });
        $obj.find("h4").click(function () {
            var $div = $(this).siblings(".list-item");
            if ($(this).parent().hasClass("selected")) {
                $div.slideUp(600);
                $(this).parent().removeClass("selected");
            }
            if ($div.is(":hidden")) {
                $("#nav_dot li").find(".list-item").slideUp(600);
                $("#nav_dot li").removeClass("selected");
                $(this).parent().addClass("selected");
                $div.slideDown(600);

            } else {
                $div.slideUp(600);
            }
        });
       }


    /****表格隔行高亮显示*****/
    window.onload=function(){
        oTable=document.getElementById("tab");//找表格
        aTr=document.getElementsByTagName("tr");//找所有的行
        for(i=0;i<aTr.length;i++){
            if(i%2==0){
                aTr[i].style.background="#fff";
            }else{
                aTr[i].style.background="#ccc";
            };
        };
    };

</script>

</body>
</html>

