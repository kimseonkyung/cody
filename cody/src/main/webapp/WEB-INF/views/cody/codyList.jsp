<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="${pageContext.request.contextPath }/codyList"
		method="post" enctype="multipart/form-data">
		<h3>회원리스트</h3>
		<table border="1">
			<tr>
				<td>코디이미지</td>
				<td>착용아이템</td>
				<td>제목</td>
				<td>소개</td>
				<td>성별</td>
				<td>신장</td>
				<td>나이</td>
				<td>관리</td>
			</tr>

			<!-- 회원 정보 출력 반복 시작 -->
			<c:forEach var="cody" items="${codys}">
				<tr>
					<td><c:if test="${cody.cody_image != null}">
							<img
								src="${pageContext.request.contextPath }/uploadfile/codyphoto/${cody.cody_image}"
								width="200">
						</c:if>
						</td>
						<td>착용아이템</td>
					<td>${cody.cody_title}</td>
					<td>${cody.cody_intro}</td>
					<td>
					<c:set var="data" value="${cody.cody_gender}" /> 
					<c:choose>
					<c:when test="${data eq true}">
					 Man
					 </c:when>
					 
					 <c:otherwise>
					 Woman
					 </c:otherwise>
					 </c:choose>
					 </td>
					<td>${cody.cody_height}</td>
					<td>${cody.cody_age}</td>
					
					<td>
						<a href="${pageContext.request.contextPath }/codyListView?cody_idx=${cody.cody_idx}">상세보기</a>
						<a href="${pageContext.request.contextPath }/codyUpdate?cody_idx=${cody.cody_idx}">수정</a>
						<a href="${pageContext.request.contextPath }/codyDelete?cody_idx=${cody.cody_idx}">삭제</a>
						<a href="codyForm">코디등록</a>
						<a href="${pageContext.request.contextPath }/bookmark?cody_idx=${cody.cody_idx}&member_idx=${cody.member_idx}" >즐겨찾기</a>
					</td>
					
				</tr>
			</c:forEach>
			<!-- 회원 정보 출력 반복 끝 -->

		</table>
	</form>
</body>
</html>


