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
			
			margin-top: 250px;
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
	     	  	<form action="employer/update-updateEmployer.do" method="post" 
	     	  	class="form-horizontal" role="form" >
	     	  		<div class="form-group">
		        		<label class="col-md-3 control-label">账号：</label>
		        		<div  class="col-md-3">
		        			<input type="text" disabled="disabled" class="form-control" value="${employer.account}"/>
		        			<input type="hidden" class="form-control" name="empId" value="${employer.id }"/>
		        		</div>
	        		</div>
	        		<div class="form-group">
		        		<label for="name" class="col-md-3 control-label">名称：</label>
		        		<div class="col-md-3">
		        			<input type="text" class="form-control" id="name" name="name" value="${employer.name}" autofocus="autofocus"/>
		        		</div>
	        		</div>
	        		<div class="form-group">
		        		<label for="name" class="col-md-3 control-label">电话号码：</label>
		        		<div class="col-md-3">
		        			<input type="text" class="form-control" name="mobile" value="${employer.mobile}"/>
		        		</div>
	        		</div>
	        		<div class="form-group">
		        		<label for="teacher" class="col-md-3 control-label">负责老师：</label>
		        		<div class="col-md-3">
		        			<input type="text" class="form-control" id="teacher" name="teacher" value="${employer.teacher}"/>
		      			</div>
	      			</div>
	      			<div class="form-group">
		      			<label class="col-md-3 control-label">总岗位数：</label>
		      			<div class="col-md-3">
		      				<input type="text" disabled="disabled" class="form-control" value="${employer.postNum }"/>
		        		</div>
	        		</div>
	        		<div class="form-group">
		        		<label class="col-md-3 control-label">月总金额：</label>
		      			<div class="col-md-3">
		      				<input type="text" disabled="disabled" class="form-control" value="${employer.totalMoney }"/>
		        		</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">备注：</label>	       
		        		<div class="col-md-3">
			        		<textarea class="form-control" name="remarks">${employer.remarks }</textarea>	
		        		</div>
	        		</div>
	        		<div class="form-group">
			            <label class="col-md-3 control-label"></label>	
			            <div class="col-md-7">
			          	  <input type="submit" class="btn btn-primary" value="保存修改"/>
			            </div>
		         	</div>
		          	
		        </form>  
		    </div>
    	</div>
      
	</div>
    
   </div><!-- /.container -->
   
   <div class="footer">
   		<jsp:include page="../main/footer.jsp"></jsp:include>
   </div>

</body>
</html>
