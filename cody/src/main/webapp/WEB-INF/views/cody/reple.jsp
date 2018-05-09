<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>

div {
	border: 1px solid gray; width: 500px;
}

</style>

<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript">
	
</script>

</head>
<body>

	<div>
		<div id="repleList">
			<c:forEach var="list" items="${list_r }">
				<div id="repleView"
					style="margin-left: ${20*list.redepth}px;">
					${list.reple_contents} ${list.relpe_date}
					
					<button id="re_repleShow">답글</button>
					<button id="repleDelete${list.reple_idx }" onclick="repleDelete(${list.reple_idx })">삭제</button>
					
					
					<div id="re_repleSave" style="border: 1px solid gray; width: 500px; display: none">
						<input type="hidden" id="cody_idx" value="1">
						<input type="hidden" id="member_idx" value="1">
						<textarea id="reple_contents" rows="3" cols="60" maxlength="500"></textarea>
						<button id="re_replySave">저장</button>
					</div>
					
					
				</div>
				
			</c:forEach>
			
			
		</div>

		


		<div>
			<input type="hidden" id="cody_idx" value="1"> <input
				type="hidden" id="member_idx" value="1">
			<textarea id="reple_contents" rows="3" cols="60" maxlength="500"></textarea>
			<button id="replySave">저장</button>
		</div>
		
	</div>
	<br>
	<br>
	<hr>

	<div id="toc" style="display: none">
	<input id="tocCnt" type="hidden" value="0">
	!!</div>

	<script>
	$(document).ready(function() {
		var cnt = $('#tocCnt').val();
		
		setInterval(
		notice(cnt), 1000);
		
	}
	
		
	
	
		$('#replySave').click(function() {

					var cody_idx = $('#cody_idx').val();
					var member_idx = $('#member_idx').val();
					var reple_contents = $('#reple_contents').val();

					$.ajax({
						type : 'post',
						url : '${pageContext.request.contextPath}/repleInsert',
						dataType : 'text',
						data : {
							cody_idx : cody_idx,
							member_idx : member_idx,
							reple_contents : reple_contents
						},
						success : function(data) {
							$('#repleList').append('<div>'+reple_contents + ' : '+member_idx+'</div>');
						}
					});
				});
		
		
		$('#re_repleShow').click(function () {
			$(this).next().next().css('display', 'block');
		});
		
		
		
		
		function repleDelete(reple_idx) {
			
			$.ajax({
				type : 'get',
				url : '${pageContext.request.contextPath}/repleDelete',
				dataType : 'text',
				data : {
					reple_idx : reple_idx
				},
				success : function(data) {
					$('#repleDelete'+reple_idx).parent().remove();
				}
			});
		}
		

		function notice(cnt) {
			
			
			$.ajax({
				type : 'get',
				url : 
				
				
			});
			
			
		}
		
		
		
	</script>


</body>
</html>
