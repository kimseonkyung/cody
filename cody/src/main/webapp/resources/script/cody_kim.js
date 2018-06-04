/*
	작성자 : 김선경
 	수정일자 : 2018. 05. 10
 */

function itemListView(item_idx) {

	console.log(item_idx);
	var params = new Object();
	params.item_idx = item_idx;
	$.ajax({
		url : "/cody/itemListView",
		type : 'POST',
		data : params,
		success : function(data) {
			alert("완료!");
			console.log(data);
			self.close();
		},
		error : function(jqXHR, textStatus, errorThrown) {
			alert("에러 발생  \n" + textStatus + " : " + errorThrown);
			self.close();
		}
	});

}

/*--------------------------------------- 알림 ---------------------------------------
 1초마다 알림 확인 
$(document).ready(function() {

	setInterval(function() {

		$.ajax({
			type : 'post',
			url : 'http://localhost:8080/cody/reception',
			dataType : 'json',
			data : {},
			success : function(data) {
				if (data > 0) {
					$('#ok').css('color', 'red');
				} else {
					$('#ok').css('color', 'black');
				}
			}
		});

	}, 1000);

});*/




/*--------------------------------------- 댓글 ---------------------------------------*/
/* 첫댓글 저장 */
$('#reple #repleSave').click(
		function() {

			var cody_idx = $('input[name="reple_cody_idx"]').val();
			var member_idx = $('input[name="reple_member_idx"]').val();
			var member_id = $('input[name="reple_member_id"]').val();
			var member_photo = $('input[name="reple_member_photo"]').val();
			var reple_contents = $('#reple #reple_contents').val();
			
			if(member_idx==null) {
				alert('로그인 이후에 작성 가능합니다.');
				$("#loginModal").modal('show');
				return;
			}
			
			$.ajax({
				type : 'post',
				url : '/cody/repleInsert',
				data : {
					cody_idx : cody_idx,
					member_idx : member_idx,
					reple_contents : reple_contents
				},
				success : function(data) {
					console.log(data);
					var rd = new Date();
					var y = rd.getFullYear();
					var m = rd.getMonth();
					var d = rd.getDate();
					var day = y + '/' + m + '/' + d;

					$('#repleList').append($('<div>').text('아이디' + day),
							$('<div>').text(reple_contents));
				}
			});
		});

/* 대댓글 저장 */
function re_repleSave(reple_idx) {

	var params = $('#re_repleForm' + reple_idx).serialize();
	console.log(params);

	$.ajax({
		type : 'post',
		url : '/cody/re_repleInsert',
		data : params,
		success : function(data) {
			alert('성공');
			location.reload();

		}
	});

}

/* 답글 작성공간 보여주기 */
function btnShow(reple_idx) {
	if ($('#re_reple' + reple_idx).css('display') == 'none') {
		$('#re_reple' + reple_idx).show();
	} else {
		$('#re_reple' + reple_idx).hide();
	}
}

/* 답글 삭제 */
function repleDelete(reple_idx) {

	$.ajax({
		type : 'get',
		url : '/cody/repleDelete',
		dataType : 'text',
		data : {
			reple_idx : reple_idx
		},
		success : function(data) {
			$('#repleDelete' + reple_idx).parent().parent().remove();
		}
	});
}


