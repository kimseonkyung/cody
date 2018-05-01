<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>

</style>
</head>
<body>

<h3>상세정보</h3>
<hr>
idx : ${member.member_idx}<br>
아이디 : ${member.member_id}<br>
이름 : ${member.member_name}<br>
비밀번호 : ${member.member_pw}<br>
날짜 <fmt:formatDate value="${member.member_reg}" pattern="yyyy-MM-dd HH:mm"/> <br>
사진 : <img src="${pageContext.request.contextPath }/uploadfile/memberphoto/${member.member_photo} ">
<br><br>
<a href="memberList">회원 리스트</a>

</body>
</html>