<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Teacher List</title>
	</head>
	<body>
		<!-- 메뉴 -->
		<div>
			<c:import url="/WEB-INF/view/inc/empMenu.jsp"></c:import>
		</div>
		
		<h3>Teacher List</h3>
		<a href="${pageContext.request.contextPath}/employee/addTeacher">강사등록</a>
		<form method="post" action="${pageContext.request.contextPath}/employee/teacherList">
			<select name="rowPerPage">
				<option value="10">10
				<option value="20">20
				<option value="30">30
			</select>
			<input name="word" placeholder="강사 이름 검색">
			<button type="submit">검색</button>
		</form>
		<table border="1">
			<tr>
				<td>아이디</td>
				<td>이름</td>
				<td>삭제</td>
			</tr>
			<c:forEach var="t" items="${list}">
				<tr>
					<td>${t.teacherId}</td>
					<td>${t.teacherName}</td>
					<td>
						<a href="${pageContext.request.contextPath}/employee/removeTeacher?teacherNo=${t.teacherNo}">삭제</a>
					</td>
				</tr>
		 	</c:forEach>
		</table>
		
		<!-- 페이징 -->
		<div>
			<c:choose>
				<c:when test="${currentPage == 1}">
					<a href="${pageContext.request.contextPath}/employee/teacherList?currentPage=1">처음</a>
					<a href="${pageContext.request.contextPath}/employee/teacherList?currentPage=${currentPage+1}">다음</a>
				</c:when>
				<c:otherwise>
					<a href="${pageContext.request.contextPath}/employee/teacherList?currentPage=${currentPage-1}">이전</a>
					<a href="${pageContext.request.contextPath}/employee/teacherList?currentPage=1">처음</a>
					<a href="${pageContext.request.contextPath}/employee/teacherList?currentPage=${currentPage+1}">다음</a>
				</c:otherwise>
			</c:choose>
		</div>
	</body>
</html>