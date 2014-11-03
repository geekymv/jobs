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
	<title>招聘详情</title>
	<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">	
	
	<style type="text/css">
		.custom{
			height:51px;
		}
		.footer {
			background-color:  #333;
			width: 100%;
			height: 165px;
			margin-top: 190px;
		}
		/*
		ul li {
			line-height: 40px;
		}
		span {
			font-weight: bold;
		}
		*/
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

		<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		  <div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
              
			  <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" 			     
               data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			  </button>
              
			  <a class="navbar-brand" href="index.do">
              	<img alt="首页" src="img/index.png" height="25"/>
              	首页
              </a>
			</div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    	<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
           <ul class="nav navbar-nav">
                <li><a href="explain.html" target="_blank">系统简介</a></li>
                <li><a href="gyhk.htm" target="_blank">开发团队</a></li>
                <li><a href="help.html" target="_blank">帮助中心</a></li>
          </ul>
          <ul class="nav navbar-nav navbar-right">
           	<s:if test="#session.user != null">
	           	<li role="presentation" class="dropdown">
	                 <a href="stu-info.jsp" class="dropdown-toggle" data-toggle="dropdown">
	              		用户：${user.name }
	                   <span class="caret"></span>
	                 </a>
	                 <ul class="dropdown-menu" role="menu">
	                   <li><a href="user/login-success.do">进入个人主页</a></li>
	                 </ul>
                </li>
           		
           	</s:if>
           	<s:else>
           		<li>
            	<a href="login.jsp">登录 <span class="glyphicon glyphicon-log-in"></span></a>
           		</li>
           	</s:else>
           	
            <li class="divider-vertical"></li>
            <li>
            	<s:if test="#session.user != null">
            		<a href="user/user-logout">退出 <span class="glyphicon glyphicon-log-out"></span></a>
            	</s:if>
            	<s:else>
	            	<a href="register.jsp">注册 <span class="glyphicon glyphicon-user"></span></a>
            	</s:else>
            </li>
          </ul>
        </div><!-- /.navbar-collapse -->
      </div><!-- /.container-fluid -->
    </nav>
    <!-- 以上是导航菜单-->
    
    <!--空白处-->
    <div class="custom">
    </div>
    
     
      
    <div class="row">
    
    	<div class="col-md-2">
	      	<pre>左边</pre>
	      	<img src="img/hello.jpg" alt="这是一张图片" title="这是一张图片吗" class="img-thumbnail">
			<%--
	        <div class="btn-group">
			  <button type="button" class="btn btn-success">Action</button>
			  <button type="button" class="btn btn-success dropdown-toggle" data-toggle="dropdown">
			    <span class="caret"></span>
			    <span class="sr-only">Toggle Dropdown</span>
			  </button>
			  <ul class="dropdown-menu" role="menu">
			    <li><a href="#">Action</a></li>
			    <li><a href="#">Another action</a></li>
			    <li><a href="#">Something else here</a></li>
			    <li class="divider"></li>
			    <li><a href="#">Separated link</a></li>
			  </ul>
			</div>
			--%>
      	</div>
    	
    	<div class="col-md-10">
	        <div class="panel panel-primary">
	          <div class="panel-heading">招聘信息详情</div>
	          <div class="panel-body">
	            <p>招聘啦！</p>
	          </div>
	        
	        <s:if test="#request.recruit == null">
	            	没有招聘信息！
	        </s:if>
	        <s:else>
	         	<input type="hidden" id="rId" value="${recruit.id}"/>
	         	
	         	<table class="table table-bordered table-hover table-condensed">
	         		<caption>招聘信息</caption>
	         		<tr>
	         			<td><span>招聘信息标题：</span>${recruit.title }</td>
	         			<td><span>发布单位：</span>${recruit.employer.name }</td>
	         		</tr>
	         		<tr>
	         			<td><span>岗位名称：</span>${recruit.postName }</td>
	         			<td><span>薪资待遇：</span>${recruit.salary }</td>
	         		</tr>
	         		<tr>
	         			<td><span>招聘人数：</span>${recruit.postNum }</td>
	         			<td><span>已报名人数：</span>${recruit.applyNum }</td>
	         		</tr>
	         		<tr>
	         			<td colspan="2">
		         			<span>工作要求：</span>
			        		<s:if test="recruit.context  == null">
			        			暂无
			        		</s:if>
			        		<s:else>
			        			${recruit.context }
			        		</s:else>
	         			</td>
	         		</tr>
					
					<tr>
						<td><span>发布时间：</span><s:date name="recruit.releaseDate" format="yyyy-MM-dd"/></td>
						<td><span>截止时间：</span>${recruit.endDate }</td>
					</tr>
					
					<tr>
						<td><span>备注：</span>${recruit.remarks }</td>
					</tr>
	         	</table>
				<button id="showStudents">查看已报名学生</button>

	        </s:else>
	        <div id="students"></div>
	        </div> <!-- end of panel -->
    	</div>
    
	</div>
   </div><!-- /.container -->
   
   <div class="footer">
   <jsp:include page="footer.jsp"></jsp:include>
   </div>


<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>

<script type="text/javascript">
	$("#showStudents").button().on("click", function() {
		$.post("<%=request.getContextPath()%>/employer/queryStudents.do", {"id": $("#rId").val()}, function(data){
		
		$("#students").empty();
		if(data.students == null || data.students.length == 0){
			alert("还没有学生报名！");
			return;
		}
		
		var html = "<table class='table table-bordered table-hover table-condensed'>"
			 + "<caption>学生信息</caption>"
			 + "<tr>"
			 + "<th>学号</th> <th>姓名</th> <th>专业</th> <th>招聘结果</th>"
			 + "</tr>";
			
			var flag = "";
			for(var i = 0; i < data.students.length; i++){
				var student = data.students[i];
				var status = data.status[i];
				
				if(status == 0){	//等待处理
					flag = "等待处理";
				}else if(status == 1) {	//已通过
					flag = "已通过";
				}else if(status == 2){	//未通过
					flag = "已离职";
				}else if(status == -1) {
					flag = "未通过";
				}				
				
				html += "<tr>"
					 + "<td align='center'>"+student.number+"</td>"+ "<td>"+student.name+"</td>"
					 + "<td>"+student.profession+"</td>" 
					 + "<td><span style='color:#00CC33'>"+flag+"</span></td>"
					 
					 + "</tr>";
			}
				html += "</table>";

			$("#students").append(html);
			
		});
	});
	

</script>

</body>
</html>
