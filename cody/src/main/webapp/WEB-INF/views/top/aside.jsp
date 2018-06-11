<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>사이드 메뉴</title>


</head>
<body>

<div class="col-md-2 order-md-1 mb-4">
		<div class="my-3 p-3 bg-white rounded box-shadow">
			<h3>사용자</h3>
			<ul>
				<li><a href="${pageContext.request.contextPath}/itemForm">아이템저장</a></li>
				<li><a href="${pageContext.request.contextPath}/itemListView?item_idx=2">아이템 상세보기</a></li>
				<li><a href="itemForm">아이템 수정</a></li>
				<li><a href="itemDelete?item_idx=5">아이템 삭제</a></li>
				<li><a href="#">데이터</a></li>
			</ul>
			</div>
          <div class="my-3 p-3 bg-white rounded box-shadow">
			<h3>카테고리</h3>
			<ul>
				<li><a href="${pageContext.request.contextPath}/codyList">코디리스트</a><br>
				<li><a href="${pageContext.request.contextPath}/itemList">아이템 전체 리스트</a><br> 
				<li><a href="${pageContext.request.contextPath}/codyTimeList">타임라인</a><br>
				<li><a href="bookmarkList">즐겨찾기</a></li>
				<li><a href="#">데이터</a></li>
			</ul>
			</div>
		 <div class="my-3 p-3 bg-white rounded box-shadow">
			<h3>브랜드</h3>
			<ul>
				<li><a href="${pageContext.request.contextPath}/codyForm">코디등록</a></li>
				<li><a href="${pageContext.request.contextPath}/repleList?cody_idx=1">답글</a></li>
				<li><a href="#">데이터</a></li>
				<li><a href="#">데이터</a></li>
				<li><a href="#">데이터</a></li>
			</ul>
		</div>
</div>

</body>
</html>