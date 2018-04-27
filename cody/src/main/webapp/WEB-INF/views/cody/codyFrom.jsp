<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>코디등록</title>
<style>
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
<td><a href="#"></a></td>
</tr>
<tr>
<td>코디상세</td>
<td>코디소개<textarea name="information" rows="20" cols="100"></textarea></td>
<td>성별※<label for="loc"></label>
                <select id="gender">
                    <option>선택하세요</option>
                    <option>Men</option>
                    <option>Women</option>
                                   </select>
    </td>
    <td>신장※<input type="text" name="height"></td>
    <td>나이※<input type="text" name="age"></td>
  <td>공개*비공개 설정※<label for="secret"></label>
                <select id="secret">
                    <option>선택하세요</option>
                    <option>공개</option>
                    <option>비공개</option>
                                   </select>
    
    </td>
    <td> 
    <input type="submit" value="Upload">
			<input type="reset"> 
			</td>
</tr>

</table>
    </form>
</body>
</html>