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

<form action="${pageContext.request.contextPath }/itemForm" method="post" enctype="multipart/form-data">
	이미지 : <input type="file" name="photofile"><br>
	이름 : <input type="text" name="item_name"><br>
	브랜드 : <input type="text" name="item_brand"><br>
	가격 : <input type="text" name="item_price"><br>
	카테고리 : <input type="text" name="item_category"><br>
	색상 : <input type="text" name="item_color"><br>
	코디번호 : <input type="text" name="cody_idx"><br>
	사용자번호 : <input type="text" name="member_idx"><br>
	<input type="submit">
</form>
<hr>
수정
<form action="${pageContext.request.contextPath }/itemUpdate" method="post" enctype="multipart/form-data">
	이미지 : <input type="file" name="photofile"><br>
	이름 : <input type="text" name="item_name"><br>
	브랜드 : <input type="text" name="item_brand"><br>
	가격 : <input type="text" name="item_price"><br>
	카테고리 : <input type="text" name="item_category"><br>
	색상 : <input type="text" name="item_color"><br>
	코디번호 : <input type="text" name="cody_idx"><br>
	사용자번호 : <input type="text" name="member_idx"><br>
	idx : <input type="text" name="item_idx">
	<input type="submit">
</form>



</body>
</html>