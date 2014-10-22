<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html>
<html lang="zh-CN">
	<head>
	<base href="<%=basePath%>">
	<meta charset="utf-8">
	<title></title>
	<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">	
	
	<style type="text/css">
	
		#foot {
			font-style: normal;
			font-size: large;
			padding-top: 55px;
			text-align: center;
		}
		
		
		#foot a, #foot a:hover, #foot a:visited {
			color: white;
			text-decoration: none;
		}
		
	
	</style>
	
	</head>
<body>
	<div id="foot">
		<small style="color:white">
			Copyright &copy; 2014  安徽农业大学学生资助管理中心  All Rights Reserved
			<br>
			技术支持：<a href="gyhk.htm" target="_blank">嘿客科技传媒</a>. &nbsp;&nbsp;联系邮箱：1784160856@qq.com		
		</small>
	</div>
		
</body>
</html>
