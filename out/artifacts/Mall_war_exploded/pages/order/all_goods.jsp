<%@ page import="com.dingzi.pojo.Page" %><%--
  Created by IntelliJ IDEA.
  User: loongchan
  Date: 2022/5/26
  Time: 15:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>${requestScope.type}</title>
    <%@ include file="/pages/common/head.jsp"%>
    <link rel="stylesheet" href="static/css/index.css">
    <script src="static/script/jquery-3.4.1.min.js"></script>
</head>
<body>
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
            <a href="pages/order/myorder.jsp">我的订单</a>
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
<div style="width: 80%;height: 85%;margin: 0 auto">
    <div style="width: 100%;height: 80px"><p style="margin-top:20px;font-size: 32px;text-align: center">${requestScope.type}</p></div>
    <div style="width: 100%;height: 100%">
        <c:forEach items="${requestScope.page.item}" var="item">
            <div class="goods" >
                <div style="width: 200px;height: 200px"><a href="goodsServlet?action=showGoodsForId&id=${item.id}"><img src="../good/${item.path}"></a></div>
                <div class="goods_inf" style="margin-top: 20px;">${item.name}(￥${item.price})</div>
            </div>
        </c:forEach>
    </div>
    <div style="height:150px;width:100%;margin-bottom: 50px;text-align: center">
        <div style="height: 40px;width: 100%">
            <a href="goodsServlet?action=page&type=${requestScope.type}&pageNo=1&pageSize=${requestScope.pageSize}">首页</a>
            <%
                Page now= (Page) request.getAttribute("page");
                int pagesize=(int)request.getAttribute("pageSize");
                if(now.getPageNo()!=1){//第一页特殊处理
            %>
            <a href="goodsServlet?action=page&type=${requestScope.type}&pageNo=${requestScope.page.pageNo-1}&pageSize=${requestScope.pageSize}">上一页</a>
            <%}%>
            <%for(int i=3;i>0;i--){
                if(now.getPageNo()-i>0){
                    int pagenow=now.getPageNo()-i;
            %>
                <a href="goodsServlet?action=page&type=${requestScope.type}&pageNo=<%=pagenow%>&pageSize=${requestScope.pageSize}"><%=pagenow%></a>
                <%}%>
            <%}%>
            ${requestScope.page.pageNo}
            <%
                for(int i=1;i<3;i++){
                if(now.getPageNo()+i<=now.getPageTotal()){
                    int pagenow=now.getPageNo()+i;
            %>
            <a href="goodsServlet?action=page&type=${requestScope.type}&pageNo=<%=pagenow%>&pageSize=${requestScope.pageSize}"><%=pagenow%></a>
                <%}%>
            <%}%>
            <%if(now.getPageNo()!=now.getPageTotal()){//最后一页特殊处理%>
            <a href="goodsServlet?action=page&type=${requestScope.type}&pageNo=${requestScope.page.pageNo+1}&pageSize=${requestScope.pageSize}">下一页</a>
            <%}%>
            <a href="goodsServlet?action=page&type=${requestScope.type}&pageNo=${requestScope.page.pageTotal}&pageSize=${requestScope.pageSize}">尾页</a>

        </div>
        <div style="height: 40px;width: 100%">
            当前是第${requestScope.page.pageNo}页，共有${requestScope.page.pageTotal}页，${requestScope.page.pageTotalCount}条记录
        </div>
        <div style="height:40px;width: 100%;">
            <form id="editform" method="post" action="">
                当前一页显示<input size="3" type="text" id="editdata" value="${requestScope.pageSize}">条记录
                <input type="submit" id="edit" value="确定">
            </form>
        </div>
    </div>
</div>
<script>
    $("#edit").click(function (){
        var data=$("#editdata").val();
        var newURL="goodsServlet?action=page&type=${requestScope.type}&name=${requestScope.name}&pageNo=1&pageSize="+data;
        $("#editform").attr('action', newURL);    //通过jquery为action属性赋值
        $("#editform").submit();    //提交ID为myform的表单

    })
</script>
</body>
</html>

