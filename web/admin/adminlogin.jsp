<%--
  Created by IntelliJ IDEA.
  User: machenike
  Date: 2018/6/9 0009
  Time: 14:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=yes">
    <link rel="stylesheet" href="css/login_register.css" type="text/css">
    <link rel="stylesheet" href="css/login.css" type="text/css">
</head>
<body>
<div class="cont">
    <div class="demo">
        <div class="login">
            <div class="login__check"></div>
            <div class="login__form">
                <form action="Login" method="post">
                    <div class="login__row">
                        <input type="text" class="login__input" placeholder="adminname" name="username"/>
                    </div>
                    <div class="login__row">
                        <input type="password" class="login__input" placeholder="Password" name="password"/>
                    </div>
                    <br>

                    <input type="submit" class="login__submit" value="登陆">
                </form>
                <p class="login__signup">Don't have an account? &nbsp;<a href="register.jsp">Sign up</a></p>
            </div>
        </div>
    </div>
</div>
</body>
</html>
