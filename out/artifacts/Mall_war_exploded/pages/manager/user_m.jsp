<%--
  Created by IntelliJ IDEA.
  User: loongchan
  Date: 2022/5/21
  Time: 18:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户管理</title>
    <%@ include file="/pages/common/head.jsp"%>
    <link type="text/css" rel="stylesheet" href="static/css/manager.css" />
</head>
<body>
<table border="1" id="myTable">
    <th>用户ID</th><th>用户名</th><th>密码</th><th>电话</th><th>修改</th><th>删除</th>
    <c:forEach items="${requestScope.userlist}" var="users">
        <tr>
            <td class="id">${users.id}</td>
            <td class="username">${users.username}</td>
            <td>${users.password}</td>
            <td>${users.telephone}</td>
            <td><a style="cursor: pointer" class="edit">修改</a></td>
            <td><a href="userServlet?action=deleteUser&id=${users.id}" onclick="return confirm('是否删除?')">删除</a></td>
        </tr>
    </c:forEach>
</table>

<div class="user_frame" id="user_frame">
    <div class="content">
        <form method="post" action="" id="myform">
            <div style="width: 100%;height: 30px;">
                <div class="userid"></div>
            </div>
            <div class="input_text">用户名:<input type="text" class="usernametext"></div>
            <div class="input_text">密 码:<input type="text" class="passwordtext"></div>
            <div class="input_text">电话号码:<input type="text" class="telephonetext"></div>
        </form>
        <div style="width: 100%;margin-top: 10px">
            <div id="modify" class="modify">修改</div>
            <div id="cancel" class="cancel">取消</div>
        </div>
    </div>
</div>

<script>
    $(".user_frame").css("display","none")
    $("#myTable").on('click','.edit',function () {//读取表格单元格数据
        document.getElementById('user_frame').style.display="";
        var currentRow=$(this).closest("tr");//获取当前行
        var id=currentRow.find("td:eq(0)").text();
        var username=currentRow.find("td:eq(1)").text();
        var password=currentRow.find("td:eq(2)").text();
        var telephone=currentRow.find("td:eq(3)").text();
        $(".userid").html(id);
        $(".usernametext").val(username);
        $(".passwordtext").val(password);
        $(".telephonetext").val(telephone);
    })
    $(".modify").click(function (){
        var id=$(".userid").html();
        var username=$(".usernametext").val();
        var password=$(".passwordtext").val();
        var telephone=$(".telephonetext").val();
        var newURL="userServlet?action=modifyUser&id="+id+"&username="+username+"&password="+password+"&telephone="+telephone;
        $("#myform").attr('action', newURL);    //通过jquery为action属性赋值
        $("#myform").submit();    //提交ID为myform的表单
    })
    $(".cancel").click(function (){
        document.getElementById('user_frame').style.display="none";
    })
</script>
</body>
</html>
