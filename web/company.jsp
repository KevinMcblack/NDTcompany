<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8"%>
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
        <span>运输公司信息管理</span><br/>
        <a href="company//showOrder.jsp" target="in">查看和操作订单</a><br/>
        <a href="company/showCar.jsp" target="in">查看和修改车辆</a><br/>
        <a href="company/addCar.jsp" target="in">增加车辆</a><br/>
        <a href="company/showEmployee.jsp" target="in">查看和修改员工</a><br/>
        <a href="company/addEmployee.jsp" target="in">增加员工</a><br/>
        <a href="company/showCompany.jsp" target="in">查看和修改公司信息</a><br/>
    </div>
    <div id="frame">
        <iframe class="s" name="in" width="1200px" height="1000px"></iframe>
    </div>
</div>
</div>
</body>
</html>