<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>코디등록</title>
<style>
var cody_gender = $(':radio[name="cody_gender"]:checked').val();
$('input:radio[name=cody_gender]:input[value='+cody_gender+']').attr("checked", true);
</style>
</head>
<body>
<h1>코디등록</h1>
    <form action="${pageContext.request.contextPath }/codyForm" method="post" enctype="multipart/form-data">
<table>
<tr>
<td>코디이미지</td>
<td><input type="file" name="photofile"></td>
</tr>
<tr>
<td>착용아이템</td>
<td><a href="itemForm">항목추가</a></td>
</tr>
<tr>
<td>코디상세</td>
<td>제목<input type="text" name="cody_title"></td>
<td>코디소개<textarea name="cody_intro" rows="20" cols="100"></textarea></td>
<td>성별<label><input type="radio" name="cody_gender" value="true">Man</label>
				<label><input type="radio" name="cody_gender" value="false">Woman</label>
				</td>
    <td>신장※<input type="text" name="cody_height"></td>
    <td>나이※<input type="text" name="cody_age"></td>
  
    <td> 
    <input type="submit" value="Upload">
			<input type="reset"> 
			</td>
</tr>

</table>
    </form>
</body>
</html>