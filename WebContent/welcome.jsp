<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>欢迎访问</title>
</head>
<link href="css/welcome.css" rel="stylesheet" type="text/css" />
<script src="js/jquery-1.11.1.js"></script>
</head>

<body>
<br>
<div style="position:relative; height:540px;">
	<div class="banner" style="position:relative; z-index:1">
	</div>
	<div class="bannerWrap">
		<ul class="showList">
			<li class="hand special" img="images/index-03.jpg"></li>
			<li class="hand" img="images/banner5.jpg"></li>
			<li class="hand" img="images/banner4.jpg"></li>
			<li class="hand" img="images/banner3.jpg"></li>
			<li class="hand" img="images/banner2.jpg"></li>
		</ul>
	</div>
	<p class="banner2" style="height:540px; position:absolute; z-index:0; top:-14px; left:auto; width:100%">
	</p>
</div>
<script src="js/welcome.js"></script>
<div style="text-align:center;clear:both">
<p>
	<span>
		<a href="index.do" style="font-size:20px;color:blue">点击直接跳转-->校内岗位招聘与学生补助报送系统</a>
	</span>
</p>
</div>

	<%
		response.setHeader("Refresh", "10;url=" + "index.jsp");
	%>

</body>

</html>

