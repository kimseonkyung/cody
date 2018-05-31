<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
</style>
</head>
<body>
<form>
   	<h3>코디검색 </h3>
   	<table border = "1">
	<tr>
 		<td>이미지</td>	
 		<td>코디제목</td>	
 		<td>조회</td>	 		
	</tr>
	<!-- 회원 정보 출력 반복 -->
	<c:forEach var="CodyLists" items="${CodyLists}">
				<tr>
					<td>
					<c:if test="${CodyLists.cody_image != null}">
							<img
								src="${pageContext.request.contextPath }/uploadfile/codyphoto/${CodyLists.cody_image}"
								width="200">
						</c:if>
						</td>						
					<td>${CodyLists.cody_title}</td>
					<td>${CodyLists.board_click}</td>									
					
				</tr>
			</c:forEach>	
	</table>
</form>
</body>
</html>