<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>타임라인</title>

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
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>


<script type="text/javascript">
	$(document).ready(function(event) {

		$(window).scroll(function() {

			var scrollHeight = $(window).scrollTop() + $(window).height();

			var documentHeight = $(document).height();

			//스크롤이 맨아래로 갔는지 아닌지 확인하는 if문

			if (scrollHeight == documentHeight) {

				for (var i = 0; i < 10; i++) {

					$('<h1>Infinity Scroll11</h1>').appendTo('body');

				}

			}

		});

	});

	//테스트를 위해 내부에 공간을 채워서 스크롤을 임의로 만듬

	$(document).ready(function() {

		for (var i = 0; i < 20; i++) {

			$('<h1>infinity scroll</h1>').appendTo('body');

		}

	});
</script>

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
			<nav class="nav nav-underline"> <a
				class="nav-link col-4 mr-auto" href="#">all</a> <a
				class="nav-link col-4 mr-auto" href="#">men</a> <a
				class="nav-link col-4 mr-auto" href="#">women</a> </nav>
		</div>
	</div>

	<div class="row">
		<!--------------------- 메인 사이드 ----------------------->
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
					<!------------------ 타임라인 전체 리스트 반복 출력 ----------------------->

					<c:forEach var="irr" items="${irr}">

						<li class="card card-item-li"><a
							href="${pageContext.request.contextPath}/codyListView?cody_idx=${irr.codyidx}">
								<img class="card-img-top card-item"
								src="${pageContext.request.contextPath}/uploadfile/codyphoto/${irr.codyimage}"
								alt="Card image cap">
						</a>
							<div class="card-body"
								style="overflow: hidden; position: relative; padding-top: 10px; padding-left: 10px; padding-right: 10px; padding-bottom: 10px;">

								<c:forEach var="item" items="${irr.itemtime}" begin="0" end="2"
									step="1">

									<div style="padding-bottom: 10px;">
										<img src="${item.item_image}"
											style="width: 40px; height: 50px">
										&emsp;${item.item_price}원<a href="#" class="btn btn-primary"
											style="position: absolute; right: 10px;">구입</a>
									</div>

								</c:forEach>


								<div class="card-main" style="float: left; height: 40px;">
									<img class="rounded-circle"
										src="${pageContext.request.contextPath }/uploadfile/memberphoto/${irr.memberphoto }"
										style="border: 1px solid darkgray; width: 40px; height: 40px;">
									<div style="float: right; padding-left: 15px;">
										<div>
											<p
												style="vertical-align: inherit; margin-bottom: 0px; height: 20px;">${irr.memberid}</p>
										</div>

										<div>
											<p
												style="vertical-align: inherit; margin-bottom: 0px; height: 20px; font-size: 5px">${irr.codyheight}cm
												${irr.codyage}세</p>
										</div>
									</div>
								</div>
								<c:choose>
									<c:when test="${loginInfo.member_idx eq irr.memberidx}">
										<a
											href="${pageContext.request.contextPath }/codyUpdate?cody_idx=${irr.codyidx}"
											class="btn btn-primary" style="float: right;">수정</a>
									</c:when>
									<c:otherwise>
										<button id="follow" class="btn btn-primary" 
											style="float: right;" onclick="ssss(${irr.memberidx})">sss</button>
										<input type="hidden" name="memberidx" value="${irr.memberidx}"
											id="follow">
									</c:otherwise>
								</c:choose>

							</div></li>
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
	<script>
	$(document).ready(function () {
		
	
	})
	
			function ssss(e) {
			
			var idx = e;
		
		
			$.ajax({
				type : 'GET',
				url : 'cody/followinsert',
				dateType : 'json',
				date :{
				
					member_idx : idx
					
					
				},success: function (data){
					  
					var obj = new obj;
					obj = date;
					if(obj!=null){
						//성공
						alert('팔로우 신청이 완료되었습니다');
						
					}else{
						//에러 
					}
								
				          
				}
						
				
			});		
		
			};
	
	
	
	/* $(function(){
		$('#follow').click(function() {

			$.ajax({
				type : 'GET',
				url : '/cody/followinsert',
				dateType : 'json',
				date : {
					
				
				}
				}
			})

			.done(function() {
				alert("팔로우 신청완료")

			});

		} */
		
	</script>




</body>

</html>

