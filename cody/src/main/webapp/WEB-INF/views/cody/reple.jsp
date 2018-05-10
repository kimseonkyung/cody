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

<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript">
	
</script>

</head>
<body>

	<div>
		<div id="repleList">
			<c:forEach var="list" items="${list_r }">
				<div id="repleView" style="margin-left: ${20*list.redepth}px;">
					${list.reple_contents} ${list.relpe_date }
					
					<span><fmt:formatDate var="thisYmd" value="${list.relpe_date}" pattern="yyyy-MM-dd HH:mm:ss" /></span>
					<c:set var="depth" value="${list.redepth}" />
					<c:if test="${depth < 1 }">
						<button id="re_repleShow${list.reple_idx }" onclick="btnShow(${list.reple_idx })">답글</button>
						<button id="repleDelete${list.reple_idx }" onclick="repleDelete(${list.reple_idx })">삭제</button>
					</c:if>

					<div id="re_repleSave${list.reple_idx }"
						style="border: 1px solid gray; width: 500px; display: none">
						<input type="hidden" id="cody_idx" value="1"> <input type="hidden" id="member_idx" value="1">
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

	<div>
		<button id="reception" onclick="receptionOk()">알림</button>
		<div id="ok" style="display: none">new!!</div>
	</div>

	<script>
	$(document).ready(function() {
		var cnt = $('#tocCnt').val();
		
		setInterval(function () {
			
			$.ajax({
				type : 'post',
				url : '${pageContext.request.contextPath}/reception',
				dataType : 'text',
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
	
	
	function receptionOk() {
		
		$.ajax({
			type : 'post',
			url : '${pageContext.request.contextPath}/receptionOk',
			dataType : 'text',
			data : {
				},
			success : function(data) {
				alert("확인");
			}
		});
	}
		
	
		/* 첫댓글 저장 */
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
							var rd = new Date();
							var y = rd.getFullYear();
							var m = rd.getMonth();
							var d = rd.getDate();
							
							$('#repleList').append('<div>'+reple_contents
									+' <span>'+y+'.'+m+'.'+d+'<span>'
									+' <button id="re_repleShow">답글</button> <button id= "repleDelete${list.reple_idx }"'
									+' onclick= "repleDelete(${list.reple_idx })">삭제</button></div>'
									+' <div id="re_repleSave${list.reple_idx }"'
									+' style="border: 1px solid gray; width: 500px; display: none">'
									+' <input type="hidden" id="cody_idx" value="1"> <input type="hidden" id="member_idx" value="1">'
									+' <textarea id="reple_contents" rows="3" cols="60" maxlength="500"></textarea>'
									+' <button id="re_replySave">저장</button>'
								    +' </div>');
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
