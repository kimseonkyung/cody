

//로그인 스크립트
	
	$(document).ready(function(){
		
		$('#loginForm').submit(function(){
			
			var uId = $('#member_id').val();
			var pw = $('#member_pw').val();
			
			// 아이디 값이 있는지 확인
			if(uId.length < 1){
				alert('아이디를 입력해주세요.');
				return false;
			}
			
			// 비밀번호값이 입력되었는지 확인
			if(pw.legth < 1){
				alert('비밀번호를 입력해주세요.');
				return false;
			}

		});
		
		
		
	});


//비밀번호 재확인 스크립트
	$(document).ready(function(){
		$('#memberForm_pw').keyup(function() {
			$('font[name=check]').text('');
		}); //#user_pass.keyup

		$('#chpw').keyup(function() {
			if ($('#memberForm_pw').val() != $('#chpw').val()) {
				$('font[name=check]').text('');

			}
			; //#user_pass.keyup

			$('#chpw').keyup(function() {
				if ($('#pw').val() != $('#chpw').val()) {
					$('font[name=check]').text('');
					$('font[name=check]').html("비밀번호가 일치하지 않습니다.");
				} else {
					$('font[name=check]').text('');
					$('font[name=check]').html("");
				}
			}); //#chpass.keyup
		});
	});

	
//카카오 로그인 스크립트

   //<![CDATA[
   // 사용할 앱의 JavaScript 키를 설정해 주세요.
   Kakao.init('25e3cdf97fe0c1f3efadeb6d1cbf3671');
   // 카카오 로그인 버튼을 생성합니다.
   function loginWithKakao() {
   Kakao.Auth.login({
         success: function(authObj) {
           // 로그인 성공시, API를 호출합니다.
           Kakao.API.request({
             url: '/v1/user/me',
             success: function(res) {
               alert(JSON.stringify(res));
               var jsonval = JSON.parse(JSON.stringify(res));
               alert(jsonval);
               alert(jsonval.kaccount_email);
               alert(jsonval.properties.thumbnail_image);
               alert(jsonval.properties.nickname);   
               
               
               // 내부 서버로 데이터를 넘겨 세션을 만들어준다. 내부서버에는 해당 데이터들을 받아 처리할 controller 필요.
              $.ajax({
                type : "POST",
                data :  
                	
                	
                "kakaoEmail="+jsonval.kaccount_email+
                "&kaccount_email_verified="+jsonval.kaccount_email_verified+
                "&id="+jsonval.id+
                "&nickname="+jsonval.properties.nickname+
                "&profile_image="+jsonval.properties.profile_image+
                "&thumbnail_image="+jsonval.properties.thumbnail_image,
                
                
                
                
                
                url : '/kakaologin',
                
                success : function(){
                 alert("카카오 로그인에 성공하였습니다.");
                 window.location = "mypage/main?type=kakao";
                 }
                });
             },
             fail: function(error) {
               alert(JSON.stringify(error));
             }
           });  
     
    },
    fail : function(err) {
     alert(JSON.stringify(err));
    }
   });
   };
	
   
 //아이디 체크여부 확인
 
 



   
   
   
	
