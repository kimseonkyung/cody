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
    	<h3>코드검색 </h3>    	
 	<form action="${pageContext.request.contextPath }/codyInfo"  method="GET" >
 	<table>
 	<tr>
 		<td>코드입력<td>
 		<td><input type = "text" name = "keyword2">
 			<input type = "submit" value = "검색">
 		</td>
 		</tr>	
</table>
	
</form>
</body>
</html>