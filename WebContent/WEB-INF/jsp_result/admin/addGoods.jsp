<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<title>addGoods.jsp</title>
<link href="css/admin/common.css" type="text/css" rel="stylesheet">
<style type="text/css">
	#addGoods_area{
		margin: 0px auto;
		border-collapse:separate; 
		border-spacing:10px 15px;

	}
</style>
</head>    
<body>
	<form:form action="adminGoods/addGoods" method="post" modelAttribute="goods" enctype="multipart/form-data">
		<table id="addGoods_area" >
			<caption>
				<font size=4 face="微软雅黑">添加商品</font>
			</caption>
			<tr>
				<td>名称<font color="red">*</font></td>
				<td>
					<form:input path="gname"/>
				</td>
			</tr>
			<tr>
				<td>原价<font color="red">*</font></td>
				<td>
					<form:input path="goprice"/>
				</td>
			</tr>
			<tr>
				<td>折扣价</td>
				<td>
					<form:input path="grprice"/>
				</td>
			</tr>
			<tr>
				<td>库存</td>
				<td>
					<form:input path="gstore"/>
				</td>
			</tr>
			<tr>
				<td>图片</td>
				<td>
					<input type="file" name="logoImage"/>
				</td>
			</tr>
			<tr>
				<td>类型</td>
				<td>
					<form:select path="goodstype_id">
         				<form:options items="${goodsType }" itemLabel="typename" itemValue="id"/>
   					</form:select>
				</td>
			</tr>
			<tr>
				<td >
					<input type="submit" value="提交"/>
				</td>
				<td >
					<input type="reset" value="重置"/>
				</td>
			</tr>
		</table>
	</form:form>
</body>
</html>
