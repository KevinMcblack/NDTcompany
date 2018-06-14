<%--
  Created by IntelliJ IDEA.
  User: machenike
  Date: 2018/6/5 0005
  Time: 14:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="JavaBean.CompanyBean" %>
<%@ page import="DAO.CompanyDAO" %>
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
<table class="hoverTable" id="table">
    <tr>
        <th>公司编号</th>
        <th>登录名</th>
        <th>密码</th>
        <th>公司名称</th>
        <th>地址</th>
        <th>电话</th>
        <th>邮箱</th>
        <th>操作</th>
        <th>操作</th>
        <th>重置</th>
    </tr>
    <c:forEach items="${arrayList}" var="ly">
        <form method="post" action="UpdateCompany">
            <tr onmouseover="this.style.backgroundColor='#ffff66';" onmouseout="this.style.backgroundColor='#d4e3e5';">
                <td><input type="text" name="companyid" value="${ly.companyid}" size="10"  readOnly="true"></td>
                <td><input type="text" name="loginname" value="${ly.loginname}" size="10"></td>
                <td><input type="text" name="secret" value="${ly.secret}" size="10"></td>
                <td><input type="text" name="companyname" value="${ly.companyname}" size="10" readOnly="true"></td>
                <td><input type="text" name="address" value="${ly.address}" size="10"></td>
                <td><input type="text" name="phone" value="${ly.phone}" size="10"></td>
                <td><input type="text" name="email" value="${ly.email}" size="10"></td>
                <td><input type="button"
                           onclick="window.location.href='DeleteCompany?id=${ly.companyid}'"
                           value="删除"></td>
                <td><input type="submit" value="修改"></td>
                <td><input type="reset" value="重置"></td>
            </tr>
        </form>
    </c:forEach>
</table>
</body>
</html>
