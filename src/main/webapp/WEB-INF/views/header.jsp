<%@ page import="org.qingGuo.model.Order" %>
<%@ page import="org.qingGuo.model.User" %><%--
  Created by IntelliJ IDEA.
  User: LiWenxiao
  Date: 2018/4/8
  Time: 下午9:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<link rel="stylesheet" href="/qingguo/css/standard.css">
<link rel="stylesheet" href="/qingguo/css/bootstrap.css">
<link rel="stylesheet" href="/qingguo/css/header.css">
<link rel="stylesheet" href="/qingguo/css/font-awesome.css">
<script src="/qingguo/js/jquery-3.2.1.js"></script>
<script src="/qingguo/js/bootstrap.js"></script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    User user = (User) session.getAttribute("user");
    String totalAmount = "0";
    String size = "0";
    if (user != null) {
        if(user.getShoppingCart().getTotalAmount() != null)
            totalAmount = user.getShoppingCart().getTotalAmount() + "";
        if (user.getShoppingCart().getShoppingCartDetails() != null)
            size = user.getShoppingCart().getShoppingCartDetails().size() + "";
    }
    Order order = (Order) session.getAttribute("order");
    String orderSize = "0";
    if (order != null) {
        orderSize = order.getOrderDetails().size() + "";
    }


%>
<head>
    <title>青果公益商城</title>
    <div class="header">
        <div class="row">
            <div class="col-md-12">
                <div class="header-first standard-out">
                    <div class="right">
                        <a href="/qingguo/index">首页</a>
                        <c:if test="${user == null}">
                            <a href="/qingguo/login">登录</a>
                            <a href="/qingguo/register">注册</a>
                        </c:if>
                        <c:if test="${user != null}">
                            欢迎您，<a href="/qingguo/user/userCenter">${user.name}</a>
                            &nbsp;&nbsp;&nbsp;
                            <a href="/qingguo/user/logOut">退出</a>
                        </c:if>
                    </div>
                    <div class="clear"></div>
                </div>
            </div>
        </div>
        <div class="row header-second">
            <div class="col-md-2 ">
                <div class="standard-out">
                    <span class="brand">LOGO</span>

                </div>
            </div>
            <div class="col-md-8">
                <div class="standard-out">
                    <div class="center">
                        <form action="/qingguo/commodity/search" method="post">
                            <input class="search" placeholder="请输入您要搜索的关键字" name="name"><button class="search-button">搜索</button>
                        </form>
                        <div class="search-key">
                            <span>书法</span>
                            <span>绘画</span>
                            <span>剪纸</span>
                            <span>雕塑</span>
                            <span>旗袍</span>
                            <span>乐器</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-2">
                <div class="standard-out">
                    <button class="my-shopping-cart" onclick="window.location.href='/qingguo/commodity/shoppingCart'">
                        <span class="fa fa-shopping-cart shopping-cart-icon" aria-hidden="true"></span>
                        <div class="shopping-cart-size right" id="shoppingCartSize"><%=totalAmount%>
                        </div>
                        我的购物车
                    </button>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-2">
                <div class="standard-out" style="padding-bottom:0px;">
                    <div class="commodity-class">所有商品分类&nbsp;&nbsp;&nbsp;<span class="caret"></span></div>
                </div>
            </div>
        </div>
    </div>
</head>