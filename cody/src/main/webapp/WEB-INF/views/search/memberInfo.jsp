<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>	
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원</title>
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
<style>
.card-item-ol {
   overflow: hidden;
   column-width:240px;
   column-gap: 15px;
}

.card-item-li {
   width: 240px;
   padding:10px;
   box-shadow: 2px 2px 5px rgba(0,0,0,0.5);;
}

.card-item {
   height: 300px;
}
</style>
</head>
<body class="bg-light">
	<!-- 인클루드 header -->
	<%@ include file="../top/header.jsp"%>

	<main role="main" class="container"> <!--------------------- 메인 배너 ----------------------->
	<div
		class="d-flex align-items-center p-3 my-3 text-white-50 rounded box-shadow"
		style="background-image: url('/cody/uploadfile/cody.png'); background-repeat: no-repeat; background-size: contain;">
		<div class="lh-100">
			<h5 class="mb-0 text-white lh-100">CODY</h5>
			<small>bitcamp 2018</small>
		</div>
	</div>

	<div class="nav-scroller bg-white">
		<div class="container">
			<nav class="nav nav-underline">
				<a class="nav-link col-4 mr-auto" href="#">all</a> <a
					class="nav-link col-4 mr-auto" href="#">men</a> <a
					class="nav-link col-4 mr-auto" href="#">women</a>
			</nav>
		</div>
	</div>

	<div class="row">
		<!------------------------- 메인  --------------------------->

		<div class="col-md-2 order-md-1 mb-4">
			<div class="my-3 p-3 bg-white rounded box-shadow">
				<h1>카테고리</h1>
				<ul>
					<li><a href="#">데이터</a></li>
					<li><a href="#">데이터</a></li>
					<li><a href="#">데이터</a></li>
					<li><a href="#">데이터</a></li>
					<li><a href="#">데이터</a></li>
				</ul>

				<div class="my-3 p-3 bg-white rounded box-shadow">
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
		</div>

		<div class="col-md-10 order-md-2">
			<div class="my-3 p-3 bg-white rounded box-shadow">
				<ol class="card-item-ol">

					<!------------------ 코디 리스트 반복 출력 ----------------------->
					<c:forEach var="MemberLsit" items="${MemberLsit}">
						<li class="card card-item-li" style="margin-bottom: 50px;display: inline-block;">
							<img class="card-img-top card-item"
							src="${pageContext.request.contextPath}/uploadfile/memberphoto/${MemberLsit.member_photo}"
							alt="Card image cap">
							<div class="card-body"
								style="overflow: hidden; position: relative; padding-bottom: 15px; padding-left: 15px; padding-right: 15px; padding-top: 15px;">
								<div style="text-align: center;"><font style="vertical-align: inherit;">${MemberLsit.member_id}</font></div>							
								<div style="text-align: center;"><font style="vertical-align: inherit;">가입일:<fmt:formatDate value="${MemberLsit.member_reg}" pattern="yyyy-MM-dd"/></font></div>
								<a
									href="${pageContext.request.contextPath }/bookmark?cody_idx=${cody.cody_idx}&member_idx=${cody.member_idx}"
									class="btn btn-primary" style="display:block;">팔로우</a>
							</div>
						</li>
					</c:forEach>

				</ol>
			</div>
		</div>



	</div>
	</main>

	<!-- 인클루드 footer -->
	<%@ include file="../bottom/footer.jsp"%>


	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>

</body>
</html>
