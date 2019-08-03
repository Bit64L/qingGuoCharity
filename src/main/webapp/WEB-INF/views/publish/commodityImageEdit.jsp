<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <%@include file="/WEB-INF/views/user/userHeader.jsp" %>
    <link rel="stylesheet" href="/qingguo/css/user.css">
</head>
<body>
<div class="container min-height">

    <div class="row">
        <%@include file="commodityNav.jsp" %>
        <br><br>
        <div class="col-md-10">
            <img src="${commodity.image}" width="180px">
            <br><br>
            <div>
                <form action="commodityImageEditSave" enctype="multipart/form-data" method="post" id="commodityImageEditSave">
                    <input type="file" name="imageFile">
                    <input type="hidden" value="${commodity.id}" name="id">
                </form>
                <br>
            </div>
        </div>
        <br><br>
    </div>
    <div class="row ">
        <div class="col-md-2"></div>
        <div class="col-md-10 border-bottom-grey" style="padding: 10px;"></div>
    </div>
    <div class="row ">
        <div class="col-md-8"></div>
        <div class="col-md-4" style="margin-top: 10px">
            <ul class="button-parallel ">
                <li>
                    <button type="button" class="btn-b right"
                            onclick="location.href='/qingguo/user/userCenter'">取消
                    </button>
                </li>
                <li>
                    <button class="btn-b right" form="commodityImageEditSave">保存</button>
                </li>
            </ul>

        </div>
    </div>
</div>
<%@ include file="/WEB-INF/views/footer.jsp" %>
</body>
<script>
    $("#commodityImage").attr("class", "contract-crea-clicked")
    $("#firstClassName").val('${commodity.firstClassName}');
    $("#secondClassName").val('${commodity.secondClassName}');

</script>
</html>
