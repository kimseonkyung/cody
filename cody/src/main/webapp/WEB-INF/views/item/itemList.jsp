<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="icon" href="../../../../favicon.ico">

<title>Offcanvas template for Bootstrap</title>

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
			<a class="nav-link col-4 mr-auto" href="#" style="font-size: 22px; font-weight: 600;">All</a> 
			<a class="nav-link col-4 mr-auto" href="#" style="font-size: 22px; font-weight: 600;">Men</a>
			<a class="nav-link col-4 mr-auto" href="#" style="font-size: 22px; font-weight: 600;">Women</a>
		</nav>
	</div>
</div>


<div class="row">
     <!--------------------- 메인 사이드 ----------------------->

	<%@ include file="../top/aside.jsp" %>
		<div class="col-md-10 order-md-2">
			<div class="my-3 p-3 bg-white rounded box-shadow">

				<ol class="card-item-ol" >
				
				
			<!------------------ 아이템 리스트 반복 출력 ----------------------->
			<c:forEach var="item" items="${items }">
			
				<li class="card card-item-li" style="display:inline-block; margin-bottom: 50px;">
					<img class="card-img-top card-item" src="${item.item_image}" alt="Card image cap" onclick="itemListView(${item.item_idx})">
						<div class="card-body" style="overflow: hidden; position: relative;">
						 <h5 class="card-title" style="float: left;"></h5>
							${item.item_name }<br> ${item.item_category }<br> ${item.item_price }
							<a href="#" class="btn btn-info"	style="position: absolute; right: 20px;">구입</a>
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
	<script
		src="${pageContext.request.contextPath}/resources/script/cody_kim.js"></script>	
</body>
</html>







