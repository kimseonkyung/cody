<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
</style>
<script>
	
</script>
</head>
<body>

<c:forEach var="list" items="list_r">
	<div style="border:1px solid gray ; margin-left: <c:out value="${20*replylist.redepth}"/>">
		

	</div>


</c:forEach>


</body>
</html>
