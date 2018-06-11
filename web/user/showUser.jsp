<%@ page import="JavaBean.UserBean" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="DAO.UserDAO" %>
<%--
  Created by IntelliJ IDEA.
  User: machenike
  Date: 2018/6/9 0009
  Time: 14:23
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
    ArrayList<UserBean> arrayList = new UserDAO().queryAllUser("select * from user");
    request.setAttribute("arrayList", arrayList);
%>
<table border="1" align="center" style="text-align:center">
    <tr>
        <th>用户编号</th>
        <th>用户登陆名</th>
        <th>用户名</th>
        <th>电话</th>
        <th>性别</th>
        <th>email</th>
        <th>操作</th>
    </tr>
    <c:forEach items="${arrayList}" var="ly">
        <form>
            <tr>
                <td><input type="text" name="userId" value="${ly.userId}" size="10" readOnly="true"></td>
                <td><input type="text" name="loginName" value="${ly.loginName}" size="10" readOnly="true"></td>
                <td><input type="text" name="username" value="${ly.username}" size="10" readOnly="true"></td>
                <td><input type="text" name="phone" value="${ly.phone}" size="10" readOnly="true"></td>
                <td><input type="text" name="sex" value="${ly.sex}" size="10" readOnly="true"></td>
                <td><input type="text" name="email" value="${ly.email}" size="10" readOnly="true"></td>
                <td><input type="button"
                           onclick="window.location.href='DeleteUser?id=${ly.userId}'"
                           value="删除"></td>
            </tr>
        </form>
    </c:forEach>
</table>
</body>
</html>
