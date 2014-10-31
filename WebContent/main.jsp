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
	
	<title>首页</title>
	
	<link rel="stylesheet" href="css/style.css">

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
                   <li><a href="user/login-success.do">进入我的主页</a></li>
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
    	
      		<pre>右边</pre>
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
	          <div class="panel-heading">招聘信息</div>
	          <div class="panel-body">
	            <p>招聘啦！</p>
	          </div>
	        
	          <!-- Table -->
	          <table class="table table-bordered table-hover table-condensed">
	            <thead>
	                <tr>
	                   	<th>招聘信息标题</th> <th>岗位名称</th> <th>发布单位</th>
			  			<th>发布时间</th> <th>截止日期</th>  <th>查看详情</th>
	                </tr>
	            </thead>
	            <tbody>
	            	
	            	<s:if test="#request.pageUtil == null || #request.pageUtil.datas.size() == 0">
	            		没有招聘信息！
	            	</s:if>
	            	<s:else>
	            		<s:iterator value="#request.pageUtil.datas">
	            			<tr>
		            			<td>${title }</td> 
		            			<td>${postName }</td> 
		            			<td>${employer.name }</td>
		            			<td><s:date name="releaseDate" format="yyyy-MM-dd"/></td>
			  					<td><s:date name="endDate" format="yyyy-MM-dd"/></td>
			  					<td><a href="index-details.do?id=${id }">查看</a></td>
	            			</tr>
	            		</s:iterator>
	            	
	            	</s:else>
	            </tbody>
	          
	          </table>
	            <div class="panel-footer">
	          	 <ul class="pager">
	
	          	 	<li>当前页 ：<s:property value="page"/>&nbsp;&nbsp;</li>
	          	 	<li>总页数：<s:property value="#request.pageUtil.totalPage"/></li>
	          	 	
	          	 	<s:if test="page-1 > 0">
	          	 		<li><a href="index-list.do?page=<s:property value=" page-1 "/>" >上一页</a></li>
	          	 	</s:if>
			
					<s:set var="totalPage" value="#request.pageUtil.totalPage"></s:set>
					<%-- totalPage: <s:property value="#totalPage"/>--%>

	          	 	<s:if test="page+1 <= #totalPage">
				  		<li><a href="index-list.do?page=<s:property value=" page+1 "/>" >下一页</a></li>
	          	 	</s:if>

				</ul>
	          </div>
	         
	        </div> <!-- end of panel -->
      </div>
      
    
      
	</div>
    
   </div><!-- /.container -->
   
   <!-- 
   <div class="footer">
   </div>
 	-->
 
	<div class="bottom_box">
	    <div class="bottom">
	        <p> Copyright &copy; 2014 安徽农业大学学生资助管理中心All Rights Reserved 
	        <br>技术支持：<a href="gyhk.htm" target="_blank">嘿客科技传媒</a>.   联系邮箱：1784160856@qq.com</p>
	        <a href="register.jsp" target="_blank" class="register">
				<img src="img/btn_register.png" width="112" height="39" />
			</a>
	        <a href="login.jsp" class="ask">
				<img src="img/btn_ask.png" width="112" height="39" />
			</a>
	    </div>
	    <div class="close"></div>  
	</div>

	<img class="mini" src="img/mini.png" width="65" height="37" />

<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>

<script type="text/javascript">
$(function(){
	setTimeout(function(){
	  $(".bottom_box").slideDown("slow");
	},2000);

	$(".close").click(function(){
		$(".bottom_box").hide();	
		$(".mini").show(200);	
	})
	$(".mini").click(function(){
		$(this).hide();	
		$(".bottom_box").show();	
	})
});
</script>

</body>
</html>
