<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.List, lecture1.jdbc1.*"%>
<%
	List<User> list = UserDAO.findAll();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<style>
div.container {width: 600px; margin: 50px auto;}
table {border-collapse: collapse; width: 100%;}
thead th {background-color: #eee;}
th, td {padding: 4px; border: 1px solid lightgray;}
</style>
</head>
<body>
	<div class="container">
		<h1>사용자등록</h1>
		<table>
			<thead>
				<tr>
					<th>사용자아이디</th>
					<th>이름</th>
					<th>이메일</th>
					<th>학과</th>
					<th>사용자유형</th>
				</tr>
			</thead>
			<tbody>
				<% for (User user : list) {	%>
				<tr>
					<td><%=user.getUserid()%></td>
					<td><%=user.getName()%></td>
					<td><%=user.getEmail()%></td>
					<td><%=user.getDepartmentName()%></td>
					<td><%=user.getUserType()%>
				</tr>
				<% } %>
			</tbody>
		</table>
	</div>
</body>
</html>