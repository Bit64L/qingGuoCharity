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
        <form action="userCenterSave" method="post" id="userCenterForm">
            <div class="col-md-5">
                <table class="user-info">
                    <tr class="row-standard">
                        <td class="col-standard1">角色：</td>
                        <td class="col-standard2">
                            ${user.role}
                        </td>
                    </tr>
                    <tr class="row-standard">
                        <td class="col-standard1">账户余额：</td>
                        <td class="col-standard2">
                            ${user.accountBalance}
                            <input type="hidden" value="${user.accountBalance}" name="accountBalance">
                        </td>
                    </tr>
                    <tr class="row-standard">
                        <td class="col-standard1">昵称：</td>
                        <td class="col-standard2">
                            <input class="form-control input" id="name" name="name" style="width: 230px;"
                                   value="${user.name}">
                        </td>
                    </tr>
                    <tr class="row-standard">
                        <td class="col-standard1">生日：</td>
                        <td class="col-standard2">
                            <label for="birthday"></label><input
                                name="birthday" class="form-control input" id="birthday"
                                type="date"
                                value="${user.birthday}"/>
                        </td>
                    </tr>
                    <tr>
                        <td>性别：</td>
                        <td>
                            <div class="radio">
                                <label class="model"><input type="radio" checked="" name="gender" id="male"
                                                            value="男">&nbsp;&nbsp;男</label>
                                <label class="model"><input type="radio" name="gender" id="female"
                                                            value="女">&nbsp;&nbsp;女</label>
                            </div>
                        </td>
                    </tr>
                    <tr class="row-standard">
                        <td class="col-standard1">微信号：</td>
                        <td class="col-standard2">
                            <input class="form-control input" id="wechat" name="wechat" style="width: 230px;"
                                   value="${user.wechat}">
                        </td>
                    </tr>
                    <tr class="row-standard">
                        <td class="col-standard1">所在地：</td>
                        <td class="col-standard2">
                            <input class="form-control input" id="location" name="location" style="width: 230px;"
                                   value="${user.location}">
                        </td>
                    </tr>
                    <tr class="row-standard">
                        <td class="col-standard1">邮箱：</td>
                        <td class="col-standard2">
                            <input class="form-control input" id="email" name="email" style="width: 230px;"
                                   value="${user.email}">
                        </td>
                    </tr>
                </table>
            </div>
            <div class="col-md-5">
                <table class="user-info">
                    <tr class="row-standard">
                        <td class="col-standard1">手机号：</td>
                        <td class="col-standard2">
                            <input class="form-control input" id="phone" name="phone" style="width: 230px;"
                                   value="${user.phone}" disabled>
                        </td>
                    </tr>
                    <tr class="row-standard">
                        <td class="col-standard1">工作单位：</td>
                        <td class="col-standard2">
                            <input class="form-control input" id="company" name="company" style="width: 230px;"
                                   value="${user.company}">
                        </td>
                    </tr>
                    <c:if test="${user.role == '导师'}">
                        <tr class="row-standard">
                            <td class="col-standard1">身份证：</td>
                            <td class="col-standard2">
                                <input class="form-control input" id="idCard" name="idCard" style="width: 230px;"
                                       value="${user.idCard}" disabled>
                            </td>
                        </tr>
                        <tr class="row-standard">
                            <td class="col-standard1">擅长领域：</td>
                            <td class="col-standard2">
                                <input class="form-control input" id="field" name="field" style="width: 230px;"
                                       value="${user.field}" disabled>
                            </td>
                        </tr>
                        <tr class="row-standard">
                            <td class="col-standard1">押金状态：</td>
                            <td class="col-standard2">${user.depositStatus}</td>
                        </tr>
                    </c:if>
                </table>
            </div>
            <input type="hidden" value="${user.id}" name="id">
        </form>
    </div>
    <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-10 border-top-grey" style="margin-top: 10px">
            <br>
            <button class="btn-b right" form="userCenterForm">保存</button>
        </div>
    </div>
</div>
<%@ include file="/WEB-INF/views/footer.jsp" %>
</body>
<script>

    $("#userCenter").attr("class", "contract-crea-clicked")
    if ("${user.gender}" == "男") {
        $("#male").attr("checked", true);
    } else {
        $("#female").attr("checked", true);
    }

</script>
</html>
