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
			margin-top: 450px;
		}
		
		ul li {
			line-height: 40px;
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
	          <div class="panel-heading">招聘信息详情</div>
	          <div class="panel-body">
	            <p>招聘啦！student</p>
	          </div>
	        
	        <s:if test="#request.recruit == null">
	            	没有招聘信息！
	        </s:if>
	        <s:else>
	         <ul>
	        	<li>招聘信息标题：${recruit.title }</li>
	        	<li>发布单位：${recruit.employer.name }</li>
	        	<li>岗位名称：${recruit.postName }</li>
	        	<li>招聘人数：${recruit.postNum } 人</li>
	        	<li>已报名人数：${recruit.applyNum } 人</li>
	        	<li>薪资待遇：${recruit.salary }</li>
	        	<li>
	        		工作要求：
	        		<s:if test="recruit.context  == null">
	        			暂无
	        		</s:if>
	        		<s:else>
	        			${recruit.context }
	        		</s:else>
	        		
	        	</li>
	        				<%--${recruit.releaseDate} --%>
	        	<li>
	        		发布时间：<s:date name="recruit.releaseDate" format="yyyy-MM-dd"/>
	        	</li>
	        	<li>截止时间：${recruit.endDate }</li>
	        	<li>备注：${recruit.remarks }</li>
	        </ul>	
			
				
				<form action="student/stu-applyJob.do" method="post">
					<input type="hidden" name="recruit.id" value="${recruit.id }"/>					
					<input type="submit" value="我要报名"/>
				</form>
				        
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
