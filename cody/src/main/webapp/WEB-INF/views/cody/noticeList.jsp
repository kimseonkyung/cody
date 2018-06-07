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
#notice {
	border: 1px solid gray;
	width: 500px;
}
</style>

<script type="text/javascript" src="https://code.jquery.com/jquery-1.10.2.js"></script>
	

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
	<div class="container">
	<div>
		<h1><i class="fa fa-bell-o" aria-hidden="true"></i> 공지 사항</h1>
		<button onclick="receptionOk()">일괄확인</button>
	</div>
	</div>
</header>
	<div class="container">
	<div id="notice" class="m-3 p-3 bg-white rounded box-shadow">
		<c:forEach var="notice" items="${arr }">
			<div>
					${notice.cody_image }
					<div>${notice.cody_title }코디에 ${notice.member_id }가 댓글을 달았습니다.</div>
					<div>${notice.reple_date }</div>
			</div>
		</c:forEach>
	
    </div>
    </div>
	
	<%@ include file="../bottom/footer.jsp" %>
	
	 
	

</body>

<script>

function receptionOk() {
	
	$.ajax({
		type : 'post',
		url : '${pageContext.request.contextPath}/receptionOk',
		dataType : 'text',
		data : {
			},
		success : function(data) {
			alert("확인완료");
			location.reload(true);
		}
	});
}


</script>

</html>
