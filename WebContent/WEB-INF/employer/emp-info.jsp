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
	<title>我的资料</title>
	<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">	
	
	<style type="text/css">
		.custom{
			height:51px;
		}
		
		.footer {
			background-color:  #333;
			width: 100%;
			height: 165px;
			
			margin-top: 450px;
		}
		.col-md-10 ul li {
			line-height: 40px;
		}
		
		.col-md-10 ul li input {
			line-height: 25px;
		}
		
		.emp_info {
			margin-left: 350px;
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
				<jsp:include page="left-sider.jsp"></jsp:include>
			</div>	
			
			
      	</div>
    
      	<div class="col-md-10">
      		<div class="panel panel-primary">
	          <div class="panel-heading">我的资料</div>
	     	  <div class="emp_info">
	     	  	<form action="employer/update-updateEmployer.do" method="post">
		     	  <ul>
		        	<li>
		        		账号：${employer.account}
		        		<input type="hidden" name="empId" value="${employer.id }"/>
		        	</li>
		        	<li>名称：<input type="text" name="name" value="${employer.name}"/></li>
		        	<li>电话号码：<input type="text" name="mobile" value="${employer.mobile}"/></li>
		        	<li>负责老师：<input type="text" name="teacher" value="${employer.teacher}"/></li>
		        	<li>
		        		总岗位数：${employer.postNum }
		        	</li>
		        	<li>
		        		月总金额：${employer.totalMoney }
		        	</li>
		        	<li>备注：<input type="text" name="employer.remarks" value="${employer.remarks }" /></li>
		          </ul>
		          
		          <input type="submit" value="保存修改"/>
		          	
		        </form>  
	          </div>
		    </div>
    	</div>
      
	</div>
    
   </div><!-- /.container -->
   
   <div class="footer">
   		<jsp:include page="../main/footer.jsp"></jsp:include>
   </div>

</body>
</html>
