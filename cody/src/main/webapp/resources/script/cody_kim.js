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
 1초마다 알림 확인 */
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

});




/*--------------------------------------- 댓글 ---------------------------------------*/
/* 첫댓글 저장 */
$('#reple #repleSave').click(function() {

			var member_idx = $('input[name="reple_member_idx"]').val();
			var cody_idx = $('input[name="reple_cody_idx"]').val();
			var member_id = $('input[name="reple_member_id"]').val();
			var member_photo = $('input[name="reple_member_photo"]').val();
			var reple_contents = $('#reple #reple_contents').val();
			
			if(member_idx.length==0) {
				alert('로그인 이후에 작성 가능합니다.');
				$("#loginModal").modal('show');
				return false;
			}
			
			if(reple_contents.trim()==0) {
				alert('댓글을 입력하세요');
				$('#reple #reple_contents').focus();
				return;
			}
			
			$.ajax({
				type : 'post',
				url : '/cody/repleInsert',
				dataType: 'json',
				data : {
					cody_idx : cody_idx,
					member_idx : member_idx,
					reple_contents : reple_contents
				},
				success : function(data) {

					$('#repleList').append('<div class="repleDiv">'
							+'<img class="rounded-circle repleImg" src="/cody/uploadfile/memberphoto/'+member_photo+'">'
							+'&emsp;<p class="h3 repleId">'+member_id+'</p> &emsp;&emsp;'+data.date
							+'<a href="javascript:repleDelete('+data.reple_idx +')"><i style="font-size: 20px; color: #444; margin-left: 10px;" class="far fa-trash-alt"></i></a>'
							+'<div class="repleCon">'+reple_contents+'</div>'
							+'</div>');
					$('#reple_contents').val("");
					$('#reple_contents').focus();
				},
				error : function(jqXHR, textStatus, errorThrown) {
					alert("에러 발생  \n" + textStatus + " : " + errorThrown);
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
			location.reload();
		},
		error : function(jqXHR, textStatus, errorThrown) {
			alert("에러 발생  \n" + textStatus + " : " + errorThrown);
			self.close();
		}
	});

}

/* 답글 접기 */
$('#repleShow').click(function(cody_idx) {
	if ($('#repleList').css('display') == 'none') {
		$('#repleList').show();
	} else {
		$('#repleList').hide();
	}
});

/* 답글 작성공간 보여주기 */
function re_repleShow(reple_idx) {
	if ($('#re_reple'+reple_idx).css('display') == 'none') {
		$('.re_reple').hide();
		$('#re_reple'+reple_idx).show();
	} else {
		$('#re_reple'+reple_idx).hide();
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
			location.reload();
		},
		error : function(jqXHR, textStatus, errorThrown) {
			alert("에러 발생  \n" + textStatus + " : " + errorThrown);
			self.close();
		}
	});
}

/*********************************** 코디등록, 수정 ****************************************/
/* 네이버 검색 */
function naverSearch() {
	
	var keyword = $('#keyword').val();

	$.ajax({
			url: '/cody/naverItem',
			type: 'post',
			dataType: 'JSON',
			data: {keyword : keyword},
		})
		.done(function(res) { // 성공시
			console.log(res);
			var $table = $('#naverTable');
			$table.html('');
			
			$.each(res, function(i, row) {
				var $tr = $('<tr>').append(
					$('<td>').html('<img src="'+row.image+'" width="100">'),
					$('<td>').html(row.title),
					$('<td>').html(row.lprice+'원'),
					$('<td>').html('<input type="checkbox" name="item_check" value="'+row.productId+'">')
				);
				$tr.appendTo($table);
			});
		})
		.fail(function(err) { // 실패
			console.log(err);
		});
	}

/* 아이템 선택후 등록 테이블 */
var $table = $('#codyTable');
var idx = $('#codyTable tbody').length;



