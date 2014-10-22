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
	<title>修改招聘信息</title>
	<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">	
	
	<link rel="stylesheet" href="jquery-ui/jquery-ui.css">
	
	<style type="text/css">
		.custom{
			height:51px;
		}
		
		.footer {
			background-color:  #333;
			width: 100%;
			height: 165px;
			
			margin-top: 200px;
		}
		
		.publish {
			margin-left: 220px;
		}
		
		form input {
			margin: 0 auto;
			margin-top: 10px;
		}
		
		em{
			font-weight: bold;
			margin-left: 1em;
			vertical-align: middle;
			color: red;
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
	          <div class="panel-heading">修改招聘信息</div>
	          	<div class="panel-body">
					<p>
						操作说明：<br/>
						①<em>*</em> 为必填信息<br/>
						②修改成功后，页面跳转至首页，显示所有的招聘信息						
					</p>
	          	</div>
	          	<div class="publish">
			     	<form action="employer/updateRecruit-update.do" id="commentForm" method="post">
			   		招聘标题:<input type="text" id="title" name="title" value="${recruit.title }" class="required" required="required"/>
			   				<span style="color:red">
			   					<em>*</em>
			   					<s:fielderror fieldName="title"></s:fielderror>
			   				</span>
			   			  <input type="hidden" name="id" value="${recruit.id }"/>	
			   		 <br />
			   		岗位名称:<input type="text" id="postName" name="postName" value="${recruit.postName }" required="required"/>
		   					<span style="color:red">
		   						<em>*</em>
		   						<s:fielderror fieldName="postName"></s:fielderror>
		   					</span>
			   		<br />
			   		招聘人数:<input type="number" id="postNum" name="postNum" value="${recruit.postNum }" required="required"/>
			   				<span style="color:red">
			   					<em>*</em>
			   					<s:fielderror fieldName="postNum"></s:fielderror>
			   				</span>
			   		<br />
			   		薪资待遇:<input type="text" id="salary" name="salary" value="${recruit.salary }" required="required"/>
			   				<span style="color:red">
			   					<em>*</em>
			   					<s:fielderror fieldName="salary"></s:fielderror>
			   				</span>
			   		<br />
			   		工作要求：<br/><textarea id="context" rows="5" cols="40" name="context" >
			   						${recruit.context }
			   					</textarea>
			   				<span style="color:red">
			   					<em>*</em>
			   					<s:fielderror fieldName="context"></s:fielderror>
			   				</span>
			   		<br/>
			   		截止日期:<input type="text" id="datepicker" name="endDate" value="${recruit.endDate }" required="required"/>
			   				<span style="color:red">
			   					<em>*</em>
			   					<s:fielderror fieldName="endDate"></s:fielderror>
			   				</span>
			   		<br />
			   		备注:<input type="text" name="remarks" value="${recruit.remarks }" /><em>&nbsp;</em> 
			   			<s:fielderror fieldName="remarks" cssStyle="color:red"></s:fielderror>
			   		<br />
			   		
			   		<input type="submit" id="submit" value="修改">
			   		
			   		</form>
		   		</div>
		     </div>
    	</div>
      
	</div>
    
   </div><!-- /.container -->
   
   
   <div class="footer">
   <jsp:include page="../main/footer.jsp"></jsp:include>
   </div>


<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>

<script type="text/javascript" src="jquery-ui/jquery-ui.min.js"></script>
<script type="text/javascript">
	$(function() {
		/*
		$('input[id="title"]').blur(function(){
			if($(this).val().trim() == ''){
				alert("标题不能为空！");				
			}
		});
		$('input[id="postName"]').blur(function(){
			if($(this).val().trim() == ''){
				alert("岗位名称不能为空！");				
			}
		});
		$('input[id="postNum"]').blur(function(){
			if($(this).val().trim() == ''){
				alert("招聘人数不能为空！");				
			}
		});
		$('input[id="salary"]').blur(function(){
			if($(this).val().trim() == ''){
				alert("薪资待遇不能为空！");				
			}
		});
		$('input[id="context"]').blur(function(){
			if($(this).val().trim() == ''){
				alert("工作要求不能为空！");				
			}
		});
		$('input[id="datepicker"]').blur(function(){
			if($(this).val().trim() == ''){
				alert("截止日期不能为空！");				
			}
		});
		*/
		
		$("#submit").click(function(){
			if($("#datepicker").val().trim() == ''){
				alert("截止日期不能为空！");
				return false;
			}
		});
		
		$( "#datepicker" ).datepicker({
			dateFormat:"yy-mm-dd",		
		});
	});
</script>
</body>
</html>
