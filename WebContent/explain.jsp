<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>系统简介</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" type="text/css" media="all"
	href="css/explain.css">
	
	<style type="text/css">
		.test {
			color: blue;
		}
		.cls {
			font-size: 16px;
			color: red;
		}
	</style>

	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

<body>
	<div id="w">
		<div id="content">
			<h1>系统简介</h1>
			<h1 class="test">注意：10.03—10号为试用时间段 之后所有测试数据将自动清除！</h1>
			<h1 class="test">目测 11号该系统将正式使用....谢谢帮忙测试的朋友~~~</h1>
			<h1 class="test"><span class="cls">后台开发者注：</span>部分页面做的不太美观，先不要太在意这些细节!</h1>
			<h1 class="test">美工努力开发中...现阶段只测试功能实现与否，ok 现在开始使用吧~~</h1>
			<p>
				&nbsp;&nbsp;&nbsp;&nbsp;本系统为嘿客科技传媒独立开发，归安徽农业大学学生资助管理中心版权所有，在使用过程中，如有问题请和学生资助管理中心联系或者直接发送邮件到开发人员邮箱1784160856@qq.com或649193002@qq.com
				,谢谢！<br> &nbsp;&nbsp;&nbsp;&nbsp;<br />【注意事项】<br>
				1、本系统为独立系统，学生在报名校内勤工助学岗位时，需注册个人账号。<br />
				2、学生登录密码丢失时，需与勤工助学单位取得联系，由勤工助学单位帮其修改密码。<br>
				3、各用工单位的账号以及密码由校学生资助管理中心进行分配，如有需要请联系校学生资助管理中心。<br>
				4、各用工单位在提交月份学生补助时，需在每月的最后一周进行提交，否则不能提交。
			</p>
		</div>
	</div>
	
			
			
	<div style="text-align:center;clear:both">
		<p>Copyright 2014 &copy; 安徽农业大学 学生资助管理中心 All Rights Reserved</p>
		<p>
			技术支持：<a href="gyhk.htm" target="_blank">嘿客科技传媒</a>
		</p>
	</div>
	<%
		response.setHeader("Refresh", "6;url=" + "index.jsp");
	%>

</body>
</html>
