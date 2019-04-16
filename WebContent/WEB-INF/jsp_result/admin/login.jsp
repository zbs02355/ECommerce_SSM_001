<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>  
  <base href="<%=basePath%>">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>后台登录</title>
	<link href="/css/admin/login_css.css" rel="stylesheet" type="text/css" />
	<style type="text/css">
		table{
		width: 200px;
		text-align: center;
		margin: 10% 40%;
		border-collapse:separate; 
		border-spacing:0px 10px;
	}
	tr{
		text-align:center;
	}
	.textSize{
		width: 120px;
		height: 25px;
	}
	* {
		margin: 0px;
		padding: 0px;
	}
	body {
		font-family: Arial, Helvetica, sans-serif;
		font-size: 20px;
		margin: 10px 10px auto;
	}
	</style>
	<script type="text/javascript">
	//确定按钮
	function sure(){
		document.forms[0].submit();
	}
	//取消按钮
	function reset(){
		document.forms[0].action = "";
	}
	</script>
  </head>
  <body>
  	<form:form action="admin/login" modelAttribute="admin" method="post">
  	<table>
		<tr>
			<td colspan="2" >管理员登陆</td>
		</tr>
		<tr>
			<td >姓名：</td>
			<td>
				<form:input path="aname" cssClass="textSize"/>
			</td>
		</tr>
		<tr>
			<td>密码：</td>
			<td>
				<form:password path="apwd" cssClass="textSize" maxlength="20"/>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="button" value='确定' onclick="sure()" >
				<input type="button" value='取消' onclick="reset()" >
			</td>
		</tr>
	</table>
	</form:form>
	${msg }
  </body>
</html>
