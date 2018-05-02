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
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script>

$("input:radio[name=cody_gender][value=" + '<c:out value="${ cody.cody_gender }"/>' + "]").attr("checked","checked");
</script>
</head>
<body>


	<form action="${pageContext.request.contextPath }/codyUpdate"
		method="post" enctype="multipart/form-data">

		<table>
			<tr>
				<td>코디이미지</td>
				<td><input type="file" name="photofile"
					></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="cody_title"
					value="${cody.cody_title}"></td>
			</tr>
			<tr>
				<td>소개</td>
				<td><textarea name="cody_intro" rows="20" cols="100">${cody.cody_intro}</textarea>
					</td>
			</tr>
			<tr>
			<td>성별<label><input type="radio"name="cody_gender" value="true">Man</label>
				<label><input type="radio" name="cody_gender" value="false">Woman</label>
			</td>
			</tr>
			<tr>
				<td>신장</td>
				<td><input type="text" name="cody_height"
					value="${cody.cody_height}"></td>
			</tr>
			<tr>
				<td>나이</td>
				<td><input type="text" name="cody_age" value="${cody.cody_age}"></td>
			</tr>
		    <tr>
				<td>코디번호</td>
				<td><input type="text" name="cody_idx" value="${cody.cody_idx}"></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" value="수정"><input type="reset"
					value="취소"></td>
			</tr>
		</table>
	</form>

	<br>
	<br>
	<a href="codyList">코디 리스트</a>

</body>
</html>
