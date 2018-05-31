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
		
		<div class="my-3 p-3 bg-white rounded box-shadow">
		<div class="row">
		
		<div id="main_section">
			<div class="my-3 p-3 bg-white rounded box-shadow">
				<ol class="card-item-ol" >
				
			
		<!------------------ 코디 리스트 반복 출력 ----------------------->
			<c:forEach var="cody" items="${codys }">
				<li class="card card-item-li">
					<a href="${pageContext.request.contextPath}/codyListView?cody_idx=${cody.cody_idx}"><img class="card-img-top card-item" src="${pageContext.request.contextPath }/uploadfile/codyphoto/${cody.cody_image}" alt="Card image cap"></a>
		           <div class="card-body" style="overflow: hidden; position: relative;padding-bottom: 15px;padding-left: 15px;padding-right: 15px;padding-top: 15px;height: 160px;">
						 <h5 class="card-title" style="float: left;">아이디</h5>
							<div><c:set var="data" value="${cody.cody_gender}" /> 
					         <c:choose>
	                           <c:when test="${data eq true}">
					             Man
					           </c:when>
					           <c:otherwise>
					            Woman
					           </c:otherwise>
					          </c:choose>
					         </div> 
					 <div>${cody.cody_height}cm</div> 
					 <div>${cody.cody_age}세</div>
							<div class="card-body" style="overflow: hidden; position: relative;height: 55px;padding-top: 15px;padding-bottom: 0px;padding-left: 0px;padding-right: 0px;">
							<a href="${pageContext.request.contextPath }/codyUpdate?cody_idx=${cody.cody_idx}" class="btn btn-primary"	style="position: absolute; left: 0px;">수정</a>
							<a href="${pageContext.request.contextPath }/codyDelete?cody_idx=${cody.cody_idx}" class="btn btn-primary"	style="position: absolute; right: 0px;">삭제</a>
						</div>
						</div>						
				</li>
				</c:forEach>
				</ol>
			</div>
		</div>
		
		
		
		</div>
		</div>
	
</main>
 
<!-- 인클루드 footer -->
	<%@ include file="../bottom/footer.jsp" %>
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