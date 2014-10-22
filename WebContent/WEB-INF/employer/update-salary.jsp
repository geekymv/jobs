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
	<title>修改学生补助信息</title>
	<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">	
	
	<style type="text/css">
		.footer {
			background-color:  #333;
			width: 100%;
			height: 165px;
			margin-top: 150px;
		}
		
		.form {
			margin-left: 300px;			
		}
		
		.form-group .error-info {
			color: red;
		}
			
	</style>
	
	<link href="css/zzsc.css" rel="stylesheet" type="text/css" />
	
	<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
	<script src="js/showlist.js" type="text/javascript"></script>
	
	<link rel="stylesheet" type="text/css" href="jquery-ui/jquery-ui.css">
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
	          <div class="panel-heading">薪水信息</div>
	          <div class="panel-body">
	            <p>
	            	修改薪水信息！
	            </p>
	          </div>
	          <div class="row">
	          <div class="form">
	          <form action="employer/update-salary-updateSalary.do" class="form-horizontal" method="post">
				<div class="form-group">	
					<label for="account" class="col-sm-2 control-label">学生学号</label>  
					<div class="col-sm-3">
						${student.number }
					</div> 
			  	</div>
			  	<div class="form-group">	
					<label for="account" class="col-sm-2 control-label">学生姓名</label>  
					<div class="col-sm-3">
						${student.name }
					</div> 
			  	</div>
			  	<div class="form-group">
				    <label for="month" class="col-sm-2 control-label">月份</label>
				    <div class="col-sm-3">
				      <input type="text" class="form-control focus" value="${salary.month}" id="datepicker" name="month" autofocus="autofocus" required="required">
				   	  <input type="hidden" name="id" value="${salary.id }"/>	
				    </div>
				    <label class="control-label error-info">
				    	<em>*</em>
				    	<s:fielderror fieldName="month"></s:fielderror>
				    </label>
				</div>
				<div class="form-group">
				    <label for="mobile" class="col-sm-2 control-label">工作时间</label>
				    <div class="col-sm-3">
				      <input type="text" class="form-control focus" value="${salary.worktime }" name="worktime" required="required">
				    </div>
				    <label class="control-label error-info">
				    	<em>*</em>
				    	<s:fielderror fieldName="worktime"></s:fielderror>
				    </label>
				</div>
				<div class="form-group">
				    <label for="salary" class="col-sm-2 control-label">基本工资</label>
				    <div class="col-sm-3">
				      <input type="text" class="form-control focus" value="${salary.salary }" name="salary" required="required"/>
				    </div>
				    <label class="control-label error-info">
				    	<em>*</em>
				    	<s:fielderror fieldName="salary"></s:fielderror>
				    </label>
				</div>
				<div class="form-group">
				    <label for="toolFee" class="col-sm-2 control-label">工具费</label>
				    <div class="col-sm-3">
				      <input type="text" class="form-control focus" value="${salary.toolFee }" name="toolFee" required="required" />
				    </div>
				    <label class="control-label error-info">
				    	<em>*</em>
				    	<s:fielderror fieldName="toolFee"></s:fielderror>
				    </label>
				</div>
			  	<div class="form-group">
				    <label for="bonus" class="col-sm-2 control-label">奖金</label>
				    <div class="col-sm-3">
				      <input type="text" class="form-control focus" value="${salary.bonus }" name="bonus" required="required"/>
				    </div>
				    <label class="control-label error-info">
				    	<em>*</em>
				    	<s:fielderror fieldName="bonus"></s:fielderror>
				    </label>
				</div>
				<div class="form-group">
				    <label for="remarks" class="col-sm-2 control-label">备注信息</label>
				    <div class="col-sm-3">
				     	<textarea class="form-control" rows="4" name="remarks">
				     		${salary.remarks }
					    </textarea>
				    </div>
				</div>
			  	 <div class="form-group">
				    <div class="col-sm-offset-2 col-sm-4">
				      <button type="submit" class="btn btn-primary">保存更新</button>
				    </div>
				</div>
	    	</form>
	        </div>
			</div>	        
    	</div>
	</div>
   </div>
   </div><!-- /.container -->

   <div class="footer">
   	<jsp:include page="../main/footer.jsp"></jsp:include>
   </div>

<script type="text/javascript" src="js/jquery-1.11.1.js"></script>

<script type="text/javascript" src="jquery-ui/jquery-ui.min.js"></script>
<script type="text/javascript">
	$(function() {
		$( "#datepicker" ).datepicker({
			dateFormat:"yy-mm",		
		});
	});
	
</script>

</body>
</html>
