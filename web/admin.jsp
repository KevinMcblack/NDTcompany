<%--
  Created by IntelliJ IDEA.
  User: Verge_C
  Date: 2018/5/31
  Time: 20:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="css/backstage_common.css"/>
    <title>主页面</title>
</head>
<body>
<div id="big">
    <img src="img/index/redlogo.png"/>
<div id="container">
    <div id="nav">
        <span>管理员</span><br/>
        <a href="./user/addorder.jsp" target="in">查看运输公司</a><br/>
        <a href="./user/showcompany.jsp" target="in">查看用户</a><br/>
        <a href="./user/showroder.jsp" target="in">修改密码</a><br/>
    </div>
    <div id="frame">
        <iframe class="s" name="in" width="1400px" height="1000px"></iframe>
    </div>
</div>
</div>
</body>
</html>
