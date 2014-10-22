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
	<title>工资列表</title>
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
	          <div class="panel-heading">工资列表</div>
	          <div class="panel-body">
	            <p>工资信息</p>
	          </div>
	        
	           <!-- Table -->
	          <table class="table table-bordered table-hover table-condensed">
	            <thead>
	                <tr>
	                	<th>学号</th> <th>姓名</th> <th>工作时间</th> <th>基本工资</th>
	                	<th>工具费</th> <th>奖金</th> <th>月份</th> <th>备注</th> <th>选择操作</th> 
	                </tr>
	            </thead>
	            <tbody>
	            	<s:if test="#request.salarys == null || #request.salarys.size() == 0">
	            		还没有发过薪水！
	            	</s:if>
	            	<s:else>
	            		<s:iterator value="#request.salarys">
	            			<tr>
	            				<td>${student.number }</td>
		            			<td>${student.name }</td>
		            			<td>${worktime }</td> 
		            			<td>${salary }</td> 
		            			<td>${toolFee }</td>
		            			<td>${bonus }</td>
		            			<td>${month }</td>
		            			<td>${remarks }</td>
		            			<td><a href="employer/update-salary-preupdateSalary.do?id=${id }&stuId=${student.id}">修改</a></td>
	            			</tr>
	            		</s:iterator>

	            	</s:else>
	            </tbody>
	          </table>

	        </div> <!-- end of panel -->
	      
    	</div>
      
	</div>
    
   </div><!-- /.container -->
   
   
   <div class="footer">
   <jsp:include page="../main/footer.jsp"></jsp:include>
   </div>

<!-- 
<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script src="jquery-ui/external/jquery/jquery.js"></script>
<script src="jquery-ui/jquery-ui.js"></script>
<script>
	$(function() {
		$("#menu").menu();
	});
</script>
 -->
 
</body>
</html>
