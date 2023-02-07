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
				$('#questionCount').change(function() {
					$('#questionCountForm').submit();   
				});
			});
		</script>
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
			<c:import url="/WEB-INF/view/inc/teacherMenu.jsp"></c:import>
		</div>
		
		<h3>${test.testTitle} 상세보기</h3>
		
		<!-- 문제 개수 -->
		<div>
			<form id="questionCountForm" method="get" action="${pageContext.request.contextPath}/teacher/testOne">
				<input type="hidden" name="testNo" value="${test.testNo}">
				<c:choose>
					<c:when test="${questionCount == 1}">
						<select name="questionCount" id="questionCount">
							<option value="1" selected="selected">1
							<option value="5">5
							<option value="10">10
						</select>
					</c:when>
					<c:when test="${questionCount == 5}">
						<select name="questionCount" id="questionCount">
							<option value="1">1
							<option value="5" selected="selected">5
							<option value="10">10
						</select>
					</c:when>
					<c:when test="${questionCount == 10}">
						<select name="questionCount" id="questionCount">
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
			<c:forEach var="i" begin="1" end="${questionCount}" step="1">
			    <button type="button" class="collapsible" onclick="collapse(this);">${i}번</button>
			    <div class="content">
			        <form id="questionForm${i}" method="post" action="${pageContext.request.contextPath}/teacher/addQuestion">
						<input type="hidden" name="testNo" value="${test.testNo}">
						<!-- 문제등록 -->
						<input type="hidden" class="questionIdx" name="questionIdx" value="${i}" readonly="readonly">
						<input type="text" class="questionTitle" name="questionTitle" placeholder="문제를 입력하세요">
						<!-- 보기등록 -->
						<br>
						1번
						<input type="text" name="exampleContent" class="example${i}" placeholder="보기를 입력하세요">
						<input type="hidden" class="exampleIdx" name="exampleIdx" value="1" readonly="readonly">
						<br>
						2번 
						<input type="text" name="exampleContent" class="example${i}" placeholder="보기를 입력하세요">
						<input type="hidden" class="exampleIdx" name="exampleIdx" value="2" readonly="readonly">
						<br>
						3번 
						<input type="text" name="exampleContent" class="example${i}" placeholder="보기를 입력하세요">
						<input type="hidden" class="exampleIdx" name="exampleIdx" value="3" readonly="readonly">
						<br>
						4번 
						<input type="text" name="exampleContent" class="example${i}" placeholder="보기를 입력하세요">
						<input type="hidden" class="exampleIdx" name="exampleIdx" value="4" readonly="readonly">
						<br>
						정답 
						<input type="radio" id="exampleAnswer" name="examplAnswer" value="1">1
						<input type="radio" id="exampleAnswer" name="examplAnswer" value="2">2
						<input type="radio" id="exampleAnswer" name="examplAnswer" value="3">3
						<input type="radio" id="exampleAnswer" name="examplAnswer" value="4">4
						<br>
						<button type="button" id="questionBtn${i}">등록</button>
					</form>
			    </div>
		    </c:forEach>
		</div>
		
		<!-- 문제 상세보기 -->
		<div>
			<h5>1번</h5>
			<c:forEach var="t" items="${list}">
				문제 ${t.questionIdx}번 ${t.questionTitle}<br>
			</c:forEach>
			<c:forEach var="t" items="${list}">
				보기 ${t.exampleIdx}	${t.exampleTitle} ${t.exampleAnswer} <br>
			</c:forEach>
		</div>
		
		<!-- script -->
		<script src="${pageContext.request.contextPath}/resources/modalJs.js"></script>
	</body>
</html>