<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
 String n = request.getParameter("number");
 int number = (n == null) ? 0 : Integer.parseInt(n);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
div {margin-bottom: 10px;}
input {padding: 2px;}
button {width: 50px;}
table {border-collapse: collapse; width: 150px;}
td {padding: 2px; border: 1px solid gray;}
</style>
</head>
<body>
<div>
<form>
<input type="text" name="number" value="<%=number%>"/>
<button type="submit">단</button>
</form>
</div>
<table>
<% for(int i=1; i<=9; ++i) { %>
<tr>
<td><%=number %> x <%=i %> = <%=number * i %></td>
</tr>
<% } %>
</table>
</body>
</html>