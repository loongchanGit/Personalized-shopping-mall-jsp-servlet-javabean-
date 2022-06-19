<%@ page import="com.dingzi.web.TypeServlet" %><%--
  Created by IntelliJ IDEA.
  User: loongchan
  Date: 2022/6/4
  Time: 13:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>数据分析</title>
    <%@ include file="/pages/common/head.jsp"%>
    <script type="text/javascript" src="static/script/echarts.js"></script>
</head>
<body>
<%
    TypeServlet typeServlet=new TypeServlet();
    typeServlet.showAllType(request,response);
%>
<div style="float: left">
    <div id="type" style="width: 590px;height:400px"></div>
    <div style="text-align:center">
        <select id="typelist">
            <c:forEach items="${requestScope.AllType}" var="type">
                <option value="${type.type_name}">${type.type_name}</option>
            </c:forEach>
        </select>
    </div>
</div>
<div style="float: right">
    <div id="hot" style="width: 590px;height:400px;float: right"></div>
    <div style="text-align:center">
        <select id="hotlist">
            <c:forEach items="${requestScope.AllType}" var="type">
                <option value="${type.type_name}">${type.type_name}</option>
            </c:forEach>
        </select>
    </div>
</div>



<script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例
    var typeChart = echarts.init(document.getElementById('type'));
    var hotChart = echarts.init(document.getElementById('hot'));

    $.ajax({
        type : "post",
        async : true,   //异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
        url : "chartsServlet?action=type&type=衣服", //请求发送到Servlet处
        success : function(resultJson) {
            var result= jQuery.parseJSON(resultJson);
            var name=[]; //类别数组（实际用来盛放X轴坐标值）
            var value=[]; //销量数组（实际用来盛放Y坐标值）
            //请求成功时执行该函数内容，result即为服务器返回的json对象
            if (result) {
                for(var i=0;i<result.length;i++){
                    name.push(result[i].name); //挨个取出类别并填入类别数组
                    value.push(result[i].sale);
                }

                typeChart.setOption({
                        title: {
                            text: '商品销量分析'
                        },
                        tooltip: {},
                        legend: {
                            data: ['销量']
                        },
                        xAxis: {
                            data: name
                        },
                        yAxis: {},
                        series: [
                            {
                                name: '销量',
                                type: 'bar',
                                data: value
                            }
                        ]
                    });
            }
        },
        error : function(errorMsg) {
            //请求失败时执行该函数
            alert("图表请求数据失败!");
            typeChart.hideLoading();
        }
    });

    $.ajax({
        type : "post",
        async : true,   //异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
        url : "chartsServlet?action=hot&type=衣服", //请求发送到Servlet处
        success : function(resultJson) {
            var result= jQuery.parseJSON(resultJson);
            var name=[]; //类别数组（实际用来盛放X轴坐标值）
            var value=[]; //销量数组（实际用来盛放Y坐标值）
            //请求成功时执行该函数内容，result即为服务器返回的json对象
            if (result) {
                for(var i=0;i<result.length;i++){
                    name.push(result[i].name); //挨个取出类别并填入类别数组
                    value.push(result[i].hot);
                }

                hotChart.setOption({
                    title: {
                        text: '热门商品分析'
                    },
                    tooltip: {},
                    legend: {
                        data: ['访问量']
                    },
                    xAxis: {
                        data: name
                    },
                    yAxis: {},
                    series: [
                        {
                            name: '访问量',
                            type: 'bar',
                            data: value
                        }
                    ]
                });
            }
        },
        error : function(errorMsg) {
            //请求失败时执行该函数
            alert("图表请求数据失败!");
            hotChart.hideLoading();
        }
    });

    $("#typelist").change(function (){
        var type=$("#typelist").val();
        $.ajax({
            type : "post",
            async : true,   //异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
            url : "chartsServlet?action=type&type="+type, //请求发送到Servlet处
            success : function(resultJson) {
                var result= jQuery.parseJSON(resultJson);
                var name=[]; //类别数组（实际用来盛放X轴坐标值）
                var value=[]; //销量数组（实际用来盛放Y坐标值）
                //请求成功时执行该函数内容，result即为服务器返回的json对象
                if (result) {
                    console.log(result.length)
                    for(var i=0;i<result.length;i++){
                        name.push(result[i].name); //挨个取出类别并填入类别数组
                        value.push(result[i].sale);
                    }

                    typeChart.setOption({
                        title: {
                            text: '商品销量分析'
                        },
                        tooltip: {},
                        legend: {
                            data: ['销量']
                        },
                        xAxis: {
                            data: name
                        },
                        yAxis: {},
                        series: [
                            {
                                name: '销量',
                                type: 'bar',
                                data: value
                            }
                        ]
                    });
                }
            },
            error : function(errorMsg) {
                //请求失败时执行该函数
                alert("图表请求数据失败!");
                typeChart.hideLoading();
            }
        });
    })

    $("#hotlist").change(function (){
        var type=$("#hotlist").val();
        $.ajax({
            type : "post",
            async : true,   //异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
            url : "chartsServlet?action=hot&type="+type, //请求发送到Servlet处
            success : function(resultJson) {
                var result= jQuery.parseJSON(resultJson);
                var name=[]; //类别数组（实际用来盛放X轴坐标值）
                var value=[]; //销量数组（实际用来盛放Y坐标值）
                //请求成功时执行该函数内容，result即为服务器返回的json对象
                if (result) {
                    for(var i=0;i<result.length;i++){
                        name.push(result[i].name); //挨个取出类别并填入类别数组
                        value.push(result[i].hot);
                    }

                    hotChart.setOption({
                        title: {
                            text: '热门商品分析'
                        },
                        tooltip: {},
                        legend: {
                            data: ['访问量']
                        },
                        xAxis: {
                            data: name
                        },
                        yAxis: {},
                        series: [
                            {
                                name: '访问量',
                                type: 'bar',
                                data: value
                            }
                        ]
                    });
                }
            },
            error : function(errorMsg) {
                //请求失败时执行该函数
                alert("图表请求数据失败!");
                hotChart.hideLoading();
            }
        });
    })
</script>
</body>
</html>
