/**
 * function addBookmark(cody_idx,member_idx){
 * 
 * console.log(cody_idx,member_idx); var params = new Object(); params.cody_idx =
 * cody_idx; params.member_idx = member_idx; $.ajax({
 * url:contextRoot+"/bookmark", type:'POST', data: params,
 * success:function(data){ alert("완료!"); console.log(data);
 * window.opener.location.reload(); self.close(); }, error:function(jqXHR,
 * textStatus, errorThrown){ alert("에러 발생 \n" + textStatus + " : " +
 * errorThrown); self.close(); } }); }
 * 
 */
var contextRoot = '${contextRoot}';

$(documemt).ready(function() {
	var cnt = $('#clickLike').val();

	setInterval(function() {

		$.ajax({
			type : 'post',
			url : '${pageContext.request.contextPath}/clickLike',
			dataType : 'text',
			data : {

			},
			success : function(data) {

				if (data > 0) {

					$('#ok').css('display', 'block');
				} else {
					$('#ok').css('display', 'nonauce');
				}
			}
		});

	}, 1000);

	function clickLikeOk() {

		$.ajax({
			type : 'post',
			url : '${pageContext.request.contextPath}/clickLikeOk',
			dataType : 'text',
			data : {},
			success : function(data) {
				alert("확인");
			}
		});
	}

});
