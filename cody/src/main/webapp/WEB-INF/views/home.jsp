<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../../../favicon.ico">

<title>코디 메인</title>

<!-- CODY CSS -->
<link href="${pageContext.request.contextPath}/resources/css/cody.css"
	rel="stylesheet">

<!-- Bootstrap core CSS -->
<link
	href="${pageContext.request.contextPath}/resources/bootstrap/dist/css/bootstrap.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link
	href="${pageContext.request.contextPath}/resources/bootstrap/offcanvas.css"
	rel="stylesheet">

<style>
	.card-item-ol {
		overflow: hidden;
		
	}
	
	.card-item-li {
		width: 240px; 
		float: left;
		margin: 0 10px 10px 10px;
	}

	.card-item {
		height: 300px;
	}

</style>

</head>


<body class="bg-light">
	
	<!-- 인클루드 header -->
	<%@ include file="./top/header.jsp" %>

	<div class="nav-scroller bg-white box-shadow">
	<div class="container">
		<nav class="nav nav-underline">
			<a class="nav-link active" href="#">Dashboard</a> <a class="nav-link" href="#"> 
			Friends <span class="badge badge-pill bg-light align-text-bottom">27</span></a> 
			<a class="nav-link" href="#">all</a> <a class="nav-link" href="#">men</a>
			<a class="nav-link" href="#">women</a> <a class="nav-link" href="#">아이템</a>
			<a class="nav-link" href="#">코디</a> <a class="nav-link" href="#">사용자</a>
		</nav>
	</div>
</div>


<main role="main" class="container">
	
	<!--------------------- 메인 배너 ----------------------->
	<div class="d-flex align-items-center p-3 my-3 text-white-50 bg-purple rounded box-shadow">
		<img class="mr-3" src="https://getbootstrap.com/assets/brand/bootstrap-outline.svg" alt="" width="48" height="48">
		<div class="lh-100">
			<h6 class="mb-0 text-white lh-100">Bootstrap</h6>
			<small>Since 2011</small>
		</div>
	</div>

<div class="row">

     <!--------------------- 메인 사이드 ----------------------->
<div class="col-md-2 order-md-1 mb-4">
		  <div class="my-3 p-3 bg-white rounded box-shadow">
			<h3>사용자</h3>
			<ul>
				<li><a href="#">데이터</a></li>
				<li><a href="#">데이터</a></li>
				<li><a href="#">데이터</a></li>
				<li><a href="#">데이터</a></li>
				<li><a href="#">데이터</a></li>
			</ul>
			</div>
          <div class="my-3 p-3 bg-white rounded box-shadow">
			<h3>카테고리</h3>
			<ul>
				<li><a href="#">데이터</a></li>
				<li><a href="#">데이터</a></li>
				<li><a href="#">데이터</a></li>
				<li><a href="#">데이터</a></li>
				<li><a href="#">데이터</a></li>
			</ul>
			</div>
		 <div class="my-3 p-3 bg-white rounded box-shadow">
			<h3>브랜드</h3>
			<ul>
				<li><a href="#">데이터</a></li>
				<li><a href="#">데이터</a></li>
				<li><a href="#">데이터</a></li>
				<li><a href="#">데이터</a></li>
				<li><a href="#">데이터</a></li>
			</ul>
			</div>
</div>

    <!--------------------- 메인 내용1 ----------------------->
<div class="col-md-10 order-md-2">
	 <div class="my-3 p-3 bg-white rounded box-shadow">
		<h6 class="border-bottom border-gray pb-2 mb-0">랭킹</h6>

	<!------------------ 아이템 리스트 반복 출력 ----------------------->			
			<ol class="card-item-ol" >
			<c:forEach var="item" items="${items }">		
				<li class="card card-item-li">
					<img class="card-img-top card-item" src="${item.item_image}" alt="Card image cap" onclick="itemListView(${item.item_idx})">
						<div class="card-body" style="overflow: hidden; position: relative;">
						 <h5 class="card-title" style="float: left;">임해군</h5><br>
							${item.item_name }<br> ${item.item_category }<br> ${item.item_price }
							<a href="#" class="btn btn-primary"	style="position: absolute; right: 20px;">구입</a>
						</div>
				</li>
            </c:forEach>
			</ol>

					
					<a href="${pageContext.request.contextPath}/itemForm">아이템저장</a><br> 
					<a href="${pageContext.request.contextPath}/codyList">코디리스트</a><br>
					<a href="${pageContext.request.contextPath}/listSearch?cody_title=샤랄라">코디 검색</a><br> 
					<a href="${pageContext.request.contextPath}/codyForm">코디등록</a><br>
					<a href="${pageContext.request.contextPath}/itemList">아이템 전체 리스트</a><br> 
					<a href="${pageContext.request.contextPath}/itemListView?item_idx=2">아이템 상세보기</a><br>
					<a href="${pageContext.request.contextPath}/itemSearch?item_name=1">아이템 검색</a><br>
					<a href="itemForm">아이템 수정</a><br>
					<a href="itemDelete?item_idx=5">아이템 삭제</a><br> 
					
						<a href="member/memberList">회원 리스트</a><br> 
						<a href="bookmarkList">즐겨찾기</a><br>
						<a href="${pageContext.request.contextPath}/repleList?cody_idx=1">답글</a><br>
						<a href="codyTimeList">타임라인</a><br>
						<a href="boardList">게시판(공지사항)</a><br>
						
						

		</div>
	<small class="d-block text-right mt-3"> <a href="#">All updates</a></small>
</div>

    <!--------------------- 메인 내용2 ----------------------->
<div class="col-md-10 order-md-3">
			<div class="my-3 p-3 bg-white rounded box-shadow">
				<h6 class="border-bottom border-gray pb-2 mb-0">Suggestions</h6>
				<div class="media text-muted pt-3">
					<img data-src="holder.js/32x32?theme=thumb&bg=007bff&fg=007bff&size=1" alt="" class="mr-2 rounded">
					<div class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
						<div class="d-flex justify-content-between align-items-center w-100">
							<strong class="text-gray-dark">Full Name</strong> <a href="#">Follow</a>
						</div>
						<span class="d-block">@username</span>
					</div>
				</div>
				<div class="media text-muted pt-3">
					<img data-src="holder.js/32x32?theme=thumb&bg=007bff&fg=007bff&size=1" alt="" class="mr-2 rounded">
					<div class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
						<div class="d-flex justify-content-between align-items-center w-100">
							<strong class="text-gray-dark">Full Name</strong> <a href="#">Follow</a>
						</div>
						<span class="d-block">@username</span>
					</div>
				</div>
				<div class="media text-muted pt-3">
					<img data-src="holder.js/32x32?theme=thumb&bg=007bff&fg=007bff&size=1" alt="" class="mr-2 rounded">
					<div class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
						<div class="d-flex justify-content-between align-items-center w-100">
							<strong class="text-gray-dark">Full Name</strong> <a href="#">Follow</a>
						</div>
						<span class="d-block">@username</span>
					</div>
				</div>
				</div>
	</div>
	
</div>
	</main>
	
    <!--------------------- 푸터 ----------------------->	
<footer class="my-5 pt-5 text-muted text-center text-small">
    <p class="mb-1">Bitcamp 2018 Project by<a href="https://twitter.com/mdo"><br>Drop the table</a>.</p>
      <p>
       <ul class="list-inline">
          <li class="list-inline-item"><a href="#">Privacy</a></li>
          <li class="list-inline-item"><a href="#">Terms</a></li>
          <li class="list-inline-item"><a href="#">Support</a></li>
        </ul>
        </p>
        </footer>
 







</body>
</html>
