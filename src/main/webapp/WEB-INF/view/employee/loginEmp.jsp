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
		<!-- 로그인 전 -->
		<c:if test="${loginEmp == null}">
			<h3>관리자 로그인</h3>
			<form method="post" action="${pageContext.request.contextPath}/loginEmp">
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
		</c:if>
		
		<!-- 로그인 후 -->
		<c:if test="${loginEmp != null}">
			<h3>${loginEmp.empName}님 반갑습니다.</h3>
		</c:if>
	</body>
</html>