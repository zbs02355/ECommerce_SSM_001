<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<jsp:include page="head.jsp"></jsp:include>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<link href="css/before/daohang.css" rel="stylesheet" type="text/css" />
<link href="css/before/common.css" rel="stylesheet" type="text/css" />
<link href="css/before/style.css" rel="stylesheet" type="text/css" />
<style type="text/css">
	#form_area{
		border-collapse:seperate;
		border-spacing: 0px 20px;
		text-align:center;
	}
</style>
<script type="text/javascript">
	//刷新验证码
	function refreshCode(){
		document.getElementById("code").src = "validateCode?" + Math.random();
    }
	//表单验证
	function checkForm(){
		var bpwd = document.registerForm.bpwd.value;
		var rebpwd = document.registerForm.rebpwd.value;
		if(bpwd != rebpwd){
			alert("两次密码不一致！");
			return false;
		}
		document.registerForm.submit();
		return true;
	}
</script>
</head>
<body>
	<div class="clearfix">
		<div class="blank20"></div>
		<div class="box4">
			<table width="100%" border="0" cellspacing="0" cellpadding="0" margin="0% 45%">
				<tr>
					<td width="100%" valign="bottom">
						<h2>用户注册</h2>
					</td>
				</tr>
			</table>
		</div>
		<div class="blank10"></div>
		<div class="box4">
			<div class="case_ll clearfix">
				<div class="regist">
					<form:form action="user/register" method="post" modelAttribute="buser"  name="registerForm">
						<table id="form_area" width="100%" border="0" cellspacing="0" cellpadding="0"
							class="ttbb2">
							<tr>
								<td width="16%" align="right"><span class="cl_f30">*</span>
									用户名：</td>
								<td width="59%"><input type="text" name="bemail"
									id="textfield" class="my_txt_350" value="${buser.bemail}" /></td>
								<td width="25%">${msg }</td>
							</tr>
							<tr>
								<td align="right"><span class="cl_f30">*</span> 密码：</td>
								<td><input type="password" name="bpwd" id="textfield2"
									class="my_txt_350" /></td>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td align="right"><span class="cl_f30">*</span> 重复密码：</td>
								<td><input type="password" name="rebpwd" id="textfield3"
									class="my_txt_350" /></td>
								<td>&nbsp;</td>
							</tr>			
							<tr>
								<td align="right"><span class="cl_f30">*</span> 验证码：</td>
								<td class="ared"><input type="text" name="code"
									id="textfield5" class="my_txt_120" />
									<img id="code" src="validateCode" /> 
									<a href="javascript:refreshCode();"><font color="blue">看不清，换一个！</font></a>
								</td>
								<td>${codeError}</td>
							</tr>
							<tr>
								<td align="right">&nbsp;</td>
								<td colspan="2" class="cl_f30" style="font-size: 12px; padding-bottom: 25px;"></td>
							</tr>
							<tr>
								<td height="50" colspan="3"><input type="button" name="button" id="button" onclick="checkForm()" value="注册账号" class="my_ann1" /></td>
								
							</tr>
						</table>
					</form:form>
					<div class="blank20"></div>
				</div>
			</div>
		</div>
		<div class="blank10"></div>
	</div>
</body>
</html>
