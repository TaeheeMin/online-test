<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>empList</title>
	</head>
	<body>
		<!-- 메뉴 -->
		<div>
			<c:import url="/WEB-INF/view/inc/empMenu.jsp"></c:import>
		</div>
		
		<h3>Employee List</h3>
		<a href="${pageContext.request.contextPath}/employee/addEmp">사원등록</a>
		<table border="1">
			<tr>
				<td>아이디</td>
				<td>이름</td>
				<td>삭제</td>
			</tr>
			<c:forEach var="e" items="${list}">
				<tr>
					<td>${e.empId}</td>
					<td>${e.empName}</td>
					<td>
						<a href="${pageContext.request.contextPath}/employee/removeEmp?empNo=${e.empNo}">삭제</a>
					</td>
				</tr>
		 	</c:forEach>
		</table>
		
		<!-- 페이징 -->
		<div>
			<c:choose>
				<c:when test="${currentPage == 1}">
					<a href="${pageContext.request.contextPath}/employee/empList?currentPage=1">처음</a>
					<a href="${pageContext.request.contextPath}/employee/empList?currentPage=${currentPage+1}">다음</a>
				</c:when>
				<c:otherwise>
					<a href="${pageContext.request.contextPath}/employee/empList?currentPage=${currentPage-1}">이전</a>
					<a href="${pageContext.request.contextPath}/employee/empList?currentPage=1">처음</a>
					<a href="${pageContext.request.contextPath}/employee/empList?currentPage=${currentPage+1}">다음</a>
				</c:otherwise>
			</c:choose>
		</div>
	</body>
</html>