/* 네이버 상품 선택 확인 */
function naverSearchOk() {
 
	var keyword = $('#naverSearchOk #keyword').val();
	var checkArr = [];
	
	$('input[name="item_check"]:checked').each(function(i) {
		checkArr.push($(this).val());	//체크된 것만 값을 뽑아서 배열에 push
	});
	
	$.ajax({
		url: '/cody/naverItemOk',
		type: 'post',
		dataType: 'JSON',
		data: {
			keyword : keyword,
			checkArr : checkArr.toString()	// 문자열로 형변환
		},
		success : function(data) {
			console.log(data);
			
			
			$.each(data, function(i, row) {
				var $div = $('<tbody id="codyDiv'+idx+'">');
				var $tr = $('<tr>').append(
					$('<td rowspan="6">').html('<img src="'+row.image+'">'),
					$('<td>').html('이름 : '+row.title)
				); $tr.appendTo($div);
					$tr = $('<tr>').append(
						$('<td>').html('브랜드 : <input name="itemList['+idx+'].item_brand" type="text" >')
				); $tr.appendTo($div);
					$tr = $('<tr>').append(
						$('<td>').html(' 카테고리 : <select id="item_category" name="itemList['+idx+'].item_category">'
								+'<option>선택해주세요</option>'
								+'<option value="모자">모자</option>'
								+'<option value="상의">상의</option>'
								+'<option value="하의">하의</option>'
								+'<option value="아우터">아우터</option>'
								+'<option value="신발">신발</option>'
								+'<option value="악세사리">악세사리</option></select>')
				); $tr.appendTo($div);	
					$tr = $('<tr>').append(
						$('<td>').html(' 색상 : <select id="item_color" name="itemList['+idx+'].item_color">'
								+'<option>선택해주세요</option>'
								+'<option value="흰색">흰색</option>'
								+'<option value="검은색">검은색</option>'
								+'<option value="빨간색"">빨간색</option>'
								+'<option value="">주황색</option>'
								+'<option value="노란색">노랑색</option>'
								+'<option value="초록색">초록색</option>'
								+'<option value="파랑색">파랑색</option>'
								+'<option value="남색">남색</option>'
								+'<option value="보라색">보라색</option></select>')
				); $tr.appendTo($div);	
					$tr = $('<tr>').append($('<td>').html('가격 : '+row.lprice+'원')
				); $tr.appendTo($div);
					$tr = $('<tr>').append($('<td>').html('<button class="btn btn-dark" type="button" onclick="itemRemove('+idx+')">삭제</button>')
				); $tr.appendTo($div);
					$tr = $('<tr>').append($('<td style="height: 30px;">')
				); $tr.appendTo($div);
					$tr = $('<tr>').append($('<td colspan="2" style="border-top:1px dashed #666; height: 30px;">')
				); $tr.appendTo($div);
				/* 태그제거 */
				var name = strip_tag(row.title);
				var $hidden = $('<div>').html('<input type="hidden" name="itemList['+idx+'].item_image" value="'+row.image+'">'
									+'<input type="hidden" name="itemList['+idx+'].item_name" value="'+name+'">'		
									+'<input type="hidden" name="itemList['+idx+'].item_price" value="'+row.lprice+'">'
									+'<input type="hidden" name="itemList['+idx+'].item_link" value="'+row.link+'">');
				 $hidden.appendTo($div);
				 $div.appendTo($table);
				 idx++;

				 $("#NaveritemModal").modal('hide');

			});
			
		},
		error : function() {
			alert("상품을 선택해 주세요.  \n");
			self.close();
		}
		
	});
 }

/* 옷장아이템 선택 확인  */
$('#myItemOk').click(function () {
	var ch = $('input[name="chItem"]:checked').val();
	var image = $('#myitem_image'+ch).val();
	var name = $('#myitem_name'+ch).val();
	var brand = $('#myitem_brand'+ch).val();
	var category = $('#myitem_category'+ch).val();
	var color = $('#myitem_color'+ch).val();
	var price = $('#myitem_price'+ch).val();
	var link = $('#myitem_link'+ch).val();
	
				var $div = $('<tbody id="codyDiv'+idx+'">');
				var $tr = $('<tr>').append($('<td rowspan="6">').html('<img src="'+image+'" width="100">'),	$('<td>').html('이름 : '+name)
				); $tr.appendTo($div);
					$tr = $('<tr>').append($('<td>').html('브랜드 : '+brand)
				); $tr.appendTo($div);	
					$tr = $('<tr>').append($('<td>').html('카테고리 : '+category)
				); $tr.appendTo($div);	
					$tr = $('<tr>').append($('<td>').html('색상 : '+color)
				); $tr.appendTo($div);	
					$tr = $('<tr>').append($('<td>').html('가격 : '+price+'원')
				); $tr.appendTo($div);
					$tr = $('<tr>').append($('<td>').html('<button class="btn btn-dark" type="button" onclick="itemRemove('+idx+')">삭제</button>')
				); $tr.appendTo($div);
					$tr = $('<tr>').append($('<td style="height: 30px;">')
				); $tr.appendTo($div);
					$tr = $('<tr>').append($('<td colspan="2" style="border-top:1px dashed #666; height: 30px;">')
				); $tr.appendTo($div);
				var $hidden = $('<div>').html('<input type="hidden" name="itemList['+idx+'].item_image" value="'+image+'">'
										  	 +'<input type="hidden" name="itemList['+idx+'].item_name" value="'+name+'">'		
											 +'<input type="hidden" name="itemList['+idx+'].item_brand" value="'+brand+'">'		
											 +'<input type="hidden" name="itemList['+idx+'].item_category" value="'+category+'">'		
											 +'<input type="hidden" name="itemList['+idx+'].item_color" value="'+color+'">'		
											 +'<input type="hidden" name="itemList['+idx+'].item_link" value="'+link+'">'		
											 +'<input type="hidden" name="itemList['+idx+'].item_price" value="'+price+'">');
				 $hidden.appendTo($div);
				 $div.appendTo($table);
				 idx++;
				 
				 

				 $("#ClosetModal").modal('hide');
			
}) 


