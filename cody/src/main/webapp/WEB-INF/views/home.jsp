<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../../../favicon.ico">

<title>코디 메인</title>
<script src="${pageContext.request.contextPath}/resources/script/cody_seo1.js"></script>

<script src="${pageContext.request.contextPath}/resources/script/cody_lim.js"></script>

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
.card-item-ol {
   overflow: hidden;
   column-width:240px;
   column-gap: 15px;
}

.card-item-li {
   width: 240px;
   box-shadow: 2px 2px 5px rgba(0,0,0,0.5);;
}

.card-item {
   height: 320px;
}
.card-item-ol1{
   overflow: hidden;
}
.card-item-li1{
   width: 240px;
   box-shadow: 2px 2px 5px rgba(0,0,0,0.5);
}
#ranking{
width: 25px;
height: 25px;
border-radius: 18px 18px 18px 18px;
background-color: black;
position: absolute;
top: 10px;
left: 10px;
text-align: center;
}

iframe {
   width: 100%!important;
   height: 50px!important;
   
}

</style>
</head>


<body class="bg-light">
	
	<!-- 인클루드 header -->
	<%@ include file="./top/header.jsp" %>

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
			<a class="nav-link col-4 mr-auto" href="${pageContext.request.contextPath}/main" style="font-size: 22px; font-weight: 600; background-color: #17a2b8; color: #fff;">All</a> 
			<a class="nav-link col-4 mr-auto" href="${pageContext.request.contextPath}/codyTimeListMan" style="font-size: 22px; font-weight: 600;">Man</a>
			<a class="nav-link col-4 mr-auto" href="${pageContext.request.contextPath}/codyTimeListWoman" style="font-size: 22px; font-weight: 600;">Woman</a>
		</nav>
	</div>
</div>
<div class="row">
     <!--------------------- 메인 사이드 ----------------------->

	<%@ include file="./top/aside.jsp" %>

    <!--------------------- 메인 내용1 ----------------------->
