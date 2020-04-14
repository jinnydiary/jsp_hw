<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String n = request.getParameter("number");
int number = (n != null)?Integer.parseInt(n):0;
if(n != null) {
	number++;
}
%>
<form>
<input type="text" name="number" value="<%=number%>">
<input type="submit" value="++">
</form>
</body>
</html>