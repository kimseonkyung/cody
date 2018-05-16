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
					${arr.member_id } ${arr.reple_date } 
					<button id="re_repleShow${arr.reple_idx }" onclick="btnShow(${arr.reple_idx })">답글</button>
					<button id="repleDelete${arr.reple_idx }" onclick="repleDelete(${arr.reple_idx })">삭제</button>
					</div>
					<div>${arr.reple_contents} </div>
					
					
						

					<div id="re_repleSave${arr.reple_idx }" style="display: none;">
						<input type="hidden" id="cody_idx" value="1"> <input type="hidden" id="member_idx" value="1">
						<textarea id="reple_contents" rows="3" cols="60" maxlength="500"></textarea>
						<button id="re_repleSave">저장</button>
					</div>


				</div>

			</c:forEach>


		</div>




		<div id="reple">
			<input type="hidden" id="member_id" value="sessionId">
			<input type="hidden" id="cody_idx" value="1">
			<input type="hidden" id="member_idx" value="1">
			<textarea id="reple_contents" name="reple_contents" rows="3" cols="60" maxlength="500"></textarea>
			<button id="repleSave">저장</button>
		</div>

	</div>
	<br>
	<br>
	<hr>

	<div>
		<form action="${pageContext.request.contextPath}/noticeList" method="post">
		<input type="hidden" value="sk">
		<input type="submit" value="알림">
		</form>
		<div id="ok" style="display: none">new!!</div>
	</div>

	<script>
	$(document).ready(function() {
		
		setInterval(function () {
			
			$.ajax({
				type : 'post',
				url : '${pageContext.request.contextPath}/reception',
				dataType : 'json',
				data : {
					},
				success : function(data) {
					if ( data > 0 ) {
						$('#ok').css('display', 'block');
					}
					else {
						$('#ok').css('display', 'none');
					}
				}
			});
			
		}, 1000);
		
	});
	
	
	
		/* 첫댓글 저장 */
		$('#reple #repleSave').click(function() {

					var cody_idx = $('#reple #cody_idx').val();
					var member_idx = $('#reple #member_idx').val();
					var reple_contents = $('#reple #reple_contents').val();
					
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
							var rd = new Date();
							var y = rd.getFullYear();
							var m = rd.getMonth();
							var d = rd.getDate();
							
							$('#repleList').append(
									${}		
									${}		
									${}		
							);
									
						}
					});
				});
		
		/* 대댓글 저장 */
		
		
		
		/* 답글 작성공간 보여주기 */
		function btnShow(reple_idx) {
			if($('#re_repleSave'+reple_idx).css('display') == 'none') {
				$('#re_repleSave'+reple_idx).show();
			} else {
				$('#re_repleSave'+reple_idx).hide();	
			}
		}
		
		
		
		
		/* 답글 삭제 */
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
		

		
		
		
	
	</script>


</body>
</html>
