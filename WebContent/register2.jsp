<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <base href="<%=basePath%>" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户注册</title>
<link rel="stylesheet" type="text/css" href="css/main.css" />
<style type="text/css">
#wizard {border:5px solid #789;font-size:12px;height:460px;margin:20px auto;width:570px;overflow:hidden;position:relative;-moz-border-radius:5px;-webkit-border-radius:5px;}
#wizard .items{width:20000px; clear:both; position:absolute;}
#wizard .right{float:right;}
#wizard #status{height:35px;background:#333333;padding-left:25px !important;}
#status li{float:left;color:#fff;padding:10px 30px;}
#status li.active{background-color:#369;font-weight:normal;}
.input{width:240px; height:18px; margin:10px auto; line-height:15px; border:1px solid #d3d3d3; padding:2px}
.page{padding:20px 30px;width:500px;float:left;}
.page h3{height:42px; font-size:16px; border-bottom:1px dotted #ccc; margin-bottom:20px; padding-bottom:5px}
.page h3 em{font-size:12px; font-weight:500; font-style:normal}
.page p{line-height:24px;}
.page p label{font-size:14px; display:block;}
.btn_nav{height:36px; line-height:36px; margin:20px auto;}
.prev,.next{width:100px; height:32px; line-height:32px; background:url(btn_bg.gif) repeat-x bottom; border:1px solid #d3d3d3; cursor:pointer}
</style>
<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
<script type="text/javascript" src="js/scrollable.js"></script>
</head>

<body>

<div id="main">
   <h2 class="top_title">用户注册</h2>
   <p style="height:24px; line-height:24px; margin:16px">创建一个账户，用于登录。</p>
   
   <form action="user/user-register.do" method="post">
	
	<div id="wizard">
		<ul id="status">
			<li class="active"><strong>1.</strong>创建账户</li>
			<li><strong>2.</strong>填写联系信息</li>
			<li><strong>3.</strong>完成</li>
		</ul>

		<div class="items">
			<div class="page">
               <p>
	               <label>学号：</label>
	               <input type="text" class="input" id="user" name="student.number" />
	           </p>
               <p> 
               		<label>登录密码：</label>
               		<input type="password" class="input" id="pass" name="student.password" />
               	</p>
               <p>
               		<label>确认密码：</label>
               		<input type="password" class="input" id="repassword" name="repassword" />
               	</p>
               <p>
               		<label>姓名：</label>
               		<input type="text" class="input" id="user" name="student.name" />
               </p>
			   <p>
			   		<label>性别：</label>
			   		<input type="radio" name="student.gender" value="男" checked="checked"/>男
			   		<input type="radio" name="student.gender" value="女"/>女
			   </p>
               <div class="btn_nav">
                  <input type="button" class="next right" value="下一步&raquo;" />
               </div>
            </div>
			<div class="page">
               <p><label>学院</label><input type="text" class="input" name="student.college" /></p>
               <p><label>专业</label><input type="text" class="input" name="student.profession" /></p>
               <p><label>手机号码：</label><input type="text" class="input" name="student.mobile" /></p>
               <p><label>自我介绍：</label><textarea rows="5" cols="40" name="student.introduce"></textarea> </p>
               <div class="btn_nav">
                  <input type="button" class="prev" style="float:left" value="&laquo;上一步" />
                  <input type="button" class="next right" value="下一步&raquo;" />
               </div>
            </div>
			<div class="page">
               <h3>完成注册<br/><em>点击确定完成注册。</em></h3>
               <p>请点击“确定”按钮完成注册。</p>
               <br/>
               <br/>
               <br/>
               <div class="btn_nav">
                  <input type="button" class="prev" style="float:left" value="&laquo;上一步" />
                  <input type="submit" class="next right" id="sub" value="确定" />
               </div>
            </div>
		</div>
	</div>
</form><br />
</div>

<script type="text/javascript">
$(function(){
	
	/*验证学号是否重复*/
	$(":input[id=user]").change(function(){
		
		var val = $(this).val();
		val = $.trim(val);
		
		var $this = $(this);
		
		if(val != ""){

			$this.nextAll("font").remove();
			
			var url = "user/validateUser";
			var args = {"number":val};

			$.post(url, args, function(data){
				if(data == "success"){	//number可用
					/*没有消息是最好的消息
					$this.after("<font color='green'>学号可用</font>");
					*/
				}else if(data == "fail"){	//number不可用
					$this.after("<font color='red'>学号已注册，<a href='login.jsp'>请点击此处登录</a></font>");
				}else {
					alert("服务器错误！");
				}
			});
			
		}else {
			alert("学号不能为空！");
			this.focus();
		}
		
	});
	
	
	
	
	
	$("#wizard").scrollable({
		onSeek: function(event,i){
			$("#status li").removeClass("active").eq(i).addClass("active");
		},
		onBeforeSeek:function(event,i){
			if(i==1){
				var user = $("#user").val();
				if(user==""){
					alert("请输入学号！");
					return false;
				}
				var pass = $("#pass").val();
				var repassword = $("#repassword").val();
				if(pass==""){
				    alert("请输入密码！");
					return false;
				}
				if(repassword != pass){
				    alert("两次密码不一致！");
					return false;
				}
			}
		}
	});
	/*
	$("#sub").click(function(){
		var data = $("form").serialize();
		alert(data);
	});
	*/
});
</script>
<div style="text-align:center;margin:50px 0; font:normal 14px/24px 'MicroSoft YaHei';">
<p>&copy;2014</p>
</div>
</body>
</html>
