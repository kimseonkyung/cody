<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">
<head>

<title>Offcanvas template for Bootstrap</title>


</head>

<body class="bg-light">
	
	<!-- 인클루드 header -->
	<%@ include file="./top/header.jsp" %>

	<div class="nav-scroller bg-white box-shadow">
		<nav class="nav nav-underline">
			<a class="nav-link active" href="#">Dashboard</a> <a class="nav-link"
				href="#"> Friends <span
				class="badge badge-pill bg-light align-text-bottom">27</span>
			</a> <a class="nav-link" href="#">all</a> <a class="nav-link" href="#">men</a>
			<a class="nav-link" href="#">women</a> <a class="nav-link" href="#">아이템</a>
			<a class="nav-link" href="#">코디</a> <a class="nav-link" href="#">사용자</a>
		</nav>
	</div>




	<main role="main" class="container">
	<div
		class="d-flex align-items-center p-3 my-3 text-white-50 bg-purple rounded box-shadow">
		<img class="mr-3"
			src="https://getbootstrap.com/assets/brand/bootstrap-outline.svg"
			alt="" width="48" height="48">
		<div class="lh-100">
			<h6 class="mb-0 text-white lh-100">Bootstrap</h6>
			<small>Since 2011</small>
		</div>
	</div>


	<div id="main_content">

		<div id="main_section">
			<div class="my-3 p-3 bg-white rounded box-shadow">
				<h6 class="border-bottom border-gray pb-2 mb-0">랭킹</h6>

				<ol style="overflow: hidden;">
					<li class="card" style="width: 240px; float: left;"><img
						class="card-img-top"
						src="${pageContext.request.contextPath}/uploadfile/itemphoto/1_sss.jpg"
						alt="Card image cap" style="height: 300px;">
						<div class="card-body"
							style="overflow: hidden; position: relative;">
							<h5 class="card-title" style="float: left;">임해군</h5>
							<a href="#" class="btn btn-primary"
								style="position: absolute; right: 20px;">팔로우</a>
						</div></li>

					<li class="card" style="width: 240px; float: left;"><img
						class="card-img-top"
						src="${pageContext.request.contextPath}/uploadfile/itemphoto/1_sss.jpg"
						alt="Card image cap" style="height: 300px;">
						<div class="card-body"
							style="overflow: hidden; position: relative;">
							<h5 class="card-title" style="float: left;">서동휘</h5>
							<a href="#" class="btn btn-primary"
								style="position: absolute; right: 20px;">팔로우</a>
						</div></li>

					<li class="card" style="width: 240px; float: left;"><img
						class="card-img-top"
						src="${pageContext.request.contextPath}/uploadfile/itemphoto/1_sss.jpg"
						alt="Card image cap" style="height: 300px;">
						<div class="card-body"
							style="overflow: hidden; position: relative;">
							<h5 class="card-title" style="float: left;">배혜림</h5>
							<a href="#" class="btn btn-primary"
								style="position: absolute; right: 20px;">팔로우</a>
						</div></li>
				</ol>
				<div>
					
					<a href="${pageContext.request.contextPath}/itemForm">아이템저장</a><br> 
					<a href="${pageContext.request.contextPath}/codyList">코디리스트</a><br>
					<a href="${pageContext.request.contextPath}/listSearch?cody_title=샤랄라">코디 검색</a><br> 
					<a href="${pageContext.request.contextPath}/codyForm">코디등록</a><br>
					<a href="${pageContext.request.contextPath}/itemList">아이템 전체 리스트</a><br> 
					<a href="${pageContext.request.contextPath}/itemListView?item_idx=2">아이템 상세보기</a><br>
					<a href="${pageContext.request.contextPath}/itemSearch?item_name=1">아이템 검색</a><br>
					<a href="itemForm">아이템 수정</a><br>
					<a href="itemDelete?item_idx=5">아이템 삭제</a><br> 
						
						
						
						(form)</a> <a href="member/memberList">회원 리스트</a><br> 
						<a href="bookmarkList">즐겨찾기</a><br>
						<a href="${pageContext.request.contextPath}/repleList?cody_idx=1">답글</a><br>
						<a href="codyTimeList">타임라인</a><br>
						<a href="boardList">게시판(공지사항)</a><br>
						
						

				</div>
				<small class="d-block text-right mt-3"> <a href="#">All
						updates</a>
				</small>
			</div>



			<div class="my-3 p-3 bg-white rounded box-shadow">
				<h6 class="border-bottom border-gray pb-2 mb-0">Suggestions</h6>
				<div class="media text-muted pt-3">
					<img
						data-src="holder.js/32x32?theme=thumb&bg=007bff&fg=007bff&size=1"
						alt="" class="mr-2 rounded">
					<div
						class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
						<div
							class="d-flex justify-content-between align-items-center w-100">
							<strong class="text-gray-dark">Full Name</strong> <a href="#">Follow</a>
						</div>
						<span class="d-block">@username</span>
					</div>
				</div>
				<div class="media text-muted pt-3">
					<img
						data-src="holder.js/32x32?theme=thumb&bg=007bff&fg=007bff&size=1"
						alt="" class="mr-2 rounded">
					<div
						class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
						<div
							class="d-flex justify-content-between align-items-center w-100">
							<strong class="text-gray-dark">Full Name</strong> <a href="#">Follow</a>
						</div>
						<span class="d-block">@username</span>
					</div>
				</div>
				<div class="media text-muted pt-3">
					<img
						data-src="holder.js/32x32?theme=thumb&bg=007bff&fg=007bff&size=1"
						alt="" class="mr-2 rounded">
					<div
						class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
						<div
							class="d-flex justify-content-between align-items-center w-100">
							<strong class="text-gray-dark">Full Name</strong> <a href="#">Follow</a>
						</div>
						<span class="d-block">@username</span>
					</div>
				</div>
				<small class="d-block text-right mt-3"> <a href="#">All
						suggestions</a>
				</small>
			</div>
		</div>

		<div id="main_aside">

			<h1>사용자</h1>
			<ul>
				<li><a href="#">데이터</a></li>
				<li><a href="#">데이터</a></li>
				<li><a href="#">데이터</a></li>
				<li><a href="#">데이터</a></li>
				<li><a href="#">데이터</a></li>
			</ul>

			<h1>카테고리</h1>
			<ul>
				<li><a href="#">데이터</a></li>
				<li><a href="#">데이터</a></li>
				<li><a href="#">데이터</a></li>
				<li><a href="#">데이터</a></li>
				<li><a href="#">데이터</a></li>
			</ul>
			
			<h1>브랜드</h1>
			<ul>
				<li><a href="#">데이터</a></li>
				<li><a href="#">데이터</a></li>
				<li><a href="#">데이터</a></li>
				<li><a href="#">데이터</a></li>
				<li><a href="#">데이터</a></li>
			</ul>





		</div>

	</div>

	</main>

 







</body>
</html>




