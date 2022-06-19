<%@ page import="com.dingzi.web.GoodsServlet" %>
<%@ page import="com.dingzi.pojo.Page" %>
<%@ page import="com.dingzi.web.TypeServlet" %>
<%--
  Created by IntelliJ IDEA.
  User: loongchan
  Date: 2022/5/25
  Time: 10:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>商品管理</title>
    <%@ include file="/pages/common/head.jsp"%>
    <link type="text/css" rel="stylesheet" href="static/css/manager.css"/>
</head>
<body>
<div style="width: 30%;height:30px;margin: 0 auto;float: left">
    <input type="button" id="newgood" value="新增商品">
    <input type="button" id="newtype" value="新增类别">
    <input type="button" id="newpart" value="新增商品规格">
</div>
<div style="width: 20%;margin: 0 auto;float: right">
<form class="search_form" style="margin-top: 10px" method="post" action="">
    <input type="text" id="searchtext">
    <input type="submit" id="search" value="搜索">
</form>
</div>

<div style="height: 70%">
    <table border="1" id="myTable">
        <th>商品ID</th><th>商品名</th><th>价格</th><th>类型</th><th>热度</th><th>商品图片</th><th>修改</th><th>删除</th>
        <c:forEach items="${requestScope.page.item}" var="good">
            <tr>
                <td>${good.id}</td>
                <td>${good.name}</td>
                <td>${good.price}</td>
                <td>${good.type}</td>
                <td>${good.hot}</td>
                <td><img src="../good/${good.path}" style="width: 20px;height: 25px"></td>
                <td><a style="cursor: pointer" class="edit">修改</a></td>
                <td><a href="goodsServlet?action=deleteGoodById&id=${good.id}">删除</a></td>
            </tr>
        </c:forEach>
    </table>
</div>

<div style="height:150px;width:100%;margin-bottom: 50px;text-align: center">
    <div style="height: 40px;width: 100%">
        <a href="goodsServlet?action=showAllGoods&type=${requestScope.type}&pageNo=1&pageSize=${requestScope.pageSize}">首页</a>
        <%
            Page now= (Page) request.getAttribute("page");
            int pagesize=(int)request.getAttribute("pageSize");
            if(now.getPageNo()!=1){//第一页特殊处理
        %>
        <a href="goodsServlet?action=showAllGoods&type=${requestScope.type}&pageNo=${requestScope.page.pageNo-1}&pageSize=${requestScope.pageSize}">上一页</a>
        <%}%>
        <%for(int i=3;i>0;i--){
            if(now.getPageNo()-i>0){
                int pagenow=now.getPageNo()-i;
        %>
        <a href="goodsServlet?action=showAllGoods&type=${requestScope.type}&pageNo=<%=pagenow%>&pageSize=${requestScope.pageSize}"><%=pagenow%></a>
        <%}%>
        <%}%>
        ${requestScope.page.pageNo}
        <%
            for(int i=1;i<3;i++){
                if(now.getPageNo()+i<=now.getPageTotal()){
                    int pagenow=now.getPageNo()+i;
        %>
        <a href="goodsServlet?action=showAllGoods&type=${requestScope.type}&pageNo=<%=pagenow%>&pageSize=${requestScope.pageSize}"><%=pagenow%></a>
        <%}%>
        <%}%>
        <%if(now.getPageNo()!=now.getPageTotal()){//最后一页特殊处理%>
        <a href="goodsServlet?action=showAllGoods&type=${requestScope.type}&pageNo=${requestScope.page.pageNo+1}&pageSize=${requestScope.pageSize}">下一页</a>
        <%}%>
        <a href="goodsServlet?action=showAllGoods&type=${requestScope.type}&pageNo=${requestScope.page.pageTotal}&pageSize=${requestScope.pageSize}">尾页</a>

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

<div class="good_frame" id="good_frame">
    <div class="content">
        <form method="post" action="" id="myform" enctype="multipart/form-data">
            <div style="width: 100%;height: 30px;">
                <div class="goodid"></div>
            </div>
            <input type="hidden" name="id" class="idtext">
            <div class="input_text">商品名:<input type="text" class="goodnametext" name="goodname"></div>
            <div class="input_text">价 格:<input type="text" class="pricetext" name="price"></div>
            <div class="input_text">类 型:
                <%
                    TypeServlet typeServlet=new TypeServlet();
                    typeServlet.showAllType(request,response);
                %>
                <select class="typetext" style="width: 165px" name="type">
                    <c:forEach items="${requestScope.AllType}" var="type">
                            <option value="${type.type_name}">${type.type_name}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="input_text">图 片:<input type="file" class="imagetext" style="width: 160px;" name="image"></div>
        </form>
        <div style="width: 100%;margin-top: 10px">
            <div id="modify" class="modify">修改</div>
            <div id="cancel" class="cancel">取消</div>
        </div>
    </div>
</div>

