<%@ page import="com.dingzi.pojo.Page" %><%--
  Created by IntelliJ IDEA.
  User: loongchan
  Date: 2022/5/29
  Time: 16:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>订单管理</title>
    <%@ include file="/pages/common/head.jsp"%>
    <link type="text/css" rel="stylesheet" href="static/css/manager.css" />
</head>
<body>
<div style="height: 70%">
    <input type="button" value="批量删除" onclick="deleteUsers();"/>
    <input type="button" value="反选" onclick="invert();"/>
<table border="1" id="myTable">
    <th><input type="checkbox"  onclick="ckAll();" id="p1"/></th><th>订单ID</th><th>商品ID</th><th>用户ID</th><th>地址</th><th>电话号码</th><th>商品尺寸</th><th>商品颜色</th><th>订单日期</th><th>价格</th><th>状态</th><th>定制图片</th><th>修改</th><th>删除</th>
    <c:forEach items="${requestScope.page.item}" var="order">
        <tr>
            <td><input type="checkbox" name="child" value="${order.id }" onclick="clickChild();"/></td>
            <td class="id">${order.id}</td>
            <td class="good_id">${order.good_id}</td>
            <td>${order.user_id}</td>
            <td>${order.address}</td>
            <td>${order.telephone}</td>
            <td>${order.good_size}</td>
            <td>${order.good_color}</td>
            <td>${order.date}</td>
            <td>${order.money}</td>
            <td>${order.state}</td>
            <td><a href="orderServlet?action=download&id=${order.id}" class="download">下载</a></td>
            <td><a style="cursor: pointer" class="edit">修改</a></td>
            <td><a href="orderServlet?action=deleteOrder&id=${order.id}" onclick="return confirm('是否删除?')">删除</a></td>
        </tr>
    </c:forEach>
</table>
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

<div class="order_frame" id="order_frame">
    <div class="content" style="height: 89%">
        <div style="width: 100%;margin-top: 10px">
            <div style="height: 10px;"></div>
            <div style="width: 100%;height: 30px;">
                <div class="orderid" style="width: 100%;font-size: 20px;text-align: center;"></div>
            </div>
            <form method="post" action="" id="orderform">
                <input type="hidden" name="id" class="idtext" >
                <div class="input_text">地址:<input type="text" id="addresstext" name="address"></div>
                <div class="input_text">电话号码:<input type="text" id="telephonetext" name="telephone"></div>
                <div class="input_text">商品尺寸:<input type="text" id="sizetext" name="size"></div>
                <div class="input_text">商品颜色:<input type="text" id="colortext" name="color"></div>
                <div class="input_text">状态:
                    <select name="state">
                        <option value="定制中">定制中</option>
                        <option value="已发货">已发货</option>
                    </select>
                </div>
            </form>
            <div id="editorder" class="add">修改</div>
            <div id="ordercancel">取消</div>
        </div>
    </div>
</div>

<script>
    $(".order_frame").css("display","none")
    $("#myTable").on('click','.edit',function () {//读取表格单元格数据
        document.getElementById('order_frame').style.display="";
        var currentRow=$(this).closest("tr");//获取当前行
        var id=currentRow.find("td:eq(1)").text();
        var address=currentRow.find("td:eq(4)").text();
        var telephone=currentRow.find("td:eq(5)").text();
        var size=currentRow.find("td:eq(6)").text();
        var color=currentRow.find("td:eq(7)").text();
        $(".orderid").html(id);
        $("#addresstext").val(address);
        $("#telephonetext").val(telephone);
        $("#sizetext").val(size);
        $("#colortext").val(color);
        $(".idtext").val(id);
    })
    $("#record").click(function (){
        var data=$("#editdata").val();
        var newURL="orderServlet?action=showAllOrder&pageNo=1&pageSize="+data;
        $("#editform").attr('action', newURL);    //通过jquery为action属性赋值
        $("#editform").submit();    //提交ID为myform的表单
    })

    $("#ordercancel").click(function (){
        document.getElementById('order_frame').style.display="none";
    })
    $("#editorder").click(function (){
        var newURL="orderServlet?action=modifyOrder";
        $("#orderform").attr('action', newURL);    //通过jquery为action属性赋值
        $("#orderform").submit();    //提交ID为myform的表单
    })

    function ckAll(){
        var status=document.getElementById("p1").checked; //全选按钮的状态
        var childs=document.getElementsByName("child"); //子节点的数组
        for(var i=0;i<childs.length;i++){
            childs[i].checked=status;
        }
    }

    //点击孩子
    function clickChild(){
        var childs=document.getElementsByName("child"); //子节点的数组
        var count=childs.length; //所有的孩子的个数
        var CheckedCount=0; //选中的孩子个数
        for(var i=0;i<childs.length;i++){
            if(childs[i].checked==true){
                CheckedCount++;
            }
        }
        //若子选按钮全选中，则全选按钮也选中
        if(count==CheckedCount){
            document.getElementById("p1").checked=true;
        }else{
            document.getElementById("p1").checked=false;
        }
    }

    //批量删除
    function deleteUsers(){
        var ids=new Array(); //数组，存储选中的id  1,3,5
        //获取选中的复选框的ID
        var childs=document.getElementsByName("child"); //子节点的数组
        for(var i=0;i<childs.length;i++){
            if(childs[i].checked==true){
                var id=childs[i].value; // value被绑定了ID
                ids.push(id);
            }
        }
        if(ids.length>0){
            if(confirm("确定要删除选中的用户吗")){
                //确定要删除
                location.href="orderServlet?action=deleteMore&ids="+ids;
            }
        }else{
            alert("请先选中要删除的用户数据！");
        }
    }
    //反选
    function invert(){
        var childs=document.getElementsByName("child"); //子节点的数组
        for(var i=0;i<childs.length;i++){
            childs[i].checked=!childs[i].checked;
        }
    }


</script>
</body>
</html>
