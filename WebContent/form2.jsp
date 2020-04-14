<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.cnt {padding:5px; margin:5px 0px;}
input.btn { padding: 0.4em 2em; margin-top: 10px; }
</style>
</head>
<body>
<%
String s1 = request.getParameter("s1");
%>
<form>
<div>
<select name="s1" class="cnt">
<option value="one" <%= "one".equals(s1) ? "selected" : "" %>>one</option>
<option value="two" <%= "two".equals(s1) ? "selected" : "" %>>two</option>
<option value="three" <%= "three".equals(s1) ? "selected" : "" %>>three</option>
</select>
</div>
<div>
<input type="text" value="<%=(s1 != null) ? s1 : "one" %> " class="cnt">
</div>
<input type="submit" value="Ok" class="btn">
</form>
</body>
</html>