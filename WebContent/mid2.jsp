<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String number = request.getParameter("number");
if (number == null) {
	number = "one";
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
div {margin-bottom: 10px;}
input.text {padding: 5px;}
button {width: 50px;}
</style>
</head>
<body>
	<form>
		<div>
			<input type="radio" name="number" value="one" <%=("one".equals(number)) ? "checked" : ""%>>one
			<input type="radio" name="number" value="two" <%=("two".equals(number)) ? "checked" : ""%>>two
			<input type="radio" name="number" value="three" <%=("three".equals(number)) ? "checked" : ""%>>three
		</div>
		<div>
			<input type="text" class="text" value="<%=number%>" />
		</div>
		<button type="submit">Ok</button>
	</form>
</body>
</html>