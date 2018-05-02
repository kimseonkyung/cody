<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>

<body>
	
	<img
		src="${pageContext.request.contextPath }/uploadfile/codyphoto/${cody.cody_image}"
		width="200">
	<br> 제목: ${cody.cody_title}
	<br> 소개: ${cody.cody_intro}
	<br> 성별: <c:set var="data" value="${cody.cody_gender}" /> 
					<c:choose>
					<c:when test="${data eq true}">
					 Man
					 </c:when>
					 
					 <c:otherwise>
					 Woman
					 </c:otherwise>
					 </c:choose>
					 
	<br> 신장: ${cody.cody_height}
	<br> 나이: ${cody.cody_age}
	<br> 조회수: ${cody.board_click}
	<br> 게시일: ${cody.board_date}
	<br> 좋아요: ${cody.board_like}
	<br>
	<br>
	<a href="${pageContext.request.contextPath }/codyList">전체리스트보기</a>
	<br>
	<a
		href="${pageContext.request.contextPath }/codyUpdate?cody_idx=${cody.cody_idx }">수정</a>
	<br>
	<a
		href="${pageContext.request.contextPath }/codyDelete?cody_idx=${cody.cody_idx}">삭제</a>
		

</body>
</html>