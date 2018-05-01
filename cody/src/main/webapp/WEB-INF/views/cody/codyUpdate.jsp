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


<form action="${pageContext.request.contextPath }/codyUpdate" method="post" enctype="multipart/form-data">

<table>
	<tr>
		<td>코디이미지</td>
		<td><input type="image" name="cody_image" value="${cody.cody_image }"></td>
	</tr>
	<tr>
		<td>제목</td>
		<td><input type="text" name="cody_title" value="${cody.cody_title}"></td>
	</tr>
	<tr>
		<td>소개</td>
		<td><input type="text" name="cody_intro" value="${cody.cody_intro}"></td>
	</tr>
	<tr>
		<td>성별</td>
		<td><input type="text" name="cody_gender" value="${cody.cody_gender}"></td>
	</tr>
	<tr>
		<td>신장</td>
		<td><input type="text" name="cody_height" value="${cody.cody_height}"></td>
	</tr>
	<tr>
		<td>나이</td>
		<td><input type="text" name="cody_age" value="${cody.cody_age}"></td>
	</tr>
	<tr>
		<td></td>
		<td><input type="submit" value="수정"><input type="reset" value="취소"></td>
	</tr>
</table>
</form>

<br><br>
<a href="codyList">코디 리스트</a>

</body>
</html>
