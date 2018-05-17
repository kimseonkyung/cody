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
div {
	border: 1px solid gray;
	width: 500px;
}
</style>

<script type="text/javascript" src="https://code.jquery.com/jquery-1.10.2.js"></script>
	

</head>
<body>


	<div>
		<div id="repleList">
			<c:forEach var="arr" items="${arr }">
				<div id="repleView" style="margin-left: ${20*arr.redepth}px;">
					<div>
					${arr.member_id } <span>${arr.reple_date }</span> 
					<button id="re_repleShow${arr.reple_idx }" onclick="btnShow(${arr.reple_idx })">답글</button>
					<button id="repleDelete${arr.reple_idx }" onclick="repleDelete(${arr.reple_idx })">삭제</button>
					</div>
					<div>${arr.reple_contents} </div>
					
					
						
					<div id="re_reple${arr.reple_idx }" style="display: none;">
					<form id="re_repleForm${arr.reple_idx }">
						<input type="hidden" id="cody_idx" name="cody_idx" value="1"> 
						<input type="hidden" id="regroup" name="regroup" value="${arr.regroup }">
						<input type="hidden" id="reparent" name="reparent" value=${arr.reple_idx }>
						<input type="hidden" id="redepth" name="redepth" value="${arr.redepth }">
						<input type="hidden" id="reorder" name="reorder" value="${arr.reorder }">
						<textarea id="reple_contents" name="reple_contents" rows="3" cols="60" maxlength="500"></textarea>
					</form>
						<button id="re_repleSave" onclick="re_repleSave(${arr.reple_idx })">저장</button>
					</div>

				</div>

			</c:forEach>


		</div>




		<div id="reple">
			<input type="hidden" id="cody_idx" value="1">
			<input type="hidden" id="member_idx" value="1">
			<textarea id="reple_contents" name="reple_contents" rows="3" cols="60" maxlength="500"></textarea>
			<button id="repleSave">저장</button>
		</div>

	</div>
	<br>
	<br>
	<hr>

	

	<script	src="${pageContext.request.contextPath}/resources/script/cody_kim.js"></script>


</body>
</html>
