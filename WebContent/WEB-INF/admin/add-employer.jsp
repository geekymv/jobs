<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh-CN">
	<head>
	<base href="<%=basePath%>">
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<title>添加用工单位</title>
	<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">	

	<style type="text/css">
		.footer {
			background-color:  #333;
			width: 100%;
			height: 165px;
			margin-top: 210px;
		}
		.form {
			margin-top: 10px;
			margin-left: 240px;
		}
		.error-info {
			color: red;
		}		
	</style>
	
	<link href="css/zzsc.css" rel="stylesheet" type="text/css" />
	
	<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
	<script src="js/showlist.js" type="text/javascript"></script>
	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

		<script type="text/javascript">
			function mycheck() {
				//验证密码是否一致
				var password = document.getElementById("password");
				var repassword = document.getElementById("repassword");
				
				if(password.value == ""){
					alert("密码不能为空！");
					return false;
				}
				if(repassword.value == ""){
					alert("重复密码不能为空！");
					return false;
				}
				
				if(password.value != repassword.value) {
					alert("两次输入的密码不一致！");
					repassword.focus(); 
					return false;
				}
				
				//验证岗位数是否合法：必须是正整数
				var postNum = document.getElementById("postNum");
				var reg = /^(?:[1-9]\d*|0)$/; 
			  	if(!reg.test(postNum.value)){
			  		alert("岗位数必须是正整数！");
			  	 	postNum.focus();
			  	 	return false;
   			  	}
				
				//验证月总金额的合法性：必须是正整数
				var totalMoney = document.getElementById("totalMoney");
				var total_value = totalMoney.value;
				var r = "1234567890";
				
				for(var i = 0; i < total_value.length; i++) {
					//开头不能是0
					if(total_value.charAt(0) == 0){
						alert("月总金额输入不合法，请输入正整数！");
						totalMoney.focus();
						return false;
					}

					var ch = total_value.charAt(i);
					if(r.indexOf(ch) == -1) {
						alert("月总金额输入不合法，请输入正整数！");
						totalMoney.focus();
						return false;
					}
				}
				
				return true;
				
			}
		</script>
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
	          <div class="panel-heading">添加用工单位</div>
	          <div class="row">
	          <div class="form">
	          <form action="admin/admin-addEmployer.do" class="form-horizontal" method="post">
				<div class="form-group">	
					<label for="account" class="col-sm-2 control-label">登录账号</label>  
					<div class="col-sm-3">
					  <input type="text" name="employer.account" class="form-control" autofocus="autofocus" required="required"/>
					  <span style="color:gray; font-size:12px;">账号一经设定，不能修改！</span>
					</div> 
					<label class="control-label error-info">
						<em>*</em>
					    <s:fielderror fieldName="account"></s:fielderror>
					</label>
			  	</div>
			  	<div class="form-group">	
					<label for="password" class="col-sm-2 control-label">登录密码</label>  
					<div class="col-sm-3">
					  <input type="password" id="password" name="employer.password" class="form-control" required="required"/>
					</div> 
					<label class="control-label error-info">
						<em>*</em>
					    <s:fielderror fieldName="password"></s:fielderror>
					</label>
			  	</div>
			  	<div class="form-group">	
					<label for="repassword" class="col-sm-2 control-label">密码确认</label>  
					<div class="col-sm-3">
					  <input type="password" id="repassword" name="repassword" class="form-control" required="required"/>
					</div> 
					<label class="control-label error-info">
						<em>*</em>
					    <s:fielderror fieldName="repassword"></s:fielderror>
					</label>
			  	</div>
			  	<div class="form-group">
					    <label for="name" class="col-sm-2 control-label">单位名称</label>
					    <div class="col-sm-3">
					      <input type="text" class="form-control focus" name="employer.name" required="required">
					    </div>
					    <label class="control-label error-info">
					    	<em>*</em>
					    	<s:fielderror fieldName="name"></s:fielderror>
					    </label>
				</div>
				<div class="form-group">
					    <label for="mobile" class="col-sm-2 control-label">电话号码</label>
					    <div class="col-sm-3">
					      <input type="text" class="form-control focus" name="employer.mobile" required="required">
					    </div>
					    <label class="control-label error-info">
					    	<em>*</em>
					    	<s:fielderror fieldName="mobile"></s:fielderror>
					    </label>
				</div>
				<div class="form-group">
					    <label for="teacher" class="col-sm-2 control-label">负责老师</label>
					    <div class="col-sm-3">
					      <input type="text" class="form-control focus" name="employer.teacher" required="required"/>
					    </div>
					    <label class="control-label error-info">
					    	<em>*</em>
					    	<s:fielderror fieldName="teacher"></s:fielderror>
					    </label>
				</div>
				<div class="form-group">
					    <label for="postNum" class="col-sm-2 control-label">岗位数</label>
					    <div class="col-sm-3">
					      <input type="text" id="postNum" class="form-control focus" name="employer.postNum" required="required"/>
					    </div>
					    <label class="control-label error-info">
					    	<em>*</em>
					    	<s:fielderror fieldName="postNum"></s:fielderror>
					    </label>
				</div>
			  	<div class="form-group">
					    <label for="totalMoney" class="col-sm-2 control-label">月总金额(元)</label>
					    <div class="col-sm-3">
					      <input type="text" id="totalMoney" class="form-control focus" name="employer.totalMoney" required="required"/>
					    </div>
					    <label class="control-label error-info">
					    	<em>*</em>
					    	<s:fielderror fieldName="totalMoney"></s:fielderror>
					    </label>
				</div>

			  	<div class="form-group">
					    <label for="remarks" class="col-sm-2 control-label">备注信息</label>
					    <div class="col-sm-3">
						    <textarea class="form-control" rows="2" name="employer.remarks"></textarea>
					    </div>
				</div>
			  	 <div class="form-group">
					    <div class="col-sm-offset-2 col-sm-4">
					      <button type="submit" class="btn btn-primary" onclick="return mycheck()">添加</button>
					    </div>
				</div>
	    	</form>
	        </div>
	        </div> <!-- end of panel -->
    	</div>
	</div>
   </div>
   </div><!-- /.container -->
   
   
   <div class="footer">
   <jsp:include page="../main/footer.jsp"></jsp:include>
   </div>



<script src="bootstrap/js/bootstrap.min.js"></script>

</body>
</html>
