<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="org.qingGuo.common.PageParams"%>
<%@ page import="org.qingGuo.model.Commodity" %>
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
    PageParams<Commodity> pageParams = (PageParams<Commodity>) request.getAttribute("pageParams");
    String orderCount="0";
    if(pageParams != null){
        orderCount = pageParams.getData().size()+"";
    }
%>

<%@include file="userHeader.jsp" %>
<div class="container min-height">
    <div class="row">
        <%@include file="userInfoNav.jsp" %>
        <div class="col-md-9">
            <br>
            <div class="result-line2">
                <div class="result-line2-left">
                    <a class="result-line2-font">找到<%=orderCount%>个项目。</a>
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
                <c:forEach items="${commodities}" var="commodity">
                    <!-- 每条搜索结果 -->
                    <div class="result-item">
                        <div class="left">
                            <input type="checkbox" id="1000608" class="chk" name="id"
                                   value="${commodity.id}"><label
                                for="${commodity.id}"></label>
                        </div>
                        <div class="left container-thumbnail">
                            <img alt="" id="image-${commodity.id}"
                                 src="${commodity.image}"
                                 onerror="error('image-${commodity.id}');" width="130px" height="130px">
                        </div>
                        <div class="item-whole" style="width:50%;">
                            <div style="font-size: 18px">
                                <a href="">${commodity.name}</a>
                            </div>
                            <table class="">
                                <tbody>
                                <tr>
                                    <td class="item-content-grey">主题：</td>
                                    <td class="item-content-blue"><a
                                            href="">${commodity.theme}</a>
                                    </td>

                                </tr>
                                <tr>
                                    <td class="item-content-grey">周期：</td>
                                    <td class="item-content-black">${commodity.period}</td>

                                </tr>
                                <tr>
                                    <td class="item-content-grey">公益积分：</td>
                                    <td class="item-content-black">${commodity.credit}</td>

                                </tr>
                                <tr>
                                    <td class="item-content-grey">价格：</td>
                                    <td class="item-content-black">￥${commodity.price}&nbsp;／个</td>
                                </tr>
                                <tr>
                                    <td class="item-content-grey">类别：</td>
                                    <td class="item-content-black">${commodity.firstClassName},${commodity.secondClassName}</td>
                                </tr>
                                <tr>
                                    <td><span class="item-content-grey">描述：</span> <span>${commodity.intro}</span></td>
                                    <td class="item-content-black"></td>
                                </tr>

                                </tbody>
                            </table>

                            <input type="hidden" id="uniqueName_1000608" value="1000608">
                        </div>

                        <div class="item-price">
                            <div class="item-price-green">状态：${commodity.status}</div>
                            <div class="item-price-black">
                                <button class="item-add" onclick="location.href='/qingguo/publish/commodityInfoEdit?id=${commodity.id}&currPage=${pageParams.currPage}'">编辑</button>
                                <div style="padding: 5px;"></div>
                                <button class="item-add" onclick="location.href='/qingguo/publish/commodityDelete?id=${commodity.id}&currPage=${pageParams.currPage}'">删除</button>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <div class="right">
                <button class="btn-page" id="forward"
                        onclick="window.location.href='/qingguo/publish/publishManage?page=<%=pageParams.getCurrPage() - 1%>&code=${code }'">上一页</button>
                <span id="pageList"></span>
                <button class="btn-page" id="afterward"
                        onclick="window.location.href='/qingguo/publish/publishManage?page=${pageParams.currPage+1}&code=${code}'">下一页</button>
                <span>共<strong>${pageParams.totalPages}</strong>页
						</span>
            </div>
        </div>
    </div>
</div>
<%@ include file="/WEB-INF/views/footer.jsp" %>
</body>
<script>
    $("#publishManage").attr("class", "contract-crea-clicked")
    var pageList = document.getElementById("pageList");
    var currPage = ${pageParams.currPage};
    var totalPages = ${pageParams.totalPages};
    if(totalPages >= 4){
        if(currPage < 3 ){
            for(var i=1; i<=3 ;i++ ){
                createButtonPage(i,"${code}");
            }
        }else{
            createButtonPage(1,"${code}");
            for(var i=currPage-1; i<=currPage+1 ;i++ ){
                createButtonPage(i,"${code}");
            }
        }
    }else if(totalPages > 0){//总页数不足4页
        for(var i=1; i<=totalPages ; i++){
            createButtonPage(i,"${code}");
        }
    }
    if(currPage == 1 || currPage == 0) $("#forward").hide();//善后处理
    if(currPage  == totalPages) {
        $("#afterward").hide();
        $("#page"+(currPage+1)).hide();
    }
    $("#page"+currPage).attr("class","btn-page-choose");



    function createButtonPage(i,code){// i表示页号
        var button = document.createElement("button")// 创建button结点
        var text = document.createTextNode(""+i);
        button.appendChild(text);
        button.id="page"+i;// 设置button属性
        button.setAttribute("class","btn-page");
        button.setAttribute("onclick","window.location.href='/qingguo/publish/publishManage?page="+i+"&code="+code+"'");
        pageList.appendChild(button);// 添加到pageList后面
    }
</script>
</html>


