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
	width: 500px; height: 500px;
}
</style>

<script type="text/javascript" src="https://code.jquery.com/jquery-1.10.2.js"></script>
	

</head>
<body>

	<div id="notice">
		<c:forEach var="notice" items="${arr }">
			<div>
					${notice.cody_image }
					<div>${notice.cody_title }코디에 ${notice.member_id }가 댓글을 달았습니다.</div>
					<div>${notice.reple_date }</div>
			</div>
		</c:forEach>
	</div>
	<button onclick="receptionOk()">일괄확인</button>
	
	
	
	 
	
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

</body>
</html>
