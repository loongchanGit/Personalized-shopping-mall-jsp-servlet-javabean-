<%--
  Created by IntelliJ IDEA.
  User: loongchan
  Date: 2022/4/18
  Time: 20:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String basePath=request.getScheme()
    +"://"
    +request.getServerName()
    +":"
    +request.getServerPort()
    +request.getContextPath()
    +"/";
%>
<base href="<%=basePath%>">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="static/script/jquery-3.4.1.min.js"></script>
