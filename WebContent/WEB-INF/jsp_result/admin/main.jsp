<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<title>商城管理后台</title>
<style type="text/css">
* {
	margin: 0px;
	padding: 0px;
}

body {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	margin: 0px auto;
	height: auto;
	width: 100%;
}

#header {
	height: 90px;
	width: 100%;
	background-image: url(images/admin/back.jpg);
	background-color: #7FFFAA;
	margin: 0px 0px 3px 0px;
	border:1px solid #00FA9A;
}

#header h1 {
	text-align: center;
	font-family: 微软雅黑;
	color: #000000;
	font-size: 30px；
}

#navigator {
	height: 25px;
	width: 100%;
	font-size: 14px;
	margin: 0% 30% 0% 25%;
}
#navigator ul {
	list-style-type: none;
}
#navigator li {
	float: left;
	position: relative;
}
#navigator li a {
	color: #000000;
	text-decoration: none;
	padding-top: 4px;
	display: block;
	width: 98px;
	height: 22px;
	text-align: center;
	background-color: PaleGreen;
	margin-left: 2px;
}
#navigator li a:hover {
	background-color: #00FA9A;
	color: 	#2F4F4F;
}
#navigator ul li ul {
   visibility: hidden;
   position: absolute;
}

#navigator ul li:hover ul,
#navigator ul a:hover ul{
   visibility: visible;
}

#content {
	height: auto;
	width: 100%;
	padding: 10px;
	margin: 0% 15% 0% 15%;
}

#content iframe {
	height: 400px;
	width: 780px;
}

</style>
</head>
<body>
	<div id="header">
		<br>
		<br>
		<h1>欢迎${admin.aname}进入后台管理系统！</h1>
	</div>
	<div id="navigator">
		<ul>
			<li><a>商品管理</a>
				<ul>
					<li><a href="adminGoods/toAddGoods" target="center">添加商品</a></li>
					<li><a href="adminGoods/selectGoods?act=deleteSelect" target="center">删除商品</a></li>
					<li><a href="adminGoods/selectGoods?act=updateSelect" target="center">修改商品</a></li>
					<li><a href="adminGoods/selectGoods" target="center">查询商品</a></li>
				</ul>
			</li>
			<li><a>类型管理</a>
				<ul>
					<li><a href="adminType/toAddType" target="center">添加类型</a></li>
					<li><a href="adminType/toDeleteType" target="center">删除类型</a></li>
				</ul>
			</li>
			<li><a>用户管理</a>
				<ul>
					<li><a href="adminUser/userInfo" target="center">删除用户</a></li>
				</ul>
			</li>
			<li><a>订单管理</a>
				<ul>
					<li><a href="adminOrder/orderInfo" target="center">删除订单</a></li>
				</ul>
			</li>
			<li><a>公告管理</a>
				<ul>
					<li><a href="adminNotice/toAddNotice" target="center">添加公告</a></li>
					<li><a href="adminNotice/deleteNoticeSelect" target="center">删除公告</a></li>
				</ul>
			</li>
			<li><a href="exit">安全退出</a></li>
		</ul>
		
	</div>
	<div id="content">
		<iframe src="adminGoods/selectGoods"  name="center" frameborder="0"></iframe>
	</div>
</body>
</html>


