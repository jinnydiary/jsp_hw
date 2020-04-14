<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="lecture1.form02.*"%>
<%
int id = 0;
String studentNumber = "";
String name = "";
int departmentId = 1;
int year = 0;
String error = null;
request.setCharacterEncoding("utf-8");
if (request.getMethod().equals("POST")) {
	id = Integer.parseInt(request.getParameter("id"));
	studentNumber = request.getParameter("studentNumber");
	name = request.getParameter("name");
	departmentId = Integer.parseInt(request.getParameter("departmentId"));
	year = Integer.parseInt(request.getParameter("year"));
	if (id == 0) {
		error = "ID를 입력하세요";
	} else if (studentNumber == null || studentNumber.length() == 0) {
		error = "학번을 입력하세요";
	} else if (name == null || name.length() == 0) {
		error = "이름을 입력하세요";
	} else if (year == 0) {
		error = "학년을 입력하세요";
	} else {
		Student student = new Student(id, studentNumber, name, departmentId, year);
		session.setAttribute("student", student);
		response.sendRedirect("studentCreate_success.jsp");
		return;
	}

}
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script src="https://kit.fontawesome.com/68abb170e0.js" crossorigin="anonymous"></script>
<title>Insert title here</title>
<style>
body { font-family: 굴림체; font-size: 10pt; }
div.container { width: 400px; margin: 20px auto; }
form, form div { margin-bottom: 20px; }
input.text { width : 200px; padding: 5px; }
select { width: 150px; padding: 5px; }
.btn { padding: 0.7em 2em; border: 1px solid #aaa; border-radius: 4px; 
         background: linear-gradient(#fff, #ddd); color: black;       
         font-family: 굴림체; font-size: 10pt; line-height: 1em;   
         text-decoration: none; cursor: pointer; display: inline-block; }
div.error { margin: 10px; padding: 10px 20px; background-color: #fdd; border: 1px solid #faa;}
</style>
</head>
<body>
	<div class="container">

		<form method="post">
			<h1>학생 등록</h1>
			<div>
			<label>ID</label><br>
			<input type="text" name="id" class="text" value="0">
			</div>
			
			<div>
			<label>학번</label><br>
			<input type="text" name="studentNumber" class="text">
			</div>
			
			<div>
			<label>이름</label><br>
			<input type="text" name="name" class="text">
			</div>
			
			<div>
			<label>학과</label><br>
			<select name="departmentId">
				<option value="1">소프트웨어공학과</option>
				<option value="2">컴퓨터공학과</option>
				<option value="3">정보통신공학과</option>
				<option value="4">글로컬IT학과</option>
			</select>
			</div>
			
			<div>
			<label>학년</label><br>
			<input type="text" name="year" class="text" value="0">
			</div>
			
			<button type="submit" class="btn">
				<i class="fas fa-user-plus"></i> 학생등록
			</button>
		</form>
		<% if(error != null) { %>
		     <div class = "error">
		                     학생등록 실패: <%=error %>
		     </div>
		<% } %>

	</div>
</body>
</html>