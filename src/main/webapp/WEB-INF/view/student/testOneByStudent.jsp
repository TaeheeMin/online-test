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
		
		<!-- 문제 상세보기 -->
		<div>
			<c:if test="${empty answer}">
				<h3>${test.testTitle} 상세보기</h3>
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
					<button id="testBtn">제출</button>
				</form>
			</c:if>
		</div>
		
		<hr>
		
		<!-- 시험결과 -->
		<c:if test="${answer != null}">
			<div>
				<h3>${test.testTitle} 결과보기</h3>
				<h2>${score}/${questionCount}개</h2>
				<!-- 답 출력 -->
				<c:forEach var="a" items="${answer}">
					<c:if test="${a.exampleIdx == 1}">
						<c:choose>
							<c:when test="${a.answerCk eq '정답'}">
								<span>
									${a.questionIdx}. ${a.questionTitle} &#11093;
								</span> 
							</c:when>
							<c:otherwise>
								<span style="font-weight: bold; color: red;">
									&#128204; ${a.questionIdx}. ${a.questionTitle} 
								</span>
							</c:otherwise>
						</c:choose>
					</c:if>
					<br>
					
					<c:if test="${a.exampleIdx == 1}">
						<c:choose>
							<c:when test="${a.exampleAnswer eq '정답' && a.answer == a.exampleIdx}">
								<span style="font-weight: bold;">
									&#10112; ${a.exampleContent}
								</span> 
							</c:when>
							<c:when test="${a.exampleAnswer eq '오답' && a.answer == a.exampleIdx}">
								<span style="font-weight: bold; color: blue;">
									&#10112; ${a.exampleContent} 오답
								</span>
							</c:when>
							<c:when test="${a.exampleAnswer eq '정답' && a.answer != a.exampleIdx}">
								<span style="font-weight: bold; color: red;">
									&#10112; ${a.exampleContent}
								</span>
							</c:when>
							<c:otherwise>
								<span>
									&#10112; ${a.exampleContent}
								</span>
							</c:otherwise>
						</c:choose>
					</c:if>
					
					<c:if test="${a.exampleIdx == 2}">
						<c:choose>
							<c:when test="${a.exampleAnswer eq '정답' && a.answer == a.exampleIdx}">
								<span style="font-weight: bold;">
									&#10113; ${a.exampleContent}
								</span> 
							</c:when>
							<c:when test="${a.exampleAnswer eq '오답' && a.answer == a.exampleIdx}">
								<span style="font-weight: bold; color: blue;">
									&#10113; ${a.exampleContent} 오답
								</span>
							</c:when>
							<c:when test="${a.exampleAnswer eq '정답' && a.answer != a.exampleIdx}">
								<span style="font-weight: bold; color: red;">
									&#10113; ${a.exampleContent}
								</span>
							</c:when>
							<c:otherwise>
								<span>
									&#10113; ${a.exampleContent}
								</span>
							</c:otherwise>
						</c:choose>
					</c:if>
					<c:if test="${a.exampleIdx == 3}">
						<c:choose>
							<c:when test="${a.exampleAnswer eq '정답' && a.answer == a.exampleIdx}">
								<span style="font-weight: bold;">
									&#10114; ${a.exampleContent}
								</span> 
							</c:when>
							<c:when test="${a.exampleAnswer eq '오답' && a.answer == a.exampleIdx}">
								<span style="font-weight: bold; color: blue;">
									&#10114; ${a.exampleContent} 오답
								</span>
							</c:when>
							<c:when test="${a.exampleAnswer eq '정답' && a.answer != a.exampleIdx}">
								<span style="font-weight: bold; color: red;">
									&#10114; ${a.exampleContent}
								</span>
							</c:when>
							<c:otherwise>
								<span>
									&#10114; ${a.exampleContent}
								</span>
							</c:otherwise>
						</c:choose>
					</c:if>
					<c:if test="${a.exampleIdx == 4}">
						<c:choose>
							<c:when test="${a.exampleAnswer eq '정답' && a.answer == a.exampleIdx}">
								<span style="font-weight: bold;">
									&#10115; ${a.exampleContent}
								</span> 
							</c:when>
							<c:when test="${a.exampleAnswer eq '오답' && a.answer == a.exampleIdx}">
								<span style="font-weight: bold; color: blue;">
									&#10115; ${a.exampleContent} 오답
								</span>
							</c:when>
							<c:when test="${a.exampleAnswer eq '정답' && a.answer != a.exampleIdx}">
								<span style="font-weight: bold; color: red;">
									&#10115; ${a.exampleContent}
								</span>
							</c:when>
							<c:otherwise>
								<span>
									&#10115; ${a.exampleContent}
								</span>
							</c:otherwise>
						</c:choose>
						<br>
						<br>
					</c:if>
				</c:forEach>
			</div>
		</c:if>
	</body>
</html>