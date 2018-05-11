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
<title>CODY 공지사항</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" />
</head>
<body>
	<div id="sub_wrap">
	<div class="top_box">
		<h3>상세보기</h3>
	</div>
	<!-- 글 작성 폼 -->
	<div class="inbox">
		<input type="hidden" name="man_idx" value=2>
			<table class="table table-write">
				<colgroup>
					<col width="120px">
					<col width="*">
				</colgroup>
				<tbody>
					<tr>
						<td class="text-center">제목</td>
						<td class="pull_input"><input type="text" size= 149 id="title" name="title" value="${board.board_title }" readonly="readonly" />
					</tr>
					<tr>
						<td class="text-center">작성자</td>
						<td class="pull_input"><input type="text" size= 149 id="name" name="name" value="${board.name }" readonly="readonly"/>
					</tr>
				<tr>
					<td class="text-center">내용</td>
					<td class="textarea"><textarea rows="14" cols="151" id="content" name="content">${board.board_contents }</textarea></td>
				</tr>
				</tbody>
			</table>
			<div class="huge-top">
				<input type="button" class="btn btn-normal pull-right" onclick="location.href='${pageContext.request.contextPath}/boardUpdateForm?board_title=${board.board_title }&board_contents=${board.board_contents }'" value="수정">
				<input type="button" class="btn btn-normal pull-right" onclick="boardDelete(${board.board_idx })" value="삭제">
				<input type="button" class="btn btn-normal pull-right" onclick="location.href='${pageContext.request.contextPath}/boardList'" value="취소">
					
			</div>
	</div>
</div>
</body>

<script>
	function boardDelete(idx) {
		$.ajax({
			type : 'post',
			url : '${pageContext.request.contextPath}/boardDelete',
			dataType : 'text',
			data : {
				board_idx : idx
				},
			success : function(data) {
				alert('삭제 완료');
				location='${pageContext.request.contextPath}/boardList';
			}
		});
	}

</script>



</html>
