<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="org.qingGuo.common.PageParams" %>
<%@ page import="org.qingGuo.model.Commodity" %>
<%@ page import="org.qingGuo.model.Order" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <link rel="stylesheet" href="/qingguo/css/user.css">
    <link rel="stylesheet" href="/qingguo/css/publish.css">
    <link rel="stylesheet" href="/qingguo/css/font-awesome.css">
</head>
<body>
<%
    PageParams<Order> pageParams = (PageParams<Order>) request.getAttribute("pageParams");
    String orderCount = "0";
    if (pageParams != null) {
        orderCount = pageParams.getData().size() + "";
    }

%>
<%@include file="../user/userHeader.jsp" %>
<div class="container min-height">
    <div class="row">
        <%@include file="../user/userInfoNav.jsp" %>
        <div class="col-md-9">
            <br>
            <div class="result-line2">
                <div class="result-line2-left">
                    <a class="result-line2-font">找到个<%=orderCount%>项目。</a>
                </div>
                <div class="result-line2-middle">
                    <span class="result-line2-font">查看方式：</span>
                    <i class="fa fa-list fa-1x" aria-hidden="true" id="glyphicon-list"></i>
                </div>
                <div class="result-line2-right">
                    <a class="result-line2-font">排序方式：相关性</a>
                </div>
            </div>
            <div class="result-items">
                <c:forEach items="${pageParams.data}" var="order">
                    <!-- 每条搜索结果 -->
                    <div class="result-item" style="height: 120px;">
                        <div class="item-whole">
                            <div style="font-size: 18px">
                                订单编号：<a href="/qingguo/order/orderInfo?id=${order.id}"> ${order.id}</a>
                            </div>
                            <table class="">
                                <tbody>
                                <tr>
                                    <td class="item-content-grey">商品数量：</td>
                                    <td class="item-content-blue"><a
                                            href="">${order.totalAmount}</a>
                                    </td>
                                    <td>
                                        <div style="padding-left: 20px;"></div>
                                    </td>
                                    <td class="item-content-grey">商品总价：</td>
                                    <td class="item-content-black">${order.totalMoney}</td>

                                </tr>
                                </tbody>
                            </table>
                            <div class="item-price-green">状态：${order.status}</div>

                            <input type="hidden" id="uniqueName_1000608" value="1000608">
                        </div>

                        <div class="item-price right" style="">
                            <div class="item-price-black">
                                <c:if test="${order.status == '待支付'}">
                                    <button class="item-add" style="margin-bottom: 10px"
                                            onclick="location.href='/qingguo/wxpay/pay?id=${order.id}'">支付
                                    </button>
                                    <button class="item-add" style="margin-bottom: 10px"
                                            onclick="location.href='/qingguo/order/statusChange?status=已取消'">取消
                                    </button>
                                </c:if>
                                <c:if test="${order.status != '待支付'}">
                                    <button class="item-add" style="margin-bottom: 10px"
                                            onclick="location.href='/qingguo/order/orderDelete?id=${order.id}'">删除
                                    </button>
                                </c:if>
                                <div style="padding: 5px;"></div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <div class="right">
                <button class="btn-page" id="forward"
                        onclick="window.location.href='/qingguo/order/publishManage?page=${pageParams.currPage-1}'">上一页
                </button>
                <span id="pageList"></span>
                <button class="btn-page" id="afterward"
                        onclick="window.location.href='/qingguo/publish/publishManage?page=${pageParams.currPage+1}'">
                    下一页
                </button>
                <span>共<strong>${pageParams.totalPages}</strong>页
						</span>
            </div>
        </div>
    </div>
</div>
<%@ include file="/WEB-INF/views/footer.jsp" %>
</body>
<script>
    $("#orderManage").attr("class", "contract-crea-clicked")
    var pageList = document.getElementById("pageList");
    var currPage = ${pageParams.currPage};
    var totalPages = ${pageParams.totalPages};
    if (totalPages >= 4) {
        if (currPage < 3) {
            for (var i = 1; i <= 3; i++) {
                createButtonPage(i, "");
            }
        } else {
            createButtonPage(1, "");
            for (var i = currPage - 1; i <= currPage + 1; i++) {
                createButtonPage(i, "");
            }
        }
    } else if (totalPages > 0) {//总页数不足4页
        for (var i = 1; i <= totalPages; i++) {
            createButtonPage(i, "");
        }
    }
    if (currPage == 1 || currPage == 0) $("#forward").hide();//善后处理
    if (currPage == totalPages) {
        $("#afterward").hide();
        $("#page" + (currPage + 1)).hide();
    }
    $("#page" + currPage).attr("class", "btn-page-choose");


    function createButtonPage(i, code) {// i表示页号
        var button = document.createElement("button")// 创建button结点
        var text = document.createTextNode("" + i);
        button.appendChild(text);
        button.id = "page" + i;// 设置button属性
        button.setAttribute("class", "btn-page");
        button.setAttribute("onclick", "window.location.href='/qingguo/publish/publishManage?page=" + i + "&code=" + code + "'");
        pageList.appendChild(button);// 添加到pageList后面
    }
</script>
</html>


