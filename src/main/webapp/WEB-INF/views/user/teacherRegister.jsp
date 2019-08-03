<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="/qingguo/css/bootstrap.css" rel="stylesheet"/>
    <link href="/qingguo/css/login.css" rel="stylesheet"/>
    <link href="/qingguo/css/header.css" rel="stylesheet">
    <link rel="stylesheet" href="/qingguo/css/standard.css">
    <script type="text/javascript" src="/qingguo/js/jquery-3.2.1.js"></script>
    <%-- <link rel="stylesheet" type="text/css" href='<c:url value="/qingguo/css/style.css"></c:url>'>
    <link rel="stylesheet" type="text/css" href='<c:url value="/qingguo/css/bootstrap.css"></c:url>'>
    <script type="text/javascript" src='<c:url value="/qingguo/js/jquery.js"></c:url>'></script> --%>
</head>
<body>
<%@include file="userHeaderFirst.jsp" %>
<div class="htmleaf-container" style="position: relative;">
    <div class="wrapper" style="height:700px">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h1>欢迎申请青果公益导师</h1>
                    <form class="form" method="post"  id="teacherInfo">
                        <input type="text" placeholder="请输入您的身份证号" name="idCard" class="inputLogin" id="idCard">
                        <div style="height:26px;width:300px; text-align:right;">
                            <input id="error-idCard" class="error" value="" disabled/>
                        </div>
                        <input type="text" placeholder="请输入您的擅长领域" name="field" class="inputLogin"
                               id="field">
                        <div style="height:26px;width:300px; text-align:right;">
                            <input id="error-field" class="error" value="" disabled/>
                        </div>
                        <textarea name="ps" id="ps" rows="5" placeholder="请输入您的个人陈述" class="inputLogin"></textarea>
                        <div style="height:26px;width:300px; text-align:right;">
                            <input id="error-ps" class="error" value="" disabled/>
                        </div>
                        <div style="font-size: 18px;">
                            支付状态: ${user.depositStatus}
                        </div>
                        <ul class="button-parallel">
                            <li>
                                <button type="button" id="login-cancel" style="margin-top:14px; display:block;"
                                        onclick="location.href='/qingguo/user/userCenter'"
                                        class="left">
                                    取消
                                </button>
                            </li>
                            <li>
                                <c:if test="${user.depositStatus == '未缴费'}">
                                    <button id="login-button" style="margin-top:14px; display:block;"
                                            form="teacherInfo" formaction="teacherRegisterPay">
                                        支付押金
                                    </button>
                                </c:if>
                                <c:if test="${user.depositStatus == '已缴费'}">
                                    <button id="login-button" style="margin-top:14px; display:block;"
                                            onclick="return check();" form="teacherInfo">
                                        注册
                                    </button>
                                </c:if>
                            </li>
                        </ul>
                    </form>
                </div>
            </div>
        </div>

    </div>
</div>
<div style="position: absolute;
    top: 600px;
    left: 40%;">
    <%@ include file="/WEB-INF/views/footer.jsp" %>
</div>

<script>

    if ('${message}' != '') {
        alert('${message}');
    }

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