<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.*" %>
<jsp:useBean id="myDbBean" scope="page" class="org.etspace.abc.jdbc.DbBean"></jsp:useBean>
<%request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>用户信息</title>
</head>
<body>
<div align="center">
	<h1> 用户信息  </h1>
	<%
		myDbBean.openConnection();
		String username = request.getParameter("username").trim();
		String sql = "select*from user where username = '"+username+"';";
		ResultSet rs = myDbBean.executeQuery(sql);
		rs.next();
		
		String password = rs.getString("password");
		String sex = rs.getString("sex");
		String school = rs.getString("school");
		myDbBean.closeConnection();
	%>
	
	<table border="1">
	<tr><td>用户名：</td><td><%=username %></td></tr>
	<tr><td>密码：</td><td><%=password %></td></tr>
	<tr><td>性别：</td><td><%=sex %></td></tr>
	<tr><td>学校：</td><td><%=school %></td></tr>
	</table>
	<br>
	<a href="../index.jsp"> [返回主界面] </a>
	<a href="All.jsp"> [返回管理员界面] </a>
</div>
</body>
</html>