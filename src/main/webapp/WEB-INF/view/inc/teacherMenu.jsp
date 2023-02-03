<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div>
	<a href="${pageContext.request.contextPath}/teacher/teacherMain">홈</a>

	<!-- 시험관리 : 시험회차 클릭 -> 문제 리스트 출력(문제 CRUD) -->
	<a href="${pageContext.request.contextPath}/teacher/testList">시험관리</a>
	
	<a href="${pageContext.request.contextPath}/teacher/modifyTeacherPw">정보수정</a>
	<a href="${pageContext.request.contextPath}/teacher/logout">로그아웃</a>
	<a href="${pageContext.request.contextPath}/employee/empList">관리자</a>
	<a href="${pageContext.request.contextPath}/student/loginStudent">학생</a>
</div>
	