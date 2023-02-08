<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>${test.testTitle}</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/modalStyle.css">
		<script>
			$(document).ready(function() {
				$('#question').change(function() {
					$('#questionCountForm').submit();   
				});
			});
		</script>
		<script>
			$(document).ready(function() {
				$('#questionBtn').click(function() {
					let example = document.querySelectorAll('.example');
					console.log(example)
					$('#questionForm').submit();
				});
			});
		</script>
	</head>
	<body>
		<!-- 메뉴 -->
		<div>
			<c:import url="/WEB-INF/view/inc/teacherMenu.jsp"></c:import>
		</div>
		
		<h3>${test.testTitle}</h3>
		
		<!-- 문제 개수 -->
		<c:if test="${questionCount < 10}">
			<div>
				<form id="questionCountForm" method="get" action="${pageContext.request.contextPath}/teacher/testOne">
					<input type="hidden" name="testNo" value="${test.testNo}">
					<c:choose>
						<c:when test="${question == 1}">
							<select name="question" id="questionCount">
								<option value="1" selected="selected">1
								<option value="5">5
								<option value="10">10
							</select>
						</c:when>
						<c:when test="${question == 5}">
							<select name="question" id="questionCount">
								<option value="1">1
								<option value="5" selected="selected">5
								<option value="10">10
							</select>
						</c:when>
						<c:when test="${question == 10}">
							<select name="question" id="questionCount">
								<option value="1">1
								<option value="5">5
								<option value="10" selected="selected">10
							</select>
						</c:when>
					</c:choose>
				</form>
			</div>
			<br>
			<div>
			    <button type="button" class="collapsible" onclick="collapse(this);">${questionCount+1}번 문제등록</button>
			    <div class="content">
			        <form id="questionForm" method="post" action="${pageContext.request.contextPath}/teacher/addQuestion">
						<input type="hidden" name="testNo" value="${test.testNo}">
						<!-- 문제등록 -->
						<input type="hidden" class="questionIdx" name="questionIdx" value="${questionCount+1}" readonly="readonly">
						<input type="text" class="questionTitle" name="questionTitle" placeholder="문제를 입력하세요">
						<!-- 보기등록 -->
						<br>
						&#10112;
						<input type="text" name="exampleContent" class="example" placeholder="보기를 입력하세요">
						<input type="hidden" class="exampleIdx" name="exampleIdx" value="1" readonly="readonly">
						<br>
						&#10113;
						<input type="text" name="exampleContent" class="example" placeholder="보기를 입력하세요">
						<input type="hidden" class="exampleIdx" name="exampleIdx" value="2" readonly="readonly">
						<br>
						&#10114; 
						<input type="text" name="exampleContent" class="example" placeholder="보기를 입력하세요">
						<input type="hidden" class="exampleIdx" name="exampleIdx" value="3" readonly="readonly">
						<br>
						&#10115;
						<input type="text" name="exampleContent" class="example" placeholder="보기를 입력하세요">
						<input type="hidden" class="exampleIdx" name="exampleIdx" value="4" readonly="readonly">
						<br>
						정답 
						<input type="radio" id="exampleAnswer" name="examplAnswer" value="1">1
						<input type="radio" id="exampleAnswer" name="examplAnswer" value="2">2
						<input type="radio" id="exampleAnswer" name="examplAnswer" value="3">3
						<input type="radio" id="exampleAnswer" name="examplAnswer" value="4">4
						<br>
						<button type="button" id="questionBtn">등록</button>
					</form>
			    </div>
			</div>
		</c:if>
		
		<!-- 문제 상세보기 -->
		<c:forEach var="t" items="${list}">
			<c:if test="${t.exampleIdx == 1}">
				${t.questionIdx}. ${t.questionTitle}
			</c:if>
			<br>
			<c:choose>
				<c:when test="${t.exampleIdx == 1}">
					&#10112; ${t.exampleContent}
				</c:when>
				<c:when test="${t.exampleIdx == 2}">
					&#10113; ${t.exampleContent}
				</c:when>
				<c:when test="${t.exampleIdx == 3}">
					&#10114; ${t.exampleContent}
				</c:when>
				<c:when test="${t.exampleIdx == 4}">
					&#10115; ${t.exampleContent}
					<br>
					<br>
				</c:when>
			</c:choose>
		</c:forEach>
		<br>
		
		<!-- 답 출력 -->
		<c:forEach var="a" items="${answer}">
			${a.questionIdx}번 ${a.exampleIdx}<br>
		</c:forEach>
		
		<!-- script -->
		<script src="${pageContext.request.contextPath}/resources/modalJs.js"></script>
	</body>
</html>