<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <%@include file="../header.jsp" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <link rel="stylesheet" href="/qingguo/css/shoppingCart.css">
    <script src="/qingguo/js/shopping-cart.js"></script>
</head>
<!-- 页面整体宽度：1320px -->
<body>

<div class="content">
    <div class="standard-out">
        <!-- 主要内容开始 -->
        <div class="container-all">
            <div class="page-title">
                <a class="inline-b black page-title-font">订单编号 ${order.id}(${order.status})</a>
                <div class="inline-b right">
                    <c:if test="${order.status == '待支付'}">
                        <button class="btn-w" onclick="location.href='/qingguo/order/statusChange?id=${order.id}&status=取消'">取消</button>
                        <button class="btn-b" onclick="location.href='/qingguo/wxpay/pay?id=${order.id}'">支付</button>
                    </c:if>
                </div>
            </div>
            <!-- 购物车内商品 -->
            <div class="settlement-line2">
                <div>
                    <!-- 购物车内商品列表 -->
                    <div class="table-responsive col-md-12">

                        <form action="deleteShoppingCartDetail" method="post">
                            <table class="table table-striped">
                                <tbody>
                                <tr>
                                    <td width="5%">编号</td>
                                    <td width="5%">图片</td>
                                    <td width="15%">名称</td>
                                    <td width="20%">主题</td>
                                    <td width="20%">公益积分</td>
                                    <td align="center" width="%">数量</td>
                                    <td align="center" width="20%">价格</td>
                                    <td width="100%">金额</td>
                                </tr>
                                <c:forEach items="${order.orderDetails}" var="orderDetail"
                                           varStatus="status">
                                    <tr>
                                        <td>${status.count}</td>
                                        <td><img width="30px" src="${orderDetail.commodity.image}"></td>
                                        <td>${orderDetail.commodity.name}</td>
                                        <td>${orderDetail.commodity.theme}</td>
                                        <td>${orderDetail.commodity.credit}</td>
                                        <td>${orderDetail.goodsCount}</td>
                                        <td align="center"><fmt:formatNumber
                                                value="${orderDetail.commodity.price}" pattern="￥#00.00#"/></td>
                                        <td id=goods_money_${shoppingCartDetail.id}><fmt:formatNumber
                                                value="${orderDetail.goodsMoney}" pattern="￥#00.00#"/></td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </form>

                    </div>
                </div>

                <!-- 订单摘要 -->
                <br>
                <div class="margin-top-10 container" align="right">
                    <table class=" margin-top-10 col-md-4"
                           id="shopping-cart-abstract">
                        <tr id="abstract-line1">
                            <td class="settlement-tab2-col1">订单摘要</td>
                            <td class="settlement-tab2-col2"></td>
                        </tr>
                        <tr id="abstract-line3">
                            <td class="settlement-tab2-col1">折扣</td>
                            <td class="settlement-tab2-col2">¥0.00</td>
                        </tr>
                        <tr id="abstract-line4">
                            <td class="settlement-tab2-col1" id="">小计(<%=orderSize%>个项目）：
                            </td>
                            <td class="settlement-tab2-col2" id="shopping_cart_total_money">
                                <fmt:formatNumber value="${order.totalMoney}" pattern="￥#00.00#"/>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>


            <div class="settlement-line3">
                <div class="right">
                    <c:if test="${order.status == '待支付'}">
                        <button class="btn-w" onclick="location.href='/qingguo/order/statusChange?id=${order.id}&status=取消'">取消</button>
                        <button class="btn-b" onclick="location.href='/qingguo/wxpay/pay?id=${order.id}'">支付</button>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
</div>
<br><br>
<%@include file="../footer.jsp" %>
</body>
</html>
