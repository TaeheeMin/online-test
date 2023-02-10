<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>addEmp</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	</head>
	<body>
		<!-- 메뉴 -->
		<div>
			<c:import url="/WEB-INF/view/inc/empMenu.jsp"></c:import>
		</div>
		
		<h3>사원추가</h3>
		<div>
			<input type="text" id="id">
			<button type="button" id="idck">중복검사</button>
		</div>
		<form method="post" action="${pageContext.request.contextPath}/employee/addEmp">
			<table border="1">
				<tr>
					<td>ID</td>
					<td>
						<input type="text" name="empId" id="empId" readonly="readonly">
					</td>
				</tr>
				<tr>
					<td>PASSWORD</td>
					<td><input type="password" name="empPw"></td>
				</tr>
				<tr>
					<td>NAME</td>
					<td><input type="text" name="empName"></td>
				</tr>
			</table>
			<button type="submit">등록</button>
		</form>
	</body>
	<script>
		$('#idck').click(function() {
			console.log($('#id').val());
			
			$.ajax({
				url:'http://localhost/online-test/employee/idCheck'
				, type:'get'
				, data:{id:$('#id').val()}
				, success:function(model) { //model -> yes/no
					console.log(model)
					if(model =='YES') {
						// 사용가능
						  $('#empId').val($('#id').val());
					} else {
						// 사용불가능
						alert($('#id').val()+'는 사용중인 아이디입니다.');
					}
				}
			})
		});
	</script>
</html>