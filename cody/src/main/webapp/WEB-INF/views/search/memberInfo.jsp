<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>	
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
#memberList{
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
			<a class="nav-link col-4 mr-auto" id="all" href="${pageContext.request.contextPath}/memberInfo?keyword3" style="font-size: 22px; font-weight: 600;">All</a> 
			<button type="button" class="nav-link col-4 mr-auto btn btn-link" id="man" style="font-size: 22px; font-weight: 600;">Man</button>
			<button type="button" class="nav-link col-4 mr-auto btn btn-link" id="woman" style="font-size: 22px; font-weight: 600;">Woman</button>
		</nav>
		</div>
</div>
<div class="row">
     <!--------------------- 메인 사이드 ----------------------->

	<%@ include file="../top/aside.jsp" %>
	


		<div class="col-md-10 order-md-2">
			<div id="memberList"class="my-3 p-3 bg-white rounded box-shadow">
<script>
$('#man').click(function () {
	
	 $.ajax({
			type : 'post',
			url : '/cody/memberInfoMan',
			dataType : 'json',
			data : {}
	 		})
	 		.done(function(data) {
		 		$('#memberList').empty();
			
				$.each(data, function(i, e) {
					$('#memberList').append('<div class="myCard">'
							+ '<img id="image" class="rounded-circle" style="height: 270px; width: 240px;" alt="Card image cap">'						
							+ '<div class="card-body" style="height: 100%">'
							+ e.member_id
				            );
				            if(e.member_photo != null) {
				            	$('#image').append('<img class="rounded-circle" src="/cody/uploadfile/memberphoto/'+ e.member_photo +'" style="height: 270px; width: 240px;" alt="Card image cap">');
				            }else{
				            	$('#image').append('<img class="rounded-circle" src="/cody/uploadfile/member.png" style="height: 270px; width: 240px;" alt="Card image cap">');
				            }
							+ '</div>'
							+ '</div>'
				});
			})
			.fail(function(err) { // 실패
				console.log(err);
			});
	 
})

$('#woman').click(function () {
	
	 $.ajax({
			type : 'post',
			url : '/cody/memberInfoWoman',
			dataType : 'json',
			data : {}
		})
		.done(function(data) {
	 		$('#memberList').empty();
		
			$.each(data, function(i, e) {
				$('#memberList').append('<div class="myCard">'
						+ '<img id="image" class="rounded-circle" style="height: 270px; width: 240px;" alt="Card image cap">'						
						+ '<div class="card-body" style="height: 100%">'
						+ e.member_id
			            );
			            if(e.member_photo != empty) {
			            	$('#image').append('<img class="rounded-circle" src="/cody/uploadfile/memberphoto/'+ e.member_photo +'" style="height: 270px; width: 240px;" alt="Card image cap">');
			            }else{
			            	$('#image').append('<img class="rounded-circle" src="/cody/uploadfile/member.png" style="height: 270px; width: 240px;" alt="Card image cap">');
			            }
						+ '</div>'
						+ '</div>'
			});
		})
		.fail(function(err) { // 실패
			console.log(err); 
		});

})
</script>
				<ol class="card-item-ol">

					<!------------------ 멤버 리스트 반복 출력 ----------------------->
					<c:forEach var="MemberLsit" items="${MemberLsit}">
						<li class="card card-item-li" style="display: inline-block;margin-bottom:50px;">
						<c:choose>
			<c:when test="${not empty MemberLsit.member_photo}" >
		<img class="rounded-circle" src="${pageContext.request.contextPath }/uploadfile/memberphoto/${MemberLsit.member_photo }" style="width:240px; height: 270px;">
		</c:when>
		<c:otherwise>
		<img class="rounded-circle" src="${pageContext.request.contextPath }/uploadfile/member.png" width="240" height="270">
		
		</c:otherwise>
		</c:choose>

							<div class="card-body" style="overflow: hidden;position: relative;padding-top: 10px;padding-bottom: 10px;padding-left: 10px;padding-right: 10px;height: 65px;">
						    <c:set var="memberId" value="${MemberLsit.member_id}"/>
						    <c:set var="Id"  value="${fn:length(memberId)}"/>
						    <c:if test="${Id > 13}">
						    <c:set var="memberId" value="${fn:substring(memberId, 0, 12)} ..." />
						    </c:if>	
								<div class="card-main" style="float:left;height: 40px;margin-top: 10px;">${memberId}</div>
								
								<c:choose>
			                    <c:when test="${loginInfo.member_idx eq MemberLsit.member_idx}" >
			                    <button type="button" class="btn btn-info" data-target="#modifyModal" data-toggle="modal" style="float:right;width: 73px; margin-top: 5px;height: 42px;padding-top: 0px;padding-bottom: 0px;">수정</button>
								</c:when>
			                    <c:otherwise>
								<a href="${pageContext.request.contextPath }/bookmark?cody_idx=${cody.cody_idx}&member_idx=${cody.member_idx}" class="btn btn-info" style="float:right;width: 73px; margin-top: 5px;height: 42px;padding-top: 0px;padding-bottom: 0px;">
						<div style="height: 17px;"><i class="fas fa-user-plus" style="font-size: 14px;vertical-align: inherit;"></i></div><div><i style="font-size: 14px; vertical-align: inherit;">팔로우</i></div></a>
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
	<%@ include file="../bottom/footer.jsp"%>


	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->

</body>
</html>