<div class="col-md-10 order-md-2">
	 <div class="my-3 p-3 bg-white rounded box-shadow">
		<p style="vertical-align: inherit;font-size:23px; margin-left: 37px; max-width: 823px; border-bottom: 1px solid darkgray;">랭킹 리스트</p>
	<!------------------ 랭킹리스트 반복 출력 ----------------------->			
			<ol class="card-item-ol1" style="padding-left: 0px" >
			<c:forEach var="cody" items="${arr }" begin="0" end="2" step="1" varStatus="status">		
				<li class="card card-item-li1" id="ranking${status.index }" style="margin-bottom:50px; margin-left: 40px; display:inline-block;">
					<a href="${pageContext.request.contextPath}/codyListView?cody_idx=${cody.cody_idx}">
					<div id="ranking">
					<c:choose>
					<c:when test="${status.index eq 0}">
					<font style="vertical-align: inherit; color: gold;">${status.index+1 }</font>
					</c:when>
					<c:when test="${status.index eq 1}">
					<font style="vertical-align: inherit; color: silver;">${status.index+1 }</font>
					</c:when>
					<c:otherwise>
					<font style="vertical-align: inherit; color: #CD7F32;">${status.index+1 }</font>
					</c:otherwise>
					</c:choose>
					</div>
					<img class="card-img-top card-item" src="${pageContext.request.contextPath }/uploadfile/codyphoto/${cody.cody_image}" alt="Card image cap">
					<c:set var="ranking" value="${status.index }"/>
					
					</a>
						<div class="card-body" style="overflow: hidden;position: relative;padding-top: 10px;padding-bottom: 10px;padding-left: 10px;padding-right: 10px;height: 65px;">
						
						<div class="card-main" style="float:left;height: 40px;margin-top: 3px;">
						<c:choose>
			<c:when test="${not empty cody.member_photo}" >
		<img class="rounded-circle" src="${pageContext.request.contextPath }/uploadfile/memberphoto/${cody.member_photo }" style="width:40px; height: 40px;">
		</c:when>
		<c:otherwise>
		<img class="rounded-circle" src="${pageContext.request.contextPath }/uploadfile/member.png" width="40" height="40"> 
		
		</c:otherwise>
		</c:choose>
						
						 
						 <div style="float:right; padding-left: 15px;">
						 <div>
						 <c:set var="memberId" value="${cody.member_id}"/>
						 <c:set var="Id"  value="${fn:length(memberId)}"/>
						 <c:if test="${Id > 9}">
						   <c:set var="memberId" value="${fn:substring(memberId, 0, 8)} ..." />
						  </c:if>
						  <p style="vertical-align: inherit;margin-bottom: 0px;height: 20px;">
						  ${memberId}
						 </p>
						 </div>
					     <div><p style="vertical-align: inherit;margin-bottom: 0px;height: 20px; font-size:5px">${cody.cody_height}cm ${cody.cody_age}세</p></div>
					    </div>
					    </div>
					    <c:if test="${loginInfo eq null }">
					    	<button class="btn btn-info" style="float:right;width: 73px; height: 42px;padding-top: 0px;padding-bottom: 0px;" onclick="loginCh()">
							<div style="height: 17px;"><i class="fas fa-user-plus" style="font-size: 14px;vertical-align: inherit;"></i></div><div><i style="font-size: 14px; vertical-align: inherit;">팔로우</i></div>
			            	</button>
					    </c:if>
					    <c:if test="${loginInfo ne null }">
							<c:if test="${loginInfo.member_idx eq cody.member_idx}" >
							<a href="${pageContext.request.contextPath }/codyUpdate?cody_idx=${cody.cody_idx}" class="btn btn-info" style="float:right;width: 73px;height: 42px;">수정</a>						
							</c:if>
							<c:if test="${loginInfo.member_idx ne cody.member_idx}" >
								
								<!-- 둘다 없을때 신청하기 -->
								<c:if test="${cody.follow eq null and cody.accept eq null}">
								<button class="btn btn-info" style="float:right;width: 73px; height: 42px;padding-top: 0px;padding-bottom: 0px;" onclick="followIns(${cody.member_idx})">
								<div style="height: 17px;"><i class="fas fa-user-plus" style="font-size: 14px;vertical-align: inherit;"></i></div><div><i style="font-size: 14px; vertical-align: inherit;">팔로우</i></div>
			           	 		</button>
			           	 		</c:if>
			           	 		<!-- 상대방이 신청중인 경우 수락하기 -->
			           	 		<c:if test="${cody.follow eq null and cody.accept ne null}">
									<c:if test="${cody.acceptInfo eq false }">
									<button class="btn btn-info" style="float:right;width: 73px; height: 42px;padding-top: 0px;padding-bottom: 0px;" onclick="followUp(${cody.member_idx})">
									<div style="height: 17px;"><i class="fas fa-user-plus" style="font-size: 14px;vertical-align: inherit;"></i></div><div><i style="font-size: 14px; vertical-align: inherit;">팔로우</i></div>
			           	 			</button>
			           	 			</c:if>
									<c:if test="${cody.acceptInfo eq true }">
									<button class="btn btn-danger" style="float:right;width: 73px; height: 42px;padding-top: 0px;padding-bottom: 0px;" onclick="followDel(${cody.followIdx})">
									<div style="height: 17px;"><i class="fas fa-user-check" style="font-size: 14px;vertical-align: inherit;"></i></div><div><i style="font-size: 14px; vertical-align: inherit;">팔로잉</i></div>
			           	 			</button>
			           	 			</c:if>
			           	 		</c:if>
			           	 		
			           	 		<!-- 내가 신청중인 경우 -->
			           	 		<c:if test="${cody.follow ne null }">
									<c:if test="${cody.followInfo eq false }">
									<button class="btn btn-info" style="float:right;width: 73px; height: 42px;padding-top: 0px;padding-bottom: 0px;" onclick="followIns(${cody.member_idx})">
									<div style="height: 17px;"><i class="fas fa-user-plus" style="font-size: 14px;vertical-align: inherit;"></i></div><div><i style="font-size: 14px; vertical-align: inherit;">팔로우</i></div>
			           	 			</button>
			           	 			</c:if>
									<c:if test="${cody.followInfo eq true }">
									<button class="btn btn-danger" style="float:right;width: 73px; height: 42px;padding-top: 0px;padding-bottom: 0px;" onclick="followDel(${cody.followIdx})">
									<div style="height: 17px;"><i class="fas fa-user-check" style="font-size: 14px;vertical-align: inherit;"></i></div><div><i style="font-size: 14px; vertical-align: inherit;">팔로잉</i></div>
			           	 			</button>
			           	 			</c:if>
			           	 		</c:if>
			           	 		
			           	 	</c:if>
			           	 	
			            </c:if>
						</div>
				</li>
            </c:forEach>
			</ol>
			</div>		
	<!------------------ 전체 리스트 반복 출력 ----------------------->
				<div class="my-3 p-3 bg-white rounded box-shadow">
			<p style="vertical-align: inherit;font-size:23px; margin-left: 37px; max-width: 823px; border-bottom: 1px solid darkgray;">전체 리스트</p>
			<ol class="card-item-ol" >
					<c:forEach var="irr" items="${irr}">

						<li class="card card-item-li" style="margin-bottom: 50px;display: inline-block;"><a
							href="${pageContext.request.contextPath}/codyListView?cody_idx=${irr.cody_idx}"><img
								class="card-img-top card-item"
								src="${pageContext.request.contextPath}/uploadfile/codyphoto/${irr.codyimage}"
								alt="Card image cap"></a>
							
							<div class="card-body" style="overflow: hidden;position: relative;padding-top: 10px;padding-bottom: 10px;padding-left: 10px;padding-right: 10px;height: 65px;;">
						
						<div class="card-main" style="float:left;height: 40px;margin-top: 3px;">
						<c:choose>
			<c:when test="${not empty irr.photo}" >
		<img class="rounded-circle" src="${pageContext.request.contextPath }/uploadfile/memberphoto/${irr.photo }" style="width:40px; height: 40px;">
		</c:when>
		<c:otherwise>
		<img class="rounded-circle" src="${pageContext.request.contextPath }/uploadfile/member.png" width="40" height="40"> 
		
		</c:otherwise>
		</c:choose>
				
						 
						 <div style="float:right; padding-left: 15px;">
						 <div>
						 <c:set var="memberId2" value="${irr.id}"/>
						 <c:set var="Id2"  value="${fn:length(memberId2)}"/>
						 <c:if test="${Id2 > 9}">
						   <c:set var="memberId2" value="${fn:substring(memberId2, 0, 8)} ..." />
						  </c:if>
						 <p style="vertical-align: inherit;margin-bottom: 0px;height: 20px;">
						 ${memberId2}
						 </p>
						 </div>
							
					     <div><p style="vertical-align: inherit;margin-bottom: 0px;height: 20px; font-size:5px">${irr.codyheight}cm ${irr.codyage}세</p></div>
					    </div>
					    </div>					   
						<c:if test="${loginInfo eq null }">
					    	<button class="btn btn-info" style="float:right;width: 73px; height: 42px;padding-top: 0px;padding-bottom: 0px;" onclick="loginCh()">
							<div style="height: 17px;"><i class="fas fa-user-plus" style="font-size: 14px;vertical-align: inherit;"></i></div><div><i style="font-size: 14px; vertical-align: inherit;">팔로우</i></div>
			            	</button>
					    </c:if>
					    <c:if test="${loginInfo ne null }">
							<c:if test="${loginInfo.member_idx eq irr.member_idx}" >
							<a href="${pageContext.request.contextPath }/codyUpdate?cody_idx=${irr.cody_idx}" class="btn btn-info" style="float:right;width: 73px;height: 42px;">수정</a>						
							</c:if>
							<c:if test="${loginInfo.member_idx ne irr.member_idx}" >
								
								<!-- 둘다 없을때 신청하기 -->
								<c:if test="${irr.follow eq null and irr.accept eq null}">
								<button class="btn btn-info" style="float:right;width: 73px; height: 42px;padding-top: 0px;padding-bottom: 0px;" onclick="followIns(${irr.member_idx})">
								<div style="height: 17px;"><i class="fas fa-user-plus" style="font-size: 14px;vertical-align: inherit;"></i></div><div><i style="font-size: 14px; vertical-align: inherit;">팔로우</i></div>
			           	 		</button>
			           	 		</c:if>
			           	 		<!-- 상대방이 신청중인 경우 수락하기 -->
			           	 		<c:if test="${irr.follow eq null and irr.accept ne null}">
									<c:if test="${irr.acceptInfo eq false }">
									<button class="btn btn-info" style="float:right;width: 73px; height: 42px;padding-top: 0px;padding-bottom: 0px;" onclick="followUp(${irr.member_idx})">
									<div style="height: 17px;"><i class="fas fa-user-plus" style="font-size: 14px;vertical-align: inherit;"></i></div><div><i style="font-size: 14px; vertical-align: inherit;">팔로우</i></div>
			           	 			</button>
			           	 			</c:if>
									<c:if test="${irr.acceptInfo eq true }">
									<button class="btn btn-danger" style="float:right;width: 73px; height: 42px;padding-top: 0px;padding-bottom: 0px;" onclick="followDel(${irr.followIdx})">
									<div style="height: 17px;"><i class="fas fa-user-check" style="font-size: 14px;vertical-align: inherit;"></i></div><div><i style="font-size: 14px; vertical-align: inherit;">팔로잉</i></div>
			           	 			</button>
			           	 			</c:if>
			           	 		</c:if>
			           	 		
			           	 		<!-- 내가 신청중인 경우 -->
			           	 		<c:if test="${irr.follow ne null }">
									<c:if test="${irr.followInfo eq false }">
									<button class="btn btn-info" style="float:right;width: 73px; height: 42px;padding-top: 0px;padding-bottom: 0px;" onclick="followIns(${irr.member_idx})">
									<div style="height: 17px;"><i class="fas fa-user-plus" style="font-size: 14px;vertical-align: inherit;"></i></div><div><i style="font-size: 14px; vertical-align: inherit;">팔로우</i></div>
			           	 			</button>
			           	 			</c:if>
									<c:if test="${irr.followInfo eq true }">
									<button class="btn btn-danger" style="float:right;width: 73px; height: 42px;padding-top: 0px;padding-bottom: 0px;" onclick="followDel(${irr.followIdx})">
									<div style="height: 17px;"><i class="fas fa-user-check" style="font-size: 14px;vertical-align: inherit;"></i></div><div><i style="font-size: 14px; vertical-align: inherit;">팔로잉</i></div>
			           	 			</button>
			           	 			</c:if>
			           	 		</c:if>
			           	 		
			           	 	</c:if>
			           	 	
			            </c:if>
            </c:forEach>
			</ol>
						
		</div>
	<small class="d-block text-right mt-3"> <a href="#">All updates</a></small>
	
			
	
	
	

	
	
