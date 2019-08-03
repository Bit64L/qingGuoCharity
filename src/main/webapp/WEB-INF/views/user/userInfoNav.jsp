<%--
  Created by IntelliJ IDEA.
  User: LiWenxiao
  Date: 2018/4/16
  Time: 下午9:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<div class="col-md-2">
    <div class="adjust-10"></div>
    <div class="adjust-10"></div>
    <div class="contract-crea-left left blue">
        <div class="contract-crea-not-clicked" id="userCenter">
            <button onclick="changeUserPage('/qingguo/user/userCenter');">会员信息</button>
        </div>
        <div class="contract-crea-not-clicked" id="userHead">
            <button onclick="changeUserPage('/qingguo/user/userHead');">修改头像</button>
        </div>
        <div class="contract-crea-not-clicked" id="userPassword">
            <button onclick="changeUserPage('/qingguo/user/userPassword');">修改密码</button>
        </div>
        <div class="contract-crea-not-clicked" id="publishManage">
            <button onclick="changeUserPage('/qingguo/publish/publishManage');">发布管理</button>
        </div>
        <div class="contract-crea-not-clicked" id="orderManage">
            <button onclick="changeUserPage('/qingguo/order/orderManage')">订单管理</button>
        </div>
    </div>
</div>
<script>
    function changeUserPage(link){
        window.location.href=link;
    }
</script>