<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>문제등록</title>
	</head>
	<body>
		<!-- 메뉴 -->
		<div>
			<c:import url="/WEB-INF/view/inc/teacherMenu.jsp"></c:import>
		</div>
		
		<!-- 문제 -->
		<h3>문제 등록</h3>
		<!-- 문제 개수 -->
		<form method="get" action="${pageContext.request.contextPath}/teacher/addQuestion">
			<select name="questionCount">
				<option value="1">1
				<option value="5">5
				<option value="10">10
			</select>
			<button type="submit">만들기</button>
		</form>
		
		<form method="post" action="${pageContext.request.contextPath}/teacher/addQuestion">
			<c:forEach var="i" begin="1" end="${questionCount}" step="1">
				<div>
					번호 : <input type="hidden" name="questionIdx" value="${i}" readonly="readonly">${i} 번
					<br>
					제목 : <input type="text" name="questionTitle">
					<br>
					보기 : <a href="${pageContext.request.contextPath}/teacher/addQuestion?testNo=${testNo}">보기등록</a>
				</div>
				<hr>
				<button type="submit" name="">등록</button>
			</c:forEach>
		</form>
	</body>
</html>