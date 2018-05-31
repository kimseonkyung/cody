<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../../../favicon.ico">

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
	<%@ include file="../top/header.jsp" %>

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

				<ol class="card-item-ol" >
				
				
			<!------------------ 아이템 리스트 반복 출력 ----------------------->
			<c:forEach var="irr" items="${irr}">
			
				<li class="card card-item-li">
					<img class="card-img-top card-item" src="${pageContext.request.contextPath}/uploadfile/codyphoto/${irr.codyimage}" alt="Card image cap" onclick="itemListView(${item.item_idx})">
						<div class="card-body" style="overflow: hidden; position: relative;">
						
							<h5 class="card-title" style="float: left;">임해군</h5><br>
							${irr.item_name }<br> ${irr.item_category }<br> ${irr.item_price}
							
							<a href="#" class="btn btn-primary"	style="position: absolute; right: 20px;">구입</a>
						</div>
				</li>

			</c:forEach>
				
					
				</ol>
			</div>

		</div>

		<!------------------------- 메인 사이드 --------------------------->
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



<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>타임라인</title>

<body>
	<form action="${pageContext.request.contextPath}/codyTimeList"
		method="post" enctype="multipart/form-data">
		<h3>최신글</h3>
		<table border="1">
			<tr>
				<td>코디</td>
				<td>이미지</td>
				<td>아이템</td>
				
			</tr>
			<c:forEach var="irr" 
			items="${irr}">
				<tr>
					<td>"${irr.codyid}"</td>
					<td><c:if test="${ㅊㅊ != null}">
							<img
								src="${pageContext.request.contextPath }/uploadfile/codyphoto/${irr.codyimage}"
								width="200">
					<td>"${irr}"</td>
						</c:if>
				</tr>
			</c:forEach>

		</table>
	</form>
</body>


</html> --%>

