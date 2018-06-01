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
    <%--<link rel="stylesheet" type="text/css" href="css/reset.css"/>--%>
    <%--<link rel="stylesheet" type="text/css" href="css/common.css"/>--%>

    <!-- <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0,
    maximum-scale=1.0, user-scalable=no"> -->
    <title>主页面</title>

    <style type="text/css">
        #container{
            width:1080px;
            margin:0 auto;
        }
        #nav{
            border:solid;
            float:left;
            font-family: "Droid Serif";
            font-size:20px;
            margin-top:100px;
        }
        #frame{
            border:solid;
            float:left;
            margin-top:100px;
            height:1080px;
        }
        span{
            font-size:27px;
            color:white;
            background-color:#F75000;
            display:inline-block;
            width:200px;
            height:50px;
            text-align:center;
            font-weight:bold
            margin-bottom:10px;
        }
        #nav a{
            color:white;
            width:200px;
            height:50px;
            display:inline-block;
            background:#FF8F59;
            text-align:center;
        }
    </style>
</head>
<body>
<div id="container">
    <div id="nav">
        <span>管理员</span><br/>
        <a href="./user/addorder.jsp" target="in">查看运输公司</a><br/>
        <a href="./user/showcompany.jsp" target="in">查看用户</a><br/>
        <a href="./user/showroder.jsp" target="in">修改密码</a><br/>
    </div>
    <div id="frame">
        <iframe class="s" name="in" width="800px" height="1000px"></iframe>

    </div>
</div>
</body>
</html>
