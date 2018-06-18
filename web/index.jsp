<%@ page import="java.util.ArrayList" %>
<%@ page import="JavaBean.OrderBean" %>
<%@ page import="DAO.OrderDAO" %>
<%@ page import="JavaBean.CompanyBean" %>
<%@ page import="DAO.CompanyDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ include file="common_header.jsp" %>

<html>
<body>
<div class="big">
    <!--中间部分-->
    <div class="main">
        <!--盒子1-->
        <div class="box_1 clearfix">
            <div class="box_1_l">
                <a href="login.jsp">网上下单<img src="img/index/icon2.png"/></a>
                <a href="register.jsp" class="a_2">承运商申请<img src="img/index/icon2.png"/></a>
            </div>
            <div class="banner">
                <!-- 代码 开始 -->
                <div id="hotpic">
                    <div id="NewsPic">
                        <a target="_blank" href="" style="visibility: visible; display: block;">
                            <img src="img/index/banner.jpg" class="Picture" alt=""/></a>
                        <a style="visibility: hidden; display: none;" target="_blank" href="">
                            <img src="img/index/banner1.jpg" class="Picture" alt=""/></a>
                        <a style="visibility: hidden; display: none;" target="_blank" href="">
                            <img src="img/index/banner2.jpg" class="Picture" alt=""/></a>
                        <div class="Nav">
                            <span class="Normal">3</span>
                            <span class="Normal">2</span>
                            <span class="Cur">1</span>
                        </div>
                    </div>
                </div>
                <script type="text/javascript">
                    $('#hotpic').liteNav(5000);
                </script>
                <!-- 代码 结束 -->
            </div>
        </div>
        <!--盒子1-->
        <div class="space_hx">&nbsp;</div>
        <div class="space_hx">&nbsp;</div>
        <%
            ArrayList<OrderBean> arrayList = new OrderDAO().selectAllOrder("select * from `order` order by time desc");
            request.setAttribute("arrayList", arrayList);
            ArrayList<CompanyBean> arrayList1 = new CompanyDAO().getAllCompany();
            request.setAttribute("arrayList1", arrayList1);
        %>
        <!--盒子3-->
        <div class="box_3 clearfix">
            <div class="box_3_l">
                <div class="box_head">
                    <span>订单信息</span>
                    <a href=""><img src="img/index/more.png"/></a>
                </div>
                <ul>
                    <c:forEach items="${arrayList}" var="ly">
                        <li>
                            <a href="">
                                <span>${ly.departure}</span>
                                <img src="img/index/icon15.png"/>
                                <span>${ly.destination}</span>
                            </a>
                            <em>${ly.time}</em>
                        </li>
                    </c:forEach>
                </ul>
            </div>
            <div class="box_3_r">
                <div class="box_head">
                    <span>物流公司信息</span>
                    <a href=""><img src="img/index/more.png"/></a>
                </div>
                <!--开始-->
                <div class="box16 clearfix">
                    <ul>
                        <c:forEach items="${arrayList1}" var="ly">
                            <li>
                                <a href="">
                                    <span>${ly.companyname} 联系电话：${ly.phone}</span>
                                </a>
                                <em>${ly.address}</em>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
                <!--结束-->
            </div>
        </div>
        <!--盒子3-->
        <div class="space_hx">&nbsp;</div>
    </div>
    <!--中间部分-->
    <%@ include file="common_footer.jsp" %>
</body>
</html>
