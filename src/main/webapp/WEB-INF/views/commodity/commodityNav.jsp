<%--
  Created by IntelliJ IDEA.
  User: LiWenxiao
  Date: 2018/5/1
  Time: 下午9:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<div class="col-md-2">
    <!--导航  -->
    <div class="sidebar standard-out" style="padding-top:0; background:transparent;">
        <div class="sidebar_con">
            <dl class="sidebar_item">
                <c:forEach items="${roots}" var="root">
                    <dd>
                        <h3 class="">
                            <a href="/qingguo/commodity/commodityCatalog?firstClassName=${root.data}"
                               class="">${root.data}</a>
                        </h3>
                            <%--弹出层--%>
                        <div class="sidebar_popup dis1">
                            <div class="sidebar_popup_class clearfix">
                                <div class="sidebar_popup_item">
                                    <strong>${root.data}</strong>
                                    <c:forEach items="${root.children}" var="child">
                                        <p>
                                        <span class="linesbg">
                                            <a href="/qingguo/commodity/commodityCatalog?firstClassName=${root.data}&secondClassName=${child.data}">${child.data}</a>
                                        </span>
                                        </p>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </dd>
                </c:forEach>
            </dl>
        </div>
    </div>
</div>
