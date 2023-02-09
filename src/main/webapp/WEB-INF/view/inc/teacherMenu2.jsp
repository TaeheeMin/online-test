<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<a href="${pageContext.request.contextPath}/teacher/teacherMain">홈</a>
						
<!-- 시험관리 : 시험회차 클릭 -> 문제 리스트 출력(문제 CRUD) -->
<a href="${pageContext.request.contextPath}/teacher/testList">시험관리</a>

<a href="${pageContext.request.contextPath}/teacher/modifyTeacherPw">정보수정</a>
<a href="${pageContext.request.contextPath}/teacher/logout">로그아웃</a>
<a href="${pageContext.request.contextPath}/employee/empList">관리자</a>
<a href="${pageContext.request.contextPath}/student/loginStudent">학생</a>
</body>
</html>