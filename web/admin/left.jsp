<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'left.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		<!--
		body {
			margin-left: 0px;
			margin-top: 0px;
			margin-right: 0px;
			margin-bottom: 0px;
		}
		.STYLE1 {
			color: #FFFFFF;
			font-weight: bold;
			font-size: 12px;
		}
		.STYLE2 {
			font-size: 12px;
			color: #03515d;
		}
		a:link {font-size:12px; text-decoration:none; color:#03515d;}
		a:visited{font-size:12px; text-decoration:none; color:#03515d;}
		-->
	</style>
	  <style >
		  #frame {
			  border: solid;
			  float: left;
			  margin-top: 100px;
			  height: 1080px;
		  }

	  </style>
	<link rel="StyleSheet" href="<%=path %>/css/dtree.css" type="text/css" />
	<script type="text/javascript" src="<%=path %>/js/dtree.js"></script>
  </head>
  
  <body>
  <table width="156" height="100%" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td align="center" valign="top">
					<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td height="33" background="<%=path %>/img/main_21.gif">
								&nbsp;
							</td>
						</tr>
						<tr>
							<td align="center" valign="top">
								<table width="145" border="0" align="center" cellpadding="0" cellspacing="0">
									<tr>
										<td>
											<table width="130" border="0" align="center" cellpadding="0" cellspacing="0">
												<tr height="10">
												   <td></td>
												</tr>
												<tr>
													<td width="41" height="35">
														<div align="center">
															<img src="<%=path %>/img/left_1.gif" width="31" height="31">
														</div>
													</td>
													<td width="89" height="35">
														<table width="100%" border="0" cellspacing="0" cellpadding="0">
															<tr>
																<td height="23" style="cursor:hand"
																	onMouseOver="this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "
																	onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'">
																	<span class="STYLE2">
																	    <a href='<%=path %>/evaluation/showEvaluation.jsp' target='I2'>修改个人密码</a>
																	</span>
																</td>
															</tr>
														</table>
													</td>
												</tr>
												<tr>
													<td width="41" height="35">
														<div align="center">
															<img src="<%=path %>/img/left_1.gif" width="31" height="31">
														</div>
													</td>
													<td width="89" height="35">
														<table width="100%" border="0" cellspacing="0" cellpadding="0">
															<tr>
																<td height="23" style="cursor:hand"
																	onMouseOver="this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "
																	onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'">
																	<span class="STYLE2">
																	    <a href='<%=path %>/admin/middel.jsp' target='I2'>个人用户管理</a>
																	</span>
																</td>
															</tr>
														</table>
													</td>
												</tr>
												<tr>
													<td width="41" height="35">
														<div align="center">
															<img src="<%=path %>/img/left_1.gif" width="31" height="31">
														</div>
													</td>
													<td width="89" height="35">
														<table width="100%" border="0" cellspacing="0" cellpadding="0">
															<tr>
																<td height="23" style="cursor:hand"
																	onMouseOver="this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "
																	onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'">
																	<span class="STYLE2">
																	    <a href='<%=path %>/gongsiMana_daishenhe.action' target='I2'>待审运输公司</a>
																	</span>
																</td>
															</tr>
														</table>
													</td>
												</tr>
												<tr>
													<td width="41" height="35">
														<div align="center">
															<img src="<%=path %>/img/left_1.gif" width="31" height="31">
														</div>
													</td>
													<td width="89" height="35">
														<table width="100%" border="0" cellspacing="0" cellpadding="0">
															<tr>
																<td height="23" style="cursor:hand"
																	onMouseOver="this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "
																	onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'">
																	<span class="STYLE2">
																	    <a href='<%=path %>/gongsiMana_yishenhe.action' target='I2'>已核运输公司</a>
																	</span>
																</td>
															</tr>
														</table>
													</td>
												</tr>
												<tr>
													<td width="41" height="35">
														<div align="center">
															<img src="<%=path %>/img/left_1.gif" width="31" height="31">
														</div>
													</td>
													<td width="89" height="35">
														<table width="100%" border="0" cellspacing="0" cellpadding="0">
															<tr>
																<td height="23" style="cursor:hand"
																	onMouseOver="this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "
																	onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'">
																	<span class="STYLE2">
																	    <a href='<%=path %>/goodsMana.action' target='I2'>货物信息管理</a>
																	</span>
																</td>
															</tr>
														</table>
													</td>
												</tr>
												<tr>
													<td width="41" height="35">
														<div align="center">
															<img src="<%=path %>/img/left_1.gif" width="31" height="31">
														</div>
													</td>
													<td width="89" height="35">
														<table width="100%" border="0" cellspacing="0" cellpadding="0">
															<tr>
																<td height="23" style="cursor:hand"
																	onMouseOver="this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "
																	onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'">
																	<span class="STYLE2">
																	    <a href='<%=path %>/gonggaoMana.action' target='I2'>公告信息管理</a>
																	</span>
																</td>
															</tr>
														</table>
													</td>
												</tr>
												<tr>
													<td width="41" height="35">
														<div align="center">
															<img src="<%=path %>/img/left_1.gif" width="31" height="31">
														</div>
													</td>
													<td width="89" height="35">
														<table width="100%" border="0" cellspacing="0" cellpadding="0">
															<tr>
																<td height="23" style="cursor:hand"
																	onMouseOver="this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#adb9c2'; "
																	onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'">
																	<span class="STYLE2">
																	    <a href='<%=path %>/liuyanMana.action' target='I2'>留言信息管理</a>
																	</span>
																</td>
															</tr>
														</table>
													</td>
												</tr>
											</table>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
  </table>
  <!--<div id="frame">
	  <iframe class="s" name="I2" width="850px" height="1000px"></iframe>
  </div>-->
  </body>
</html>
