<%@ page import="JavaBean.OrderBean" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="JavaBean.CompanyBean" %>
<%@ page import="DAO.CompanyDAO" %>
<%@ page import="JavaBean.EvaluationBean" %>
<%@ page import="DAO.EvaluationDAO" %><%--
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

</head>
<body>
<%
    System.out.println(request.getParameter("company"));
    session.setAttribute("companyId", request.getParameter("company"));
    System.out.println("companyId=" + session.getAttribute("companyId"));
    if (session.getAttribute("res") != null) {
        int p = Integer.parseInt(request.getParameter("page"));
        ArrayList res = (ArrayList) session.getAttribute("res");
        OrderBean bean;
        if (p < res.size()) {
            bean = (OrderBean) res.get(p);
        } else {
            bean = null;
        }
        request.setAttribute("res", res);
        request.setAttribute("page", p);
        request.setAttribute("price", bean.getPrice());
        EvaluationBean evaluationBean;
        evaluationBean = new EvaluationDAO().getEvaluation("select * from evaluation where orderid = '"+bean.getOrderId()+"' ");
        CompanyDAO dao = new CompanyDAO();
        CompanyBean companyBean = dao.getCompany(bean.getCompanyID());
        String companyName = companyBean.getCompanyname();
        request.setAttribute("companyName", companyName);
        if (bean.getStatus().equals("等待收件")) {
            bean.setDeliveryTime("尚未收件");
            bean.setFinishtime("尚未发货");
            request.setAttribute("price", "尚未收件");
        } else if (bean.getStatus().equals("已发货")) {
            bean.setFinishtime("进行中");
        }
        request.setAttribute("b", bean);
        request.setAttribute("e",evaluationBean);
%>
<div id="show">
    <div id="info">
        <form action="EditOrder?id=${b.orderId}&page=${page}&code=1" method="post" id="form">
            <table id="table">
                <tr>
                    <td>编号</td>
                    <td><input type="text" id="id" name="id" title="" value="${b.orderId}" readonly="readonly"></td>
                </tr>
                <tr>
                    <td>接单公司</td>
                    <td><input type="text" id="companyname" name="companyname" title="" value="${companyName}"
                               readonly="readonly"></td>
                </tr>
                <tr>
                    <td>出发地</td>
                    <td><input type="text" id="departure" name="departure" title="" value="${b.departure}"
                               readonly="readonly"></td>
                </tr>
                <tr>
                    <td>目的地</td>
                    <td><input type="text" id="destination" name="destination" title="" value="${b.destination}"
                               readonly="readonly"></td>
                </tr>
                <tr>
                    <td>创建时间</td>
                    <td><input type="text" id="time" name="time" title="" value="${b.time}" readonly="readonly"></td>
                </tr>
                <tr>
                    <td>发货时间</td>
                    <td><input type="text" id="deliveryTime" name="deliveryTime" title="" value="${b.deliveryTime}"
                               readonly="readonly"></td>
                </tr>
                <tr>
                    <td>完成时间</td>
                    <td><input type="text" id="finishtime" name="finishtime" title="" value="${b.finishtime}"
                               readonly="readonly"></td>
                </tr>
                <tr>
                    <td>货物数量</td>
                    <td><input type="text" id="amount" name="amount" title="" value="${b.amount}" readonly="readonly">
                    </td>
                </tr>
                <tr>
                    <td>货物重量</td>
                    <td><input type="text" id="itemSize" name="itemSize" title="" value="${b.itemSize}"
                               readonly="readonly"></td>
                </tr>
                <tr>
                    <td>期望取件时间</td>
                    <td><input type="text" id="availableTime" name="availableTime" title="" value="${b.availableTime}"
                               readonly="readonly">
                        ~<input type="text" id="availableTime1" name="availableTime1" title=""
                                value="${b.availableTime1}" readonly="readonly"></td>
                </tr>
                <tr>
                    <td>订单价格</td>
                    <td><input type="text" name="price" title="" value="${price}" readonly="readonly"></td>
                </tr>
                <tr>
                    <td>订单状态</td>
                    <td><input type="text" name="status" title="" value="${b.status}" readonly="readonly"></td>
                </tr>
                <tr id="evaluation1">
                    <td>评价</td>
                    <td><textarea>${e.content}</textarea></td>
                </tr>
            </table>
            <input type="submit" value="提交" style="display: none" id="submit">
        </form>
        <input type="button" onclick="editable()" value="修改订单">
        <input type="button" onclick="deleteable()" value="删除订单">
        <input type="button" onclick="window.location.href='EditOrder?id=${b.orderId}&code=2&page=${page}'" value="确认收货"
               style="display: none" id="finish">
        <input type="button"
               onclick="window.location.href='../evaluation/addEvaluation.jsp?orderid=${b.orderId}&companyid=${b.companyID}'"
               value="评价" style="display: none" id="evaluation"><br><br>
        <input type="button" onclick="window.location='showOrder.jsp?page=${page-1}'" value="上一单" id="left">
        <input type="button" onclick="window.location='showOrder.jsp?page=${page+1}'" value="下一单" id="right">
        当前第${page+1}页，总共${sessionScope.res.size()}页<input type="text" id="goto" title="" style="width: 50px">&nbsp;&nbsp;<input type="button" onclick="goTo()" value="跳转">
    </div>
</div>
<script>
    function goTo() {
        var p = document.getElementById("goto");
        var txt = p.value;
        txt=txt-1;
        window.location="showOrder.jsp?page="+txt+"";
    }
    function editable() {
        var status = "${b.status}";
        if (status == "等待收件") {
            var submit = document.getElementById("submit");
            submit.style.display = "inline";
            document.getElementById("destination").readOnly = false;
            document.getElementById("amount").readOnly = false;
            document.getElementById("itemSize").readOnly = false;
            document.getElementById("availableTime").readOnly = false;
            document.getElementById("availableTime1").readOnly = false;
        } else {
            alert('包裹已发货，无法再修改信息');
        }
    }

    function deleteable() {
        var status = "${b.status}";
        if (status == "等待收件") {
            location.href = "DeleteOrder?id=${b.orderId}";
        } else {
            alert('包裹已发货，无法再删除订单');
        }
    }
</script>
<script>
    var status = "${b.status}";
    if(status!="已评价"){
        var evaluation1=document.getElementById("evaluation1");
        evaluation1.style.display="none";
        <%--evaluation=document.getElementById("evaluationtxt");--%>
        <%--evaluation1.value="${e.content}";--%>
    }
    if (status == "已送达") {
        var submit = document.getElementById("finish");
        submit.style.display = "inline";
    }
    if (status == "已完成") {
        var evaluation = document.getElementById("evaluation");
        evaluation.style.display = "inline";
    }
    if (!${page}) {
        var left = document.getElementById("left");
        left.style.display = "none";
    }
    var size = parseFloat("${res.size()}");
    var page = parseFloat("${page}");
    if (page == size - 1) {
        var right = document.getElementById("right");
        right.style.display = "none";
    }
</script>
<%
    } else {
        out.print("<script>alert('查看订单失败');window.close();</script>");
        //response.sendRedirect("about:blank");
    }

%>
</body>
</html>
