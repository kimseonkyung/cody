<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>코디</title>
<style>
</style>
</head>
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
   overflow: hidden;
}

.card-item {
   height: 300px;
}

</style>	
</head>
<body class="bg-light">
<!-- 인클루드 header -->
	<%@ include file="../top/header.jsp" %>

	<main role="main" class="container">
	<!--------------------- 메인 배너 ----------------------->
	<div
		class="d-flex align-items-center p-3 my-3 text-white-50 rounded box-shadow" 
		style="
		background-image: url('/cody/uploadfile/cody.png');
		background-repeat:no-repeat;
		background-size: contain;">
		<div class="lh-100">
			<h5 class="mb-0 text-white lh-100">CODY</h5><small>bitcamp 2018</small>
		</div>
	</div>
	
	<div class="nav-scroller bg-white">
	<div class="container">
		<nav class="nav nav-underline">
			<a class="nav-link col-4 mr-auto" href="#">all</a> 
			<a class="nav-link col-4 mr-auto" href="#">men</a>
			<a class="nav-link col-4 mr-auto" href="#">women</a>
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
				<ol class="card-item-ol" >

			<!------------------ 코디 리스트 반복 출력 ----------------------->
			<c:forEach var="irr" items="${irr}">
				<li class="card card-item-li" style="margin-bottom: 50px;display: inline-block;">
				<a href="${pageContext.request.contextPath}/codyListView?cody_idx=${irr.cody_idx}"> <img class="card-img-top card-item" src="${pageContext.request.contextPath }/uploadfile/codyphoto/${irr.cody_image}" alt="Card image cap"></a>
		           <div class="card-body" style="position: relative;padding-top: 10px;padding-bottom: 10px;padding-left: 10px;padding-right: 10px;height: 65px;;">
						 <h5 class="card-title">${irr.cody_title}</h5>
							<div><c:set var="data" value="${irr.cody_gender}" /> </div> 
					 <div class="card-main" style="float:left;height: 40px;">
					 <c:choose>
			<c:when test="${not empty irr.member_photo}" >
		<img class="rounded-circle" src="${pageContext.request.contextPath }/uploadfile/memberphoto/${irr.member_photo}" style="width:40px; height: 40px;">
		</c:when>
		<c:otherwise>
		<img class="rounded-circle" src="${pageContext.request.contextPath }/uploadfile/member.png" width="40" height="40"> 
		
		</c:otherwise>
		</c:choose>
				
						 
						 <div style="float:right; padding-left: 15px;">
						 <div><p style="vertical-align: inherit;margin-bottom: 0px;height: 20px;">${irr.member_id}</p></div>
							
					     <div><p style="vertical-align: inherit;margin-bottom: 0px;height: 20px; font-size:5px">${irr.cody_height}cm ${irr.cody_age}세</p></div>
					    </div>
					    </div>
					    
				<c:choose>
			<c:when test="${loginInfo.member_idx eq irr.memberidx}" >
						<a href="${pageContext.request.contextPath }/codyUpdate?cody_idx=${irr.cody_idx}" class="btn btn-primary" style="float:right;">수정</a>						
			</c:when>
			<c:otherwise>
						<a href="${pageContext.request.contextPath }/bookmark?cody_idx=${irr.cody_idx}&member_idx=${irr.member_idx}" class="btn btn-primary" style="float:right;">팔로우</a>
			</c:otherwise>
			</c:choose>
						</div>						
				</li>
				</c:forEach>
				
				</ol>
			</div>
		</div>

		

</div>
	</main>

<!-- 인클루드 footer -->
	<%@ include file="../bottom/footer.jsp" %>


	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>

</body>
</html>