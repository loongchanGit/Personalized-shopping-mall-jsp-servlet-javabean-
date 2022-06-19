<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <%@ include file="/pages/common/head.jsp"%>
<%--    <%@ include file="/pages/common/logined.jsp"%>--%>
    <meta charset="UTF-8">
    <title>${requestScope.goodsDetails.name}</title>
    <link rel="stylesheet" href="static/css/index.css">
    <script src="static/script/jquery-3.4.1.min.js"></script>
    <script type="text/javascript" src="https://api.map.baidu.com/getscript?v=3.0&ak=sW05byN9iehwAoGGLgr30N5lRsavC3DK">
    </script>
</head>

<body>
<%@ include file="/pages/common/top.jsp"%>
<div>

   <div class="details_no1">
        <h2 class="details_no1_float">商品详情</h2>
    </div>
    <div class="details_no3">
        <div style="height: 800px;width: 600px;float: left">
<%--            商品详情图片--%>
            <div class="details_no3_img">
                <c:forEach items="${requestScope.image}" var="image">
                    <img src="../good/${image}" style="display: none" width="450" height="450" alt="">
                </c:forEach>
                <img src="../good/${requestScope.goodsDetails.path}" style="display: block" width="450" height="450" alt="">
            </div>
            <div class="details_name">${requestScope.goodsDetails.name}</div>
            <div class="details_money">${requestScope.goodsDetails.price}元</div>
            <div class="details_left_address">
                <div class="address" style="float: left">${requestScope.userAddress.address}</div>
                <div id="edit" style="color: #ff6700;float: right;cursor: pointer">修改</div>
                <div id="add" style="color: #ff6700;float: right;cursor: pointer;margin-right: 10px">添加</div>
                <div id="map" style="color: #ff6700;float: right;cursor: pointer;margin-right: 10px">定位</div>
            </div>
            <div class="details_left_bottom">
                <div class="details_left_bottom_y">√</div>
                <div class="details_left_bottom_z">七天无理由退货</div>
                <div class="details_left_bottom_y">√</div>
                <div class="details_left_bottom_z">15天质量问题换货</div>
                <div class="details_left_bottom_y">√</div>
                <div class="details_left_bottom_z">360天保障</div>
            </div>
        </div>

        <div class="details_no3_right">
            <div class="details_no3_right_div6">选择尺寸</div>
            <div class="details_no3_right_div7">
                <c:forEach items="${requestScope.size}" var="size">
                    <li class="details_no3_right_div7_in">
                        <span>${size}</span>
                    </li>
                </c:forEach>
            </div>
            <div class="details_no3_right_div6">选择颜色</div>
            <div class="details_no3_right_div9">
                <c:forEach items="${requestScope.color}" var="color">
                    <li class="details_no3_right_div7_in"><span>${color}</span></li>
                </c:forEach>
            </div>

            <div class="details_no3_right_div6">选择定制图案</div>
            <form  id="myform" action="" method="post" enctype="multipart/form-data">
                <input type="hidden" name="good_id" id="good_id" value="${requestScope.goodsDetails.id}">
                <input type="hidden" name="user_id" id="user_id" value="${sessionScope.userid}">
                <input type="hidden" name="telephone" id="telephone" value="${sessionScope.telephone}">
                <input type="hidden" name="address" id="address" value="${requestScope.userAddress.address}">
                <input type="hidden" name="size" id="size">
                <input type="hidden" name="color" id="color">
                <input type="file" name="image">
                <input type="hidden" name="money" id="money" value="${requestScope.goodsDetails.price}">
            <div class="details_no3_right_div10">
                <p class="details_no3_right_div10_p1">
                        ${requestScope.goodsDetails.name}
                        <span class="details_no3_right_div10_span0"></span>
                        <span class="details_no3_right_div10_span1"></span>
                </p>
                <span class="details_no3_right_span10">${requestScope.goodsDetails.price}元</span>
            </div>
            <div style="height: 100px;width: 620px">
                <input type="submit" class="details_buy" value="立即购买">
                <input type="submit" class="details_add" value="加入购物车">
            </div>
            </form>
        </div>
    </div>
