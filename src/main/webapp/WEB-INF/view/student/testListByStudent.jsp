<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Test List</title>
	</head>
	<body>
		<!-- 메뉴 -->
		<div>
			<c:import url="/WEB-INF/view/inc/studentMenu.jsp"></c:import>
		</div>
		
		<h3>시험목록</h3>
		<form method="get" action="${pageContext.request.contextPath}/student/testListByStudent">
			<select name="rowPerPage">
				<option value="10">10
				<option value="20">20
				<option value="30">30
			</select>
			<button type="submit">검색</button>
		</form>
		<table border="1">
			<tr>
				<td>시험</td>
				<td>날짜</td>
				<td>결과</td>
			</tr>
			<c:forEach var="t" items="${list}">
				<tr>
					<td>
						<a href="${pageContext.request.contextPath}/student/testOneByStudent?testNo=${t.testNo}">${t.testTitle}</a>
					</td>
					<td>${t.testDate}</td>
					<td>
						<a href="${pageContext.request.contextPath}/student/testResult?testNo=${t.testNo}">보기</a>
					</td>
				</tr>
		 	</c:forEach>
		</table>
		
		<!-- 페이징 -->
		<div>
			<a href="${pageContext.request.contextPath}/student/testListByStudent?currentPage=1">HOME</a>
			<a href="${pageContext.request.contextPath}/student/testListByStudent?currentPage=${currentPage-1}">&#128072;</a>
			<c:forEach var="i" begin="${beginPage}" end="${endPage}" step="1">
				<span>
					<a href="${pageContext.request.contextPath}/student/testListByStudent?currentPage=${i}">${i}</a>
				</span>
			</c:forEach>
			<a href="${pageContext.request.contextPath}/student/testListByStudent?currentPage=${currentPage+1}">&#128073;</a>
			<a href="${pageContext.request.contextPath}/student/testListByStudent?rowPerPage=${rowPerPage}&currentPage=${lastPage}">END</a>
		</div>
	</body>
</html>