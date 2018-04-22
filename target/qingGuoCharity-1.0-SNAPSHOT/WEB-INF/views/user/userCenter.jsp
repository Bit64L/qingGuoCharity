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
            <table class="user-info">
                <tr class="row-standard">
                    <td class="col-standard1">昵称：</td>
                    <td class="col-standard2">
                        <input class="form-control input" id="title" name="title" style="width: 230px;">
                    </td>
                </tr>
                <tr class="row-standard">
                    <td class="col-standard1">生日：</td>
                    <td class="col-standard2">
                        <label for="meeting"></label><input
                            name="validTo" class="form-control input" id="meeting"
                            type="date"
                            value=""/>
                    </td>
                </tr>
                <tr>
                    <td>性别：</td>
                    <td>
                        <div class="radio">
                            <label class="model"><input type="radio" checked="" name="sqmTemplateId" id="spm_model1"
                                                        value="1000015">&nbsp;&nbsp;男</label>
                            <label class="model"><input type="radio" name="sqmTemplateId" id="spm_model1"
                                                        value="1000016">&nbsp;&nbsp;女</label>
                        </div>
                    </td>
                </tr>
                <tr class="row-standard">
                    <td class="col-standard1">微信号：</td>
                    <td class="col-standard2">
                        <input class="form-control input" id="title" name="title" style="width: 230px;">
                    </td>
                </tr>
                <tr class="row-standard">
                    <td class="col-standard1">所在地：</td>
                    <td class="col-standard2">
                        <input class="form-control input" id="title" name="title" style="width: 230px;">
                    </td>
                </tr>
                <tr class="row-standard">
                    <td class="col-standard1">邮箱：</td>
                    <td class="col-standard2">
                        <input class="form-control input" id="title" name="title" style="width: 230px;">
                    </td>
                </tr>
            </table>
        </div>
        <div class="col-md-5">
            <table class="user-info">
                <tr class="row-standard">
                    <td class="col-standard1">手机号：</td>
                    <td class="col-standard2">
                        <input class="form-control input" id="title" name="title" style="width: 230px;">
                    </td>
                </tr>
                <tr class="row-standard">
                    <td class="col-standard1">工作单位：</td>
                    <td class="col-standard2">
                        <input class="form-control input" id="title" name="title" style="width: 230px;">
                    </td>
                </tr>
            </table>
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
    $("#userCenter").attr("class", "contract-crea-clicked")
</script>
</html>
