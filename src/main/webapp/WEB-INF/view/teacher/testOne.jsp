<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
	</head>
	<body>
		<!-- 메뉴 -->
		<div>
			<c:import url="/WEB-INF/view/inc/teacherMenu.jsp"></c:import>
		</div>
		
		<h3>상세보기</h3>
		<table border="1">
			<tr>
				<td>문제</td>
				<td>날짜</td>
				<td>수정/삭제</td>
			</tr>
			
			<c:forEach var="list" items="${list}">
				<tr>
					<td>${list.exampleTitle}</td>
					<td>
						<a href="">수정</a>
						<a href="">삭제</a>
					</td>
				</tr>
			</c:forEach>
		</table>
	</body>
</html>