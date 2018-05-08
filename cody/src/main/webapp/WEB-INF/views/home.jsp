<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>

<%-- <html>
<head>
	<title>CODY</title>
	
	<!--외부에 있는 스타일시트 파일을 현재 html페이지로 로드-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/cody.css">
    
</head>
<body>

<!-- header start -->
    <header id="main_header">
        <div class="container">
            <div class="search_box">
                <input type="text"><input type="submit" value="검색">
            </div>
            <h1 class="main_title">CODY</h1>
            <div class="mycontent">
            	<div class="user">
                로그인
            	</div>
				<p class="notice">알림</p>
            </div>
        </div>
    </header>
    <!-- header end -->

    <article id="main_wrap">
        <!--네비게이션 시작-->
        <div id="main_navigation">
            <nav>
                <ul class="main_menu">
                    <li>ALL</li>
                    <li>MEN</li>
                    <li>WOMEN</li>
                </ul>

            </nav>
        </div>
        <!--네비게이션 끝-->

        <div class="main_article">



            <!--본문 시작-->
            <div id="content">
                <section id="main_section">
                    <article class="basic_article">
                        <h1 class="article_title">랭킹</h1>
                        <p>update 10:00</p>
                        <p>
                            제90회 아카데미 감독상, 작품상 등 4관왕에 오른 영화 《셰이프 오브 워터》의 원작소설이다. 불완전한 존재에 대한 관심과 사랑을 끊임없이 영화로 표현해 온 다크 판타지의 거장 기예르모 델 토로 최고의 역작으로 평가 받는 이번 작품은 사람과 괴생명체 간의 사랑을 그린 판타지 로맨스로, 진짜 성인 남녀가 사랑을 하듯이 사랑의 과정과 환희, 이별과 상실 등을 사실적으로 그려냈다.
                        </p>
                    </article>

                    <article class="basic_article">
                        <h1 class="article_title">타이틀</h1>
                        <p>2018년 4월 6일</p>
                        <p>
                            제90회 아카데미 감독상, 작품상 등 4관왕에 오른 영화 《셰이프 오브 워터》의 원작소설이다. 불완전한 존재에 대한 관심과 사랑을 끊임없이 영화로 표현해 온 다크 판타지의 거장 기예르모 델 토로 최고의 역작으로 평가 받는 이번 작품은 사람과 괴생명체 간의 사랑을 그린 판타지 로맨스로, 진짜 성인 남녀가 사랑을 하듯이 사랑의 과정과 환희, 이별과 상실 등을 사실적으로 그려냈다.
                        </p>
                        <br>
                        <br>
                        <br>
                        <br>
                        <br>
                        <br>
                        <br>
                        <br>
                        <br>
                        <br>
                        <br>
                        <br>
                        <br>
                        <br>
                        <br>
                        <br>
                        <br>
                        <br>
                        <br>
                    </article>

                </section>
                <aside id="main_aside">
                    <h1>카테고리</h1>
                    <ul>
                        <li><a href="#">데이터</a></li>
                        <li><a href="#">데이터</a></li>
                        <li><a href="#">데이터</a></li>
                        <li><a href="#">데이터</a></li>
                        <li><a href="#">데이터</a></li>
                    </ul>

                    <h1>최근 글</h1>
                    <ul>
                        <li><a href="itemForm">아이템저장</a></li>
                        <li><a href="codyList">코디리스트</a></li>
                        <li><a href="listView?cody_idx=3">코디 상세보기</a></li>
                        <li><a href="listSearch?cody_title=샤랄라">코디 검색</a></li>
                        <li><a href="codyForm">코디등록</a><br></li>
                        <li><a href="itemList">아이템 전체 리스트</a><br></li>
                        <li><a href="itemListView?item_idx=2">아이템 상세보기</a></li>
                        <li><a href="itemSearch?item_name=1">아이템 검색</a></li>
                        <li><a href="itemForm">아이템 수정</a></li>
                        <li><a href="itemDelete?item_idx=5">아이템 삭제</a></li>
                        <li><a>공지사항</a></li>
                        <li></li>
                        <li></li>
                    </ul>
                </aside>
            </div>
            <!--본문 끝-->
        </div>

    </article>
    <!--footer 시작-->
    <footer id="footer">
        <h1>@2018 bitcamp.</h1>
    </footer>
    <!--footer 끝-->

