<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<title>마이페이지</title>

<!--웹폰트 추가 : 구글 폰트-->
<link href="https://fonts.googleapis.com/css?family=Nanum+Brush+Script"
	rel="stylesheet">
<!-- CODY CSS -->
<link href="resources/css/cody.css" type="text/css" rel="stylesheet">
<link href="resources/css/codyform.css" type="text/css" rel="stylesheet">
<style>
input:focus, textarea:focus {
	resize: none, outline: none;
}
</style>

<style>
	#bar1 {
	height: 55px;
	border: 1px solid #007bff;
	border-radius: 15px;
	}

	#card1{
	
	border: 1px solid #007bff;
	}
	#card2{
	
	border: 1px solid #007bff;
	}
	#card3{
	
	border: 1px solid #007bff;
	}
	#card4{
	border: 1px solid #007bff;
	}
	
	#button2{
	width: 300px;
	}
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
	
	
	<div class="my-3 p-3 bg-white rounded box-shadow">
          <img src="${pageContext.request.contextPath }/uploadfile/memberphoto/${member.member_photo}" width="220" height="300">
          <button type="button" class="btn btn-primary" data-target="#registerModal" data-toggle="modal">프로필변경</button>
        </div>
     		
		<div class="my-3 p-3 bg-white rounded box-shadow">
         <div class="row">
                <div class="col" id="bar1"><a href="#"><font style="vertical-align:inherit">코디</font></a></div>
               <div class="col" id="bar1"><a href="#"><font style="vertical-align:inherit">옷장</font></a></div>
               <div class="col" id="bar1"><a href="#"><font style="vertical-align:inherit">좋아요</font></a></div>
                <div class="col" id="bar1"><a href="#"><font style="vertical-align:inherit">팔로우</font></a></div>           
		</div>
		</div>
		
		<div class="p-3 bg-white rounded box-shadow">
         <div class="row">
        <form action="${pageContext.request.contextPath }/codyForm" method="get" style="margin: 0 auto;">
		<button id="button2" type="submit" class="btn btn-primary btn-lg">코디등록</button>
        </form>
		</div>		
		</div>
		
		<div class="col-md-10 order-md-2">
			<div class="my-3 p-3 bg-white rounded box-shadow">

				<ol class="card-item-ol" >
				
				
			<!------------------ 아이템 리스트 반복 출력 ----------------------->
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
			</div>

		</div>
		
	
</main>
 
 <footer class="my-5 pt-5 text-muted text-center text-small">
    <p class="mb-1">Bitcamp 2018 Project for <a href="${pageContext.request.contextPath }">Cody</a> by <a href="https://twitter.com/mdo">Drop the table</a>.</p>
      <p>
       <ul class="list-inline">
          <li class="list-inline-item"><a href="#">Privacy</a></li>
          <li class="list-inline-item"><a href="#">Terms</a></li>
          <li class="list-inline-item"><a href="#">Support</a></li>
        </ul>
        <a href="#">Back to top</a>
      </p>
    </footer>
    
</body>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script
		src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
	<script src="http://googledrive.com/host/0B-QKv6rUoIcGREtrRTljTlQ3OTg"></script>
	<!-- ie10-viewport-bug-workaround.js -->
	<script src="http://googledrive.com/host/0B-QKv6rUoIcGeHd6VV9JczlHUjg"></script>
	<!-- holder.js -->

<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script src="${pageContext.request.contextPath}/resources/script/cody_seo1.js"></script>
<script src="//html5shiv.googlecode.com/svn/trunk/html5.js"></script>


</html>