</div>

<div class="address_frame" id="address_frame">
    <div class="content" style="height: 80%">
        <div style="width: 100%;margin-top: 10px">
            <div style="height: 10px;"></div>
            <div style="width: 100%;height: 30px;">
                <div class="userid" style="width: 100%;font-size: 20px;text-align: center;"></div>
            </div>
            <form method="post" action="" id="addressform" style="height:40px ">
                <input type="hidden" name="id" class="idtext" >
                <div class="input_text" style="text-align: center">地址:
                    <select class="addresstext" style="width: 165px" name="address">
                    <c:forEach items="${requestScope.addressList}" var="address">
                        <option class="addressoption" value="${address.address}">${address.address}</option>
                    </c:forEach>
                    </select>
                </div>
            </form>
            <div id="editaddress" class="add">确定</div>
            <div id="addresscancel">取消</div>
        </div>
    </div>
</div>

<div class="add_frame" id="add_frame">
    <div class="content" style="height: 80%">
        <div style="width: 100%;margin-top: 10px">
            <div style="height: 10px;"></div>
            <div style="width: 100%;height: 30px;">
                <div class="userid" style="width: 100%;font-size: 20px;text-align: center;"></div>
            </div>
            <form method="post" action="" id="addform" style="height:40px ">
                <input type="hidden" name="id" class="idtext" value="${sessionScope.userid}">
                <input type="hidden" name="goodid" class="idtext" value="${requestScope.goodsDetails.id}">
                <div class="input_text" style="text-align: center">添加地址:
                    <input type="text" name="address">
                </div>
            </form>
            <div id="addaddress" class="add">添加</div>
            <div id="addcancel">取消</div>
        </div>
    </div>
</div>

<div class="map_frame" id="map_frame">
    <div class="content" style="height: 80%;width: 99%">
        <div id="container" style="height: 100%;width: 100%"></div>
        <div style="text-align: center;height: 50px;float: left">
            <div style="float: left;margin-top: 15px;margin-left: 10px">
                <form>
                    <input type="text" id="province" name="province" style="width: 100px">
                    <input type="text" id="city" name="city" style="width: 100px">
                    <input type="text" id="district" name="district" style="width: 100px">
                    <input type="text" id="street" name="street">
                    <input type="text" id="streetNumber" name="streetNumber">
                </form>
            </div>
            <div style="margin-top: 10px;margin-left:10px;float: left">
                <div id="determap" class="add">确定</div>
                <div id="mapcancel" style="margin-left: 10px">取消</div>
            </div>

        </div>
    </div>
</div>





<script type="text/javascript">
    var map = new BMap.Map("container");
    // 创建地图实例
    var point = new BMap.Point(116.404, 39.915);
    // 创建点坐标
    map.centerAndZoom(point,18);
    map.enableScrollWheelZoom(); //启用滚轮放大缩小，默认禁用
    map.enableContinuousZoom(); //启用地图惯性拖拽，默认禁用
    map.addControl(new BMap.OverviewMapControl()); //添加默认缩略地图控件

    //百度地图定位
    var geolocation = new BMap.Geolocation();

    geolocation.getCurrentPosition(function (r) {
        if (this.getStatus() == BMAP_STATUS_SUCCESS) {
            let mk = new BMap.Marker(r.point);
            map.setCenter(r.point); // 设置地图中心点
            map.addOverlay(mk);
            map.panTo(r.point);
            //mk.enableDragging()
            let gc = new BMap.Geocoder();
            gc.getLocation(r.point, function (rs) {
                let addComp = rs.addressComponents;
                address = addComp.province + addComp.city + addComp.district + addComp.street + addComp.streetNumber;
                $("#province").val(addComp.province);
                $("#city").val(addComp.city);
                $("#district").val(addComp.district);
                $("#street").val(addComp.street);
                $("#streetNumber").val(addComp.streetNumber);
            })
            map.addEventListener('click', function(e){
                var pt = e.point;
                map.clearOverlays();
                map.setCenter(pt); // 设置地图中心点
                var marker = new BMap.Marker(pt);
                map.addOverlay(marker);
                gc.getLocation(pt, function (rs) {
                    let addComp = rs.addressComponents;
                    address = addComp.province + addComp.city + addComp.district + addComp.street + addComp.streetNumber;
                    $("#province").val(addComp.province);
                    $("#city").val(addComp.city);
                    $("#district").val(addComp.district);
                    $("#street").val(addComp.street);
                    $("#streetNumber").val(addComp.streetNumber);
                })
            })
            var navigationControl = new BMap.NavigationControl({
                // 靠左上角位置
                anchor: BMAP_ANCHOR_TOP_RIGHT,
                // LARGE类型
                type: BMAP_NAVIGATION_CONTROL_LARGE,
                // 启用显示定位
                enableGeolocation: true // 会多出一个点
            });
            map.addControl(navigationControl);

        } else {
            console.log(66666)
        }
    }, {
        enableHighAccuracy: true,
        howAddressBar: true,
        offset: new BMap.Size(10, 10),
    });


