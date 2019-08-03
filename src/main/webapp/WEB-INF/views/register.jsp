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
                <a href="/qingguo/index">首页</a>
                <a href="/qingguo/login">登录</a>
                <a href="/qingguo/register">注册</a>
            </div>
            <div class="clear"></div>
        </div>
    </div>
</div>
<div class="htmleaf-container" style="position: relative;">
    <div class="wrapper" style="height:700px">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h1>欢迎加入青果会员</h1>
                    <form class="form" method="post" action="user/addUser">
                        <input type="text" placeholder="请输入您的用户名(手机号)" name="phone" class="inputLogin" id="phone">
                        <div style="height:26px;width:300px; text-align:right;">
                            <input id="error-phone" class="error" value="" disabled/>
                        </div>
                        <input type="text" placeholder="请输入您的昵称" name="name" class="inputLogin" id="name">
                        <div style="height:26px;width:300px; text-align:right;">
                            <input id="error-name" class="error" value="" disabled/>
                        </div>
                        <input type="text" name="email" placeholder="请输入您的电子邮箱" class="inputLogin" id="email">
                        <div style="height:26px;width:300px; text-align:right;">
                            <input id="error-email" class="error" value="" disabled/>
                        </div>
                        <input type="password" name="password" placeholder="请设置您的登录密码" class="inputLogin" id="psd">
                        <div style="height:26px;width:300px; text-align:right;">
                            <input id="error-psd" class="error" value="" disabled/>
                        </div>
                        <input type="password" name="repassword" placeholder="请重复您的登录密码" class="inputLogin" id="repsd">
                        <div style="height:26px;width:300px; text-align:right;">
                            <input id="error-repsd" class="error" value="" disabled/>
                        </div>

                        <input type="text" name="company" placeholder="请输入您的工作单位" class="inputLogin" id="company">
                        <div style="height:26px;width:300px; text-align:right;">
                            <input id="error-company" class="error" value="" disabled/>
                        </div>
                        <div class="radio"
                             style="margin-bottom:2px; margin-top:-2px; font-size:16px; width:200px; display:inline-block; color:black;"
                             onChange="showSignUp();">
                            <label> <input type="radio" name="gender" id="buyer" value="男" checked>男</label> &nbsp;&nbsp;&nbsp;
                            <label> <input type="radio" name="gender" id="supplier" value="女">女</label>
                        </div>u
                        <input type="hidden" name="role" value="普通用户">
                        <button id="login-button" style="margin-top:14px; display:block;" onclick="return check();">注册
                        </button>
                    </form>
                </div>
            </div>
        </div>

    </div>
</div>
<div style="position: absolute;
    top: 600px;
    left: 40%;">
    <%@ include file="footer.jsp" %>
</div>

<script>
    function check() {
        // var username = $("#phone").val();
        // if (username == "") {
        //     $("#useralert").val("请输入用户名");
        //     return false;
        // }
        var psd = $("#psd").val();
        var repsd = $("#repsd").val();
        var inputLogins = $(".inputLogin");
        var success = true;
        for (var i = 0; i < inputLogins.length; i++) {
            var inputLogin = $(inputLogins[i]);
            if (inputLogin.val() == "") {
                $("#error-" + inputLogin.attr("id")).val("不能为空");
                success = false;
            }
        }
        if (psd != repsd) {
            $("#error-repsd").val("密码不一致");
            success = false;
        }
        return success;
    }
</script>


</body>
</html>