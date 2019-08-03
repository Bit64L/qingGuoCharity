<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <%@include file="userHeader.jsp" %>
    <link rel="stylesheet" href="/qingguo/css/user.css">
</head>
<body>
<div class="container min-height">
    <div class="row">
        <%@include file="userInfoNav.jsp" %>
        <br><br>
        <div class="col-md-5">
            <form action="userPasswordModify" method="post" id="userPasswordModify">
                <table class="user-info">
                    <tr class="row-standard">
                        <td class="col-standard1">原密码：</td>
                        <td class="col-standard2">
                            <input class="form-control input" type="password" id="password" name="password" style="width: 230px;">
                        </td>
                    </tr>
                    <tr class="row-standard">
                        <td class="col-standard1">新密码：</td>
                        <td class="col-standard2">
                            <input class="form-control input" type="password" id="newPassword" name="newPassword" style="width: 230px;">
                        </td>
                    </tr>
                    <tr class="row-standard">
                        <td class="col-standard1">确认密码：</td>
                        <td class="col-standard2">
                            <input class="form-control input" type="password" id="newPasswordRe" name="" style="width: 230px;">
                        </td>
                        <td><span class="error" id="error"></span></td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
    <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-10 border-top-grey" style="margin-top: 10px">
            <br>
            <button class="btn-b right" form="userPasswordModify" onclick="return check()">保存</button>
        </div>
    </div>
</div>
<%@ include file="../footer.jsp" %>
</body>
<script>

    if("${message}" != null && "${message}" != "") alert("${message}");
    $("#userPassword").attr("class", "contract-crea-clicked")
    function check(){
        var newPassword = $("#newPassword").val();
        var newPasswordRe = $("#newPasswordRe").val();
        if(newPassword == newPasswordRe)
            return true;
        else{
            $("#error").html("密码输入不一致");
            return false;
        }
    }
</script>
</html>