</body>
</html> --%>


<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../../../favicon.ico">

<title>Offcanvas template for Bootstrap</title>

<!-- CODY CSS -->
<link href="${pageContext.request.contextPath}/resources/css/cody.css"
	rel="stylesheet">

<!-- Bootstrap core CSS -->
<link
	href="${pageContext.request.contextPath}/resources/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link
	href="${pageContext.request.contextPath}/resources/bootstrap/offcanvas.css"
	rel="stylesheet">

</head>

<body class="bg-light">

	<nav class="navbar navbar-expand-lg fixed-top navbar-dark bg-dark">
		<form class="form-inline my-2 my-lg-0">
			<input class="form-control mr-sm-2" type="text" placeholder="Search"
				aria-label="Search">
			<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
		</form>
		<a class="navbar-brand mr-auto mr-lg-0" href="#">Cody</a>
		<button class="navbar-toggler p-0 border-0" type="button"
			data-toggle="offcanvas">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="navbar-collapse offcanvas-collapse"
			id="navbarsExampleDefault">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="#">회원가입
						<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item"><a class="nav-link" href="#">로그인</a></li>
				<li class="nav-item"><a class="nav-link" href="#">Profile</a></li>
				<li class="nav-item"><a class="nav-link" href="#">Switch
						account</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="http://example.com"
					id="dropdown01" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false">Settings</a>
					<div class="dropdown-menu" aria-labelledby="dropdown01">
						<a class="dropdown-item" href="#">Action</a> <a
							class="dropdown-item" href="#">Another action</a> <a
							class="dropdown-item" href="#">Something else here</a>
					</div></li>
			</ul>
		</div>
	</nav>


	<div class="nav-scroller bg-white box-shadow">
		<nav class="nav nav-underline">
			<a class="nav-link active" href="#">Dashboard</a> <a class="nav-link"
				href="#"> Friends <span
				class="badge badge-pill bg-light align-text-bottom">27</span>
			</a> <a class="nav-link" href="#">all</a> <a class="nav-link" href="#">men</a>
			<a class="nav-link" href="#">women</a> <a class="nav-link" href="#">아이템</a>
			<a class="nav-link" href="#">코디</a> <a class="nav-link" href="#">사용자</a>
			<a class="nav-link" href="#">마이페이지</a>
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
					<a href="itemForm">아이템저장</a><br> <a href="codyList">코디리스트</a><br>
					<a href="listSearch?cody_title=샤랄라">코디 검색</a><br> <a
						href="codyForm">코디등록</a><br> <a href="itemList">아이템 전체
						리스트</a><br> <a href="itemListView?item_idx=2">아이템 상세보기</a><br>
					<a href="itemSearch?item_name=1">아이템 검색</a><br> <a
						href="itemForm">아이템 수정</a><br> <a
						href="itemDelete?item_idx=5">아이템 삭제</a><br> <a
						href="member/memberReg">회원가입 (form)</a> <a href="member/login">로그인
						(form)</a> <a href="member/memberList">회원 리스트</a><br> 
						<a href="bookmarkList">즐겨찾기</a><br>
						<a href="repleList?cody_idx=1">답글</a>
						<a href="codyTimeList">타임라인</a>

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

			<h1>카테고리</h1>
			<ul>
				<li><a href="#">데이터</a></li>
				<li><a href="#">데이터</a></li>
				<li><a href="#">데이터</a></li>
				<li><a href="#">데이터</a></li>
				<li><a href="#">데이터</a></li>
			</ul>

			<h1>최근 글</h1>
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

	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script>
		window.jQuery
				|| document
						.write('<script src="${pageContext.request.contextPath}/resources/bootstrap/assets/vendor/jquery-slim.min.js"><\/script>')
	</script>
	<script
		src="${pageContext.request.contextPath}/resources/bootstrap/assets/vendor/popper.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/bootstrap/dist/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/bootstrap/assets/vendor/holder.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/bootstrap/offcanvas.js"></script>
</body>
</html>




