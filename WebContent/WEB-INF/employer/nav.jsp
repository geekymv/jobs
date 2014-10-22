<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>导航菜单</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		.custom {
			height:51px;
		}
	
	</style>
	

  </head>
  
  <body>
    	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		  <div class="container">
			<div class="navbar-header">
			  <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" 			     
               data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			  </button>
			  <a class="navbar-brand" href="index.do">
              	<img alt="首页" src="img/index.png" height="25"/>
              	首页
              </a>
			</div>
    	<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
           <ul class="nav navbar-nav">
                <li><a href="explain.html" target="_blank">系统简介</a></li>
                <li><a href="gyhk.htm" target="_blank">开发团队</a></li>
                <li><a href="help.html" target="_blank">帮助中心</a></li>
          </ul>
		  <ul class="nav navbar-nav navbar-right">
	         	<li>
	         		<a href="employer/emp-empInfo.do">用户：${employer.name } <span class="glyphicon glyphicon-user"></span>
	         		</a>
	         	</li>
	           	<li class="divider-vertical"></li>
	           	<li><a href="user/user-logout">退出 <span class="glyphicon glyphicon-log-out"></span></a></li>
	      </ul>
        </div><!-- /.navbar-collapse -->
      </div><!-- /.container-fluid -->
    </nav>
    <!-- 以上是导航菜单-->
    
    <!--空白处-->
    <div class="custom">
    </div>
  </body>
</html>
