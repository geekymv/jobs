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
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">		
	<title>基本资料</title>
	<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">	
	
	<style type="text/css">
		.custom{
			height:51px;
		}
		
		.footer {
			background-color:  #333;
			width: 100%;
			height: 165px;
			margin-top: 240px;
		}
		ul li {
			line-height: 40px;
		}
	</style>
	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->		
	</head>

<body>
	<div class="container">
		
	<jsp:include page="nav.jsp"></jsp:include>	
      
    <div class="row">
    	<div class="col-md-2">
    		<div class="panel panel-primary">
		        <div class="panel-heading">功能导航</div>
			   	<div class="list-group">
				  <a href="student/stu-stuInfo.do" class="list-group-item">我的资料</a>
				  <a href="student/stu-approveJob.do" class="list-group-item">我的工作</a>
				  <a href="student/stu-listJob.do" class="list-group-item">报名记录</a>
				  <a href="student/stu-listRecruit.do" class="list-group-item">查看招聘</a>
				  <a href="student/preUpdatePassword.do" class="list-group-item">修改密码</a>
				</div>
			</div>
      	</div>
    
      	<div class="col-md-10">
      		 <div class="panel panel-primary">
	          <div class="panel-heading">${student.name }的资料</div>
		     	 <ul>
		        	<li>学号：${student.number}</li>
		        	<li>姓名：${student.name }</li>
		        	<li>性别：${student.gender }</li>
		        	<li>学院：${student.college }</li>
		        	<li>专业：${student.profession }</li>
		        	<li>手机号码：${student.mobile }</li>
		        	<li>自我介绍：
		        		<s:if test="student.introduce == null">
		        			无！
		        		</s:if>
		        		<s:else>
				        	${student.introduce }
		        		</s:else>
		        	</li>	
		        	<li>注册时间：<s:date name="student.regTime" format="yyyy-MM-dd" /></li>
		        </ul>	
		        
		        <a href="student/preupdate.do" class="btn btn-primary">修改基本资料</a>	
		     </div>
    	</div>
      
	</div>
    
   </div><!-- /.container -->
   
   
   <div class="footer">
   	<jsp:include page="../main/footer.jsp"></jsp:include>
   </div>


<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>

</body>
</html>
