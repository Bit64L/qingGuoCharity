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
        <div class="col-md-5">
            <table class="user-info">
                <tr class="row-standard">
                    <td class="col-standard1">名称：</td>
                    <td class="col-standard2">
                        ${commodity.name}
                    </td>
                </tr>
                <tr class="row-standard">
                    <td class="col-ou">主题：</td>
                    <td class="col-standard2">
                        ${commodity.theme}
                    </td>
                </tr>
                <tr class="row-standard">
                    <td class="col-standard1">周期：</td>
                    <td class="col-standard2">
                        ${commodity.period}
                    </td>
                </tr>
                <tr class="row-standard">
                    <td class="col-standard1">公益积分：</td>
                    <td class="col-standard2">
                        ${commodity.credit}
                    </td>
                </tr>
                <tr class="row-standard">
                    <td class="col-standard1">价格：</td>
                    <td class="col-standard2">
                        ${commodity.price}
                    </td>
                </tr>
            </table>
        </div>
        <div class="col-md-5">
            <table class="user-info">
                <tr class="row-standard">
                    <td class="col-standard1" valign="top">类别：</td>
                    <td class="col-standard2">
                        <select class="form-control input" name="firstClassName" id="firstClassName">
                            <option value="">第一级类别</option>
                            <option value="文房四宝">文房四宝</option>
                        </select>
                        <div style="padding: 5px;"></div>
                        <select class="form-control input" name="secondClassName" id="secondClassName">
                            <option value="">第二级类别</option>
                            <option value="毛笔">毛笔</option>
                        </select>
                    </td>
                </tr>
                <tr class="row-standard">
                    <td class="col-standard1" valign="top">说明：</td>
                    <td class="col-standard2">
                            <textarea class="form-control input" id="intro" name="intro" style="width: 230px;"
                                      name="intro" disabled
                                      rows="5">${commodity.intro}</textarea>

                    </td>
                </tr>

                <tr class="row-standard">
                    <td>图片：</td>
                    <td class="col-standard2">
                        <form action="commodityImageSave" enctype="multipart/form-data" method="post"
                              id="commodityImageSave">
                            <input type="file" name="imageFile">
                        </form>

                    </td>
                </tr>
            </table>
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
                    <button class="btn-b right" form="commodityImageSave">发布</button>
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
