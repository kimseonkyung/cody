/**
 * 
 */
function addBookmark(cody_idx,member_idx){
	
	console.log(cody_idx,member_idx);
	var params = new Object();
	params.cody_idx = cody_idx;
	params.member_idx = member_idx;
	 $.ajax({
	        url:contextRoot+"/bookmark",
	        type:'POST',
	        data: params,
	        success:function(data){
	            alert("완료!");
	            console.log(data);
	            window.opener.location.reload();
	            self.close();
	        },
	        error:function(jqXHR, textStatus, errorThrown){
	            alert("에러 발생  \n" + textStatus + " : " + errorThrown);
	            self.close();
	        }
	    });
}