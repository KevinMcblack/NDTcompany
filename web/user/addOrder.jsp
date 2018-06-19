<%--
  Created by IntelliJ IDEA.
  User: Verge_C
  Date: 2018/6/2
  Time: 13:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>新建订单页面</title>
    <link type="text/css" href="../css/showInfo.css" rel="stylesheet">
</head>
<body>
<%
    System.out.println(request.getParameter("company"));
    session.setAttribute("companyId", request.getParameter("company"));
    System.out.println("companyId=" + session.getAttribute("companyId"));
%>
<div id="show">
    <div id="info">
        <form action="AddOrder" method="post" id="form">
            <table id="table" class="hoverTable">
                <tr>
                    <td>出发地</td>
                    <td><input type="text" id="departure" name="departure" title="" size="35"></td>
                </tr>
                <tr>
                    <td>目的地</td>
                    <td><input type="text" id="destination" name="destination" title="" size="35"></td>
                </tr>
                <tr>
                    <td>货物数量(件)</td>
                    <td><input type="text" name="amount" title=""></td>
                </tr>
                <tr>
                    <td>货物重量(kg)</td>
                    <td><input type="text" name="itemSize" title=""></td>
                </tr>
                <tr>
                    <td>期望取件时间</td>
                    <td><input type="datetime-local" name="availableTime" title="">~<input type="datetime-local"
                                                                                           name="availableTime1"
                                                                                           title=""></td>
                </tr>
            </table>
            <input type="submit" value="提交" id="submit">
        </form>
    </div>
</div>
</body>
</html>
