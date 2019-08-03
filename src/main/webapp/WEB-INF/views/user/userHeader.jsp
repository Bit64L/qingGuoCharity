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
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
    <title>青果公益商城</title>
    <div class="header">
        <div class="header-first standard-out">
            中国传统文化孵化平台
        </div>
        <div class="container">
            <div class="row">
                <div class="col-md-2 ">
                    <div class="standard-out">
                        <a href="/qingguo/index"><span class="brand">LOGO</span></a>
                    </div>
                </div>
                <div class="col-md-7">
                </div>
                <div class="col-md-3">
                    <div class="standard-out">
                        <ul class="second-user-header">
                            <li>
                                <c:if test="${user.role == '普通用户'}">
                                    <button class="button btn-b"
                                            onclick="location.href='/qingguo/user/teacherRegister'">
                                        导师申请
                                    </button>
                                </c:if>
                                <c:if test="${user.role == '导师'}">
                                    <button class="button btn-b"
                                            onclick="location.href='/qingguo/publish/commodityInfo'">
                                        发布
                                    </button>
                                </c:if>
                            </li>
                            <li><img src="${user.headUrl}" width="30px"></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</head>