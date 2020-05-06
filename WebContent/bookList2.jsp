<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.List, lecture1.midterm.*"%>
<%
String author = request.getParameter("author");
if(author == null) author = "";
List<Book> list = BookDAO.findByAuthor(author); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
div.container {width: 600px; margin: 50px auto;}
table {border-collapse: collapse; width: 600px; margin-top: 10px;}
th, td {border: 1px solid gray; padding: 4px;}
th {background-color: lightgray;}
td:nth-child(4) {text-align: center;}
button {width: 50px;}
</style>
</head>
<body>
	<div class="container">
	<h1>책목록</h1>
	<form>
	<label>저자</label>
	<input type="text" name="author" value="<%=author %>" placeholder="검색조건">
	<button type="submit">조회</button>
	</form>
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