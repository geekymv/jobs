<%@ page language="java" import="java.util.*, com.heike.dto.RecruitStudent, com.heike.pojo.Recruit" pageEncoding="utf-8"%>
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
	<title>我的工作</title>
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
			   	<div class="list-group">
				  <a href="student/stu-stuInfo.do" class="list-group-item">我的资料</a>
				  <a href="student/stu-approveJob.do" class="list-group-item">我的工作</a>
				  <a href="student/stu-listJob.do" class="list-group-item">报名记录</a>
				  <a href="student/stu-listRecruit.do" class="list-group-item">查看招聘</a>
				  <a href="student/preUpdatePassword.do" class="list-group-item">修改密码</a> 
				</div>
			</div>
      	</div>
    
      	<div class="col-md-10">
	        <div class="panel panel-primary">
	          <div class="panel-heading">我的工作</div>
	        
		      <s:if test="#request.recruitStudents == null || #request.recruitStudents.size() == 0">
	            		暂无工作！快去报名吧...
	          </s:if>	
	        
	          <s:else>
	          <!-- Table -->
	          <table class="table table-bordered table-hover table-condensed">
	            <thead>
	                <tr>
	                   	<th>岗位名称</th> <th>所在单位</th> <th>报名时间</th> <td>基本工资</td> <td>状态</td>
	                </tr>
	            </thead>
	            <tbody>
	            	<%
	            		List<RecruitStudent> recruitStudents = (List<RecruitStudent>)request.getAttribute("recruitStudents");
	            		List<String> status = (List<String>)request.getAttribute("status");
	            		for(int i = 0; i < recruitStudents.size(); i++){
	            			RecruitStudent rs = recruitStudents.get(i);
	            			Recruit recruit = rs.getRecruit();
	            			String statu = status.get(i);
	            			%>
	            			<tr>
		            			<td><%=recruit.getPostName() %> </td> 
		            			<td><%=recruit.getEmployer().getName() %> </td>
		            			<td><%=rs.getApplyDate() %></td>
            					<td><%=recruit.getSalary() %> </td>
            					<td><%=statu %> </td>
           					</tr>
	            			<% 
	            		}
	            	%>
	            
	            <%--	添加状态（在职、离职）
            		<s:iterator value="#request.recruitStudents">
           				<tr>
	            			<td>${recruit.postName }</td> 
	            			<td>${recruit.employer.name }</td>
	            			<td><s:date name="applyDate" format="yyyy-MM-dd"/></td>
            				<td>${recruit.salary }</td>
           				</tr>
            		</s:iterator>
	             --%>	
	            </tbody>
	          
	          </table>

	         </s:else>
	         
	         
	        </div> <!-- end of panel -->
	      
    	</div>
      
	</div>
    
   </div><!-- /.container -->
   
   
   <div class="footer">
   	<jsp:include page="../main/footer.jsp"></jsp:include>
   </div>


<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>

</body>
</html>
