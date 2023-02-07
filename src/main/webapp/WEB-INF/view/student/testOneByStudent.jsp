<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>${test.testTitle}</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/modalStyle.css">
		<c:forEach var="t" items="${list}">
			<c:if test="${t.exampleIdx == 1}">
				<script>
					$(document).ready(function(){
						$('#testBtn').click(function() {
							if($('input:radio[id=exampleAnswer${t.questionIdx}]').is(':checked')) { // 답 선택->체크 true
								let answer = $('input:radio[id=exampleAnswer${t.questionIdx}]:checked').val(); // 체크된 보기번호 저장
								$('#answer${t.questionIdx}').val(answer); // 히든값에 넣어줌
							}
							$('#testForm').submit();
						});
					});
				</script>
			</c:if>
		</c:forEach>
	</head>
	<body>
		<!-- 메뉴 -->
		<div>
			<c:import url="/WEB-INF/view/inc/studentMenu.jsp"></c:import>
		</div>
		
		<h3>${test.testTitle} 상세보기</h3>
		
		<!-- 문제 상세보기 -->
		<form id="testForm" method="post" action="${pageContext.request.contextPath}/student/addPaper">
			<c:forEach var="t" items="${list}">
				<c:if test="${t.exampleIdx == 1}">
					${t.questionIdx}. ${t.questionTitle}
					<input type="hidden" id="answer${t.questionIdx}" name="answer" value="">
					<input type="hidden" name="studentNo" value="${loginStudent.getStudentNo() }">
					<input type="hidden" name="questionNo" value="${t.questionNo}">
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
			<button type="button" id="testBtn">제출</button>
		</form>
		
		<!-- script -->
		<script src="${pageContext.request.contextPath}/resources/modalJs.js"></script>
	</body>
</html>