<div class="add_frame" id="add_frame">
    <div class="content">
        <form method="post" action="" id="addform" enctype="multipart/form-data">
            <div style="text-align:center;width: 100%;height: 30px;font-size: 20px">
                添加商品
            </div>
            <div class="input_text">商品名:<input type="text" class="addgoodnametext" name="goodname"></div>
            <div class="input_text">价 格:<input type="text" class="addpricetext" name="price"></div>
            <div class="input_text">类 型:
                <%
                    typeServlet.showAllType(request,response);
                %>
                <select class="addtypetext" style="width: 165px" name="type">
                    <c:forEach items="${requestScope.AllType}" var="type">
                        <option value="${type.type_name}">${type.type_name}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="input_text">图 片:<input type="file" class="addimagetext" style="width: 160px;" name="image"></div>
        </form>
        <div style="width: 100%;margin-top: 10px">
            <div id="addgood" class="add">添加</div>
            <div id="addcancel">取消</div>
        </div>
    </div>
</div>

<div class="type_frame" id="type_frame">
    <div class="content" style="height: 77%">
        <div style="width: 100%;margin-top: 10px">
            <div style="height: 20px;"></div>
            <form method="post" action="" id="typeform">
                <div class="input_text">添加类别:<input type="text" id="typetext" name="type"></div>
            </form>
            <div id="addtype" class="add">添加</div>
            <div id="typecancel">取消</div>
        </div>
    </div>
</div>

<div class="part_frame" id="part_frame">
    <div class="content" style="height: 87%">
        <div style="width: 100%;margin-top: 10px">
            <div style="height: 40px;text-align: center;font-size: 20px">添加商品规格</div>
            <form method="post" action="" id="partform" enctype="multipart/form-data">
                <div class="input_text" style="height: 20px">商品ID:<input type="text" id="goodid" name="id" style="width: 100px"></div>
                <div class="input_text" style="height: 40px">添加商品大小:<input type="text" id="sizetext" name="size"></div>
                <div class="input_text" style="height: 40px">添加商品颜色:<input type="text" id="colortext" name="color"></div>
                <div class="input_text" style="height: 30px;">添加商品图片:<input type="file" id="imagetext" name="image" style="width: 100px"></div>
            </form>
            <div id="addpart" class="add">添加</div>
            <div id="partcancel">取消</div>
        </div>
    </div>
</div>

<script>
    $(".good_frame").css("display","none");
    $(".add_frame").css("display","none");
    $(".type_frame").css("display","none");
    $(".part_frame").css("display","none");

    $("#record").click(function (){
        var data=$("#editdata").val();
        var newURL="goodsServlet?action=showAllGoods&type=${requestScope.type}&name=${requestScope.name}&pageNo=1&pageSize="+data;
        $("#editform").attr('action', newURL);    //通过jquery为action属性赋值
        $("#editform").submit();    //提交ID为myform的表单

    })

    $("#search").click(function (){
        var data=$("#searchtext").val();
        var newURL="goodsServlet?action=showAllGoods&type=搜索商品&name="+data+"&pageNo=1&pageSize=10";
        $(".search_form").attr('action', newURL);    //通过jquery为action属性赋值
        $(".search_formt").submit();    //提交ID为myform的表单

    })

    $("#myTable").on('click','.edit',function () {//读取表格单元格数据
        document.getElementById('good_frame').style.display="";
        var currentRow=$(this).closest("tr");//获取当前行
        var id=currentRow.find("td:eq(0)").text();
        var goodname=currentRow.find("td:eq(1)").text();
        var price=currentRow.find("td:eq(2)").text();
        $(".goodid").html(id);
        $(".goodnametext").val(goodname);
        $(".pricetext").val(price);
        $(".idtext").val(id);
    })

    $(".modify").click(function (){
        var newURL="goodsServlet?action=modifyGood";
        $("#myform").attr('action', newURL);    //通过jquery为action属性赋值
        $("#myform").submit();    //提交ID为myform的表单
    })

    $("#addgood").click(function (){
        if($(".addgoodnametext").val() || $(".addpricetext").val()){
            var newURL="goodsServlet?action=addGood";
            $("#addform").attr('action', newURL);    //通过jquery为action属性赋值
            $("#addform").submit();    //提交ID为myform的表单
        }else{
            alert("商品名或价格不能为空！");
        }

    })

    $("#addtype").click(function (){
        if($("#typetext").val()){
            var newURL="typeServlet?action=addType";
            $("#typeform").attr('action', newURL);    //通过jquery为action属性赋值
            $("#typeform").submit();    //提交ID为myform的表单
            alert("添加成功！");
        }else{
            alert("输入框不能为空");
        }

    })

    $("#addpart").click(function (){
        if($("#goodid").val() || $("#sizetext").val() || $("#colortext").val()){
            var newURL="goodsServlet?action=addPart";
            $("#partform").attr('action', newURL);    //通过jquery为action属性赋值
            $("#partform").submit();    //提交ID为myform的表单
            alert("添加成功！");
        }else{
            alert("输入框不能为空!");
        }

    })

    $("#newpart").click(function (){
        document.getElementById('part_frame').style.display="";
    })

    $("#newgood").click(function (){
        document.getElementById('add_frame').style.display="";
    })

    $("#newtype").click(function (){
        document.getElementById('type_frame').style.display="";
    })

    $("#cancel").click(function (){
        document.getElementById('good_frame').style.display="none";
    })

    $("#addcancel").click(function (){
        document.getElementById('add_frame').style.display="none";
    })

    $("#typecancel").click(function (){
        document.getElementById('type_frame').style.display="none";
    })

    $("#partcancel").click(function (){
        document.getElementById('part_frame').style.display="none";
    })


</script>
</body>
</html>
