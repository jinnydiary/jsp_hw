<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.List, lecture1.midterm.*"%>
<% List<Book> list = BookDAO.findAll(); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
div.container {width: 600px; margin: 50px auto;}
table {border-collapse: collapse; width: 600px;}
th, td {border: 1px solid gray; padding: 4px;}
th {background-color: lightgray;}
td:nth-child(4) {text-align: center;}
</style>
</head>
<body>
	<div class="container">
	<h1>책목록</h1>
		<table>
			<thead>
				<tr>
					<th>id</th>
					<th>제목</th>
					<th>저자</th>
					<th>카테고리</th>
					<th>가격</th>
					<th>출판사</th>
				</tr>
			</thead>
			<tbody>
				<% for (Book book : list) {	%>
				<tr>
					<td><%=book.getId()%></td>
					<td><%=book.getTitle()%></td>
					<td><%=book.getAuthor()%></td>
					<td><%=book.getCategoryName()%></td>
					<td><%=book.getPrice()%></td>
					<td><%=book.getPublisher()%></td>
				</tr>
				<% } %>
			</tbody>
		</table>
	</div>
</body>
</html>