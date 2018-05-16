<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.10.2.js"></script>



<title>Insert title here</title>

<script src="//html5shiv.googlecode.com/svn/trunk/html5.js"></script>





</head>
<body>
	<form action="${pageContext.request.contextPath }/bookmarkList"
		method="post" enctype="application/x-www-form-urlencoded">
		<h3>즐겨찾기리스트</h3>
		<table align="center" border="1">

			<tr>
				<td>코디</td>
				<td>아이디</td>
				<td>관리</td>
				

			</tr>

			<!-- 회원 정보 출력반복 시작 -->
			<c:forEach var="bookmark" items="${bookmarks}">
				<c:forEach var="cody" items="${codys}">
				<tr>
				<td><c:if test="${cody.cody_image !=null }">
							<img
								src="${pageContext.request.contextPath }/uploadfile/codyphoto/${cody.cody_image}"
								width="200">
					</c:if></td> 
					<td>${bookmark.bookmark_idx}</td>
					<td>${bookmark.cody_idx}</td>
					

					



					<!--<c:set var="data" value="${bookmark_idx }" />
					<c:choose>
						<c:when test="${data eq true}">
						</c:when>
					</c:choose> -->

					<td><a
						href="${pageContext.request.contextPath }/codyListView?cody_idx=${bookmark.cody_idx}">상세보기</a>
						<a
						href="${pageContext.request.contextPath }/deleteBookmark?bookmark_idx=${bookmark.bookmark_idx}">삭제</a>
						
						
					</td>
				</tr>
				</c:forEach>
			</c:forEach>
			<!-- 회원 정보 출력 반복 끝 -->

		</table>

	
	</form>
</body>
</html>