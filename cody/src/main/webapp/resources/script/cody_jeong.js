
$('#gBookmark').click(function(){
	
	$.ajax({
		
		type : 'get',
		url : '/cody/bookmarkList',
		dataType : 'json',
		data : {}
	})
	.done(function(data){
	 	$('#myPageList').empty();
	 	
	 	$.each(data, function(i, e ){
	 		$('#myPageList').append('<div class="myCard">'
	 				+ '<a href="/cody/bookmark?cody_idx='+e.bookmark_idx+ '&member_idx='+e.member_idx+'&cody_image='+e.cody_image+'"><img class="card-img-top" src="/cody/uploadfile/codyphoto/'+ e.cody_image +'" style="height: 300px;" alt="Card image cap"></a>'
	 				+ '<div class="card-body" style="height: 100%">'
	 				+ e.cody_image
	 				+ '</div>'
	 				+ '</div>');
	 	});
	
	})
	.fail(function(err){
		console.log(err);
		
	
	});
	
	
	
})



