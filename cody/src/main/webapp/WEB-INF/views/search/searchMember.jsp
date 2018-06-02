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

 	<h3>회원검색 </h3>
 	<form action="${pageContext.request.contextPath }/memberInfo"  method="GET" >
 	<table>
 	<tr>
 		<td>회원이름<td>
 		<td><input type = "text" name = "keyword3">
 			<input type = "submit" value = "검색">
 		</td>
 		</tr>	
</table>
	
</form>



</body>
</html>