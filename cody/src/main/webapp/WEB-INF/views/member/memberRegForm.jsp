<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입 폼</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script>
	$(document).ready(function(){
		
		// 사용자가 입력하는 데이터의 유효성 검사
		$('#regForm').submit(function(){
			
			var userId = $('#member_id').val();
			var pw = $('#member_pw').val();
			var userName = $('#member_name').val();
			var userbirth = ${'#member_birth'}.val();
			var useremail = ${'#member_email'}.val();
			var userph = ${'#member_ph'}.val();
			
		
			
			
			if(userId.length < 1){
				alert('아이디를 입력해주세요.');
				$('#member_id').focus();
				return false;
			}
			if(pw.length < 1){
				alert('비밀번호를 입력해주세요.');
				$('#member_pw').focus();
				return false;
			}
			if(userName.length < 1 ){
				alert('회원명을 입력해주세요.');
				$('#member_name').focus();
				return false;
			}
			if(userbirth.length < 1 ){
				alert('생일을 입력해주세요.');
				$('#member_birth').focus();
				return false;
			}
			if(useremail.length < 1 ){
				alert('이메일을 입력해주세요.');
				$('##member_email').focus();
				return false;
			}
			if(userph.length < 1 ){
				alert('전화번호를 입력해주세요.');
				$('#member_ph').focus();
				return false;
			}
			
			
		});
		
		// 아이디 입력시 사용 유무 확인 체크 : 서버쪽에 확인 요청
		$('#member_id').focusout(function(){
			
			var memberId = $(this).val();
			
			if(memberId.length > 5){
				
				$.ajax({
					url : '/cody/member/idchk',
					type : 'post',
					dataType : 'text',
					data : {
						userid : memberId
					},
					success : function(data){
						if(data == "Y"){
							$('#idChkMsg').text('사용가능한 아이디입니다.');
							$('#idChkMsg').css('color', 'blue');
						} else if(data == 'N') {
							$('#idChkMsg').text('이미 사용중인 아이디입니다.');
							$('#idChkMsg').css('color', 'red');
						}
					}					
				});
				
				
			} else {
				$('#idChkMsg').text('아이디는 6자 이상이어야 합니다.');
			}
			
		});
		

	
	});

</script>
<style>

</style>
</head>
<body>

<h1>회원가입 폼</h1>
<form action="memberReg" id="regForm" method="post" enctype="multipart/form-data">
<table>
	<tr>
		<td>아이디(이메일)*</td>
		<td>
			<input type="checkbox" id="idchk" hidden="hidden">
			<input type="text" name="member_id" id="member_id"> 
			<span id="idChkMsg"></span>
		</td>
	</tr> 
	<tr>
		<td>비밀번호*</td>
		<td><input type="password" name="member_pw" id="member_pw">  </td>
	</tr> 
	
	<tr>
		<td>비밀번호 재확인</td>
		<td><input type="password" name="pw" id="passwordCheck" onkeyup="pwcheck">  </td>
		<td id= "passwordcheckText" width=100>
	</tr> 
	
	
	
	
	<tr>
		<td>회원명*</td>
		<td><input type="text" name="member_name" id="member_name">  </td>
	</tr> 
	<tr>
		<td>생일*</td>
		<td><input type="text" name="member_birth" id="member_birth">  </td>
	</tr> 
	<tr>
		<td>이메일*</td>
		<td><input type="text" name="member_email" id="member_email">  </td>
	</tr> 
	<tr>
		<td>전화번호*</td>
		<td><input type="text" name="member_ph" id="member_ph">  </td>
	</tr> 
	
	
	
	<tr>
		<td>사진</td>
		<td><input type="file" name="photofile">  </td>
	</tr> 
	<tr>
		<td></td>
		<td>
			<input type="submit" value="가입">
			<input type="reset">
		</td>
	</tr>
</table>

</form>













</body>
</html>