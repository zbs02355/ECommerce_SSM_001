<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>  
<jsp:include page="head.jsp"></jsp:include>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>登录页面</title>
	<link href="css/before/daohang.css" rel="stylesheet" type="text/css" />
	<link href="css/before/common.css" rel="stylesheet" type="text/css" />
	<link href="css/before/style.css" rel="stylesheet" type="text/css" />
	
	<style type="text/css">
	table{
		text-align: center;
		
	}
	#login_area{
		width:450px;
		border-collapse:separate; 
		border-spacing:0px 10px;
	}
	.textSize{
		width: 200px;
		height: 20px;
	}
	</style>
	<script type="text/javascript">
	//确定按钮
	function sure(){
		document.loginform.submit();
	}
	//取消按钮
	function cancel(){
		document.loginform.action="";
	}
	function refreshCode(){
		document.getElementById("code").src = "validateCode?" + Math.random();
    }
	</script>
  </head>
  <body>
  	<center>
  	<form:form action="user/login" method="post" modelAttribute="bruser"  name = "loginform">
	<table id="login_area">
		<tr>
			<td></td>
			<td style="font-size:20px;font-weight:bold">用户登陆</td>
			<td colspan="2"></td>
		</tr>
		<tr>
			<td>用户名：</td>
			<td ><input type="text" name="bemail" value="${bruser.bemail }"  class="textSize"/></td>
			<td colspan="2"></td>
			<td></td>
		</tr>
		<tr>
			<td>密码：</td>
			<td ><input type="password" name="bpwd" class="textSize"/></td>
			<td colspan="2"></td>
			<td></td>
		</tr>
		<tr>
			<td>验证码：</td>
			<td><input type="text" name="code" class="textSize"/></td>
			<td><img id="code" src="validateCode"/></td>
			<td class="ared">
				<a href="javascript:refreshCode();"><font color="blue">看不清，换一个！</font></a>
			</td>
		</tr>			
		<tr>
			<td colspan="2">
				<input type="button" value="确定" onclick="sure()">
				<input type="button" value="取消" onclick="cancel()">
			</td>
		</tr>
	</table>
	</form:form>
	${msg }
	</center>
  </body>
</html>
