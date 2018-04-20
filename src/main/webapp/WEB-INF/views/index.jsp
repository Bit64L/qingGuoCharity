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
<link rel="stylesheet" href="css/commodityNav.css">
<link rel="stylesheet" href="css/index.css">
<script src="js/commodityNav.js"></script>
<body>
<div class="row" style="position: relative;z-index: 20">
    <div class="col-md-2">
        <!--导航  -->
        <div class="sidebar standard-out" style="padding-top:0; background:transparent;">
            <div class="sidebar_con">
                <dl class="sidebar_item">
                    <dd>
                        <h3 class="">
                            <a href="commodity/commodityCatalog?code=43" class="">文房四宝</a>
                        </h3>
                        <%--弹出层--%>
                        <div class="sidebar_popup dis1">
                            <div class="sidebar_popup_class clearfix">
                                <div class="sidebar_popup_item">
                                    <strong>传统手工艺 传统乐器</strong>
                                    <p>
                                        <span class="linesbg"><a href="guidedCommodity?code=4321">毛笔</a></span>
                                    </p>
                                    <p>
                                        <span class="linesbg"><a href="guidedCommodity?code=4321">墨</a></span>
                                    </p>
                                    <p>
                                        <span class="linesbg"><a href="guidedCommodity?code=4321">纸</a></span>
                                    </p>
                                    <p>
                                        <span class="linesbg"><a href="guidedCommodity?code=4321">砚台</a></span>
                                    </p>

                                </div>
                            </div>
                        </div>
                    </dd>
                    <dd>
                        <h3 class="">
                            <a href="commodityCatalog?code=43" class="">旗袍 汉服 唐装</a>
                        </h3>
                        <%--弹出层--%>
                        <div class="sidebar_popup dis1">
                            <div class="sidebar_popup_class clearfix">
                                <div class="sidebar_popup_item">
                                    <strong>文房四宝</strong>
                                    <p>
                                        <span class="linesbg"><a href="guidedCommodity?code=4321">毛笔</a></span>
                                    </p>
                                    <p>
                                        <span class="linesbg"><a href="guidedCommodity?code=4321">墨</a></span>
                                    </p>
                                    <p>
                                        <span class="linesbg"><a href="guidedCommodity?code=4321">纸</a></span>
                                    </p>
                                    <p>
                                        <span class="linesbg"><a href="guidedCommodity?code=4321">砚台</a></span>
                                    </p>

                                </div>
                            </div>
                        </div>
                    </dd>
                    <dd>
                        <h3 class="">
                            <a href="commodityCatalog?code=43" class="">红色文化</a>
                        </h3>
                        <%--弹出层--%>
                        <div class="sidebar_popup dis1">
                            <div class="sidebar_popup_class clearfix">
                                <div class="sidebar_popup_item">
                                    <strong>文房四宝</strong>
                                    <p>
                                        <span class="linesbg"><a href="guidedCommodity?code=4321">毛笔</a></span>
                                    </p>
                                    <p>
                                        <span class="linesbg"><a href="guidedCommodity?code=4321">墨</a></span>
                                    </p>
                                    <p>
                                        <span class="linesbg"><a href="guidedCommodity?code=4321">纸</a></span>
                                    </p>
                                    <p>
                                        <span class="linesbg"><a href="guidedCommodity?code=4321">砚台</a></span>
                                    </p>

                                </div>
                            </div>
                        </div>
                    </dd>
                    <dd>
                        <h3 class="">
                            <a href="commodityCatalog?code=43" class="">文化艺术</a>
                        </h3>
                        <%--弹出层--%>
                        <div class="sidebar_popup dis1">
                            <div class="sidebar_popup_class clearfix">
                                <div class="sidebar_popup_item">
                                    <strong>文房四宝</strong>
                                    <p>
                                        <span class="linesbg"><a href="guidedCommodity?code=4321">毛笔</a></span>
                                    </p>
                                    <p>
                                        <span class="linesbg"><a href="guidedCommodity?code=4321">墨</a></span>
                                    </p>
                                    <p>
                                        <span class="linesbg"><a href="guidedCommodity?code=4321">纸</a></span>
                                    </p>
                                    <p>
                                        <span class="linesbg"><a href="guidedCommodity?code=4321">砚台</a></span>
                                    </p>

                                </div>
                            </div>
                        </div>
                    </dd>
                    <dd>
                        <h3 class="">
                            <a href="commodityCatalog?code=43" class="">书法 国画 油画</a>
                        </h3>
                        <%--弹出层--%>
                        <div class="sidebar_popup dis1">
                            <div class="sidebar_popup_class clearfix">
                                <div class="sidebar_popup_item">
                                    <strong>文房四宝</strong>
                                    <p>
                                        <span class="linesbg"><a href="guidedCommodity?code=4321">毛笔</a></span>
                                    </p>
                                    <p>
                                        <span class="linesbg"><a href="guidedCommodity?code=4321">墨</a></span>
                                    </p>
                                    <p>
                                        <span class="linesbg"><a href="guidedCommodity?code=4321">纸</a></span>
                                    </p>
                                    <p>
                                        <span class="linesbg"><a href="guidedCommodity?code=4321">砚台</a></span>
                                    </p>

                                </div>
                            </div>
                        </div>
                    </dd>
                </dl>
            </div>
        </div>
    </div>
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
                <img src="images/01.jpg" alt="First slide">
            </div>
            <div class="item">
                <img src="images/2.jpg" alt="Second slide">
            </div>
            <div class="item">
                <img src="images/03.jpg" alt="Third slide">
            </div>
        </div>
    </div>
</div>
<div class="row">
    <div class="standard-out">
        <div class="title">匠人风采</div>
        <div class="title-content">
            <div class="col-md-3">
                <img src="images/master1.jpg" alt="">
            </div>
            <div class="col-md-3">
                <img src="images/master2.jpg" alt="">
            </div>
            <div class="col-md-3">
                <img src="images/master3.jpg" alt="">
            </div>
            <div class="col-md-3">
                <img src="images/master4.jpg" alt="">
            </div>
        </div>
    </div>
</div>

<div class="row">
    <div class="standard-out">
        <div class="title">新品速递</div>
        <div class="title-content">
            <div class="col-md-3">
                <img src="images/material1.jpg" alt="">
            </div>
            <div class="col-md-3">
                <img src="images/material2.jpg" alt="">
            </div>
            <div class="col-md-3">
                <img src="images/material3.jpg" alt="">
            </div>
            <div class="col-md-3">
                <img src="images/material4.jpg" alt="">
            </div>
        </div>
    </div>
</div>
<%@include file="footer.jsp"%>
</body>
</html>
