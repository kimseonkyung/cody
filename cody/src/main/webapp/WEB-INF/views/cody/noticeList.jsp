<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#page_container {
	width: 800px;
	float: left;
}

#notice {
	border-radius: 3px;
	border: 1px solid #ddd;
}

#new {
	border-radius: 3px;
	border: 1px solid #ddd;
}

#notice .activity {
	width: 100%;
	display: table;
	border-bottom: 1px solid #ddd;
	
}

.activity div {
	display: inline-block;
}

.pageNum>.active>a, .pageNum>.active>a:focus, .pageNum>.active>a:hover, .pageNum>.active>span, .pageNum>.active>span:focus, .pageNum>.active>span:hover {
		font-weight: bold;
		color: #aaa;
	}
	
.pageNum {
	text-align: center;
}

.pageNum li{
	display: inline-block;
}

#sidebar {
	width: 300px;
	float: right;
	
}

.new {
	border-radius: 3px;
	border: 1px solid #ddd;
}

.fontNum {
	font-size: 30px;
	text-align: center;
	color: #aaa;
	margin: 0 5px 0 5px;
}

.font {
	font-size: 40px;
	text-align: center;
	color: #aaa;
}

.pageIcon {
	background-color: #ddd;
	border: 1px solid #ddd;
	padding: 0 20px 0 20px;
	margin: 0 20px 0 20px;
}

.tit {
	padding: 19px 0 17px 18px;
	font-weight: bold;
	border-bottom: 1px solid #eee;
	font-size: 14px;
	line-height: 1.2;
}

.tit ul {
	padding: 8px 18px 20px 12px;
}

.tit li {
	font-size: 14px;
	padding: 0 0 0 18px;
	margin: 8px 0 0 0;
}

</style>

</head>
<body>
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
	
</main>
<header style="border-bottom: 1px solid #ddd; padding: 50px 0 30px 0;">
	<div class="container" s>
	<div>
		<h1><i class="far fa-bell" aria-hidden="true"></i> 공지 사항</h1>
	</div>
	</div>
