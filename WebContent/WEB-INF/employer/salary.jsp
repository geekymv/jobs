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
	<title>发放工资</title>
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
		
		em {
			color: red;
		}
	</style>
	
	<link rel="stylesheet" type="text/css" href="jquery-ui/jquery-ui.css">
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
	          <div class="panel-heading">提交薪资</div>
	          <div class="panel-body">
            	<p>
					操作说明：<br/>
					①<em>*</em> 为必填信息.<br/>
					②以下输入框中数据是默认值，按照实际情况输入<br/>
					③只可以在每月的最后一周提交工资.<br/>
					④提交成功后，页面跳转至工资列表，显示已经提交的工资.					
				</p>
	            <p class="actionerror">
	            	<s:actionerror />
	            </p>
	          </div>
	        
	           <!-- Table -->
	          <table class="table table-bordered table-hover table-condensed">
	            <thead>
	                <tr>
	                	<!-- <th>选择</th> -->
	                   	 <th>学号</th> <th>姓名</th> <th>工作时间</th> <th>基本工资</th> <th>工具费</th> <th>奖金</th> <th>备注</th>  
	                </tr>
	            </thead>
	            <tbody>
	            	<s:if test="#request.students == null || #request.students.size() == 0">
	            		没有学生信息！
	            	</s:if>
	            	<s:else>
            		<form action="employer/payoff.do" method="post">
	            		<s:iterator value="#request.students">
	            			<tr>
		            			<td>
		            				${number }
		            				<input type="hidden" name="stuIds" value="${id }" />
		            				<input type="hidden" name="empIds" value="${employer.id }" />
		            			</td> 
		            			<td>${name }</td> 
		            			<td><input type="text" name="worktimes" value="30小时" size="15"/><em>*</em></td>
		            			<td>
		            				<input type="text" name="salarys" value="100" size="15"/><em>*</em>
		            			</td>
		            			<td>
		            				<input type="text" name="toolfees" value="0" size="15" /><em>*</em>
		            			</td>
		            			<td>
		            				<input type="text" name="bonus" value="0" size="15" /><em>*</em>
		            			</td>
		            			<td>
		            				<input type="text" name="remarks" value="无" size="15" /><em>*</em>
		            			</td>
	            			</tr>
	            		</s:iterator>
	            		
	            		<br/>
	            		选择年月:<input type="text" id="datepicker" size="10" name="month"/><em>*</em>
            				&nbsp;&nbsp;
            			<input type="submit" id="submit" value="提交"/>
            			<br>
            		
            		</form>
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
<script type="text/javascript" src="js/jquery-1.11.1.js"></script>

<script type="text/javascript" src="jquery-ui/jquery-ui.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#submit").click(function(){
			if($("#datepicker").val().trim() == ''){
				alert("请选择工资的年月！");
				return false;
			}
		});
		
		$( "#datepicker" ).datepicker({
			dateFormat:"yy-mm",		
		});
	});
	
</script>

</body>
</html>
