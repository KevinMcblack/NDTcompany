<%--
  Created by IntelliJ IDEA.
  User: machenike
  Date: 2018/6/6 0006
  Time: 20:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="../css/showInfo.css">
</head>
<body>
<%-- 获取session中的用户id和companyid，orderid，进行强制转换 --%>
<%
    int userid = (int) session.getAttribute("userid");
    int companyid = Integer.parseInt(request.getParameter("companyid"));
    int orderid = Integer.parseInt(request.getParameter("orderid"));
%>
<%-- 提交评价表单，id信息隐藏不会显示 --%>
<form method="post" action="AddEvaluation" enctype="multipart/form-data" id="form">
    <input type="hidden" name="userid" value="<%=userid%>">
    <input type="hidden" name="companyid" value="<%=companyid%>">
    <input type="hidden" name="orderid" value="<%=orderid%>">
    <table class="hoverTable" id="table">
        <tr><td>评论标题</td><td><input type="text" name="title"></td></tr>
        <tr><td>评论内容</td><td><textarea name="content" cols="30" rows="4"></textarea></td></tr>
        <tr><td>上传照片</td><td><input type="file" name="photo1" size="23"></td></tr>
    </table>
    <input type="submit" value="增加">
    <input type="reset" value="重置">
</form>
</body>
</html>
