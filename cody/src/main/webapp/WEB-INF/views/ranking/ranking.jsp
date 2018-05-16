<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<body>
	<form action="${pageContext.request.contextPath}/ranking" method="post"
		enctype="multipart/form-data">
		<h3>랭킹리스트</h3>
		<table border="1">
			<tr>
				<td>랭킹리스트</td>
				<td>title</td>
				<td>intro</td>
				<td>조회수</td>
			</tr>

			<!--  정보 출력 반복시작 -->

			<c:forEach var="cody" items="${rankings}">
				<tr>
					<td><c:if test="${cody.cody_image !=null }">
							<img
								src="${pageContext.request.contextPath }/uploadfile/codyphoto/${cody.cody_image}"
								width="200">
						</c:if> 
					</td>
					<td>${cody.cody_title}</td>
					<td>${cody.cody_intro}</td>
					<td>${cody.board_click}</td>
			</c:forEach>
			

		</table>
	</form>
</body>
</html>