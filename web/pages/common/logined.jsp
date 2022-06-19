<%--
  Created by IntelliJ IDEA.
  User: loongchan
  Date: 2022/5/19
  Time: 14:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*" %>
<%
    if(session.getAttribute("username")==null || session.getAttribute("username").equals("")){
        out.print("<script type='text/javascript'> alert('请先登录！');location.href='pages/user/login.jsp';</script>");
    }
%>

