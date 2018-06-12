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

	<style type="text/css">
		.STYLE2 {
			font-size: 12px;
			color: #03515d;
		}
		a:link {font-size:12px; text-decoration:none; color:#03515d;}
		a:visited{font-size:12px; text-decoration:none; color:#03515d;}

	  </style>
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
																	    <a href='<%=path %>/evaluation/showEvaluation.jsp' target='I2'>评价管理</a>
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
																	    <a href='<%=path %>/admin/showgongsi.jsp' target='I2'>物流公司管理</a>
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
																	    <a href='<%=path %>/user/order/showOrder2.jsp' target='I2'>订单管理</a>
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
																	    <a href='<%=path %>/user/showUser.jsp' target='I2'>用户管理</a>
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
  </body>
</html>
