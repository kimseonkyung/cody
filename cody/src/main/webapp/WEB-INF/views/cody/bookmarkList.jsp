<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="${pageContext.request.contextPath }/bookmarkList"
		method="post">
		<table border="1">
			<tr>
				<td>번호</td>
				<td>아이디</td>
				<td>코디</td>

			</tr>

			<!-- 회원 정보 출력반복 시작 -->
			<c:forEach var="bookmark" items="${bookmarks}">
				<tr>
					<td>${bookmark.idx}</td>
					<td>${bookmark.member_idx}</td>
					<td>${bookmark.cody_idx}</td>

					<td><a href="../bookmark/bookmarkList?id=${bookmark.idx}">보기</a>
						<a href="../bookmark/bookmarkList?id=${bookmark.idx}">등록</a> 
						<a href="../bookmark/bookmarkDelete?id=${bookmark.member_id}">삭제</a>

					</td>

				</tr>
			</c:forEach>
			<!-- 회원 정보 출력 반복 끝 -->

		</table>

	</form>
</body>
</html>