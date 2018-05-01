<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 폼</title>
<style>

</style>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script>	

	$(document).ready(function(){
		
		$('#loginForm').submit(function(){
			
			var uId = $('#member_id').val();
			var pw = $('#member_pw').val();
			
			// 아이디 값이 있는지 확인
			if(uId.length < 1){
				alert('아이디를 입력해주세요.');
				return false;
			}
			
			// 비밀번호값이 입력되었는지 확인
			if(pw.legth < 1){
				alert('비밀번호를 입력해주세요.');
				return false;
			}
			
			
		});
		
		
		
	});




	/* window.onload = function () {
		var loginForm = document.querySelector('#loginForm');
		var memberId = document.querySelector('#member_id');
		var pw = document.querySelector('#password'); 
		
		loginForm.onsubmit = function() {
			var memberIdValue = memberId.value;
			var passValue = pw.value;			
			if(memberIdValue.trim().length < 1 ){
				alert('아이디를 입력해주세요.');
				return false;
			}			
			if(passValue.trim().length<1){
				alert('비밀번호를 입력해주세요.');
				return false;
			}			
			return true;
		}
	}; */

</script>
</head>
<body>
<h1>로그인 폼</h1>
<form id="loginForm" action="login.do" method="post">
<table>
	<tr>
		<td>아이디(이메일)</td>
		<td><input id="member_id" type="text" name="member_id"> </td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><input id="member_pw" type="password" name="member_pw"> </td>
	</tr>
	<tr>
		<td></td>
		<td><input type="submit" value="로그인"> <input type="reset"> </td>
	</tr>
</table>
</form>















</body>
</html>