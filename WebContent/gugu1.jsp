<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>gugu1.jsp</title>
<style>
 table {border-collapse: collapse;}
 td {border: solid 1px gray;}
</style>
</head>
<body>
<table>
<%
for(int i=1; i<=9; i++) {
	out.print("<tr>");
	for(int j=2; j<=9; j++) {
		out.print("<td>"+ j + " x " + i + " = " + i*j + "</td>");
	}
	out.print("</tr>");
}
%>
</table>
</body>
</html>