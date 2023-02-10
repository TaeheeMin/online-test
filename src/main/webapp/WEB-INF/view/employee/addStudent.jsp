<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>addStudent</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	</head>
	<body>
		<!-- 메뉴 -->
		<div>
			<c:import url="/WEB-INF/view/inc/empMenu.jsp"></c:import>
		</div>
		
		<h3>학생추가</h3>
		<div>
			<input type="text" id="id">
			<button type="button" id="idck">중복검사</button>
		</div>
		<form method="post" action="${pageContext.request.contextPath}/employee/addStudent">
			<table border="1">
				<tr>
					<td>ID</td>
					<td>
						<input type="text" name="studentId" id="studentId" readonly="readonly">
					</td>
				</tr>
				<tr>
					<td>PASSWORD</td>
					<td><input type="password" name="studentPw" id="studentPw"></td>
				</tr>
				<tr>
					<td>NAME</td>
					<td><input type="text" name="studentName" id="studentName"></td>
				</tr>
			</table>
			<button type="submit">등록</button>
		</form>
		<script>
		$('#idck').click(function() {
			console.log($('#id').val())
			$.ajax({
				url:'http://localhost/online-test/student/idCheck'
				, type:'get'
				, data:{id:$('#id').val()}
				, success:function(model) { //model -> yes/no
					console.log(model)
					if(model =='YES') {
						// 사용가능
						  $('#studentId').val($('#id').val());
					} else {
						// 사용불가능
						alert($('#id').val()+'는 사용중인 아이디입니다.');
					}
				}
			})
		});
	</script>
	</body>
</html>