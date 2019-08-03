<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@include file="../header.jsp" %>
<link href="/qingguo/css/commodityNav.css" rel="stylesheet" type="text/css"/>
<script src="/qingguo/js/commodityNav.js"></script>
<script src="/qingguo/js/shopping-cart.js"></script>
<link rel="stylesheet" href="/qingguo/css/commodity.css">
<html xmlns="http://www.w3.org/1999/xhtml">
<body class="a-dashbrd-page-bg">
<div class="row" style="position: relative;z-index: 20">
    <%@include file="commodityNav.jsp" %>
    <div class="col-md-10">
        <div class="results-out" style="padding-top: 0px; border-left:0">
            <!-- 面包屑导航 -->
            <div>
                <ol class="breadcrumb bread-nav">
                    <li><a href="/qingguo/index">首页</a></li>
                    <c:if test="${firstClassName != null and firstClassName !='' }">
                        &nbsp;/&nbsp;<a href="">${firstClassName}</a>
                    </c:if>
                    <c:if test="${secondClassName != null and secondClassName != ''}">
                        &nbsp;/&nbsp;<a href="">${secondClassName}</a>
                    </c:if>
                </ol>
                <!-- 搜索结果 -->
                <div style="width:100%; height:360px;">
                    <c:forEach items="${pageParams.data}" var="commodity">
                        <div class="col-md-4 full-height commodity-container">
                            <div class="a-third">
                                <div class="a-third-title">
                                    <a class="black f-14"
                                       href="commodityInfo?id=${commodity.id}">${commodity.name}</a>
                                </div>
                                <img class="a-third-img"
                                     href=""
                                     alt="" id="image-"
                                     src="${commodity.image}"
                                     onerror="error('image-');"/>
                                <div class="a-third-description"><span></span>
                                </div>
                                <div class="item-price-green">￥${commodity.price}</div>
                                <div class="item-price-grey">&nbsp;／个</div>
                                <br>
                                <div class="item-price-black">数量：<input class="item-quantity"
                                                                        id="quantity_${commodity.id}" value="1"/>
                                    <button class="item-add" onclick="add(${commodity.id});">添加到购物车</button>
                                </div>
                            </div>
                            <div class="adjust-10"></div>
                        </div>
                    </c:forEach>
                </div>

            </div>
        </div>
    </div>
</div>
<div class="container">
    <div class="row">
        <div class="right">
            <button class="btn-page" id="forward"
                    onclick="window.location.href='/qingguo/publish/publishManage?page=${pageParams.getCurrPage() - 1}&firstClassName=${firstClassName}&secondClassName=${secondClassName}'">
                上一页
            </button>
            <span id="pageList"></span>
            <button class="btn-page" id="afterward"
                    onclick="window.location.href='/qingguo/publish/publishManage?page=${pageParams.currPage+1}&firstClassName=${firstClassName}&secondClassName=${secondClassName}'">
                下一页
            </button>
            <span>共<strong>${pageParams.totalPages}</strong>页
						</span>
        </div>
    </div>
</div>
<%@include file="../footer.jsp" %>
</body>
<script>
    function createGuidedBuyingButtonPage(i, firstClassName, secondClassName) {// i表示页号
        var button = document.createElement("button")// 创建button结点
        var text = document.createTextNode("" + i);
        button.appendChild(text);
        button.id = "page" + i;// 设置button属性
        button.setAttribute("class", "btn-page");
        button.setAttribute("onclick", "window.location.href='/qingguo/commodity/commodityCatalog?currPage="
            + i + "&firstClassName=" + firstClassName + "&secondClassName=" + secondClassName);
        pageList.appendChild(button);// 添加到pageList后面
    }

    var pageList = document.getElementById("pageList");
    var currPage = '${pageParams.currPage}';
    var totalPages = '${pageParams.totalPages}';

    if (totalPages >= 4) {
        if (currPage < 3) {
            for (var i = 1; i <= 3; i++) {
                createGuidedBuyingButtonPage(i, "${firstClassName}", "${secondClassName}");
            }
        } else {
            createGuidedBuyingButtonPage(1, "${firstClassName}", "${secondClassName}");
            for (var i = currPage - 1; i <= currPage + 1; i++) {
                createGuidedBuyingButtonPage(i, "${firstClassName}", "${secondClassName}");
            }
        }
    } else if (totalPages > 0) {//总页数不足4页
        for (var i = 1; i <= totalPages; i++) {
            createGuidedBuyingButtonPage(i, "${firstClassName}", "${secondClassName}");
        }
    }
    if (currPage == 1 || currPage == 0) $("#forward").hide();//善后处理
    if (currPage == totalPages) {
        $("#afterward").hide();
        $("#page" + (currPage + 1)).hide();
    }
    $("#page" + currPage).attr("class", "btn-page-choose");


    function add(id) {
        var quantity = $("#quantity_" + id).val();
        addShoppingCart(id, quantity);
    }


</script>
</html>
