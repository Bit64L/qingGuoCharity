<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <%@include file="../header.jsp" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <link rel="stylesheet" href="/qingguo/css/shoppingCart.css">
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
                            onclick="window.location.href='/ProcurementSystem/buyer/commodityCatalog'">继续购物
                    </button>
                    <button class="btn-b">结账</button>
                </div>
            </div>
            <!-- 购物车内商品 -->
            <div class="settlement-line2">
                <div>
                    <!-- 购物车内商品列表 -->
                    <div class="table-responsive col-md-12">
                        <form action="commodityCatalogDeleteShoppingCart" method="post">
                            <table class="table table-striped">
                                <thead>
                                <tr>
                                    <td colspan="10"><a id="settlement-line2-left-left">总共1个项目
                                    </a></td>
                                    <td colspan="2"><a id="settlement-line2-left-right">显示详细信息</a></td>
                                </tr>
                                </thead>
                                <tbody><tr>
                                    <td></td>
                                    <td>编号</td>
                                    <td>简称</td>
                                    <td>说明</td>
                                    <td align="center">数量</td>
                                    <td>单位</td>
                                    <td>价格</td>
                                    <td>折扣</td>
                                    <td>净额</td>
                                    <td>费用</td>
                                    <td>税款</td>
                                    <td>金额</td>
                                </tr>

                                <tr>
                                    <td><input type="checkbox" id="1000607" class="chk" name="commodityUniqueNames" value="1000607"><label for="1000607"></label></td>
                                    <td>1</td>
                                    <td>WTC型超大功率水冷制动电阻罐(WTC-2MW)</td>
                                    <td>广泛用于船体、钢厂、变频器柜体内及海上钻井平台等恶劣环境的领域。具有安全泄压和温度、流量等报警输出来满足系统运行要求。</td>
                                    <td>
                                        <div class="input-group">
														<span class="input-group-btn">
															<button class="btn btn-default" onclick="quantityChange(1000607,-1)" type="button">-</button>
														</span> <input class="commodity-quantity" onchange="quantityChangeServer(1000607)" value="1" name="buyQuantity_1000607" id="buyQuantity_1000607"> <span class="input-group-btn">
															<button class="btn btn-default" onclick="quantityChange(1000607,1)" type="button">+</button>
														</span>
                                        </div>
                                    </td>
                                    <td>个</td>
                                    <td>￥100000.00</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td id="commodityTotalMoney_1000607">￥100000.00</td>
                                </tr>

                                <tr>
                                    <td colspan="2"><button class="btn-w" type="submit">删除</button></td>
                                    <td colspan="8"></td>
                                    <td colspan="2"><button class="btn-w right" type="submit" formaction="updateShoppingCartBuyQuantity">更新总计</button></td>
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
                        <%--<c:forEach items="123{sessionScope.shoppingCart.commodities}"--%>
                        <%--var="commodity" varStatus="status">--%>
                        <tr id="abstract-line2">
                            <td class="settlement-tab2-col1"></td>
                            <td class="settlement-tab2-col2" id="commodityTotalMoney1_123{commodity.uniqueName }"
                            <%-->￥<fmt:formatNumber--%>
                            <%--value="123{commodity.unitPrice * commodity.buyQuantity}"--%>
                            <%--pattern="#00.00#" /></td>--%>
                        </tr>
                        <%--</c:forEach>--%>
                        <tr id="abstract-line3">
                            <td class="settlement-tab2-col1">折扣</td>
                            <td class="settlement-tab2-col2">¥0.00</td>
                        </tr>
                        <tr id="abstract-line4">
                            <td class="settlement-tab2-col1">小计（个项目）：
                            </td>
                            <td class="settlement-tab2-col2" id="totalMoney">
                                <%--<fmt:formatNumber value="123{shoppingCart.totalAmount }" pattern="￥#00.00#" />--%>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>


            <div class="settlement-line3">
                <div class="right">
                    <button class="btn-w"
                            onclick="window.location.href='/ProcurementSystem/buyer/commodityCatalog'">继续购物
                    </button>
                    <button class="btn-b" onclick="">结账</button>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
</script>
</body>
</html>
