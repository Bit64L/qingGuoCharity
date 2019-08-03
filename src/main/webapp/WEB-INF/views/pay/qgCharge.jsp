<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<html>
<head>
    <link rel="stylesheet" href="/qingguo/css/standard.css">
    <link rel="stylesheet" href="/qingguo/css/bootstrap.css">
    <link rel="stylesheet" href="/qingguo/css/header.css">
    <link rel="stylesheet" href="/qingguo/css/user.css">
    <link rel="stylesheet" href="/qingguo/css/font-awesome.css">
    <script src="/qingguo/js/jquery-3.2.1.js"></script>
    <script src="/qingguo/js/bootstrap.js"></script>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <title>青果公益商城</title>
</head>
<body>
<div class="container">
    <div class="row" style="margin: 15px -15px 15px -15px">
        <div class="col-md-12 ">
            <div class="">
                <span class="brand" style="font-size: 40px;">青果收银台</span>
            </div>
        </div>
    </div>
    <div class="row" style=" background-color: rgb(233,233,239);">
        <div class="col-md-5">
            <div class="standard-out">
                <table class="user-info" style="border-spacing: 10px;">
                    <tr>
                        <td>订单编号：</td>
                        <td>${order.id}</td>
                    </tr>
                    <tr>
                        <td>订单类型：</td>
                        <td>订单</td>
                    </tr>
                    <tr>
                        <td>应付金额：</td>
                        <td>￥${order.totalMoney}</td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
    <br>
    <link rel="stylesheet" href="/qingguo/css/commodityNav.css">
    <link rel="stylesheet" href="/qingguo/css/index.css">
    <script src="/qingguo/js/commodityNav.js"></script>
    <div class="row" style="border:2px solid rgb(233,233,239); height: 70px">
        <div class="col-md-12">
            <ul class="second-user-header" style="padding-left: 5px">
                <li><img src="/qingguo/images/wx-logo.png" width="40px" class="left"></li>
                <li><img src="/qingguo/images/wx-tag.png" width="40px"></li>
            </ul>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <center>
                <img src="${imageUrl}" width="200px"><br>
                <img src="/qingguo/images/wx-intro.png" width="150px">
            </center>
            <br>
        </div>
    </div>
    <div class="row" style="border-top:2px solid rgb(233,233,239);">
        <div class="col-md-10"></div>
        <div class="col-md-2">
            <br>
            <button class="btn-b" onclick="location.href='/qingguo/index'">取消</button>
        </div>
    </div>
</div>

</body>
<%@include file="../footer.jsp" %>
</body>
<script>
    if ('${message}' != '') {
        alert('${message}');
    }
    setInterval(function () {
        load()
    }, 2000);
    function load() {
        $.ajax({
            data:
                {
                    "id": "${order.id}"
                },
            type: "GET",
            dataType: 'text',
            url: "/qingguo/wxpay/orderQuery",
            error: function (data) {
                alert("出错了！！:" + data);
            },
            success: function (data) {
                if (data == "SUCCESS") {
                    alert("支付成功！正在跳转，请稍等。。。")
                    //延迟3000毫秒执行tz() 方法
                    setTimeout(function () {
                        tz("${order.type}")
                    }, 1000);

                    function tz(type) {
                        if(type == '商品')
                            window.location.href = "/qingguo/order/orderInfo?id=" + "${order.id}"
                        else
                            window.location.href = "/qingguo/user/addTeacherInfo";
                    };
                }
            }
        });
    }

</script>
</html>
