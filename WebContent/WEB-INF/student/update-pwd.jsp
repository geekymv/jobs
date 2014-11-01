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
	<title>修改密码</title>
	<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">	
	
	<style type="text/css">
		.custom{
			height:51px;
		}
		
		.footer {
			background-color:  #333;
			width: 100%;
			height: 165px;
			
			margin-top: 400px;
		}
		ul li {
			line-height: 40px;
		}
		ul li input {
			line-height: 20px;
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
	          <div class="panel-heading">修改密码</div>
	          	<div class="row">
		          	<div class="col-md-9">	
		          		<br/>
						 <form action="student/updatePassword.do" class=".form-horizontal" method="post">
						   <div class="form-group">
							    <label for="password" class="col-sm-2 col-md-offset-4 control-label">密码</label>
							    <div class="col-sm-3">
							      <input type="password" class="form-control focus" id="password" name="password" autofocus="autofocus">
							    </div>
							    <label class="control-label error-info">
							    	<s:fielderror fieldName="password"></s:fielderror>
							    </label>
						   </div>
						    <div class="form-group">
							    <label for="newpassword" class="col-sm-2 col-md-offset-4 control-label">新密码</label>
							    <div class="col-sm-3">
							      <input type="password" class="form-control focus" id="newpassword" name="newpassword">
							    </div>
							    <label class="control-label error-info">
							    	<s:fielderror fieldName="newpassword"></s:fielderror>
							    </label>
						   </div>
						    <div class="form-group">
							    <label for="repassword" class="col-sm-2 col-md-offset-4 control-label">确认密码</label>
							    <div class="col-sm-3">
							      <input type="password" class="form-control focus" id="repassword" name="repassword" />
							    </div>
							    <label class="control-label error-info">
							    	<s:fielderror fieldName="repassword"></s:fielderror>
							    </label>
						   </div>
						   <br/>
						   <div class="form-group">
						    <div class="col-sm-offset-6 col-sm-4">
						      <button type="submit" class="btn btn-primary">保存</button>
						    </div>
						   </div>
				     		
				        </form>
			       </div> 
			       <div class="col-md-1">
			       </div>
		       </div>
	      </div> <!-- end of panel -->
	      
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
