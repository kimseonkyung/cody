<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../../../favicon.ico">

<title>코디 메인</title>
<script src="${pageContext.request.contextPath}/resources/script/cody_seo1.js"></script>

<!-- CODY CSS -->
<link href="${pageContext.request.contextPath}/resources/css/cody.css"
	rel="stylesheet">

<!-- Bootstrap core CSS -->
<link
	href="${pageContext.request.contextPath}/resources/bootstrap/dist/css/bootstrap.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link
	href="${pageContext.request.contextPath}/resources/bootstrap/offcanvas.css"
	rel="stylesheet">
<title>아이디 찾기</title>
<style>
	form{
	
	text:center
	
	}
</style>
</head>
<body class="bg-light">
	
<!-- 인클루드 header -->
<%@ include file="../top/header.jsp" %>




<script type="text/javascript"
 src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
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

        <div  class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 row justify-content-center my-5" >
		<div  class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 row justify-content-center my-5" >
        <div  class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 row justify-content-center my-5" >
			
		<div  class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 row justify-content-center my-5" >
		<h3 style="color: #888888"  class="text-center font-weight-light text-justify col-xl-12">까먹은 이메일을 찾아봅시다</h3>
		<br>
		<br>
		<br>
		<br>
			<form>
						
  						<table width="380" border="0" cellspacing="1" class="regtable">
  							<tbody><tr>
  								<td width="100" height="25" bgcolor="#f4f4f4">이름</td>
  								<td width="130">
  									<input type="text" name="member_name" id="name" tabindex="1">
  								</td>
  							</tr>
  							<tr>
  								<td height="25" bgcolor="#f4f4f4">생년월일</td>
  								<td>
  									<input type="text" name="member_birth" id="birth" tabindex="2">
  								</td>
  							</tr>
  							<tr>
  								<td height="25" bgcolor="#f4f4f4">핸드폰 번호</td>
  								<td>
  									<input type="text" name="member_ph" id="tel" tabindex="2">
  								</td>
  							</tr>
						  </tbody></table>
					  </form>
		 
	             <button id="findId">아이디 찾기</button>
	         <br>
	         <br>

	          <span id="emailList"></span>

		</div>
		</div>
		</div>
	</div>

</body>

</html>