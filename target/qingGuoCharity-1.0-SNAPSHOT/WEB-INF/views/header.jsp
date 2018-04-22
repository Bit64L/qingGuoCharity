<%--
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
<link rel="stylesheet" href="/qingguo/css/font-awesome.css" >
<script src="/qingguo/js/jquery-3.2.1.js"></script>
<script src="/qingguo/js/bootstrap.js"></script>
<head>
    <title>青果公益商城</title>
    <div class="header">
        <div class="row">
            <div class="col-md-12">
                <div class="header-first standard-out">
                    <div class="left">
                        <a href="/qingguo">首页</a>
                        <a href="login">登录</a>
                        <a href="register">注册</a>
                    </div>
                    <div class="right">
                        <span>我的收藏</span>
                        <span>我的订单</span>
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
                        <input class="search" placeholder="请输入您要搜索的关键字"><button class="search-button">搜索</button>
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
                        <div class="shopping-cart-size right" id="shoppingCartSize">0</div>
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