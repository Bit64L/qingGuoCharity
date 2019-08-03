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
        <form action="commodityInfoSave" method="post" id="commodityInfoSave">
            <div class="col-md-5">
                <table class="user-info">
                    <tr class="row-standard">
                        <td class="col-standard1">名称：</td>
                        <td class="col-standard2">
                            <input class="form-control input" id="name" name="name" style="width: 230px;"
                                   value="">
                        </td>
                    </tr>
                    <tr class="row-standard">
                        <td class="col-ou">主题：</td>
                        <td class="col-standard2">
                            <input class="form-control input" id="theme" name="theme" style="width: 230px;"
                                   value="">
                        </td>
                    </tr>
                    <tr class="row-standard">
                        <td class="col-standard1">周期：</td>
                        <td class="col-standard2">
                            <input class="form-control input" id="period" name="period" style="width: 230px;"
                                   value="">
                        </td>
                    </tr>
                    <tr class="row-standard">
                        <td class="col-standard1">公益积分：</td>
                        <td class="col-standard2">
                            <input class="form-control input" id="credit" name="credit" style="width: 230px;"
                                   value="">
                        </td>
                    </tr>
                    <tr class="row-standard">
                        <td class="col-standard1">价格：</td>
                        <td class="col-standard2">
                            <input class="form-control input" id="price" name="price" style="width: 230px;"
                                   value="">
                        </td>
                    </tr>
                </table>
            </div>
            <div class="col-md-5">
                <table class="user-info">
                    <tr class="row-standard">
                        <td class="col-standard1" valign="top">类别：</td>
                        <td class="col-standard2">
                            <select class="form-control input" name="firstClassName">
                                <option value="">第一级类别</option>
                                <option value="文房四宝">文房四宝</option>
                            </select>
                            <div style="padding: 5px;"></div>
                            <select class="form-control input" name="secondClassName">
                                <option value="">第二级类别</option>
                                <option value="毛笔">毛笔</option>
                            </select>
                        </td>
                    </tr>
                    <tr class="row-standard">
                        <td class="col-standard1" valign="top">说明：</td>
                        <td class="col-standard2">
                            <textarea class="form-control input" id="intro" name="intro" style="width: 230px;"
                                      name="intro"
                                      value="" rows="5"></textarea>

                        </td>
                    </tr>
                </table>
            </div>
            <input type="hidden" value="${user.id}" name="user.id">
        </form>
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
                    <button type="button" class="btn-b right" form="userCenterForm"
                            onclick="location.href='/qingguo/user/userCenter'">取消
                    </button>
                </li>
                <li>
                    <button class="btn-b right" form="commodityInfoSave">下一步</button>
                </li>
            </ul>

        </div>
    </div>
</div>
<%@ include file="/WEB-INF/views/footer.jsp" %>
</body>
<script>
    $("#commodityInfo").attr("class", "contract-crea-clicked")


</script>
</html>
