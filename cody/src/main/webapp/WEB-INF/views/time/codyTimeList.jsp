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
				<td>코디</td>
			</tr>

			<!-- 회원 정보 출력 반복 시작 -->
			<c:forEach var="cody" items="${codytimes}">
				<tr>
					<td><c:if test="${cody.cody_image != null}">
							<img
								src="${pageContext.request.contextPath }/uploadfile/codyphoto/${cody.cody_image}"
								width="200">
						</c:if> ${cody.cody_title}${cody.cody_intro}</td>
			</c:forEach>
			<tr>
				<c:forEach var="map" items="${map}">
					<td>${map}</td>
				</c:forEach>

			</tr>

 

		</table>
	</form>
</body>


</html>