</div>

	</main>

	<!-- 인클루드 footer -->
	<%@ include file="./bottom/footer.jsp" %>
	
</body>

<script>


</script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
	 <script>
   //<![CDATA[
   // 사용할 앱의 JavaScript 키를 설정해 주세요.
   Kakao.init('25e3cdf97fe0c1f3efadeb6d1cbf3671');
   // 카카오 로그인 버튼을 생성합니다.
   Kakao.Auth.createLoginButton({
     container: '#kakao-login-btn',
     size:'large',
         success: function(authObj) {
           // 로그인 성공시, API를 호출합니다.
           Kakao.API.request({
             url: '/v1/user/me',
             success: function(res) {
            	 var jsonval = JSON.parse(JSON.stringify(res));
              /*  alert(JSON.stringify(res));
               
               alert(jsonval);
               alert(jsonval.kaccount_email);
               alert(jsonval.properties.thumbnail_image);
               alert(jsonval.properties.nickname);  */  
               
               
               // 내부 서버로 데이터를 넘겨 세션을 만들어준다. 내부서버에는 해당 데이터들을 받아 처리할 controller 필요.
              $.ajax({
                type : "POST",
                data : 
                	
                "kakaoEmail="+jsonval.kaccount_email+
                "&kaccount_email_verified="+jsonval.kaccount_email_verified+
                "&id="+jsonval.id+
                "&profile_image="+jsonval.properties.profile_image+
                "&nickname="+jsonval.properties.nickname+
                "&thumbnail_image="+jsonval.properties.thumbnail_image,
                
                
                url : "kakaologin",
                success : function(){
                 alert("카카오 로그인에 성공하였습니다.");
                 window.location.href = "http://localhost:8080/cody/";
                 }
                });
             },
             fail: function(error) {
               alert(JSON.stringify(error));
             }
           });  
     
    },
    fail : function(err) {
     alert(JSON.stringify(err));
    }
   });
   //]]>
  </script>
</html>