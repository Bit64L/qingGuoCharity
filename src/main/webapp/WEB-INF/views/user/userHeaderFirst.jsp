<%--
  Created by IntelliJ IDEA.
  User: LiWenxiao
  Date: 2018/4/16
  Time: 下午9:43
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
<head>
    <title>青果公益商城</title>
    <div class="row">
        <div class="col-md-12">
            <div class="header-first standard-out">
                <div class="right">
                    <a href="/qingguo">首页</a>
                    欢迎您，<a href="/qingguo/user/userCenter">${user.name}</a>
                    &nbsp;&nbsp;&nbsp;
                    <a href="/qingguo/user/logOut">退出</a>
                </div>
                <div class="clear"></div>
            </div>
        </div>
    </div>
</head>