<%@ page import="JavaBean.OrderBean" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="DAO.OrderDAO" %>
<%--
  Created by IntelliJ IDEA.
  User: machenike
  Date: 2018/6/9 0009
  Time: 13:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    ArrayList<OrderBean> arrayList = new OrderDAO().selectAllOrder();
    request.setAttribute("arrayList", arrayList);
%>
<table border="1" align="center" style="text-align:center">
    <tr>
        <th>订单编号</th>
        <th>用户编号</th>
        <th>物流公司编号</th>
        <th>出发地</th>
        <th>目的地</th>
        <th>订单发布时间</th>
        <th>取货时间</th>
        <th>货物个数</th>
        <th>货物重量</th>
        <th>价格</th>
        <th>状态</th>
        <th>用户期望开始时间</th>
        <th>用户期望结束时间</th>
        <th>操作</th>
    </tr>
    <c:forEach items="${arrayList}" var="ly">
        <form>
            <tr>
                <td><input type="text" name="OrderId" value="${ly.orderId}" size="10" readOnly="true"></td>
                <td><input type="text" name="userId" value="${ly.userId}" size="10" readOnly="true"></td>
                <td><input type="text" name="companyId" value="${ly.companyID}" size="10" readOnly="true"></td>
                <td><input type="text" name="departure" value="${ly.departure}" size="10" readOnly="true"></td>
                <td><input type="text" name="destination" value="${ly.destination}" size="10" readOnly="true"></td>
                <td><input type="text" name="time" value="${ly.time}" size="10"></td>
                <td><input type="text" name="deliveryTime" value="${ly.deliveryTime}" size="10"></td>
                <td><input type="text" name="amount" value="${ly.amount}" size="10"></td>
                <td><input type="text" name="itemSize" value="${ly.itemSize}" size="10"></td>
                <td><input type="text" name="price" value="${ly.price}" size="10"></td>
                <td><input type="text" name="status" value="${ly.status}" size="10"></td>
                <td><input type="text" name="availableTime" value="${ly.availableTime}" size="10"></td>
                <td><input type="text" name="availableTime1" value="${ly.availableTime1}" size="10"></td>
                <td><input type="button"
                           onclick="window.location.href='DeleteOrder?id=${ly.orderId}'"
                           value="删除"></td>
            </tr>
        </form>
    </c:forEach>
</table>
</body>
</html>