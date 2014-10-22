<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>" />
<title>学生注册</title>

<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="this is my page">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">	

<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
   <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
   <!--[if lt IE 9]>
     <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
     <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
   <![endif]-->
<style type="text/css">
body{
	height: 900px;
}
label {
	width: 10em;
	float: left;
}
label.error {
	float: none;
	color: red;
	padding-left: .5em;
	vertical-align: top;
}
p {
	clear: both;
}
.submit {
	margin-left: 12em;
}
em {
	padding-right: 1em;
	vertical-align: middle;
	color: red;
}
em.error {
	background: url("img/unchecked.gif") no-repeat 0px 0px;
	padding-left: 16px;
}
em.success {
	background: url("img/checked.gif") no-repeat 0px 0px;
	padding-left: 16px;
}

.fielderror {
	color: red;
}
</style>

<script type="text/javascript" src="validation/jquery-1.10.0.js"></script>
<script type="text/javascript" src="validation/jquery.validate.js"></script>
<script type="text/javascript" src="validation/jquery.metadata.js"></script>
<script type="text/javascript" src="validation/messages_zh.js"></script>

<script type="text/javascript" src="js/register-validation.js"></script>

</head>

<body>
<div class="container">
	<div class="row">
		<form class="form-horizontal" action="user/user-register.do" role="form" method="post">
		<fieldset>
			<legend>学生注册</legend>
		  <div class="form-group">
		    <label for="number" class="col-sm-4 control-label">学号</label>
		    <em>*</em>
		    <div class="col-sm-3">
		      <input type="text" class="form-control focus" id="number" name="number" placeholder="id" autofocus="autofocus">
		      <span class="fielderror">
		      <s:fielderror fieldName="number"></s:fielderror>	
		      </span>
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="password" class="col-sm-4 control-label">登录密码</label>
		    <em>*</em>
		    <div class="col-sm-3">
		      <input type="password" class="form-control" id="password" name="password" placeholder="password">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="repassword" class="col-sm-4 control-label">确认密码</label>
		    <em>*</em>
		    <div class="col-sm-3">
		      <input type="password" class="form-control" id="repassword" name="repassword" placeholder="repassword">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="name" class="col-sm-4 control-label">姓名</label>
		    <em>*</em>
		    <div class="col-sm-3">
		      <input type="text" class="form-control" id="name" name="name" placeholder="name">
		    </div>
		  </div>
		  <div class="form-group">
		  	<label for="gender" class="col-sm-4 control-label">性别</label>
		  	<em>&nbsp;</em>
		  	<div class="col-sm-3">
			  	<label class="radio-inline col-sm-5 control-label">
			  		<input type="radio" name="gender" id="male" value="男" checked="checked"> 男
				</label>
				<label class="radio-inline col-sm-5 ">
				  <input type="radio" name="gender" id="female" value="女"> 女
				</label>
			</div>
		  </div>
		  <div class="form-group">
		    <label for="mobile" class="col-sm-4 control-label">手机号码</label>
		    <em>*</em> 
		    <div class="col-sm-3">
		      <input type="text" class="form-control" id="mobile" name="mobile" placeholder="mobile">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="college" class="col-sm-4 control-label">学院</label>
		    <em>*</em> 
		    <div class="col-sm-3">
		      <input type="text" class="form-control" id="college" name="college" placeholder="college">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="profession" class="col-sm-4 control-label">专业</label>
		    <em>*</em> 
		    <div class="col-sm-3">
		      <input type="text" class="form-control" id="profession" name="profession" placeholder="profession">
		    </div>
		  </div>
		   <div class="form-group">
		    <label for="introduce" class="col-sm-4 control-label">自我介绍</label>
		    <div class="col-sm-3">
		    	<textarea class="form-control" rows="3" name="introduce" placeholder="introduce"></textarea>
		    </div>
		  </div>
		 
		  <div class="form-group">
		    <div class="col-sm-offset-4 col-sm-4">
		      <button type="submit" class="btn btn-default">注册</button>&nbsp;&nbsp;&nbsp;&nbsp;
		      <button type="button" class="btn btn-default" onclick="location.href='<%=basePath%>index.jsp';">取消</button>
		    </div>
		  </div>
		  </fieldset>
		</form>

	</div>
</div>
</body>
</html>
