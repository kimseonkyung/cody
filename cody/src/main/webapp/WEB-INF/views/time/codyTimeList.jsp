<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<body>
	<form action="${pageContext.request.contextPath}/codyTimeList"
		method="post" enctype="multipart/form-data">
		<h3>최신글</h3>
		<table border="1">
			<tr>
				<td>코디이미지</td>
				<td>착용아이템</td>
				<td>제목</td>
				<td>소개</td>
				<td>성별</td>

			</tr>

			<!-- 회원 정보 출력 반복 시작 -->
			<c:forEach var="cody" items="${codytimes}">
				<tr>
					<td><c:if test="${cody.cody_image != null}">
							<img
								src="${pageContext.request.contextPath }/uploadfile/codyphoto/${cody.cody_image}"
								width="200">
						</c:if></td>
					<td>착용아이템</td>
					<td>${cody.cody_title}</td>
					<td>${cody.cody_intro}</td>
					<td><c:set var="data" value="${cody.cody_gender}" /> <c:choose>
							<c:when test="${data eq true}">
					 Man
					 </c:when>

							<c:otherwise>
					 Woman
					 </c:otherwise>
						</c:choose></td>

				</tr>
			</c:forEach>
			<!-- 회원 정보 출력 반복 끝 -->

		</table>
	</form>
</body>
</html>
