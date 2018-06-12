<%@ page import="java.util.ArrayList" %>
<%@ page import="JavaBean.OrderBean" %>
<%@ page import="DAO.OrderDAO" %>
<%@ page import="JavaBean.CompanyBean" %>
<%@ page import="DAO.CompanyDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<html>
<head>
    <title>哪都通物流有限公司</title>
    <link rel="stylesheet" type="text/css" href="css/reset.css"/>
    <link rel="stylesheet" type="text/css" href="css/common.css"/>
    <script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
    <link rel="stylesheet" type="text/css" href="css/index.css"/>
    <!--幻灯片-->
    <link rel="stylesheet" type="text/css" href="plugins/banner/css/goodnav.css">
    <script type="text/javascript" src="plugins/banner/js/jquery.litenav.js"></script>
    <!--幻灯片-->
    <!--滑动门-->
    <!--滑动门-->
</head>
<body>
<div class ="big">
<!--头部-->
<div class="head_bg">
    <div class="head clearfix">
        <div class="logo"><a href=""><img src="img/index/redlogo.png" alt=""/></a></div>
        <div class="menu">
            <div class="head_top">
                <a href="login.jsp">登录</a>
                <a href="register.jsp">注册</a>
                <a href="">设为首页</a>
                <a href="">加入收藏</a>
            </div>
            <ul class="clearfix">
                <li class="now"><a href="">首页</a></li>
                <li><a href="">我的物流</a></li>
                <li class="news"><a href="">消息</a></li>
                <li><a href="">网站地图</a></li>
                <li><a href="help.jsp">帮助与支持</a></li>
                <li><a href="about.html">关于哪都通</a></li>
            </ul>
        </div>
    </div>
</div>
<!--头部-->
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
        ArrayList<OrderBean> arrayList=new OrderDAO().selectAllOrder("select * from `order` order by time desc");
        request.setAttribute("arrayList",arrayList);
        ArrayList<CompanyBean> arrayList1=new CompanyDAO().getAllCompany();
        request.setAttribute("arrayList1",arrayList1);
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

<!--底部-->
<div class="foot_bg">
    <div class="foot">
        <div class="foot_t">
            <a href="">业务介绍</a>
            <a href="">联系我们</a>
        </div>
        <div class="copy">
            Copyright&copy;&nbsp;1998-2018&nbsp; 哪都通物流有限责任公司.&nbsp;&nbsp;All&nbsp;&nbsp;rights&nbsp;&nbsp;reserved.
            &nbsp;&nbsp;粤ICP备666666
        </div>
    </div>
</div>
</div>
<!--底部-->
</body>
</html>
