<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String name = "";
String gender = null;
String errmsg = null;
request.setCharacterEncoding("utf-8");
if (request.getMethod().equals("POST")) {
	name = request.getParameter("name");
	gender = request.getParameter("gender");
	if (name == null || name.length() == 0) {
		errmsg = "이름을 입력하세요";
	} else if (gender == null || gender.length() == 0) {
		errmsg = "성별을 입력하세요";
	}
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table { border-collapse: collapse; width: 400px; }
td { padding: 3px; border: 1px solid gray; }
div { margin-bottom: 20px;}
div.container {margin-bottom: 40px;}
input.text {padding: 5px; width: 200px;}
div.err { margin: 10px;	padding: 10px 20px; background-color: #fdd; border: 1px solid #faa; }
button {padding: 5px; width: 100px;}
</style>
</head>
<body>
	<div class="container">
		<form method="post">
			<h1>회원 등록</h1>
			<div>
				<label>이름</label><br>
				<input type="text" class="text" name="name" value="<%=name%>">
			</div>
			<div>
				<label>성별</label><br>
				<input type="radio" name="gender" value="남자" <%=("남자".equals(gender)) ? "checked" : "" %>>남자<br>
				<input type="radio" name="gender" value="여자" <%=("여자".equals(gender)) ? "checked" : "" %>>여자
			</div>
			<button type="submit">회원 등록</button>
		</form>
		<%
			if (errmsg != null) {
		%>
		<div class="err">
			회원등록 실패 :
			<%=errmsg%>
		</div>
		<%
			}
		%>
	</div>
	<table>
		<tr>
			<td>이름</td>
			<td><%=name%></td>
		</tr>
		<tr>
			<td>성별</td>
			<td><%=gender%></td>
		</tr>
	</table>
</body>
</html>