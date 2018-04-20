<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="css/bootstrap.css" rel="stylesheet"/>
    <link href="css/login.css" rel="stylesheet"/>
    <link href="css/header.css" rel="stylesheet">
    <link rel="stylesheet" href="css/standard.css">
    <script type="text/javascript" src="js/jquery-3.2.1.js"></script>
    <%-- <link rel="stylesheet" type="text/css" href='<c:url value="css/style.css"></c:url>'>
    <link rel="stylesheet" type="text/css" href='<c:url value="css/bootstrap.css"></c:url>'>
    <script type="text/javascript" src='<c:url value="js/jquery.js"></c:url>'></script> --%>
</head>
<body>
<div class="row">
    <div class="col-md-12">
        <div class="header-first standard-out">
            <div class="left">
                <a href="/qingguo">首页</a>
                <a href="login">登录</a>
                <a href="register">注册</a>
            </div>
            <div class="clear"></div>
        </div>
    </div>
</div>
<div class="htmleaf-container" style="position: relative;">
    <div class="wrapper">
        <div class="container">
            <div class="row">
                <div class="col-md-5">
                    <h1>欢迎</h1>

                    <form class="form" method="post">
                        <input type="text" placeholder="用户名" name="username" class="inputLogin" id="username">

                        <input type="password" name="password" placeholder="密码" class="inputLogin" id="psd"
                               style="margin-bottom:0;">

                        <div class="radio"
                             style="margin-bottom:2px; margin-top:-2px; font-size:16px; width:200px; display:inline-block"
                             onChange="showSignUp();">
                        </div>
                        <button id="login-button" style="margin-top:14px; display:block;" onclick="return check();">登录
                        </button>
                    </form>
                    <form id="initialSignUp" action="supplier/signUp?signup=true" method="post" hidden="hidden">

                    </form>
                </div>
            </div>
        </div>

        <ul class="bg-bubbles">
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
        </ul>
    </div>
</div>
<div style="position: absolute;top: 550px;left: 40%;">
    <%@ include file="footer.jsp" %>
</div>

<script>
    function showSignUp() {
        var role = $('input:radio[name="role"]:checked').val();
        if (role == "supplier") {
            //alert("123");
            $("#signup").show()
        } else {
            //alert("1234");
            $("#signup").hide()
        }
    }

    function check() {
        var username = $("#username").val();
        var psd = $("#psd").val();
        if (username == "") {
            $("#useralert").val("请输入用户名");
            //alert("请输入用户名");
            return false;
        }
        $("#useralert").val("");
        if (psd == "") {
            $("#psdalert").val("请输入密码");
            return false;
        }
        $("#psdalert").val("");
        location.href = "login";
    }
</script>


</body>
</html>