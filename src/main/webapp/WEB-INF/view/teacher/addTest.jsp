<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>addTest</title>
	</head>
	<body>
		<!-- 메뉴 -->
		<div>
			<c:import url="/WEB-INF/view/inc/teacherMenu.jsp"></c:import>
		</div>
		
		<h3>시험 등록</h3>
		<div>${errorMsg}</div>
		<form method="post" action="${pageContext.request.contextPath}/teacher/addTest">
			<table border="1">
				<tr>
					<td>시험제목</td>
					<td>
						<input type="text" name="testTitle">
					</td>
				</tr>
				<tr>
					<td>날짜</td>
					<td><input type="date" name="testDate"></td>
				</tr>
			</table>
			<button type="submit">등록</button>
		</form>
	</body>
</html>