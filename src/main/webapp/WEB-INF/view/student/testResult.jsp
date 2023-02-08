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
		<h3>${score}/${questionIdx}개</h3>
		<!-- 답 출력 -->
		<c:forEach var="a" items="${answer}">
			<c:if test="${a.exampleIdx == 1}">
				${a.questionIdx}. ${a.questionTitle}
			</c:if>
			<br>
			
			<c:if test="${a.exampleIdx == 1}">
				<c:choose>
					<c:when test="${a.exampleAnswer eq '정답' && a.answer == a.exampleIdx}">
						<span style="font-weight: bold;">
							&#10112; ${a.exampleContent} ${a.answerCk}
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
			</c:if>
			
			<c:if test="${a.exampleIdx == 2}">
				<c:choose>
					<c:when test="${a.exampleAnswer eq '정답' && a.answer == a.exampleIdx}">
						<span style="font-weight: bold;">
							&#10112; ${a.exampleContent} ${a.answerCk}
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
			</c:if>
			<c:if test="${a.exampleIdx == 3}">
				<c:choose>
					<c:when test="${a.exampleAnswer eq '정답' && a.answer == a.exampleIdx}">
						<span style="font-weight: bold;">
							&#10112; ${a.exampleContent} ${a.answerCk}
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
			</c:if>
			<c:if test="${a.exampleIdx == 4}">
				<c:choose>
					<c:when test="${a.exampleAnswer eq '정답' && a.answer == a.exampleIdx}">
						<span style="font-weight: bold;">
							&#10112; ${a.exampleContent} ${a.answerCk}
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
	</body>
</html>