</script>

<script >
        $("#address_frame").css("display","none");
        $("#add_frame").css("display","none");
        $("#map_frame").css("display","none");
        //点击立即购买
        $(".details_buy").click(function (){
            var newURL="orderServlet?action=buy";
            $("#myform").attr('action', newURL);    //通过jquery为action属性赋值
            $("#myform").submit();    //提交ID为myform的表单
        })
        //点击加入购物车
        $(".details_add").click(function (){
            var newURL="orderServlet?action=add";
            $("#myform").attr('action', newURL);    //通过jquery为action属性赋值
            $("#myform").submit();    //提交ID为myform的表单
        })

        $("#edit").click(function (){
            $("#address_frame").css("display","");
        })
        //修改收货地址
        $("#editaddress").click(function (){
            var address=$(".addresstext").val();
            $(".address").html(address);//设置div显示的html值
            $("#address").val(address);//设置表单隐藏域的值
            $(".address_frame").css("display","none");
        })

        $("#addresscancel").click(function (){
            $(".address_frame").css("display","none");
        })
        //添加收货地址
        $("#add").click(function (){
            $(".add_frame").css("display","");
        })

        $("#addaddress").click(function (){
            var newURL="orderServlet?action=addAddress";
            $("#addform").attr('action', newURL);    //通过jquery为action属性赋值
            $("#addform").submit();    //提交ID为myform的表单
            $(".add_frame").css("display","none");
            alert("添加成功!")
        })

        $("#addcancel").click(function (){
            $(".add_frame").css("display","none");
        })
        //地图定位
        $("#map").click(function (){
            $(".map_frame").css("display","");
        })

        $("#mapcancel").click(function (){
            $(".map_frame").css("display","none");
        })

        $("#determap").click(function (){
            var address=$("#province").val()+ $("#city").val()+ $("#district").val()+ $("#street").val()+ $("#streetNumber").val();
            $(".address").html(address);
            $("#address").val(address);//设置表单隐藏域的值
            $(".map_frame").css("display","none");
        })

        //尺寸
        $(".details_no3_right_div7 .details_no3_right_div7_in").click(function () {
            console.log($(this).children().html());
            $("#size").val($(this).children().html());
            $(".details_no3_right_div10_span0").html($(this).children().html());
            $(".details_no3_right_span10").html($(this).children().eq(1).html());
            // var value = "总计:"+$(this).children().eq(1).html();
            // $(".details_no3_right_div10_p2").html(value);
            $(this).siblings().removeClass("details_no3_right_div7_in_hover").end().addClass("details_no3_right_div7_in_hover");
        })
        //颜色
        $(".details_no3_right_div9 .details_no3_right_div7_in").click(function () {
            console.log($(this).children().eq(1).html());
            $("#color").val($(this).children().html());
            $(".details_no3_right_div10_span1").html($(this).children().html());
            $(".details_no3_img img").css("display","none").eq($(this).index()).css("display", "block");
            $(this).siblings().removeClass("details_no3_right_div7_in_hover").end().addClass("details_no3_right_div7_in_hover");
        })

    </script>


</body>
</html>