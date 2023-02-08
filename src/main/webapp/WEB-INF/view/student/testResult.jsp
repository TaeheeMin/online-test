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
				<c:forEach var="a" items="${answer}">
					<c:choose>
						<c:when test="${a.exampleIdx eq a.answer}">
							${a.questionIdx}번 정답 
						</c:when>
						<c:otherwise>
							<span style="font-weight: bold; color: blue;">
								&#10112; ${t.exampleContent}
							</span>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</c:if>
			
			<c:if test="${t.exampleIdx == 2}">
				<c:forEach var="a" items="${answer}">
					<c:choose>
						<c:when test="${a.exampleIdx eq t.exampleIdx}">
							<span style="font-weight: bold; color: red;">
								&#10113; ${t.exampleContent} 
							</span>
						</c:when>
						<c:otherwise>
							<span style="font-weight: bold; color: blue;">
								&#10113; ${t.exampleContent}
							</span>
						</c:otherwise>
					</c:choose>
				</c:forEach>
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
		<!-- 답 출력 -->
		<c:forEach var="a" items="${answer}">
			${a.questionIdx}번 정답-${a.exampleIdx} 고른답-${a.answer}<br>
			<c:choose>
				<c:when test="${a.exampleIdx eq a.answer}">
					${a.questionIdx}번 정답 
				</c:when>
				<c:otherwise>
					${a.questionIdx}번 오답
				</c:otherwise>
			</c:choose>
			<br>
				${a.questionIdx}. ${a.questionTitle}
			<br>
			<c:if test="${a.exampleIdx == 1}">
				&#10112; ${a.exampleContent}
			</c:if>
			<c:if test="${a.exampleIdx == 2}">
				&#10113; ${a.exampleContent}
			</c:if>
			<c:if test="${a.exampleIdx == 3}">
				&#10114; ${a.exampleContent}
			</c:if>
			<c:if test="${a.exampleIdx == 4}">
				&#10115; ${a.exampleContent}
				<br>
				<br>
			</c:if>
			
		</c:forEach>
	</body>
</html>