<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<title>검색</title>
<body>
	
	<form action="${pageContext.request.contextPath}/searchItem"
		method="GET" enctype="multipart/form-data">
		<h3>최신글</h3>
		<table border="1">
			<select>				
				<option>아이템</option>  
				<option>코디</option>
				<option>회원</option>
			</select>		
	</table>
		<input type= "text" name = "searchWord"/>
		<input type="submit" value="검색"/>
	</form>
</body>

</html>

