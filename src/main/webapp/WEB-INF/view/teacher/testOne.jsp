<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>${test.testTitle}</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/style.css">
		<script>
			$(document).ready(function() {
				$('#questionCount').change(function() {
					$('#questionCountForm').submit();   
				});
			});
		</script>
		<c:forEach var="i" begin="${questionCount + 1}" end="10" step="1">
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
		<c:if test="${questionCount < 10}">
			<div>
				<c:forEach var="i" begin="${questionCount + 1}" end="10" step="1">
				    <button type="button" class="collapsible" onclick="collapse(this);">${i}번</button>
				    <div class="content">
				        <form id="questionForm${i}" method="post" action="${pageContext.request.contextPath}/teacher/addQuestion">
							<input type="hidden" name="testNo" value="${test.testNo}">
							<!-- 문제등록 -->
							<input type="hidden" class="questionIdx" name="questionIdx" value="${i}" readonly="readonly">
							<input type="text" class="questionTitle" name="questionTitle" placeholder="문제를 입력하세요">
							<!-- 보기등록 -->
							<br>
							<input type="radio" id="exampleAnswer" name="examplAnswer" value="1">&#10112;
							<input type="text" name="exampleContent" class="example${i}" placeholder="보기를 입력하세요">
							<input type="hidden" class="exampleIdx" name="exampleIdx" value="1" readonly="readonly">
							<br>
							<input type="radio" id="exampleAnswer" name="examplAnswer" value="2">&#10113; 
							<input type="text" name="exampleContent" class="example${i}" placeholder="보기를 입력하세요">
							<input type="hidden" class="exampleIdx" name="exampleIdx" value="2" readonly="readonly">
							<br>
							<input type="radio" id="exampleAnswer" name="examplAnswer" value="3">&#10114;
							<input type="text" name="exampleContent" class="example${i}" placeholder="보기를 입력하세요">
							<input type="hidden" class="exampleIdx" name="exampleIdx" value="3" readonly="readonly">
							<br>
							<input type="radio" id="exampleAnswer" name="examplAnswer" value="4">&#10115; 
							<input type="text" name="exampleContent" class="example${i}" placeholder="보기를 입력하세요">
							<input type="hidden" class="exampleIdx" name="exampleIdx" value="4" readonly="readonly">
							<br>
							<br>
							<button type="button" id="questionBtn${i}">등록</button>
						</form>
				    </div>
			    </c:forEach>
			</div>
		</c:if>
		
		<!-- 문제 상세보기 -->
		<div>
			<c:forEach var="t" items="${list}">
				<c:if test="${t.exampleIdx == 1}">
					${t.questionIdx}. ${t.questionTitle}
				</c:if>
				<br>
				<c:if test="${t.exampleIdx == 1}">
					<c:choose>
						<c:when test="${t.exampleAnswer eq '정답'}">
							<span style="font-weight: bold; color: red;">
								&#10112; ${t.exampleContent}
							</span> 
						</c:when>
						<c:otherwise>
							<span>
								&#10112; ${t.exampleContent}
							</span>
						</c:otherwise>
					</c:choose>
				</c:if>
				<c:if test="${t.exampleIdx == 2}">
					<c:choose>
						<c:when test="${t.exampleAnswer eq '정답'}">
							<span style="font-weight: bold; color: red;">
								&#10113; ${t.exampleContent}
							</span> 
						</c:when>
						<c:otherwise>
							<span>
								&#10113; ${t.exampleContent}
							</span>
						</c:otherwise>
					</c:choose>
				</c:if>
				<c:if test="${t.exampleIdx == 3}">
					<c:choose>
						<c:when test="${t.exampleAnswer eq '정답'}">
							<span style="font-weight: bold; color: red;">
								&#10114; ${t.exampleContent}
							</span> 
						</c:when>
						<c:otherwise>
							<span>
								&#10114; ${t.exampleContent}
							</span>
						</c:otherwise>
					</c:choose>
				</c:if>
				<c:if test="${t.exampleIdx == 4}">
					<c:choose>
						<c:when test="${t.exampleAnswer eq '정답'}">
							<span style="font-weight: bold; color: red;">
								&#10115; ${t.exampleContent}
							</span> 
						</c:when>
						<c:otherwise>
							<span>
								&#10115; ${t.exampleContent}
							</span>
						</c:otherwise>
					</c:choose>
					<br>
					<br>
				</c:if>
			</c:forEach>
		</div>
		
		<!-- script -->
		<script src="${pageContext.request.contextPath}/resources/js.js"></script>
	</body>
</html>