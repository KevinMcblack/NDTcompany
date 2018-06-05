<%@ page import="JavaBean.OrderBean" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="DAO.OrderDAO" %><%--
  Created by IntelliJ IDEA.
  User: KevinWang
  Date: 2018/6/4
  Time: 15:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Title</title>
</head>
<body>
<%
    ArrayList<OrderBean> arrayList = new OrderDAO().selectAllOrder();
    request.setAttribute("arrayList", arrayList);
%>
<table border="1">
    <tr>
        <th>订单编号</th>
        <th>用户编号</th>
        <th>公司编号</th>
        <th>出发地</th>
        <th>目的地</th>
        <th>订单发布时间</th>
        <th>取货时间</th>
        <th>货物个数</th>
        <th>货物重量</th>
        <th>货物价格</th>
        <th>期望时间开始</th>
        <th>期望时间结束</th>
        <th>状态</th>
    </tr>
    <c:forEach items="${arrayList}" var="ly">
        <form method="post" action="">
            <tr>
                <td>${ly.orderId}</td>
                <td>${ly.userId}</td>
                <td>${ly.companyID}</td>
                <td>${ly.departure}</td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td><input type="submit" value="修改"></td>
                <td><input type="reset" value="重置"></td>
            </tr>
        </form>
    </c:forEach>
</table>
</body>
</html>