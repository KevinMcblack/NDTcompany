<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="css/common.css"/>

    <!-- <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0,
    maximum-scale=1.0, user-scalable=no"> -->
    <title>主页面</title>

    <style type="text/css">
        #container {
            width: 1080px;
            margin: 0 auto;
        }

        #nav {
            border: solid;
            float: left;
            font-family: Georgia;
            font-size: 20px;
            margin-top: 100px;
        }

        #frame {
            border: solid;
            float: left;
            margin-top: 100px;
            height: 1080px;
        }

        span {
            font-size: 25px;
            color: white;
            background-color: #F75000;
            display: inline-block;
            width: 200px;
            height: 50px;
            text-align: center;
            font-weight: bold;
            margin-bottom: 10px;
        }

        #nav a {
            color: white;
            width: 200px;
            height: 50px;
            display: inline-block;
            background: #FF8F59;
            text-align: center;
        }
    </style>
</head>
<body>
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
        <iframe class="s" name="in" width="850px" height="1000px"></iframe>
    </div>
</div>
</body>
</html>