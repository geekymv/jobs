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
	<title>学生首页</title>
	<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">	
	
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
              
              <%--
                <li role="presentation" class="dropdown">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown">
               		 关于我们
                    <span class="caret"></span>
                  </a>
                 
                  <ul class="dropdown-menu" role="menu">
                    <li><a href="#">Geek_ymv</a></li>
                    <li><a href="#">Another action</a></li>
                    <li><a href="#">Something else here</a></li>
                    <li class="divider"></li>
                    <li><a href="#">Separated link</a></li>
                    <li class="divider"></li>
                    <li><a href="#">One more separated link</a></li>
                  </ul>
                </li>
                --%> 
          </ul>
		  <ul class="nav navbar-nav navbar-right">
	           	<li><a href="student/stu-stuInfo.do">用户：${student.name } <span class="glyphicon glyphicon-user"></span></a></li>
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
