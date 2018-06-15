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
#itemList{
    overflow: hidden;
    column-width: 240px;
    column-gap: 15px;
}

.myCard {
		width: 240px;  
		display: inline-block;
		margin-left: 40px;
        margin-bottom: 50px;
  		background-color: #fff;
  		border: 1px solid rgba(0, 0, 0, 0.125);
  		border-radius: 0.25rem;
  		box-shadow: 2px 2px 5px rgba(0,0,0,0.5);
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
			<a class="nav-link col-4 mr-auto" id="all" href="${pageContext.request.contextPath}/itemListCap" style="font-size: 22px; font-weight: 600;">All</a> 
			<button type="button" class="nav-link col-4 mr-auto btn btn-link" id="man" style="font-size: 22px; font-weight: 600;">Man</button>
			<button type="button" class="nav-link col-4 mr-auto btn btn-link" id="woman" style="font-size: 22px; font-weight: 600;">Woman</button>
		</nav>
		</div>
</div>
<div class="row">
     <!--------------------- 메인 사이드 ----------------------->

	<%@ include file="../top/aside.jsp" %>
		<div class="col-md-10 order-md-2">
		<div id="itemList"class="my-3 p-3 bg-white rounded box-shadow">
			<script>
	$('#man').click(function () {
		
		 $.ajax({
				type : 'post',
				url : '/cody/itemListCapMan',
				dataType : 'json',
				data : {}
		 		})
		 		.done(function(data) {
			 		$('#itemList').empty();
				
					$.each(data, function(i, e) {
						$('#itemList').append('<div class="myCard">'
								+ '<img class="card-img-top" src="'+ e.item_image +'" style="height: 270px;" alt="Card image cap">'
								+ '<div class="card-body" style="height: 100%">'
								+ e.item_name
								+ '<br>'
								+ e.item_category
								+ '<br>'
								+ e.item_price +'원'
								+ '<a href="'+ e.item_link +'" class="btn btn-info" style="float:right; margin-bottom: 20px;">구입</a>'
								+ '</div>'
								+ '</div>');
					});
				})
				.fail(function(err) { // 실패
					console.log(err);
				});
		 
	})
	
	$('#woman').click(function () {
		
		 $.ajax({
				type : 'post',
				url : '/cody/itemListCapWoman',
				dataType : 'json',
				data : {}
	 		})
	 		.done(function(data) {
		 		$('#itemList').empty();
			
				$.each(data, function(i, e) {
					$('#itemList').append('<div class="myCard">'
							+ '<img class="card-img-top" src="'+ e.item_image +'" style="height: 270px;" alt="Card image cap">'
							+ '<div class="card-body" style="height: 100%">'
							+ e.item_name
							+ '<br>'
							+ e.item_category
							+ '<br>'
							+ e.item_price +'원'
							+ '<a href="'+ e.item_link +'" class="btn btn-info" style="float:right; margin-bottom: 20px;">구입</a>'
							+ '</div>'
							+ '</div>');
				});
			})
			.fail(function(err) { // 실패
				console.log(err);
			});
	 
})
</script>

				<ol class="card-item-ol" >
				
				
			<!------------------ 아이템 리스트 반복 출력 ----------------------->
			<c:forEach var="item" items="${items }">
			
				<li class="card card-item-li" style="display:inline-block; margin-bottom: 50px;">
					<img class="card-img-top card-item" src="${item.item_image}" alt="Card image cap" onclick="itemListView(${item.item_idx})">
						<div class="card-body" style="height: 100%;">
							${item.item_name }<br> ${item.item_category }<br> ${item.item_price }원
							<a href="#" class="btn btn-info" style="float: right; margin-bottom: 20px;">구입</a>
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







