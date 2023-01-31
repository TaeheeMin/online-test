<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>login</title>
	</head>
	<body>
		<!-- 메뉴 -->
		<div>
			<c:import url="/WEB-INF/view/inc/empMenu.jsp"></c:import>
		</div>
		
		<h3>로그인</h3>
		<form method="post" action="${pageContext.request.contextPath}/employee/loginEmp">
			<table border="1">
				<tr>
					<td>ID</td>
					<td><input type="text" name="empId"></td>
				</tr>
				<tr>
					<td>PASSWORD</td>
					<td><input type="password" name="empPw"></td>
				</tr>
			</table>
			<button type="submit">로그인</button>
		</form>
	</body>
</html>