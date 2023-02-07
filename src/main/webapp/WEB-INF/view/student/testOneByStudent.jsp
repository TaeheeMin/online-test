<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>${test.testTitle}</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/modalStyle.css">
		<c:forEach var="i" begin="1" end="${questionCount}" step="1">
			<script>
				$(document).ready(function() {
					$('#questionBtn${i}').click(function() {
						let example${i} = document.querySelectorAll('.example${i}');
						console.log(example${i})
						$('#questionForm${i}').submit();
					});
				});
			</script>
		</c:forEach>
	</head>
	<body>
		<!-- 메뉴 -->
		<div>
			<c:import url="/WEB-INF/view/inc/studentMenu.jsp"></c:import>
		</div>
		
		<h3>${test.testTitle} 상세보기</h3>
		
		<div>
			<c:forEach var="t" items="${list}">
				<c:if test="${t.exampleIdx == 1}">
				    <button type="button" class="collapsible" onclick="collapse(this);">${t.questionIdx}. ${t.questionTitle}</button>
				</c:if>
			    <div class="content">
					<c:forEach var="t" begin="0" end="${list.size()}" step="1" items="${list}">
					    <c:if test="${t.exampleIdx == 1}">
							<input type="radio" id="exampleAnswer" name="examplAnswer" value="1">&#10112; ${t.exampleContent}
						</c:if>
						<c:if test="${t.exampleIdx == 2}">
							<input type="radio" id="exampleAnswer" name="examplAnswer" value="2">&#10113; ${t.exampleContent}
						</c:if>
						<c:if test="${t.exampleIdx == 3}">
							<input type="radio" id="exampleAnswer" name="examplAnswer" value="3">&#10114; ${t.exampleContent}
						</c:if>
						<c:if test="${t.exampleIdx == 4}">
							<input type="radio" id="exampleAnswer" name="examplAnswer" value="4">&#10115; ${t.exampleContent}
							<br>
						</c:if>
		   			</c:forEach>
			    </div>
			</c:forEach>
		</div>
		<hr>
		<!-- 문제 상세보기 -->
		<form method="post" action="${pageContext.request.contextPath}/student/addPaper">
			<c:forEach var="t" items="${list}">
				<c:if test="${t.exampleIdx == 1}">
					${t.questionIdx}. ${t.questionTitle}
				</c:if>
				<br>
				<input type="hidden" name="studentNo" value="${loginStudent.getStudentNo() }">
				<input type="hidden" name="questionNo" value="${t.questionNo }">
				<c:if test="${t.exampleIdx == 1}">
					<input type="radio" id="exampleAnswer" name="answer" value="1">&#10112; ${t.exampleContent}
				</c:if>
				<c:if test="${t.exampleIdx == 2}">
					<input type="radio" id="exampleAnswer" name="answer" value="2">&#10113; ${t.exampleContent}
				</c:if>
				<c:if test="${t.exampleIdx == 3}">
					<input type="radio" id="exampleAnswer" name="answer" value="3">&#10114; ${t.exampleContent}
				</c:if>
				<c:if test="${t.exampleIdx == 4}">
					<input type="radio" id="exampleAnswer" name="answer" value="4">&#10115; ${t.exampleContent}
					<br>
				</c:if>
			</c:forEach>
			<button type="submit">제출</button>
		
		</form>
		
		<!-- script -->
		<script src="${pageContext.request.contextPath}/resources/modalJs.js"></script>
	</body>
</html>