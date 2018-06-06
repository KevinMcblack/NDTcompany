<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="css/reset.css"/>
    <link rel="stylesheet" type="text/css" href="css/common.css"/>
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
            background-color: #FFFFFF;
        }

        span {
            font-size: 27px;
            color: white;
            background-color: #F75000;
            display: inline-block;
            width: 200px;
            height: 50px;
            text-align: center;
            font-weight: bold
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
        <span>用户信息管理</span><br/>
        <a href="user/chooseCompany.jsp" target="in">发布订单</a><br/>
        <a href="company/showCompany.jsp" target="in">查看运输公司</a><br/>
        <a href="ShowOrder" target="in">查看订单</a><br/>
        <a href="user/editPersonalInfo.jsp" target="in">修改个人信息</a><br/>
    </div>
    <div id="frame">
        <iframe class="s" name="in" width="800px" height="1000px"></iframe>
    </div>
</div>
</body>
</html>