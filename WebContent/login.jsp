<%@page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />

<title>用户登录</title>
<script src="js/jquery-1.11.1.js" type="text/javascript" ></script>
<link rel="stylesheet" type="text/css" href="css/login.css"/>
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
  <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->

<style type="text/css">
	.error_info {
		color: red;
		font-size: 16px;
	}

</style>

</head>
<body>
<div class='signup_container'>

    <h1 class='signup_title'>用户登录</h1>
    <img src='img/people.png' id='admin'/>
    <div class="error_info">
    	<s:actionerror/>
    </div>
    <form action="user/user-login.do" method="post">
    <div id="signup_forms" class="signup_forms clearfix">
            <div class="signup_form_form" id="signup_form">
                    <div class="form_row first_row">
                        <label for="signup_name">请输入用户名</label>
                        <input type="text" name="account" placeholder="请输入用户名" id="signup_name" required="required"/>
                    </div>
                    <div class="form_row">
                        <label for="signup_password">请输入密码</label>
                        <input type="password" name="password" placeholder="请输入密码" id="signup_password" required="required" />
                    </div>
           </div>
    </div>
    <div class="login-btn-set">
		<div class='rem'>记住我</div> 
		<input type="submit" value="" class='login-btn' />
	</div>
	</form>
</div>
<script type="text/javascript">

$(function(){

    $('.rem').click(function(){
        $(this).toggleClass('selected');
    });
/*
    $('#signup_select').click(function(){
        $('.form_row ul').show();
        event.cancelBubble = true;
    });

    $('#d').click(function(){
        $('.form_row ul').toggle();
        event.cancelBubble = true;
    });

    $('body').click(function(){
        $('.form_row ul').hide();
    });

    $('.form_row li').click(function(){
        var v  = $(this).text();
        $('#signup_select').val(v);
        $('.form_row ul').hide();
    });
*/
});
</script>
</body>
</html>