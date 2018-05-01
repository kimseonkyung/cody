<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>My Page</title>
<style>
	div{
		width: 200px;
		height: 200px;
		
		border-radius : 100px; 
		
		
		background-image: url('../uploadfile/memberphoto/${member.member_photo}');
		background-size: 100%;
		
	}
</style>
</head>
<body>

<div id="my"> </div>
${member.member_id} / ${member.member_name} / ${member.member_photo} / ${member.member_reg }


<h1>수정 및 탈퇴  페이지</h1>
    <p>
       <a href="../member/modifyForm?id=${member.member_id}">수정</a>  
       <a href="../member/memberDelete?id=${member.member_id}">삭제</a>
    </p>








</body>
</html>