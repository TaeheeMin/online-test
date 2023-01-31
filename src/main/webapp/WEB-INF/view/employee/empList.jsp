<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>empList</title>
	</head>
	<body>
		<h3>Employee List</h3>
		<table border="1">
			<tr>
				<td>번호</td>
				<td>아이디</td>
				<td>이름</td>
			</tr>
			<c:forEach var="e" items="${list}">
				<tr>
					<td>${e.empNo}</td>
					<td>${e.empId}</td>
					<td>${e.empName}</td>
				</tr>
		 	</c:forEach>
		</table>
		<div>
			<a href="${pageContext.request.contextPath}/employee/empList?currentPage=${currentPage-1}">이전</a>
			<a href="${pageContext.request.contextPath}/employee/empList?currentPage=1">처음</a>
			<a href="${pageContext.request.contextPath}/employee/empList?currentPage=${currentPage+1}">다음</a>
		</div>
	</body>
</html>