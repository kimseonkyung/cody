<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>카카오 로그인</title>

<script type="text/javascript"
 src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

</head>
<body>

						<div class="box">
							<a id="kakao-login-btn"></a>
							<a href="http://developers.kakao.com/logout"></a>
						</div>
  <script type='text/javascript'>
   //<![CDATA[
   // 사용할 앱의 JavaScript 키를 설정해 주세요.
   Kakao.init('25e3cdf97fe0c1f3efadeb6d1cbf3671');
   // 카카오 로그인 버튼을 생성합니다.
   Kakao.Auth.createLoginButton({
     container: '#kakao-login-btn',
     size:'large',
         success: function(authObj) {
           // 로그인 성공시, API를 호출합니다.
           Kakao.API.request({
             url: '/v1/user/me',
             success: function(res) {
            	 var jsonval = JSON.parse(JSON.stringify(res));
              /*  alert(JSON.stringify(res));
               
               alert(jsonval);
               alert(jsonval.kaccount_email);
               alert(jsonval.properties.thumbnail_image);
               alert(jsonval.properties.nickname);  */  
               
               
               // 내부 서버로 데이터를 넘겨 세션을 만들어준다. 내부서버에는 해당 데이터들을 받아 처리할 controller 필요.
              $.ajax({
                type : "POST",
                data : 
                	
                "kakaoEmail="+jsonval.kaccount_email+
                "&kaccount_email_verified="+jsonval.kaccount_email_verified+
                "&id="+jsonval.id+
                "&profile_image="+jsonval.properties.profile_image+
                "&nickname="+jsonval.properties.nickname+
                "&thumbnail_image="+jsonval.properties.thumbnail_image,
                
                
                url : "kakaologin",
                success : function(){
                 alert("카카오 로그인에 성공하였습니다.");
                 window.location.href = "http://localhost:8080/cody/";
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
   //]]>
  </script>
</body>
</html>