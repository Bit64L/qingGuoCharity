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
                <a class="inline-b black page-title-font">购物车</a>
                <div class="inline-b right">
                    <button class="btn-w"
                            onclick="window.location.href='/qingguo/index'">继续购物
                    </button>
                    <button class="btn-b"  formaction="/qingguo/order/orderCreate" form="form">结账</button>
                </div>
            </div>
            <!-- 购物车内商品 -->
            <div class="settlement-line2">
                <div>
                    <!-- 购物车内商品列表 -->
                    <div class="table-responsive col-md-12">

                        <form action="" method="post" id="form">
                            <table class="table table-striped">
                                <thead>
                                <tr>
                                    <td colspan="7"><a id="settlement-line2-left-left">总共<%=size%>个项目
                                    </a></td>
                                    <td colspan="1" class="right"><a id="settlement-line2-left-right">显示详细信息</a></td>
                                </tr>
                                </thead>
                                <tbody><tr>
                                    <td width="5%"></td>
                                    <td width="5%">编号</td>
                                    <td width="5%">图片</td>
                                    <td width="15%">名称</td>
                                    <td width="20%">主题</td>
                                    <td align="center" width="%">数量</td>
                                    <td align="center" width="20%">价格</td>
                                    <td width="100%">金额</td>
                                </tr>
                                <c:forEach items="${user.shoppingCart.shoppingCartDetails}" var="shoppingCartDetail" varStatus="status">
                                <tr>
                                    <td><input type="checkbox" id="${shoppingCartDetail.id}" class="chk" name="ids" value="${shoppingCartDetail.id}"><label for="${shoppingCartDetail.id}"></label></td>
                                    <td>${status.count}</td>
                                    <td><img width="30px" src="${shoppingCartDetail.commodity.image}"></td>
                                    <td>${shoppingCartDetail.commodity.name}</td>
                                    <td>${shoppingCartDetail.commodity.theme}</td>
                                    <td>
                                        <div class="input-group">
														<span class="input-group-btn">
															<button class="btn btn-default" onclick="quantityChange(${shoppingCartDetail.id},-1)" type="button">-</button>
														</span> <input class="commodity-quantity" onchange="quantityChangeServer(${shoppingCartDetail.id})" value="${shoppingCartDetail.goodsCount}" name="id" id="buyQuantity_${shoppingCartDetail.id}"> <span class="input-group-btn">
															<button class="btn btn-default" onclick="quantityChange(${shoppingCartDetail.id},1)" type="button">+</button>
														</span>
                                        </div>
                                    </td>
                                    <td align="center" > <fmt:formatNumber value="${shoppingCartDetail.commodity.price}" pattern="￥#00.00#" /></td>
                                    <td id = goods_money_${shoppingCartDetail.id}> <fmt:formatNumber value="${shoppingCartDetail.goodsMoney}" pattern="￥#00.00#" /></td>
                                </tr>
                                </c:forEach>

                                <tr>
                                    <td colspan="2"><button class="btn-w" type="submit">删除</button></td>
                                    <td colspan="5"></td>
                                    <td colspan=""><button class="btn-w right" type="button" formaction="">更新总计</button></td>
                                </tr>
                                </tbody></table>
                        </form>

                    </div>
                </div>

                <!-- 购物车摘要 -->
                <br>
                <div class="margin-top-10 container" align="right">
                    <table class=" margin-top-10 col-md-4"
                           id="shopping-cart-abstract">
                        <tr id="abstract-line1">
                            <td class="settlement-tab2-col1">购物车摘要</td>
                            <td class="settlement-tab2-col2"></td>
                        </tr>
                        <tr id="abstract-line3">
                            <td class="settlement-tab2-col1">折扣</td>
                            <td class="settlement-tab2-col2">¥0.00</td>
                        </tr>
                        <tr id="abstract-line4">
                            <td class="settlement-tab2-col1" id="">小计(<%=size%>个项目）：
                            </td>
                            <td class="settlement-tab2-col2" id="shopping_cart_total_money">
                                <fmt:formatNumber value="${user.shoppingCart.totalMoney}" pattern="￥#00.00#" />
                            </td>
                        </tr>
                    </table>
                </div>
            </div>


            <div class="settlement-line3">
                <div class="right">
                    <button class="btn-w"
                            onclick="window.location.href='/qingguo/index'">继续购物
                    </button>
                    <button class="btn-b"  formaction="/qingguo/order/orderCreate" form="form">结账</button>
                </div>
            </div>
        </div>
    </div>
</div>
<br><br>
<%@include file="../footer.jsp"%>
</body>
</html>