</header>
	<div class="container" style="height: 750px;">
	<div id="page_container">
		<div id="notice" class="m-3 bg-white rounded box-shadow">
		<div style="border-bottom: 1px solid #ddd; padding: 10px; height: 70px;">
		<h2 style="float: left; margin: 10px 0 0 10px; color: #555">알림</h2>
		<button class="btn btn-outline-secondary" style="float: right; margin: 10px 10px 0 0; border-color: #ccc;" onclick="receptionOk()">전체삭제</button>
		</div>
		<div style="padding: 20px;">
		<ul style="margin: 0; padding: 0;">
			<c:forEach var="notice" items="${page }">
				<li class="activity">
				<div style="margin: 10px 0 10px 0; width: 700px; height: 100px; position: relative;">
					<div style="width: 70px; vertical-align: middle;">
					<a href="${pageContext.request.contextPath}/codyListView?cody_idx=${notice.cody_idx}"><img src="${pageContext.request.contextPath}/uploadfile/codyphoto/${notice.cody_image }" style="width: 100%;"></a>
					</div>
					<div style="vertical-align: middle; padding-left: 18px;">
					<h6>${notice.cody_title }코디에 ${notice.member_id }가 댓글을 달았습니다.</h6>
					<div><i class="fa fa-plus-circle"></i>&ensp;<h6 style="display: inline-block;">${notice.reple_date }</h6></div>
					</div>
					<div style="position:absolute; right: 0; bottom: 15px;">
					<a href="javascript:recepOk(${notice.reple_idx })"><i style="font-size: 20px; color: #444;" class="far fa-trash-alt"></i></a>
			
					</div>
				</div>
				</li>
			</c:forEach>
		</ul>
		</div>
   	 	</div>
    
    	<div id="page">
     <!-- 페이징  -->
		<c:choose>
		<c:when test="${paging.numberOfRecords ne NULL and paging.numberOfRecords ne '' and paging.numberOfRecords ne 0}">
		<div>
			<ul class="pageNum">
				<c:if test="${paging.currentPageNo gt 3}">  											  <!-- 현재 페이지가 3보다 크다면(즉, 4페이지 이상이라면) -->
					<li><a href="javascript:gopage(${paging.prevPageNo}, ${paging.maxPost})"><span class="font"><i class="pageIcon fa fa-angle-left"></i></span></a></li> <!-- 이전페이지 표시 -->
				</c:if>
				
					<!-- 다른 페이지를 클릭하였을 시, 그 페이지의 내용 및 하단의 페이징 버튼을 생성하는 조건문-->
					<c:forEach var="i" begin="${paging.startPageNo}" end="${paging.endPageNo}" step="1"> <!-- 변수선언 (var="i"), 조건식, 증감식 -->
		            <c:choose>
		                <c:when test="${i eq paging.currentPageNo}"> 
		                      <li class="active fontNum"><a href="javascript:gopage(${i}, ${paging.maxPost})" style="color: #aaa">${i}</a></li> <!-- 1페이지부터 5개씩 뽑아내고, 1,2,3페이지순으로 나타내라-->
		                </c:when>
		                	<c:otherwise>
		                    <li class="fontNum"><a  href="javascript:gopage(${i}, ${paging.maxPost})" style="color: #aaa">${i}</a></li> 
							</c:otherwise>
					</c:choose>
					</c:forEach>
					
					<!-- begin에 의해서 변수 i는 1이기 때문에, 처음에는 c:when이 수행된다. 그 후 페이징의 숫자 2를 클릭하면 ${i}는 2로변하고, 현재는 ${i}는 1이므로 otherwise를 수행한다
					         그래서 otherwise에 있는 함수를 수행하여 2페이지의 게시물이 나타나고, 반복문 실행으로 다시 forEach를 수행한다. 이제는 i도 2이고, currentPageNo도 2이기 때문에
					     active에 의해서 페이징부분의 2에 대해서만 진한색으로 나타난다. 그리고 나머지 1,3,4,5,이전,다음을 표시하기위해 다시 c:otherwise를 수행하여 페이징도 나타나게한다.-->
				<!-- // 다른 페이지를 클릭하였을 시, 그 페이지의 내용 및 하단의 페이징 버튼을 생성하는 조건문-->
										
				<!-- 소수점 제거 =>-->
				<fmt:parseNumber var="currentpage" integerOnly="true" value="${(paging.currentPageNo-1)/3}"/>
				<fmt:parseNumber var="finalpage" integerOnly="true" value="${(paging.finalPageNo-1)/3}"/>
				<c:if test="${currentpage < finalpage}"> <!-- 현재 페이지가 마지막 페이지보다 작으면 '다음'을 표시한다. -->
					<li><a href="javascript:gopage(${paging.nextPageNo}, ${paging.maxPost})"><span class="font"><i class="pageIcon fa fa-angle-right"></i></span></a></li>
				</c:if> 
			</ul>
		</div>
		</c:when>
		</c:choose>
		</div>
    </div>
    
    <aside id="sidebar">
    	<div id="new" class="m-3 bg-white rounded box-shadow"> 
    		<p class="tit">CODY 소식</p>
    		<ul>
    			<li><a href="#">새로운 기능 추가</a></li>
    			<li><a href="#">유니클로 감사제 7/20~7/23</a></li>
    			<li><a href="#">60 개 이상의 상점이 대상 2000원 쿠폰</a></li>
    		</ul>
    		
    	
    	</div>
    </aside>
    
    </div>
    
    <%@ include file="../bottom/footer.jsp" %>
   
	
	
	
	 
	

</body>

<script	src="${pageContext.request.contextPath}/resources/script/cody_kim.js"></script>


</html>
