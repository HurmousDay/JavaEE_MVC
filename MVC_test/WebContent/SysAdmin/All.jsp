<%@ page language="java" contentType="text/html; charset=UTF-8 "
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id="myDbBean" scope="page" class="org.etspace.abc.jdbc.DbBean"></jsp:useBean>
<%request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>信息维护</title>
</head>
<body>
	<div align="center">
	<h1>信息维护</h1>
	<%
		String pageNo = request.getParameter("pageno");
		int pageSize=3;
		int pageCount;
		int rowCount;
		int pageCurrent;
		int rowCurrent;
		if (pageNo == null || pageNo.trim().length()==0) {
			pageCurrent = 1;
		}else {
			pageCurrent=Integer.parseInt(pageNo);
		}
		
		try {
			myDbBean.openConnection();	
			String sql = "select*from user";
			ResultSet rs = myDbBean.executeQuery(sql);
			rs.last();
			rowCount = rs.getRow();
			pageCount = (rowCount + pageSize-1)/pageSize;
			if (pageCurrent>pageCount) pageCurrent=pageCount;
			if (pageCurrent<1) 		   pageCurrent=1;
	%>
		<table border="1">
		<tr><td>用户名</td><td>性别</td><td>学校</td><td>操作</td>
	<%		
			rs.beforeFirst();
			rowCurrent=1;
			while (rs.next()) {
				if(rowCurrent>(pageCurrent-1)*pageSize && rowCurrent<=pageCurrent*pageSize) {
					String username = rs.getString("username");
					String sex = rs.getString("sex");
					String school = rs.getString("school");
	%>
		<tr><td><%=username%></td><td><%=sex %></td><td><%=school %></td>
		<td><a href="Info.jsp?username=<%=username %>">详情</a>
		<a href="Update.jsp?username=<%=username %> ">修改</a>
		<a href="Delete.jsp?username=<%=username %> ">删除</a>
		</td></tr>
	<%
				}
				rowCurrent++;
			}
	%>
		</table>
			<p align="center">
			<form method="POST" action="All.jsp">	
				第<%=pageCurrent %>页 共<%=pageCount %>页&nbsp;
				<%if(pageCurrent > 1) { %>
				<a href="All.jsp?&pageno=1">首页</a>
				<a href="All.jsp?&pageno=<%=pageCurrent-1 %>">上一页</a>
				<%} %>
				&nbsp;
				<%if(pageCurrent<pageCount) { %> 
				<a href="All.jsp?&pageno=<%=pageCurrent+1 %>">下一页</a>
				<a href="All.jsp?&pageno=<%=pageCount %>">尾页</a>
				<%} %>
				&nbsp;
			</form>
	<%		
			myDbBean.closeConnection();
		}
		catch(SQLException e) {
			out.println(e.getMessage());
		}
		catch(Exception e) {
			out.println(e.toString());
		}
		
	%>
	<a href="../index.jsp"> [返回主界面] </a>
	<a href="All.jsp"> [返回管理员界面] </a>
	</div>
	
</body>
</html>