<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>${test.testTitle}</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	</head>
	<body>
		<!-- 메뉴 -->
		<div>
			<c:import url="/WEB-INF/view/inc/studentMenu.jsp"></c:import>
		</div>
		
		<h3>${test.testTitle} 결과보기</h3>
		
		<!-- 문제 상세보기 -->
		<c:forEach var="t" items="${list}">
			<c:if test="${t.exampleIdx == 1}">
				${t.questionIdx}. ${t.questionTitle}
			</c:if>
			<br>
			<c:if test="${t.exampleIdx == 1}">
				<input type="radio" id="exampleAnswer${t.questionIdx}" name="answer${t.questionIdx}" value="1">&#10112; ${t.exampleContent}
			</c:if>
			<c:if test="${t.exampleIdx == 2}">
				<input type="radio" id="exampleAnswer${t.questionIdx}" name="answer${t.questionIdx}" value="2">&#10113; ${t.exampleContent}
			</c:if>
			<c:if test="${t.exampleIdx == 3}">
				<input type="radio" id="exampleAnswer${t.questionIdx}" name="answer${t.questionIdx}" value="3">&#10114; ${t.exampleContent}
			</c:if>
			<c:if test="${t.exampleIdx == 4}">
				<input type="radio" id="exampleAnswer${t.questionIdx}" name="answer${t.questionIdx}" value="4">&#10115; ${t.exampleContent}
				<br>
				<br>
			</c:if>
		</c:forEach>
		<br>
		
	</body>
</html>