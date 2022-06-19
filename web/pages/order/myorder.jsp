<%@ page import="com.dingzi.web.OrderServlet" %>
<%@ page import="com.dingzi.pojo.Orders" %>
<%@ page import="java.util.List" %>
<%@ page import="com.dingzi.service.OrderService" %>
<%@ page import="com.dingzi.service.impl.OrderServiceImpl" %>
<%@ page import="com.dingzi.pojo.Goods" %>
<%@ page import="com.dingzi.service.GoodsService" %>
<%@ page import="com.dingzi.service.impl.GoodsServiceImpl" %>
<%@ page import="com.dingzi.pojo.Page" %><%--
  Created by IntelliJ IDEA.
  User: loongchan
  Date: 2022/5/31
  Time: 10:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>我的订单</title>
    <%@ include file="/pages/common/head.jsp"%>
    <link rel="stylesheet" href="static/css/index.css">
    <script src="static/script/jquery-3.4.1.min.js"></script>
</head>
<body style="background-color: #f5f5f5">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    OrderService orderService=new OrderServiceImpl();
    GoodsService goodsService=new GoodsServiceImpl();
    int id=(int)session.getAttribute("userid");
    List<Orders> ordersList=orderService.showOrderByUser(id);
    request.setAttribute("ordersList",ordersList);
%>
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
<div style="height: 90%;width: 80%;margin: 50px auto;background-color:#ffffff">
    <div>
        <table style="width: 90%;margin: 10px auto;" >
            <th>商品名称</th><th style="width: 80px">商品图片</th><th style="width: 80px">商品尺寸</th><th style="width: 80px">商品颜色</th><th style="width: 80px">商品价格</th><th style="width: 80px">定制图片</th><th>收货地址</th><th>收货人电话</th><th>订单日期</th><th>状态</th><th></th>
            <c:forEach items="${requestScope.page.item}" var="order">
                <br>
                <tr>
                    <%
                        int k=0;
                        int goodid=ordersList.get(k).getGood_id();
                        Goods goods=goodsService.showGoodsForId(goodid);
                        k++;
                    %>
                    <td style="text-align: center"><%=goods.getName()%></td>
                    <td style="text-align: center"><img src="../good/<%=goods.getPath()%>" style="height: 60px;width: 50px"></td>
                    <td style="text-align: center">${order.good_size}</td>
                    <td style="text-align: center">${order.good_color}</td>
                    <td style="text-align: center">${order.money}</td>
                    <td style="text-align: center"><img src="../order/${order.good_image}" style="height: 60px;width: 50px"> </td>
                    <td style="text-align: center">${order.address}</td>
                    <td style="text-align: center">${order.telephone}</td>
                    <td style="text-align: center">${order.date}</td>
                    <td style="text-align: center">${order.state}</td>
                    <td style="text-align: center"><a href="orderServlet?action=confirm&id=${order.id}&userid=${sessionScope.userid}"><input type="button>" style="width: 80px" value="确认收货"></a></td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>

<div style="height:150px;width:100%;margin-bottom: 50px;text-align: center">
    <div style="height: 40px;width: 100%">
        <a href="orderServlet?action=showAllOrder&pageNo=1&pageSize=${requestScope.pageSize}">首页</a>
        <%
            Page now= (Page) request.getAttribute("page");
            int pagesize=(int)request.getAttribute("pageSize");
            if(now.getPageNo()!=1){//第一页特殊处理
        %>
        <a href="orderServlet?action=showAllOrder&pageNo=${requestScope.page.pageNo-1}&pageSize=${requestScope.pageSize}">上一页</a>
        <%}%>
        <%for(int i=3;i>0;i--){
            if(now.getPageNo()-i>0){
                int pagenow=now.getPageNo()-i;
        %>
        <a href="orderServlet?action=showAllOrder&pageNo=<%=pagenow%>&pageSize=${requestScope.pageSize}"><%=pagenow%></a>
        <%}%>
        <%}%>
        ${requestScope.page.pageNo}
        <%
            for(int i=1;i<3;i++){
                if(now.getPageNo()+i<=now.getPageTotal()){
                    int pagenow=now.getPageNo()+i;
        %>
        <a href="orderServlet?action=showAllOrder&pageNo=<%=pagenow%>&pageSize=${requestScope.pageSize}"><%=pagenow%></a>
        <%}%>
        <%}%>
        <%if(now.getPageNo()!=now.getPageTotal()){//最后一页特殊处理%>
        <a href="orderServlet?action=showAllOrder&pageNo=${requestScope.page.pageNo+1}&pageSize=${requestScope.pageSize}">下一页</a>
        <%}%>
        <a href="orderServlet?action=showAllOrder&pageNo=${requestScope.page.pageTotal}&pageSize=${requestScope.pageSize}">尾页</a>
    </div>
    <div style="height: 40px;width: 100%">
        当前是第${requestScope.page.pageNo}页，共有${requestScope.page.pageTotal}页，${requestScope.page.pageTotalCount}条记录
    </div>
    <div style="height:40px;width: 100%;">
        <form id="editform" method="post" action="">
            当前一页显示<input size="3" type="text" id="editdata" value="${requestScope.pageSize}">条记录
            <input type="submit" id="record" value="确定">
        </form>
    </div>
</div>
</div>

<script>
    $("#record").click(function (){
        var data=$("#editdata").val();
        var newURL="orderServlet?action=showPersonalOrder&id=${sessionScope.userid}&pageNo=1&pageSize="+data;
        $("#editform").attr('action', newURL);    //通过jquery为action属性赋值
        $("#editform").submit();    //提交ID为myform的表单
    })
</script>
</body>
</html>
