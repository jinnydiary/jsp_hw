<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>gugu3.jsp</title>
<style>
 table {border-collapse: collapse;}
 td {border: solid 1px gray;}
</style>
</head>
<body>
<table>
<%
for(int i=2; i<=9; i++) {
	if( i == 2 || i == 6) {
		out.print("<tr>");
	}
	out.print("<td>");
	for(int j=1; j<=9; j++) {
		out.print(i + " x " + j + " = " + i*j + "<br>");
	}
	out.print("</td>");
	if( i == 5 || i == 9) {
		out.print("</tr>");
	}
}
%>
</table>
</body>
</html>