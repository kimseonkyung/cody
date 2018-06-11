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
	border: 1px solid gray;
	width: 700px;
	float: left;
}

#notice {
	border-radius: 3px;
	border: 1px solid #ddd;
}

#notice .activity {
	width: 100%;
	height: 100px;
	display: table;
	border-bottom: 1px solid #red;
	
}

.activity div {
	display: inline-block;
}

.pageNum>.active>a, .pageNum>.active>a:focus, .pageNum>.active>a:hover, 
.pageNum>.active>span, .pageNum>.active>span:focus, .pageNum>.active>span:hover {
	background-color:#005aab;
	border-color:#005aab;
	}

.pageNum li{
	display: inline-block;
}

#sidebar {
	width: 370px;
	float: right;
	
}

.new {
	border-radius: 3px;
	border: 1px solid #red;
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
		<h1><i class="fa fa-bell-o" aria-hidden="true"></i> 공지 사항</h1>
		<button onclick="receptionOk()">일괄확인</button>
	</div>
	</div>
</header>
	<div class="container" style="height: 700px;">
	<div id="page_container">
		<div id="notice" class="m-3 p-3 bg-white rounded box-shadow">
		<ul style="margin: 0; padding: 0;">
			<c:forEach var="notice" items="${page }">
				<li class="activity">
					<div style="width: 70px;">
					<img src="${pageContext.request.contextPath}/uploadfile/codyphoto/${notice.cody_image }" style="width: 100%;">
					</div>
					<div style="vertical-align: middle; padding-left: 18px;">
					<h6>${notice.cody_title }코디에 ${notice.member_id }가 댓글을 달았습니다.</h6>
					<h6>${notice.reple_date }</h6>
					</div>
				</li>
			</c:forEach>
		</ul>
   	 	</div>
    
    	<div id="page">
     <!-- 페이징  -->
		<c:choose>
		<c:when test="${paging.numberOfRecords ne NULL and paging.numberOfRecords ne '' and paging.numberOfRecords ne 0}">
		<div>
			<ul class="pageNum">
				<c:if test="${paging.currentPageNo gt 3}">  											  <!-- 현재 페이지가 3보다 크다면(즉, 4페이지 이상이라면) -->
					<li><a href="javascript:gopage(${paging.prevPageNo}, ${paging.maxPost})">이전</a></li> <!-- 이전페이지 표시 -->
				</c:if>
				
					<!-- 다른 페이지를 클릭하였을 시, 그 페이지의 내용 및 하단의 페이징 버튼을 생성하는 조건문-->
					<c:forEach var="i" begin="${paging.startPageNo}" end="${paging.endPageNo}" step="1"> <!-- 변수선언 (var="i"), 조건식, 증감식 -->
		            <c:choose>
		                <c:when test="${i eq paging.currentPageNo}"> 
		                      <li class="active"><a href="javascript:gopage(${i}, ${paging.maxPost})">${i}</a></li> <!-- 1페이지부터 5개씩 뽑아내고, 1,2,3페이지순으로 나타내라-->
		                </c:when>
		                	<c:otherwise>
		                    <li><a href="javascript:gopage(${i}, ${paging.maxPost})">${i}</a></li> 
							</c:otherwise>
					</c:choose>
					</c:forEach>
					
					<!-- begin에 의해서 변수 i는 1이기 때문에, 처음에는 c:when이 수행된다. 그 후 페이징의 숫자 2를 클릭하면 ${i}는 2로변하고, 현재는 ${i}는 1이므로 otherwise를 수행한다
					         그래서 otherwise에 있는 함수를 수행하여 2페이지의 게시물이 나타나고, 반복문 실행으로 다시 forEach를 수행한다. 이제는 i도 2이고, currentPageNo도 2이기 때문에
					     active에 의해서 페이징부분의 2에 대해서만 파란색으로 나타난다. 그리고 나머지 1,3,4,5,이전,다음을 표시하기위해 다시 c:otherwise를 수행하여 페이징도 나타나게한다.-->
				<!-- // 다른 페이지를 클릭하였을 시, 그 페이지의 내용 및 하단의 페이징 버튼을 생성하는 조건문-->
										
				<!-- 소수점 제거 =>-->
				<fmt:parseNumber var="currentpage" integerOnly="true" value="${(paging.currentPageNo-1)/3}"/>
				<fmt:parseNumber var="finalpage" integerOnly="true" value="${(paging.finalPageNo-1)/3}"/>
					
				<c:if test="${currentpage < finalpage}"> <!-- 현재 페이지가 마지막 페이지보다 작으면 '다음'을 표시한다. -->
					<li><a href="javascript:gopage(${paging.nextPageNo}, ${paging.maxPost})">다음</a></li>
				</c:if> 
			</ul>
		</div>
		</c:when>
		</c:choose>
		</div>
    </div>
    
    <aside id="sidebar">
    	<div class="new"> 
    		dsad<br>
    		asdasdasssssssssssssssss<br>
    		asdasd<br>
    		sadasd<br>
    		sadasd<br>
    		asdasd
    	
    	
    	</div>
    </aside>
    
    </div>
    
    <%@ include file="../bottom/footer.jsp" %>
   
	
	
	
	 
	

</body>

<script	src="${pageContext.request.contextPath}/resources/script/cody_kim.js"></script>


</html>
