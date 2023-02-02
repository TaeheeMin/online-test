<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>addStudent</title>
	</head>
	<body>
		<!-- 메뉴 -->
		<div>
			<c:import url="/WEB-INF/view/inc/empMenu.jsp"></c:import>
		</div>
		
		<h3>학생추가</h3>
		<div>${errorMsg}</div>
		<form method="post" action="${pageContext.request.contextPath}/employee/addStudent">
			<table border="1">
				<tr>
					<td>ID</td>
					<td>
						<input type="text" name="StudentId">
					</td>
				</tr>
				<tr>
					<td>PASSWORD</td>
					<td><input type="password" name="StudentPw"></td>
				</tr>
				<tr>
					<td>NAME</td>
					<td><input type="text" name="StudentName"></td>
				</tr>
			</table>
			<button type="submit">등록</button>
		</form>
	</body>
</html>