//팔로우 신청 ajax

 $(document).ready(function () {
         
   })  
   
         function idx(e) {
          
      
         $.ajax({
            type : 'GET',
            url : 'cody/followinsert',
             data : {member_idx : e},
                              
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