<%@ page language="java" import="java.util.*, com.heike.pojo.*" pageEncoding="utf-8"%>
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
	<title>学生列表</title>
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
	          <div class="panel-heading">学生列表</div>
	          <div class="panel-body">
	            <p>
	            	温馨提示：<br/>
	            	①当学生离职后，需要删除该学生，否则该学生不能继续报名你发布的招聘信息！
	            
	            </p>
	          </div>
	        
	           <!-- Table -->
	          <table class="table table-bordered table-hover table-condensed">
	            <thead>
	                <tr>
	                   	<th>学号</th> <th>姓名</th> <th>专业</th> <th>手机号码</th> <th>岗位名称</th> <th>选择操作</th> 
	                </tr>
	            </thead>
	            <tbody>
	            	
	            	<%
	            		List<Student> students = (List<Student>)request.getAttribute("students");
	            		List<String> postNames = (List<String>)request.getAttribute("postNames");
	            		
	            		for(int i = 0; i < students.size(); i++){
							Student student = students.get(i);
							String postName = postNames.get(i);
						%>
							<tr>
	            				<td><%=student.getNumber() %></td>
		            			<td><%=student.getName() %></td> 
		            			<td><%=student.getProfession() %></td> 
		            			<td><%=student.getMobile() %></td>
		            			<td><%=postName %></td>
		            			<td>
		            				<a href="employer/stu-deleteStudent.do?stuId=<%=student.getId() %>"
		            			 	onclick="javascript:if(confirm('确定要解聘学号为'+<%=student.getNumber() %>+'的学生吗？')){alert('操作成功！');return true;}return false;">
		            				 解聘</a>
		            			</td>
	            			</tr>						
						<% 							            			
	            		}
	            	%>
	            	<%--
	            	<s:if test="#request.students == null || #request.students.size() == 0">
	            		暂无学生！
	            	</s:if>
	            	<s:else>
	            		<s:iterator value="#request.students">
	            			<tr>
	            				<td>${number }</td>
		            			<td>${name }</td> 
		            			<td>${profession }</td> 
		            			<td>${mobile }</td>
		            			<td>岗位名称</td>
		            			<td>
		            				<a href="employer/stu-deleteStudent.do?stuId=${id }"
		            			 onclick="javascript:if(confirm('确定要解聘学号为'+${number}+'的学生吗？')){alert('操作成功！');return true;}return false;">
		            				 删除</a>
		            			</td>
	            			</tr>
	            		</s:iterator>

	            	</s:else>
	            	 --%>
	            </tbody>
	          </table>
	        </div> <!-- end of panel -->
    	</div>
	</div>
   </div><!-- /.container -->
   
   <div class="footer">
   	<jsp:include page="../main/footer.jsp"></jsp:include>
   </div>


<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>

<!-- 
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
