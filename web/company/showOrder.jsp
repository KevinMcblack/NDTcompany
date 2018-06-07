<%@ page import="JavaBean.OrderBean" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="DAO.OrderDAO" %><%--
  Created by IntelliJ IDEA.
  User: KevinWang
  Date: 2018/6/4
  Time: 15:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="css/backstage_common.css"/>
    <title>Title</title>
</head>
<body>
<%
    ArrayList<OrderBean> arrayList = new OrderDAO().selectAllOrder();
    request.setAttribute("arrayList", arrayList);
%>
<script language="javascript" type="text/javascript">

    function openwindow() {
        var obj = new Object();
        var mxh1 = new Array("mxh","net_lover","孟子E章")
        str =window.showModalDialog("showCar.jsp",obj,"dialogWidth=500px;dialogHeight=500px");
    }

    function openModelessDialog() {
        var obj = new Object();
        str = window.showModelessDialog("showCompany.jsp", obj, "dialogWidth=500px;dialogHeight=500px");
    }
</script>
<input type="button" id="btnOpen" value="打开模态窗口" onclick="openwindow();" />
<input type="button" id="Button1" value="打开非模态窗口" onclick="openModelessDialog();" />
</body>
</html>