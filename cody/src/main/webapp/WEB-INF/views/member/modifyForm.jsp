<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보 수정</title>
<style>

</style>
</head>
<body>
<form action="${pageContext.request.contextPath }/member/modifyForm" method="post" enctype="multipart/form-data">
<input type="hidden" name="idx" value="${member.member_idx }">
<input type="hidden" name="member_pw" value="${member.member_pw }">
<table>
	<tr>
		<td>아이디</td>
		<td><input type="text" name="member_id" value="${member.member_id }" readonly="readonly"></td>
	</tr>
	<tr>
		<td>이름</td>
		<td><input type="text" name="member_name" value="${member.member_name }"></td>
	</tr>
	<tr>
		<td>이메일</td>
		<td><input type="text" name="member_email" value="${member.member_email }"></td>
	</tr>
	<tr>
		<td>생일</td>
		<td><input type="text" name="member_birth" value="${member.member_birth }"></td>
	</tr>
	<tr>
		<td>전화번호</td>
		<td><input type="text" name="member_ph" value="${member.member_ph }"></td>
	</tr>
	<tr>
		<td>사진</td>
		<td><input type="file" name="photofile" value="${member.member_photo }"></td>
	</tr>
	
	
	
	
	
	
	<tr>
		<td></td>
		<td><input type="submit" value="수정"><input type="reset" value="취소"></td>
	</tr>
</table>
</form>

<br><br>
<a href="memberList">회원 리스트</a>

</body>
</html>