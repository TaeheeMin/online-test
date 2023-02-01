<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<!-- 메뉴 -->
		<div>
			<c:import url="/WEB-INF/view/inc/empMenu.jsp"></c:import>
		</div>
		<h3>${loginEmp.empName}님 비밀번호 수정</h3>
		<form method="post" action="${pageContext.request.contextPath}/employee/modifyEmpPw">
			<table border="1">
				<tr>
					<td>PASSWORD</td>
					<td><input type="password" name="oldPw"></td>
				</tr>
				<tr>
					<td>NEW PASSWORD</td>
					<td><input type="password" name="newPw"></td>
				</tr>
			</table>
			<button type="submit">수정</button>
		</form>
	</body>
</html>