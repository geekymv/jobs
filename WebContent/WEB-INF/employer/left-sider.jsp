<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>左菜单</title>

	<link href="css/zzsc.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
	<script src="js/showlist.js" type="text/javascript"></script>

  </head>
  
  <body>
   		<div class="left-sider">
	      <div class="operate">
	        <ul id="J_navlist">
	          <li>
	            <h4 >个人资料</h4>
	            <div class="list-item none">
	              <p ><a href="employer/emp-empInfo.do" target="_self">查看资料</a></p>
	              <p ><a href="employer/update-preUpdatePwd.do" target="_self">修改密码</a></p>
	            </div>
	          </li>
	          <li >
	            <h4 >招聘管理</h4>
	            <div class="list-item none">
	              <p ><a href="employer/emp-recruitList.do" target="_self">招聘列表</a></p>
	              <p ><a href="employer/publish.do" target="_self">发布招聘</a></p>
	            </div>
	          </li>
	          <li >
	            <h4 >学生管理</h4>
	            <div class="list-item none">
	              <p ><a href="employer/stu-listStudent.do" target="_self">学生列表</a></p>
	            </div>
	          </li>
	          <li >
	            <h4 >工资管理</h4>
	            <div class="list-item none">
	              <p ><a href="employer/emp-stuList.do" target="_self">发放工资</a></p>
	              <p ><a href="employer/salary-list.do" target="_self">工资列表</a></p>
	              <p ><a href="employer/emp-preLoadSalary.do">下载工资表</a></p>
	            </div>
	          </li>
	        </ul>
	        <script type="text/javascript">
				navList(1);
			</script>
	      </div>
	   </div>
  </body>
</html>
