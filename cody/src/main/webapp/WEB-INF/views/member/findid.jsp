<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>아이디 찾기</title>
<script type="text/javascript"
 src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>

</head>
<body>
<script type='text/javascript'>
$(document).on('click','#findId',function(){
	var name = $('#name').val();
 	var birth = $('#birth').val();
 	var tel = $('#tel').val();

 	var postData = {'member_name' : name , 'member_birth' : birth , 'member_ph' : tel};

	$.ajax({
        url:'findId',
        type:'POST',
        data: postData,
        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
        dataType : "json",

        success:function(data){
        	var emailLists = data.member_email;
        	var emailLength = emailLists.length
        	var emailfind = emailLists.substring(1, emailLength-1)
       	 		 $("#emailList").append("<h1>"+"회원님의 정보로 등록된 이메일은 : "+emailfind+" 입니다.</h1>")

        },
        error: function (XMLHttpRequest, textStatus, errorThrown){

        	alert('정보를 다시 입력해주시길 바랍니다.' );
        }
    });
});

</script>
	<h1>까먹은 이메일을 찾아봅시다</h1>
	<form>
		이름 <input type="text" name="member_name" id="name"><br>
		생년월일 <input type="text" name="member_birth" id="birth"><br>
		핸드폰 번호 <input type="text" name="member_ph" id="tel"><br>

	</form>
	<button id="findId">아이디 찾기</button>
	<br>
	<br>

	<span id="emailList"></span>
</body>

</html>