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
				<td>이미지</td>
				<td>아이템</td>
				
			</tr>

			<c:forEach var="irr" items="${irr}">
				<tr>
					<td>"${irr.codyid}"</td>
					<td><c:if test="${irr.codyimage != null}">
							<img
								src="${pageContext.request.contextPath }/uploadfile/codyphoto/${irr.codyimage}"
								width="200">
					<td>"${irr}"</td>
						</c:if>
				</tr>
			</c:forEach>

		<%-- 	<!-- 아이템 반복 출력 -->
			<c:forEach var="irrr" items="${irr.codyidx}">
				<tr>
					<td>"${irr.Cody_idx}"</td>
			</c:forEach>
 --%>


		</table>
	</form>
</body>


</html>

