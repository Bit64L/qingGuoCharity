<%--
  Created by IntelliJ IDEA.
  User: LiWenxiao
  Date: 2018/4/1
  Time: 下午5:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<html>
<%@include file="header.jsp" %>
<link rel="stylesheet" href="/qingguo/css/commodityNav.css">
<link rel="stylesheet" href="/qingguo/css/index.css">
<script src="/qingguo/js/commodityNav.js"></script>
<body>
<div class="row" style="position: relative;z-index: 20">
    <%@include file="commodity/commodityNav.jsp"%>
</div>
<br><br><br><br><br><br><br><br><br><br>
<div class="big-screen">
    <div id="myCarousel" class="carousel slide">
        <!-- 轮播（Carousel）指标 -->
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
            <div class="item active">
                <img src="/qingguo/images/01.jpg" alt="First slide">
            </div>
            <div class="item">
                <img src="/qingguo/images/2.jpg" alt="Second slide">
            </div>
            <div class="item">
                <img src="/qingguo/images/03.jpg" alt="Third slide">
            </div>
        </div>
    </div>
</div>
<div class="row">
    <div class="standard-out">
        <div class="title">匠人风采</div>
        <div class="title-content">
            <div class="col-md-3">
                <img src="/qingguo/images/master1.jpg" alt="">
            </div>
            <div class="col-md-3">
                <img src="/qingguo/images/master2.jpg" alt="">
            </div>
            <div class="col-md-3">
                <img src="/qingguo/images/master3.jpg" alt="">
            </div>
            <div class="col-md-3">
                <img src="/qingguo/images/master4.jpg" alt="">
            </div>
        </div>
    </div>
</div>

<div class="row">
    <div class="standard-out">
        <div class="title">新品速递</div>
        <div class="title-content">
            <div class="col-md-3">
                <img src="/qingguo/images/material1.jpg" alt="">
            </div>
            <div class="col-md-3">
                <img src="/qingguo/images/material2.jpg" alt="">
            </div>
            <div class="col-md-3">
                <img src="/qingguo/images/material3.jpg" alt="">
            </div>
            <div class="col-md-3">
                <img src="/qingguo/images/material4.jpg" alt="">
            </div>
        </div>
    </div>
</div>
<%@include file="footer.jsp"%>
</body>
<script>
    if('${message}' != ''){
        alert('${message}');
    }
</script>
</html>
