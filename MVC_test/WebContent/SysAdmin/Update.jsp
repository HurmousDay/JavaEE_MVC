<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.*" %>
<jsp:useBean id="myDbBean" scope="page" class="org.etspace.abc.jdbc.DbBean"></jsp:useBean>
<%request.setCharacterEncoding("utf-8"); %>
<script type="text/javascript">
function check(theForm) {
	if (theForm.username.value=="") {
		alert("请输入用户名！");
		theForm.username.focus();
		return (false);
	}
	if (theForm.password.value=="") {
		alert("请输入密码！");
		theForm.password.focus();
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
<title>注册信息</title>
</head>
<body>
	<%
		String username = request.getParameter("username");
		myDbBean.openConnection();	
		String sql = "select*from user where username = '" + username + "';";
		ResultSet rs = myDbBean.executeQuery(sql);
		rs.next();
		String password = rs.getString("password");
		String sex = rs.getString("sex");
		String school = rs.getString("school");
	%>
	
	<div align="center">
		<h1> 用户修改  </h1>
		<form id="form1" name="form1" method="post" action="UpdateCheck.jsp"onSubmit="return check(this)">
			<table border="1">
			<tr><td>用户名</td><td><input name="username" type="text" id="username" value=<%=username%> readonly></td></tr>
			<tr><td>密码</td><td><input name="password" type="text" id="password" value=<%=password %>></td></tr>
			<tr><td>性别</td><td> 
				<input type="radio" name="sex" value="男" <%if(sex.equals("男")) { %>checked="checked" <%} %>/>男
				<input type="radio" name="sex" value="女" <%if(sex.equals("女")) { %>checked="checked" <%} %>/>女 </td></tr> 	
			<tr><td>学校</td><td><input name="school" type="text" id="school"value=<%=school %>></td></tr>
			</table>
			<input name="submit" type="submit" value="确定"/>
			<input name="reset"	type="reset" value="重置"/>
		</form>
		<a href="../index.jsp"> [返回主界面] </a>
		<a href="All.jsp"> [返回管理员界面] </a>
	</div>
</body>
</html>