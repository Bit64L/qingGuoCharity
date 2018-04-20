<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <%@ include file="../header.jsp" %>
    <link
            href="//netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
            rel="stylesheet">
    <link href="/qingguo/css/commodityNav.css" rel="stylesheet" type="text/css"/>
    <link href="/qingguo/css/commodity.css" rel="stylesheet" type="text/css">
    <style type="text/css">
        table > tbody > tr > td {
            font-size: 16px;
        }
    </style>
</head>
<body>
<br>
<div class="row">
    <div class="col-md-12">
        <!-- 面包屑导航 -->
        <div class="standard-out"  style="background: #efefef; padding-top:2px;padding-bottom: 2px";>
        <ol class="breadcrumb bread-nav">
            <li><a
                    href="/ProcurementSystem/buyer/commodityCatalog?currPage=${currPage}&code=${code}"><i
                    class="fa fa-angle-double-left" aria-hidden="true"></i>返回 </a></li>
            <li><a href="/ProcurementSystem/buyer/commodityCatalog">目录主页</a></li>
            <%--<c:forEach var="node" items="${}" varStatus="status">--%>

            <%--</c:forEach>--%>
        </ol>
    </div>
    </div>
</div>
<div class="content">
    <div class="container">
        <div class="standart-out">
            <div class="row" style="padding: 10px 50px 10px 50px;">
                <div class="col-md-6">
                    <div style="padding-right: 100px;" class="right">
                        <div class="left">
                            <div class="">
                                <div class="bigImg">
                                    <img id=iimage-
                                         onerror="error('image-');"
                                         src="/qingguo/images/material1.jpg">
                                </div>
                                <div class="smallImgs">
                                    <%--<c:forEach var="path" items="${paths}">--%>
                                    <div class="smallImg left">
                                    <img id=image-${commodity.uniqueName}
                                    src="/qingguo/images/material1.jpg"
                                    onerror="error('image-');">
                                    </div>
                                    <%--</c:forEach>--%>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">

                    <div class="" style="padding-left: 100px;">
                        <div class="standard-title-main margin-bottom">
                            <strong>标题</strong>
                        </div>
                        <table class="commodity-item-table">
                            <tr>
                                <td class="right">主题：</td>
                                <td></td>
                            </tr>
                            <tr>
                                <td class="right">周期：</td>
                                <td></td>
                            </tr>

                            <tr>
                                <td class="right">公益积分：</td>
                                <td></td>

                            </tr>
                            <tr>
                                <td class="right">价格：</td>
                                <td>
                                    <div class="item-price-green">￥100
                                    </div>
                                    <div class="item-price-grey">&nbsp;／个</div>
                                </td>
                            </tr>
                        </table>
                        <div>
                            <br>
                            <div class="item-price-black">
                                数量： <input class="item-quantity"
                                           id="quantity_" value="1"/>
                                <button class="item-add"
                                        onclick="add();">添加到购物车
                                </button>
                            </div>
                            <div>
                                <a class="item-price-blue">添加到收藏夹</a>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <div class="row" style="padding: 10px 50px 10px 50px;">
                <div class="col-md-12">
                    <div class="margin-bottom">
                        <div class="standard-subtitle">产品说明</div>
                        <div style="font-size:16px; ">关于产品的一些说明</div>
                        <br>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="../footer.jsp"%>
</body>
<script>
    function add(uniqueName) {
        var quantity = $("#quantity_" + uniqueName).val();
        addShoppingCart(uniqueName, quantity);
    }

    $(document).ready(function () {
        var $miaobian = $('.smallImgs>div');
        var $huantu = $('.bigImg>img');
        /* var $miaobian1=$('.Xcontent26>div'); */
        $miaobian.mousemove(function () {
            miaobian(this);
        });

        /* $miaobian1.click(function(){miaobian1(this);}); */
        function miaobian(thisMb) {
            for (var i = 0; i < $miaobian.length; i++) {
                $miaobian[i].style.borderColor = '#dedede';
            }
            thisMb.style.borderColor = '#cd2426';

            $huantu[0].src = thisMb.children[0].src;
        }

        function miaobian1(thisMb1) {
            for (var i = 0; i < $miaobian1.length; i++) {
                $miaobian1[i].style.borderColor = '#dedede';
            }
//	thisMb.style.borderColor = '#cd2426';
            $miaobian.css('border-color', '#dedede');
            thisMb1.style.borderColor = '#cd2426';
            $huantu[0].src = thisMb1.children[0].src;
        }
    })
</script>
</html>