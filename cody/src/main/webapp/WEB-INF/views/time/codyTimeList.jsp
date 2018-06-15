<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>타임라인</title>

<script src="${pageContext.request.contextPath}/resources/script/cody_kim.js"></script>
<script src="${pageContext.request.contextPath}/resources/script/cody_lim.js"></script>
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

<style>

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
			<a class="nav-link col-4 mr-auto" href="${pageContext.request.contextPath}/main" style="font-size: 22px; font-weight: 600;">All</a> 
			<a class="nav-link col-4 mr-auto" href="${pageContext.request.contextPath}/codyTimeListMan" style="font-size: 22px; font-weight: 600;">Men</a>
			<a class="nav-link col-4 mr-auto" href="${pageContext.request.contextPath}/codyTimeListWoman" style="font-size: 22px; font-weight: 600;">Women</a>
		</nav>
	</div>
</div>

    <div class="row">
     <!--------------------- 메인 사이드 ----------------------->

	<%@ include file="../top/aside.jsp" %>

      <div class="col-md-10 order-md-2">
         <div class="my-3 p-3 bg-white rounded box-shadow">
            <ol class="card-item-ol">
               <!------------------ 타임라인 전체 리스트 반복 출력 ----------------------->

               <c:forEach var="irr" items="${irr}">

                  <li class="card card-item-li" style="margin-bottom: 50px;display: inline-block;"><a
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
                              &emsp;${item.item_price}원<a href="#" class="btn btn-info"
                                 style="position: absolute; right: 10px;">구입</a>
                           </div>

                        </c:forEach>


                        <div class="card-main" style="float: left; height: 40px;margin-top: 3px;">
                           <c:choose>
			<c:when test="${not empty irr.memberphoto}" >
		<img class="rounded-circle"
                              src="${pageContext.request.contextPath }/uploadfile/memberphoto/${irr.memberphoto }"
                              style="width: 40px; height: 40px;">
		</c:when>
		<c:otherwise>
		<img class="rounded-circle" src="${pageContext.request.contextPath }/uploadfile/member.png" style="width: 40px; height: 40px;"> 
		
		</c:otherwise>
		</c:choose>
                           
                           <div style="float: right; padding-left: 15px;">
                              <div>
                              <c:set var="memberId" value="${irr.memberid}"/>
						      <c:set var="Id"  value="${fn:length(memberId)}"/>
						      <c:if test="${Id > 9}">
						      <c:set var="memberId" value="${fn:substring(memberId, 0, 8)} ..." />
						      </c:if>
                                 <p style="vertical-align: inherit; margin-bottom: 0px; height: 20px;">${memberId}</p>
                              </div>

                              <div>
                                 <p
                                    style="vertical-align: inherit; margin-bottom: 0px; height: 20px; font-size: 5px">${irr.codyheight}cm
                                    ${irr.codyage}세</p>
                              </div>
                           </div>
                        </div>
                      <c:if test="${loginInfo eq null }">
					    	<button class="btn btn-info" style="float:right;width: 73px; height: 42px;padding-top: 0px;padding-bottom: 0px;" onclick="loginCh()">
							<div style="height: 17px;"><i class="fas fa-user-plus" style="font-size: 14px;vertical-align: inherit;"></i></div><div><i style="font-size: 14px; vertical-align: inherit;">팔로우</i></div>
			            	</button>
					    </c:if>
					    <c:if test="${loginInfo ne null }">
							<c:if test="${loginInfo.member_idx eq irr.memberidx}" >
							<a href="${pageContext.request.contextPath }/codyUpdate?cody_idx=${irr.memberidx}" class="btn btn-info" style="float:right;width: 73px;height: 42px;">수정</a>						
							</c:if>
							<c:if test="${loginInfo.member_idx ne irr.memberidx}" >
								
								<!-- 둘다 없을때 신청하기 -->
								<c:if test="${irr.follow eq null and irr.accept eq null}">
								<button class="btn btn-info" style="float:right;width: 73px; height: 42px;padding-top: 0px;padding-bottom: 0px;" onclick="followIns(${irr.memberidx})">
								<div style="height: 17px;"><i class="fas fa-user-plus" style="font-size: 14px;vertical-align: inherit;"></i></div><div><i style="font-size: 14px; vertical-align: inherit;">팔로우</i></div>
			           	 		</button>
			           	 		</c:if>
			           	 		<!-- 상대방이 신청중인 경우 수락하기 -->
			           	 		<c:if test="${irr.follow eq null and irr.accept ne null}">
									<c:if test="${irr.acceptInfo eq false }">
									<button class="btn btn-info" style="float:right;width: 73px; height: 42px;padding-top: 0px;padding-bottom: 0px;" onclick="followUp(${irr.memberidx})">
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
									<button class="btn btn-info" style="float:right;width: 73px; height: 42px;padding-top: 0px;padding-bottom: 0px;" onclick="followIns(${irr.memberidx})">
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
   <script>
   
   
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
