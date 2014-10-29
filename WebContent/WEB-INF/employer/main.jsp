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
	<title>招聘列表</title>
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
	          <div class="panel-heading">招聘列表</div>
	          <div class="panel-body">
	            <p>招聘啦！</p>
	          </div>
	        
	           <!-- Table -->
	          <table class="table table-bordered table-hover table-condensed">
	            	<s:if test="#request.pageUtil == null || #request.pageUtil.datas.size() == 0">
	            		没有招聘信息！
	            	</s:if>
	            	<s:else>
	            		<thead>
			                <tr>
			                   	<th>招聘信息标题</th> <th>岗位名称</th> <th>发布单位</th>
					  			<th>发布时间</th> <th>截止日期</th>  <th>查看详情</th>
			                </tr>
			            </thead>
	            	    <tbody>
	            		<s:iterator value="#request.pageUtil.datas">
	            			<tr>
		            			<td>${title }</td> 
		            			<td>${postName }</td> 
		            			<td>${employer.name }</td>
		            			<td><s:date name="releaseDate" format="yyyy-MM-dd"/></td>
			  					<td><s:date name="endDate" format="yyyy-MM-dd"/></td>
			  					<td>
			  						<a href="employer/emp-details.do?id=${id }">查看</a>
			  						<a href="employer/updateRecruit-preUpdate.do?id=${id }">修改</a>
			  					</td>
	            			</tr>
	            		</s:iterator>
	            	   </tbody>
	            	</s:else>
	          </table>
	            <div class="panel-footer">
	          	 <ul class="pager">
	
	          	 	<li>当前页 ：<s:property value="page"/>&nbsp;&nbsp;</li>
	          	 	<li>总页数：<s:property value="#request.pageUtil.totalPage"/></li>
	          	 	
	          	 	<s:if test="page-1 > 0">
	          	 		<li><a href="employer/emp-recruitList.do?page=<s:property value=" page-1 "/>" >上一页</a></li>
	          	 	</s:if>
			
					<s:set var="totalPage" value="#request.pageUtil.totalPage"></s:set>
					<%-- totalPage: <s:property value="#totalPage"/>--%>

	          	 	<s:if test="page+1 <= #totalPage">
				  		<li><a href="employer/emp-recruitList.do?page=<s:property value=" page+1 "/>" >下一页</a></li>
	          	 	</s:if>

				</ul>
	          </div>
	         
	         
	        </div> <!-- end of panel -->
	      
    	</div>
      
	</div>
    
   </div><!-- /.container -->
   
   
   <div class="footer">
   <jsp:include page="../main/footer.jsp"></jsp:include>
   </div>
</body>
</html>
