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
        <div class="col-md-10">
            <img src="/qingguo/images/master1.jpg" width="180px">
            <br><br>
            <div>
                <button class="btn-b">上传图片</button>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-10 border-top-grey" style="margin-top: 10px">
            <br>
            <button class="btn-b right">保存</button>
        </div>
    </div>
</div>
<%@ include file="../footer.jsp" %>
</body>
<script>
    $("#userHead").attr("class", "contract-crea-clicked")
</script>
</html>
