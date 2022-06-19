<%@ page import="java.util.ArrayList" %>
<%@ page import="com.dingzi.pojo.Goods" %>
<%@ page import="com.dingzi.service.GoodsService" %>
<%@ page import="com.dingzi.web.GoodsServlet" %>
<%@ page import="java.util.List" %>
<%@ page import="com.dingzi.pojo.Type" %>
<%@ page import="com.dingzi.web.TypeServlet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>首页</title>
    <%@ include file="/pages/common/head.jsp"%>
    <link rel="stylesheet" href="static/css/index.css">
    <script src="static/script/jquery-3.4.1.min.js"></script>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    GoodsServlet goodsServlet=new GoodsServlet();
    goodsServlet.showFiveHotGoodsForAll(request,response);
    ArrayList<Goods> hotGoods=(ArrayList)request.getAttribute("HotForAll");
    request.setAttribute("HotForALL",hotGoods);
    TypeServlet typeServlet=new TypeServlet();
    typeServlet.showAllType(request,response);
    ArrayList<Type> AllType=(ArrayList<Type>)request.getAttribute("AllType");
    request.setAttribute("AllType",AllType);
%>
<%@include file="/pages/common/top.jsp"%>

    <div class="scroll">
        <ul>
            <li><img src="static/img/scroll_01.jpg" alt=""></li>
            <li><img src="static/img/scroll_02.jpg" alt=""></li>
            <li><img src="static/img/scroll_03.jpg" alt=""></li>
            <li><img src="static/img/scroll_04.jpg" alt=""></li>
        </ul>
        <div class="scroll_dot">
            <span class="scroll_dot_span"></span>
        </div>
        <div class="scroll_arrows">
            <a href="javascript:void(0);"><span class="left scroll_arrows_back">〈</span></a>
            <a href="javascript:void(0);"><span class="right scroll_arrows_back">〉</span></a>
        </div>

        <div class="scroll_left">
            <ul class="scr-ul">
                <li class="scr_li"><a href="goodsServlet?action=page&type=全部商品&pageNo=1&pageSize=10">全部商品</a><i class="scr_i"></i></li>
                <c:forEach items="${requestScope.AllType}" var="alltype">
                    <li class="scr_li"><a href="goodsServlet?action=page&type=${alltype.type_name}&pageNo=1&pageSize=10">${alltype.type_name}</a><i class="scr_i"></i></li>
                </c:forEach>
            </ul>
        </div>
    </div>
    <div class="bot">
            <div class="bot_first">
                <div class="bot_one">
                    <div><a href=""><img src="static/img/bot_01.jpg">1</a></div>
                    <div><a href=""><img src="static/img/bot_02.jpg">2</a></div>
                    <div><a href=""><img src="static/img/bot_03.jpg">3</a></div>
                    <div><a href=""><img src="static/img/bot_04.jpg">4</a></div>
                    <div><a href=""><img src="static/img/bot_05.jpg">5</a></div>
                    <div><a href=""><img src="static/img/bot_06.jpg">6</a></div>
                </div>
            </div>
        <div class="bot_max">
                <img src="static/img/banner_bottom.jpg">
        </div>
    </div>
    <div class="time">
        <div class="H">热门定制商品</div>

            <c:forEach items="${requestScope.HotForALL}" var="good">
                <div class="goods">
                    <div class="goods_img"><a href="goodsServlet?action=showGoodsForId&id=${good.id}"><img src="../good/${good.path}"></a></div>
                    <div class="goods_inf" style="margin-top: 220px;">${good.name}(￥${good.price})</div>
                </div>
            </c:forEach>

    </div>
<%int i=0;%>
<c:forEach items="${requestScope.AllType}" var="alltype">
    <div class="appliances">
        <div class="app_width">
            <div class="app_A">${alltype.type_name}</div>
            <div class="app_Ar orangeGL">
                <div class="app_Ar_r"><a href="goodsServlet?action=page&type=${alltype.type_name}&pageNo=1&pageSize=10">查看更多</a></div>
            </div>
                <%goodsServlet.showFiveHotGoodsForType(request,response,AllType.get(i++).getType_name());%>
                <%ArrayList<Goods> hots=(ArrayList)request.getAttribute("HotForType");%>
                <%request.setAttribute("Hots",hots);%>
                <c:forEach items="${requestScope.Hots}" var="hots">
                    <div class="goods">
                        <div><a href="goodsServlet?action=showGoodsForId&id=${hots.id}"><img src="../good/${hots.path}"></a></div>
                        <div class="goods_inf" style="margin-top: 220px;">${hots.name}(￥${hots.price})</div>
                    </div>
                </c:forEach>

        </div>
    </div>
</c:forEach>

    <script>
        var abc = document.getElementsByClassName("script_capa_box_top_ar");
        console.log("abc:"+abc);
        console.log("abc[0]"+abc[0]);
        var box = document.getElementsByClassName("scrip_capa_box");
        console.log("box:"+box);
        console.log("box[0]:"+box[0]);
        for(var i = 0; i<abc.length;i++){
            abc[i].index=i;
            abc[i].onmouseover=function(){
                for(var j = 0 ;j<abc.length;j++){
                    box[j].className="capa_box scrip_capa_box";
                }
                box[this.index].className="capa_box scrip_capa_box scrip_capa_box_on"
                console.log("this.index:"+this.index);
            }
        }
        var n = 0;

        var t = setInterval(fun,2000);
        function  fun() {
            n++;
            if(n > $(".scroll>ul>li").length-1){
                n = 0;
            }
            $(".scroll>ul>li").css("opacity","0").eq(n).css("opacity","1")
            $(".scroll_dot span").eq(n).addClass("scroll_dot_span").siblings().removeClass("scroll_dot_span");
        }
        $(".scroll_arrows .left").click(function() {
            n -= 2;
                    if(n <-1){
                        n=4;
                    }
                    fun()

        } );
        $(".scroll_arrows .right").click(function() {
            fun()
        });
        $(".scroll_dot span").click(function () {
            console.log($(this).index());
            n=$(this).index()-1;
            $(this).siblings().removeClass("scroll_dot_span").end().addClass("scroll_dot_span");
            fun()
        }); $(".scroll").hover(function () {
                    clearInterval(t);
                },
                function () {
                    t = setInterval(fun,2000);
                });

    </script>
</body>
</html>