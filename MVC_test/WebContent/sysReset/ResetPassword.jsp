<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id="myDbBean" scope="page" class="org.etspace.abc.jdbc.DbBean"></jsp:useBean>
<%request.setCharacterEncoding("utf-8"); %>
<script type="text/javascript">
function check(theForm) {
	if (theForm.username.value=="") {
		alert("请输入用户名！");
		theForm.username.focus();
		return (false);
	}
	if (theForm.school.value=="") {
		alert("请输入学校！");
		theForm.school.focus();
		return (false);
	}
	return (true);
}
</script>
<html> 
<head>
<meta charset="UTF-8">
<title>重置密码</title>
</head>
<body>
	<div align="center">
		<h1> 重置密码 </h1>
		<div style=color:red>
			<%
			String error = (String)session.getAttribute("error");
			if (error != null && !error.equals("0")) { 
				out.print(error);
				session.setAttribute("error", "0");
			}
			%>
		</div>
		<form id="form1" name="form1" method="post" action="../ResetServlet"onSubmit="return check(this)">
			<table border="1">
			<tr><td>用户名</td><td><input name="username" type="text" id="username"/></td></tr>
			<tr><td>学校</td><td><input name="school" type="text" id="school"/></td></tr>
			</table>
			<input name="submit" type="submit" value="确定"/>
			<input name="reset"	type="reset" value="重置"/>
		</form>
		<a href="../index.jsp"> [返回] </a>
	</div>
</body>
</html>