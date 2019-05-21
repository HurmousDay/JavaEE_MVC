<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
	return (true);
}
</script>
<head>
<meta charset="UTF-8">
<title>用户登录</title>
</head>
<body>
	<div align="center">
		<form action="../LoginServletByDB" method="post" onSubmit="return check(this)">
			<h1>用户登录</h1> <br>
			<div style=color:red>
			<%
			String error = (String)session.getAttribute("error");
			if (error != null && !error.equals("0")) { 
				out.print(error);
				session.setAttribute("error", "0");
			}
			%>
			</div>
			<table>
			<tr><td align="right">用户名：</td><td><input type="text"name="username"></td></tr>
			<tr><td align="right">密码：</td><td><input type="password"name="password"></td></tr>
			</table>
			<br>
			<input type="submit" value="登录">
		</form>
		<a href="../index.jsp"> [返回] </a>
	</div>
	
</body>
</html>