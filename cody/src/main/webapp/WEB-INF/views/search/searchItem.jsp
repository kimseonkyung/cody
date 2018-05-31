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
<form action="${pageContext.request.contextPath}/searchItem method="GET" enctype="multipart/form-data">
    	<h3>아이템검색 </h3>    	
    	<input type = "text" value = ""> <input type ="submit" value="검색" >
    </form>	
    	
    <table border = "1">
	<tr>
 		<td>이미지</td>	
 		<td>아이템이름</td>	
 		<td>가격</td>	 		
	</tr>
	<!-- 회원 정보 출력 반복 -->
	<c:forEach var="ItemLists" items="${ItemLists}">
				<tr>
					<td><c:if test="${ItemLists.item_image != null}">
							<img
								src="${pageContext.request.contextPath }/uploadfile/codyphoto/${ItemLists.item_image}"
								width="200">
						</c:if>
						</td>						
					<td>${ItemLists.item_name}</td>
					<td>${ItemLists.item_price}</td>									
					
				</tr>
			</c:forEach>	
			</table>	
</form>
</body>
</html>