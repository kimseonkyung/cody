
/*
 * 좋아요 횟수 저장
 */
$(document).ready(function(){
$('#clickLike').click(
		function() {

			var cody_idx = $('#cody_idx').val();
			/*var cody_like = $('#cody_like').val();*/
			
			$.ajax({
				type : 'GET',
				url : 'clickLike',
				dataType : 'text',
				data : {
					cody_idx : cody_idx,
				/*	cody_like : cody_like,*/
					
				},
				success : function(data) {
					alert('성공');
					
					location.reload();

				}
			});
		});

});


		
		
		
		
	
		
		
	
	
	
	
	