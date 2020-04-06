<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>gugu2.jsp</title>
<style>
 table {border-collapse: collapse;}
 td {border: solid 1px gray;}
</style>
</head>
<body>
<table>
<tr>
<%
for(int i=2; i<=9; i++) {
	out.print("<td>");
	for(int j=1; j<=9; j++) {
		out.print(i + " x " + j + " = " + i*j + "<br>");
	}
	out.print("</td>");
}
%>
</tr>
</table>
</body>
</html>