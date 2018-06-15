<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>코디</title>
<script src="${pageContext.request.contextPath}/resources/script/cody_lim.js"></script>
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
			<a class="nav-link col-4 mr-auto" id="all" href="${pageContext.request.contextPath}/codyInfo?keyword2" style="font-size: 22px; font-weight: 600;">All</a> 
			<button type="button" class="nav-link col-4 mr-auto btn btn-link" id="man" style="font-size: 22px; font-weight: 600;">Man</button>
			<button type="button" class="nav-link col-4 mr-auto btn btn-link" id="woman" style="font-size: 22px; font-weight: 600;">Woman</button>
		</nav>
		</div>
    </div>
	
<div class="row">
     <!--------------------- 메인 사이드 ----------------------->

	<%@ include file="../top/aside.jsp" %>

		<div class="col-md-10 order-md-2">
			<div class="my-3 p-3 bg-white rounded box-shadow">
				<ol class="card-item-ol" >

			<!------------------ 코디 리스트 반복 출력 ----------------------->
			<c:forEach var="irr" items="${irr}">
				<li class="card card-item-li" style="margin-bottom: 50px;display: inline-block;">
				<a href="${pageContext.request.contextPath}/codyListView?cody_idx=${irr.cody_idx}"> <img class="card-img-top card-item" src="${pageContext.request.contextPath }/uploadfile/codyphoto/${irr.cody_image}" alt="Card image cap"></a>
		           <div class="card-body" style="position: relative;padding-top: 10px;padding-bottom: 10px;padding-left: 10px;padding-right: 10px;height: 65px;;">
						  <c:set var="codyTt" value="${irr.cody_title}"/>
						 <c:set var="Tt"  value="${fn:length(codyTt)}"/>
						 <c:if test="${Tt > 9}">
						   <c:set var="codyTt" value="${fn:substring(codyTt, 0, 8)} ..." />
						  </c:if>
						 <h5 class="card-title" style="text-align: center;">${codyTt}</h5>
							<div><c:set var="data" value="${irr.cody_gender}" /> </div> 
					 <div class="card-main" style="float:left;height: 40px;margin-bottom: 10px;margin-top: 3px;">
					 <c:choose>
			<c:when test="${not empty irr.member_photo}" >
		<img class="rounded-circle" src="${pageContext.request.contextPath }/uploadfile/memberphoto/${irr.member_photo}" style="width:40px; height: 40px;">
		</c:when>
		<c:otherwise>
		<img class="rounded-circle" src="${pageContext.request.contextPath }/uploadfile/member.png" width="40" height="40"> 
		
		</c:otherwise>
		</c:choose>
				
						 
						 <div style="float:right; padding-left: 15px;">
						 <div>
						 <c:set var="memberId2" value="${irr.member_id}"/>
						 <c:set var="Id2"  value="${fn:length(memberId2)}"/>
						 <c:if test="${Id2 > 9}">
						   <c:set var="memberId2" value="${fn:substring(memberId2, 0, 8)} ..." />
						  </c:if>
						 <p style="vertical-align: inherit;margin-bottom: 0px;height: 20px;">
						 ${memberId2}
						 </p>						
						 </div>
							
					     <div><p style="vertical-align: inherit;margin-bottom: 0px;height: 20px; font-size:5px">${irr.cody_height}cm ${irr.cody_age}세</p></div>
					    </div>
					    </div>
					    
				<c:choose>
			<c:when test="${loginInfo.member_idx eq irr.member_idx}" >
				<a href="${pageContext.request.contextPath }/codyUpdate?cody_idx=${irr.cody_idx}" class="btn btn-info" style="float:right;width: 73px;height: 42px;">수정</a>							
			</c:when>
			<c:otherwise>
			    <button class="btn btn-info" style="float:right;width: 73px; height: 42px;padding-top: 0px;padding-bottom: 0px;" onclick="idx(${irr.member_idx})">
				<div style="height: 17px;"><i class="fas fa-user-plus" style="font-size: 14px;"></i></div><div><i style="font-size: 14px;">팔로우</i></div></a>					
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
		

</body>
</html>