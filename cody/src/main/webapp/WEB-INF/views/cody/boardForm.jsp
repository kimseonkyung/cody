<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html class="no-js" lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.3.min.js"></script>
<title>Elvis Blog 글 쓰기</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="${listContext.request.contextPath}/resources/css/style.css" />
</head>
<body>
	<div id="sub_wrap">
	<div class="top_box">
		<h3>글쓰기</h3>
	</div>
	<!-- 글 작성 폼 -->
	<div class="inbox">
		<form action="${pageContext.request.contextPath}/boardInsert" id="write" name="write" method="post">
		<input type="hidden" name="man_idx" value=2>
			<table class="table table-write">
				<colgroup>
					<col width="120px">
					<col width="*">
				</colgroup>
				<tbody>
					<tr>
						<td class="text-center">제목</td>
						<td class="pull_input"><input type="text" size= 149 id="title" name="title"/>
					</tr>
				<tr>
					<td class="text-center">내용</td>
					<td class="textarea"><textarea rows="14" cols="151" id="content" name="content"></textarea></td>
				</tr>
				</tbody>
			</table>
			<div class="huge-top">
				<input type="button" class="btn btn-normal pull-right" onclick="location.href='/boardList'" value="취소">
				<input type="submit" class="btn btn-normal btn-blue pull-right" id="insert" name="insert" value="확인">	
			</div>
		</form>
	</div>
</div>
</body>

</html>
