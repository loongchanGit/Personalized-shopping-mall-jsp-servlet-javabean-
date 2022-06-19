<%--
  Created by IntelliJ IDEA.
  User: loongchan
  Date: 2022/5/17
  Time: 21:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="box">
    <div class="inner whiteGL">
        <div class="left">
            <a class="mix" href="pages/index.jsp">钉子商城</a>
        </div>
        <div class="right">
            <%
                String username=(String)session.getAttribute("username");
                if(username==null || username.equals("")){//未登录%>
            <a class="mix" href="pages/user/login.jsp">登录</a>
            <a href="pages/user/regist.jsp">注册</a>
            <a class="max"  href="">消息通知</a>
            <%}else{//已登录%>
                <%if(username.equals("admin")){%>
                    <font color="#f0f8ff">欢迎您,管理员</font>
                    <a href="pages/manager/manager.jsp" target="_blank">后台管理</a>
                    <a href="userServlet?action=signOut">退出</a>
                <%}else{%>
                    <font color="#f0f8ff">欢迎您,<%=username%></font>
                    <a href="orderServlet?action=showPersonalOrder&id=${sessionScope.userid}&pageNo=1&pageSize=10">我的订单</a>
                    <a href="">我的收藏</a>
                    <a href="">个人中心</a>
                    <a class="max"  href="">消息通知</a>
                    <a href="userServlet?action=signOut">退出</a>
                <%}%>
            <%}%>
            <img src="static/img/cart.jpg" alt=""><a href="pages/cart/trolley.jsp">购物车</a>
        </div>
    </div>
</div>
<div class="logo">
    <div class="logo_left">
        <div>
            <a href="javascript:void(0);" title="钉子网"><img class="dingzi" src="static/img/logo.gif"></a>
        </div>
    </div>
    <ul class="logo_center orangeGL">
        <img src="static/img/banner.jpg">
    </ul>
    <form class="logo_right" method="post" action="">
        <div class="logo_input">
            <input type="text" id="search">
        </div>
        <a class="logo_right_a"><img src="static/img/find.jpg"></a>
    </form>
</div>
<script>
    $(".logo_right_a").click(function (){
        var data=$("#search").val();
        var newURL="goodsServlet?action=page&type=搜索商品&name="+data+"&pageNo=1&pageSize=10";
        $(".logo_right").attr('action', newURL);    //通过jquery为action属性赋值
        $(".logo_right").submit();    //提交ID为myform的表单

    })
</script>
