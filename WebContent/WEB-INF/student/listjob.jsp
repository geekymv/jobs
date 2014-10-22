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
	<title>报名记录</title>
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
	          <div class="panel-heading">报名记录</div>
	        
		      <s:if test="#request.recruitStudents == null || #request.recruitStudents.size() == 0">
	            		没有报名信息！
	          </s:if>	
	        
	          <s:else>
	          <!-- Table -->
	          <table class="table table-bordered table-hover table-condensed">
	            <thead>
	                <tr>
	                   	<th>招聘信息标题</th> <th>岗位名称</th> <th>发布单位</th>
			  			<th>发布时间</th> <th>截止日期</th>  <th>是否通过</th>
	                </tr>
	            </thead>
	            <tbody>
            		<s:iterator value="#request.recruitStudents">
            			<tr>
	            			<td><a href="student/stu-details.do?id=${recruit.id }">${recruit.title }</a></td> 
	            			<td>${recruit.postName }</td> 
	            			<td>${recruit.employer.name }</td>
	            			<td><s:date name="recruit.releaseDate" format="yyyy-MM-dd"/></td>
		  					<td><s:date name="recruit.endDate" format="yyyy-MM-dd"/></td>
		  					<td>
		  						<s:if test="status == 0">
		  							待审核
		  						</s:if>
		  						<s:elseif test="status == 1">
		  							已通过
		  						</s:elseif>
		  						<s:elseif test="status == -1">
		  							未通过
		  						</s:elseif>
		  						<s:elseif test="status == 2">
		  							已离职
		  						</s:elseif>
		  						
		  					</td>
            			</tr>
            		</s:iterator>
	            	
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
