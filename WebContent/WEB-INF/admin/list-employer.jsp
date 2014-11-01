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
	<title>用工单位列表</title>
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
	          <div class="panel-heading">用工单位列表</div>
	          
	          <div class="panel-body">
			    <button id="search" class="btn btn-default">查询用工单位</button>
			  </div>
	        
		      <s:if test="#request.employers == null || #request.employers.size() == 0">
	            	没有用工单位！
	          </s:if>	
	          <s:else>
	          <!-- Table -->
	          <table class="table table-bordered table-hover table-condensed">
	            <thead>
	                <tr>
	                   	<th>登录账号</th> <th>单位名称</th> <th>电话号码</th> <th>负责老师</th>
			  			 <th>岗位数</th> <th>月总金额</th> <th>备注信息</th> <th>操作</th> 
	                </tr>
	            </thead>
	            <tbody>
            		<s:iterator value="#request.employers">
            			<tr>
	            			<td>${account }</td> 
	            			<td>${name }</td> 
	            			<td>${mobile }</td>
	            			<td>${teacher }</td>
	            			<td>${postNum }</td>
		  					<td>${totalMoney }元</td>
		  					<td>
		  						<s:if test="remarks == null">
		  							无
		  						</s:if>
		  						<s:else>
		  							${remarks }
		  						</s:else>
		  					</td>
		  					<td><a href="admin/update-emp-preupdateEmployer?empId=${id }">修改</a></td>
            			</tr>
            		</s:iterator>
	            </tbody>
	          </table>
	         </s:else>
	        </div> <!-- end of panel -->
    	</div>
    	
		<!-- Modal -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-sm">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
		        <h4 class="modal-title" id="myModalLabel">查询用工单位</h4>
		      </div>
		      <div class="modal-body">
					  <input type="text" name="account" class="form-control" placeholder="请输入用工单位账号" autofocus="autofocus" required="required"/>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
		        <button type="button" class="btn btn-primary" id="searchEmp">查询</button>
		      </div>
		    </div>
		  </div>
		</div>  	
      
	</div>
    
   </div><!-- /.container -->
   
   
   <div class="footer">
   <jsp:include page="../main/footer.jsp"></jsp:include>
   </div>

	<script src="bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		$("#search").click(function() {
			$("#myModal").modal("show");
		});	
		
		$("#searchEmp").click(function() {
			var account = $("input[name=account]").val();
			window.location.href="admin/queryEmployer?account="+account;
		});
	
	</script>

</body>
</html>













