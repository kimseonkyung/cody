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

    	<h3>아이템검색 </h3>    	
 	<form action="${pageContext.request.contextPath }/itemInfo"  method="GET" >
 	<table>
 	<tr>
 		<td>아이템입력<td>
 		<td><input type = "text" name = "keyword1">
 			<input type = "submit" value = "검색">
 		</td>
 		</tr>	
</table>
	
</form>
</body>
</html>