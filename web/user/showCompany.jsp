<%@ page import="java.util.ArrayList" %>
<%@ page import="JavaBean.CompanyBean" %>
<%@ page import="DAO.CompanyDAO" %><%--
  Created by IntelliJ IDEA.
  User: KevinWang
  Date: 2018/6/2
  Time: 13:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="../css/showInfo.css">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Title</title>
</head>
<body>
<%
    ArrayList<CompanyBean> arrayList = new CompanyDAO().getAllCompany();
    request.setAttribute("arrayList", arrayList);
%>
<table id="table" class="hoverTable">
    <tr>
        <th>公司编号</th>
        <th>公司名称</th>
        <th>地址</th>
        <th>电话</th>
        <th>邮箱</th>
    </tr>
    <c:forEach items="${arrayList}" var="ly">
        <form method="post" action="UpdateCompany">
            <tr>
                <td><input type="text" name="companyid" value="${ly.companyid}" readOnly="true"></td>
                <td><input type="text" name="companyname" value="${ly.companyname}" readOnly="true"></td>
                <td><input type="text" name="address" value="${ly.address}" readOnly="true"></td>
                <td><input type="text" name="phone" value="${ly.phone}" readOnly="true"></td>
                <td><input type="text" name="email" value="${ly.email}" readOnly="true"></td>
            </tr>
        </form>
    </c:forEach>
</table>
</body>
</html>
