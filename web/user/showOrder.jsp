<%@ page import="JavaBean.OrderBean" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: Verge_C
  Date: 2018/6/2
  Time: 13:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>查看历史订单</title>
    <link rel="stylesheet" href="../css/showInfo.css" type="text/css">

    <script>
        if (!${page}) {
            var left=document.getElementById("left");
            left.style.display="none";
        }
        if(${page}==${res.size()}) {
            var right = document.getElementById("right");
            right.style.display = "none";
        }
        function editable() {
            var status="${b.status}";
            if(status=="等待收货"){
                var submit = document.getElementById("submit");
                submit.style.display="inline";
                document.getElementById("destination").readOnly=false;
                document.getElementsByName("amount").readOnly=false;
                document.getElementsByName("itemSize").readOnly=false;
            } else {
                alert('包裹已发货，无法再修改信息');
            }
        }
    </script>
</head>
<body>
<%
    session.setAttribute("companyId",request.getParameter("company"));
    System.out.println("companyId="+session.getAttribute("companyId"));
    if(session.getAttribute("res")!=null){
        int p = Integer.parseInt(request.getParameter("page"));
        ArrayList res =(ArrayList)session.getAttribute("res");
        OrderBean bean;
        if(p<res.size()){
            bean = (OrderBean)res.get(p);
        } else {
            bean = null;
        }
        request.setAttribute("res",res);
        request.setAttribute("b",bean);
        request.setAttribute("page",p);
%>
<div id="show">
    <div id="info">
        <form action="EditOrder" method="post" id="form">
            <table id="table">
                <tr>
                    <td>编号</td>
                    <td><input type="text" id="id" name="id" title="" value="${b.orderId}" readonly="readonly"></td>
                </tr>
                <tr>
                    <td>接单公司</td>
                    <td><input type="text" id="companyname" name="companyname" title="" value=""></td>
                </tr>
                <tr>
                    <td>出发地</td>
                    <td><input type="text" id="departure" name="departure" title="" value="${b.departure}"></td>
                </tr>
                <tr>
                    <td>目的地</td>
                    <td><input type="text" id="destination" name="destination" title="" value="${b.destination}" readonly="readonly"></td>
                </tr>
                <tr>
                    <td>创建时间</td>
                    <td><input type="text" id="time" name="time" title="" value="${b.time}"></td>
                </tr>
                <tr>
                    <td>发货时间</td>
                    <td><input type="text" id="deliveryTime" name="deliveryTime" title="" value="${b.deliveryTime}"></td>
                </tr>
                <tr>
                    <td>完成时间</td>
                    <td><input type="text" id="finishtime" name="finishtime" title="" value="${b.finishtime}"></td>
                </tr>
                <tr>
                    <td>货物数量</td>
                    <td><input type="text" name="amount" title="" value="${b.amount}"></td>
                </tr>
                <tr>
                    <td>货物重量</td>
                    <td><input type="text" name="itemSize" title="" value="${b.itemSize}"></td>
                </tr>
                <tr>
                    <td>期望取件时间</td>
                    <td><input type="text" name="availableTime" title="" value="${b.availableTime}~${b.availableTime1}"></td>
                </tr>
                <tr>
                    <td>订单价格</td>
                    <td><input type="text" name="price" title="" value="${b.price}"></td>
                </tr>
                <tr>
                    <td>订单状态</td>
                    <td><input type="text" name="status" title="" value="${b.status}"></td>
                </tr>
            </table>
            <input type="submit" value="提交" style="display: none" id="submit">
        </form>
        <input type="button" onclick="editable()" value="修改订单">
        <input type="button" onclick="" value="删除订单"><br><br>
        <input type="button" onclick="window.location='showOrder.jsp?page=${page-1}'" value="上一单" id="left">
        <input type="button" onclick="window.location='showOrder.jsp?page=${page+1}'" value="下一单" id="right">
    </div>
</div>
<%
    } else{
        out.print("<script>alert('查看订单失败');window.close();</script>");
        //response.sendRedirect("about:blank");
    }

%>
</body>
</html>
