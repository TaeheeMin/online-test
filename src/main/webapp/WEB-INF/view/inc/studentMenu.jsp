<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div>
	<a href="${pageContext.request.contextPath}/student/studentMain">홈</a>
	<!-- 
		과거 응시 결과 : 리스트+점수 & 결시 확인 & 점수확인(paper 확인+정답확인)
		오늘 시험 응시 : 문제+보기(question x example) + 답안지 제출 paper
	 -->
	<a href="${pageContext.request.contextPath}/student/studentTestList">시험관리</a>
	<a href="${pageContext.request.contextPath}/student/modifyStudentPw">정보수정</a>
	<a href="${pageContext.request.contextPath}/student/logout">로그아웃</a>
	<a href="${pageContext.request.contextPath}/employee/empList">관리자</a>
	<a href="${pageContext.request.contextPath}/teacher/teacherMain">강사</a>
</div>
	