function itemRemove(removeIdx) {
	$('#codyDiv'+removeIdx).remove();
	
}

/* 태그 제거 */
function strip_tag(str)
{
    return str.replace(/(<([^>]+)>)/ig,"");
};




 /* 코디 등록 */
function codyInsert() {
	var formObj = $('form[role="codyForm"]');
	
	console.log(formObj);
	
	formObj.attr("action", "codyForm");
	formObj.attr("method", "post");
	formObj.submit();
}; 



// 옷장 아이템 선택 이벤트
$(".card").click(function () {
	
	$(".card").removeClass("checkedItem");
	$(this).addClass("checkedItem");
}); 

// 페이징 처리(원하는 페이지로 이동)
function gopage(pages, lines) {
    location.href = '?' + "pages=" + pages;
}

// 알림페이지 일괄확인
function receptionOk() {
	
	$.ajax({
		type : 'post',
		url : '/cody/receptionOk',
		dataType : 'text',
		data : {
			},
		success : function(data) {
			alert("확인완료");
			location.reload(true);
		},
		error : function(jqXHR, textStatus, errorThrown) {
			alert("에러 발생  \n" + textStatus + " : " + errorThrown);
			self.close();
		}
	});
}

//알림페이지 확인
function recepOk(idx) {
	
	$.ajax({
		type : 'post',
		url : '/cody/recepOk',
		dataType : 'text',
		data : {
			reple_idx : idx
		},
		success : function(data) {
			location.reload(true);
		},
		error : function(jqXHR, textStatus, errorThrown) {
			alert("에러 발생  \n" + textStatus + " : " + errorThrown);
			self.close();
		}
	});
}

// 즐겨찾기 추가
function bookmarkIns(memberIdx, codyIdx) {
	
	$.ajax({
		type : 'post',
		url : '/cody/bookmark',
		data : {
			member_idx : memberIdx,
			cody_idx : codyIdx,
		},
		success : function(data) {
			location.reload(true);
		},
		error : function(jqXHR, textStatus, errorThrown) {
			alert("에러 발생  \n" + textStatus + " : " + errorThrown);
		}
	});
	
};

//즐겨찾기 삭제
function bookmarkDel(idx) {
	
	$.ajax({
		type : 'post',
		url : '/cody/bookmarkDel',
		data : {
			bookmark_idx : idx
		},
		success : function(data) {
			location.reload(true);
		},
		error : function(jqXHR, textStatus, errorThrown) {
			alert("에러 발생  \n" + textStatus + " : " + errorThrown);
		}
	});
	
};

//로그인 체크
function loginCh() {
	alert('로그인 이후에 작성 가능합니다.');
	$("#loginModal").modal('show');
	return false;
};


// 팔로우 추가
function followIns(idx) {
	
	$.ajax({
		type : 'get',
		url : '/cody/followinsert',
		data : {member_idx : idx},
		
		success: function (data){
			
			//성공
			alert('팔로우 신청이 완료되었습니다');
			location.reload(true);
			
		}
		,error: function(){
			alert(' error 발생');
			
		}                       
		
	});
	
	
};

// 팔로우 삭제
function followDel(idx) {
 
    $.ajax({
       type : 'get',
       url : '/cody/followDelete',
        data : {fallow_idx : idx},
                         
      success: function (data){
   	   
   	           //성공
             alert('팔로우 삭제가 완료되었습니다');
   	           location.reload(true);
                      
          }
       ,error: function(){
         alert(' error 발생');
       	
       }                       
                 
       });
                  
 
    };
    
// 팔로우 수락
    function followUp(idx) {
    	
    	$.ajax({
    		type : 'get',
    		url : '/cody/followUpDate',
    		data : {member_idx : idx},
    		
    		success: function (data){
    			
    			//성공
    			alert('팔로우 추가가 완료되었습니다');
    			location.reload(true);
    			
    		}
    		,error: function(){
    			alert(' error 발생');
    			
    		}                       
    		
    	});
    	
    	
    };

//아이템 구매 팝업차
    function buy(url) {
		var winWidth = 700;
		var winHeight = 600;
		 var popupOption= "width="+winWidth+", height="+winHeight;    //팝업창 옵션(optoin)
			window.open(url,"",popupOption);
	}
    
    
