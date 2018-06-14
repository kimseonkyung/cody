<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../../../favicon.ico">
<title>Insert title here</title>
<!-- CODY CSS -->
<link href="${pageContext.request.contextPath}/resources/css/cody.css"
	rel="stylesheet">

<!-- Bootstrap core CSS -->
<link
	href="${pageContext.request.contextPath}/resources/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link
	href="${pageContext.request.contextPath}/resources/bootstrap/offcanvas.css"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.0.0/css/font-awesome.min.css">

<!--웹폰트 추가 : 구글 폰트-->
<link href="https://fonts.googleapis.com/css?family=Nanum+Brush+Script"
	rel="stylesheet">
	
<!-- CODY CSS -->
<link href="resources/css/cody.css" type="text/css" rel="stylesheet">

<!-- icon사용  -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">

<style>
#searchbox {
	width: 120px;
}

.searchlabel /*서치박스 스타일*/ {
	width: 350px;
	margin: 1px 0 0 0;
	padding: 1px;
	background-color: #ccccff;
	text-align: center;
	border: 1px solid #ccccff;
}


section.buttons {
	overflow: hidden;
}

#section1b input {
	display: none;
}

section.buttons>label {
	/*블럭 형태로 처리*/
	display: block;
	width: 100%;
	height: 40px;
	/*블럭의 중앙에 텍스트 위치*/
	text-align: center;
	line-height: 30px;
	
	/*테두리 속성*/
	box-sizing: border-box;
	/*border: 1px solid #000000;*/
	/*배경 색 지정*/
	background-color: white;
	color: black;
}
/*선택시 색상변경*/
section.buttons>label:hover {
	cursor: pointer;
}

input:nth-of-type(1):checked ~ section.buttons>label:nth-of-type(1) {
	background-color: #DDDDDD;
	color: #000000;
}

input:nth-of-type(2):checked ~ section.buttons>label:nth-of-type(2) {
	background-color: #DDDDDD;
	color: #000000;
}

input:nth-of-type(3):checked ~ section.buttons>label:nth-of-type(3) {
	background-color: #DDDDDD;
	color: #000000;
}

        .img_wrap{
           width: 280px;
            height: 260px;
            border: 2px solid darkgray;
         
          
            margin-top: 45px;
            border-radius: 5px 5px 5px 5px;
            
        }
        
        .img_wrap img{
            width: 280px;
            height: 260px;
            
       
        }
        
        .img_wrap1{
           width: 280px;
            height: 260px;
            border: 2px solid darkgray;
         
          
            margin-top: 45px;
            border-radius: 5px 5px 5px 5px;
            
        }
        
        .img_wrap1 img1{
            width: 280px;
            height: 260px;
             
       
        }
        
     
        
        
        
</style>
</head>
<body>

	<header class="mb_auto">
		<div
			class="d-flex flex-column flex-md-row align-items-center px-md-3 mb-2 border-bottom fixed-top bg-white">
			<div class="container">
				<nav class="navbar navbar-expand-lg navbar" style="padding: 0;">
					<div class="d-flex flex-column flex-md-row mr-auto">

						<!-- 검색 -->
						<form id="scarchform" class="form-inline mr-auto md-2" method ="GET">
							<div class="d-flex flex-column flex-md-row mr-auto">
								<div id="section1" class="label">
									<input class="form-control" type="text"
										placeholder="Search" id="searchbox" aria-label="Search" data-toggle="dropdown">

									<div id="section1b" class="elements">
										<input id="codyinfo" type="radio"> 
										<input id="iteminfo" type="radio" > 
										<input id="memberinfo" type="radio">

										<section class="buttons dropdown-menu" id="section1b" aria-labelledby="searchbox">
											<label class="dropdown-item" for="codyinfo" id="cody">코디</label> 
											<label class="dropdown-item" for="iteminfo" id="item">아이템</label>
											<label class="dropdown-item" for="memberinfo" id="member">회원</label>
										</section>
									</div>
								</div>
								<button class="btn btn-secondary"type="submit"><i class="fas fa-search"></i></button>
							</div>

						</form>
					</div>


					<a class="navbar-brand mr-auto" style="font-weight:800;color: black;"
						href="${pageContext.request.contextPath}/main"><h1 style="margin: 0;">CODY</h1></a>


					<div class="my-2 my-md-0 mr-md-3" id="navbarsExampleDefault">

						<ul class="navbar-nav mr-auto">
<c:choose>
			<c:when test="${not empty sessionScope.loginInfo}" >
			     <li class="nav-item dropdown">
    			    <a class="nav-link dropdown-toggle" href="http://example.com" id="dropdown01" data-toggle="dropdown" 
			     aria-haspopup="true" aria-expanded="false" style="color: black; padding-right: 20px;">
			     <c:set var="photo" value="${loginInfo.member_photo }"/>
			     <c:if test="${photo eq null }">
			     <c:set var="photo" value="member.png"/>
			     </c:if>
		<img class="rounded-circle" src="${pageContext.request.contextPath }/uploadfile/memberphoto/${photo }" style="width:35px; height: 35px; margin: 0 10px 0 0;">
		<h4 style="display: inline-block;">${loginInfo.member_id }</h4>
		</a>

				<div class="dropdown-menu" aria-labelledby="dropdown01">
					<a class="dropdown-item" href="${pageContext.request.contextPath}/myPage">마이페이지</a>
					<a class="dropdown-item" href="#">Another action</a>
					<a class="dropdown-item" href="member/memberDelete?id=${loginInfo.member_id}">회원탈퇴</a>
					<a class="dropdown-item btn btn-default btn-logiut" href="${pageContext.request.contextPath}/member/memberlogout"><span class="glyphicon glyphicon-log-out">로그아웃</span></a>
				</div>
				</li>
				<li class="nav-item">
					<div style="font-size:1.8em;">
  					<a href="${pageContext.request.contextPath}/noticeList"><i id="ok"  class="far fa-bell" aria-hidden="true" style="color: black; border-left: 1px solid #888; padding-left: 20px;"></i></a>
					</div>
				</li>
				</c:when>
				
				<c:otherwise>
				 <li class="nav-item"><a class="nav-link" href="#" data-toggle="modal" data-target="#loginModal" style="color: black;">로그인</a></li>
				 <li class="nav-item"><a class="nav-link" href="#" data-toggle="modal" data-target="#registerModal" style="color: black;">회원가입</a></li>
				 
				 
				  
                
			   </c:otherwise>
				</c:choose>

						</ul>
					</div>
				</nav>
			</div>
		</div>
	</header>
	<a href="#" class="icon_font over"></a>
	<!--회원가입 폼-->
<div class="container" style="float: left">

			<div class="modal fade" id="registerModal" role="dialog">
				<div class="modal-dialog">
					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title">회원가입</h4>
							<button type="button" class="close" data-dismiss="modal">&times;</button>

						</div>
						<div class="modal-body">

							<form action="member/memberReg" method="post" id="regForm" enctype="multipart/form-data">
                      
								<!-- Email -->
								<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 row justify-content-center align-items-center my-4">
									<div class="col-xl-4 col-lg-4 col-md-4 col-sm-4 col-4 row justify-content-center align-items-center px-2">아이디</div>
									<div class="col-xl-8 col-lg-8 col-md-8 col-sm-8 col-8 row justify-content-between align-items-center px-2">
										<div class="col-xl-8 col-lg-8 col-md-8 col-sm-8 col-8 row justify-content-start align-items-center">
											<input type="text" name="member_id" id="memberForm_id" placeholder="&nbsp;Please enter a valid email" style="width: 100%;">
										</div>
										<div class="col-xl-4 col-lg-4 col-md-4 col-sm-4 col-4 row justify-content-start align-items-center pl-2">
										<a id="idchk" class="row justify-content-center align-items-center" style="background-color: #01D1FE; color: white; cursor: pointer; height: 27px; width: 100%;">중복확인</a>
									    </div>
				
										<input type = "text" style = "display:none" id = "dupl">
									</div>
								</div>
								
								<!-- Password -->
								<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 row justify-content-center align-items-center my-4">
									<div class="col-xl-4 col-lg-4 col-md-4 col-sm-4 col-4 row justify-content-center align-items-center px-2">비밀번호</div>
									<div class="col-xl-8 col-lg-8 col-md-8 col-sm-8 col-8 row justify-content-start align-items-center px-2">
										<input type="password" name="member_pw" id="memberForm_pw" placeholder="6글자 이상" style="width: 100%;">
									</div>
								</div>

								 
								<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 row justify-content-center align-items-center my-4">
									<div class="col-xl-4 col-lg-4 col-md-4 col-sm-4 col-4 row justify-content-center align-items-center px-2">
										<p style="text-align: center;">
											비밀번호 <br> 재확인
										</p>
									</div>
									<div class="col-xl-8 col-lg-8 col-md-8 col-sm-8 col-8 row justify-content-start align-items-center px-2 ">
										<input type="password" id="chpw" style="width: 100%;">
										<font name="check" size="2" color="red"></font>
									</div>
								</div> 

								<!-- Name -->
								<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 row justify-content-center align-items-center my-4">
									<div class="col-xl-4 col-lg-4 col-md-4 col-sm-4 col-4 row justify-content-center align-items-center px-2">사용자 이름</div>
									<div class="col-xl-8 col-lg-8 col-md-8 col-sm-8 col-8 row justify-content-start align-items-center px-2">
										<input type="text" name="member_name" id="member_name" style="width: 100%;">
									</div>
								</div>

                                <!-- Email -->
                                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 row justify-content-center align-items-center my-4">
									<div class="col-xl-4 col-lg-4 col-md-4 col-sm-4 col-4 row justify-content-center align-items-center px-2">메일주소</div>
									<div class="col-xl-8 col-lg-8 col-md-8 col-sm-8 col-8 row justify-content-start align-items-center px-2">
										<input type="text" name="member_email" id="member_email" placeholder="asdf@naver.com" style="width: 100%;">
									</div>
								</div>


								<!-- Birth -->
								<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 row justify-content-center align-items-center my-4">
									<div class="col-xl-4 col-lg-4 col-md-4 col-sm-4 col-4 row justify-content-center align-items-center px-2">생일</div>
									<div class="col-xl-8 col-lg-8 col-md-8 col-sm-8 col-8 row justify-content-start align-items-center px-2">
										<input type="text" name="member_birth" id="member_birth" placeholder="&nbsp;ex)&nbsp;910425" style="width: 100%;">
									</div>
								</div>
								<!-- PhoneNumber -->
								<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 row justify-content-center align-items-center my-4">
									<div class="col-xl-4 col-lg-4 col-md-4 col-sm-4 col-4 row justify-content-center align-items-center px-2">전화번호</div>
									<div class="col-xl-8 col-lg-8 col-md-8 col-sm-8 col-8 row justify-content-start align-items-center px-2">
										<input type="text" name="member_ph" id="member_ph" style="width: 100%;" placeholder="&nbsp;ex)&nbsp;01095078230">
									</div>
								</div>
								
								
								
								<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 row justify-content-center align-items-center my-4">
									<div class="col-xl-4 col-lg-4 col-md-4 col-sm-4 col-4 row justify-content-center align-items-center px-2">사진</div>
					      
					        
									<div class="preview-image"  >
										<input type="file" name="photofile" id="input_img"/>
									</div>
									<div class="img_wrap" >
									  <img id="img" src="${pageContext.request.contextPath }/uploadfile/memberphoto/member.png" width="280" height="260"/>
									  
									</div>

         
         
         
								</div>
								
								
								

								<div class="form-group">
									<div class="col-xl-12ss">
										<button type="submit" class="btn btn-primary p-3"
											style="background-color: #01D1FE; color: white; border: none; width: 100%; font-size: 20px;">가입</button>
									</div>
								</div>

								
								

								</form>

						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
						</div>
					</div>

				</div>
			</div>

		</div>

	<!-- 로그인 폼 -->

	<div class="container" style="float: left">
			<div class="modal fade" id="loginModal" role="dialog">
				<div class="modal-dialog">
					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title">Login</h4>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>
						<div class="modal-body">
                   
							<form action="login" method="post" id="loginForm" enctype="multipart/form-data" >
								<div class="form-group">
									<label for="inputEmail3" class="col-xl-sm-2 control-label">ID</label>
									<div class="col-xl-12">
										<input type="text" class="form-control" id="member_id"
											placeholder="Email" name="member_id" style="width: 100%">
									</div>
								</div>
								<div class="form-group">
									<label for="inputPassword3" class="col-xl-sm-2 control-label">Password</label>
									<div class="col-xl-12">
										<input type="password" class="form-control"
											id="member_pw" placeholder="Password"
											name="member_pw" style="width: 100%">
									</div>
								</div>
								<div class="form-group">
									<div class="col-xl-sm-offset-2 col-xl-sm-10">
										<div class="checkbox">
											<label> <input type="checkbox" name="useCookie">
												아이디 저장
											</label>
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="col-xl-12ss">
										<button type="submit" class="btn btn-primary p-3"
											style="background-color: #01D1FE; color: white; border: none; width: 100%; font-size: 20px;">Login</button>
									</div>
								</div>
								
							</form>

							<div class = "col-xl-12 row justify-content-center align-items-center my-3">
								<a href = "findId">아이디 찾기&nbsp;</a>&nbsp; / &nbsp;&nbsp;
								<a href = "findpw">비밀번호 찾기</a>
							</div>
							
							<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 row justify-content-center align-items-center my-2">
							<div
								class="col-xl-10 col-lg-10 col-md-10 col-sm-10 col-10 row justify-content-center align-items-center">
								 <div>
                               <div>
                                 <a href="#none" ><img src="${pageContext.request.contextPath}/resources/icon/naver.PNG" style="width: 110%;"/></a>
                               </div>
                                <br>
                               <div>
                                 <a href="#none" ><img src="${pageContext.request.contextPath}/resources/icon/facebook.PNG" style="width: 110%;"/></a>
                               </div>
                                <br>
                                <div>
                                                           
                                 <a id="kakao-login-btn"></a>
                                 
                               </div>
                           </div>
								
							</div>							
						</div>	
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
						</div>

					</div>

				</div>
			</div>

		</div>
		
		<div class="container" style="float: left">

			<div class="modal fade" id="modifyModal" role="dialog">
				<div class="modal-dialog">
					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title">회원정보수정</h4>
							<button type="button" class="close" data-dismiss="modal">&times;</button>

						</div>
						<div class="modal-body">

							<form action="${pageContext.request.contextPath }/member/modify" method="post" enctype="multipart/form-data">
                             <input type="hidden" name="idx" value="${member.member_idx }">
                             <input type="hidden" name="member_pw" value="${member.member_pw }">
                             
								<!-- Email -->
								 <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 row justify-content-center align-items-center my-4">
									<div class="col-xl-4 col-lg-4 col-md-4 col-sm-4 col-4 row justify-content-center align-items-center px-2">아이디</div>
										<div class="col-xl-8 col-lg-8 col-md-8 col-sm-8 col-8 row justify-content-start align-items-center px-2">
											<input type="text" name="member_id" value="${sessionScope.loginInfo.member_id }"  style="width: 100%;" readonly="readonly">
										</div>
								</div>

								<!-- Name -->
								<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 row justify-content-center align-items-center my-4">
									<div class="col-xl-4 col-lg-4 col-md-4 col-sm-4 col-4 row justify-content-center align-items-center px-2">사용자 이름</div>
									<div class="col-xl-8 col-lg-8 col-md-8 col-sm-8 col-8 row justify-content-start align-items-center px-2">
										<input type="text" name="member_name" value="${member.member_name }" style="width: 100%;">
									</div>
								</div>

                                <!-- Email -->
                                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 row justify-content-center align-items-center my-4">
									<div class="col-xl-4 col-lg-4 col-md-4 col-sm-4 col-4 row justify-content-center align-items-center px-2">메일주소</div>
									<div class="col-xl-8 col-lg-8 col-md-8 col-sm-8 col-8 row justify-content-start align-items-center px-2">
										<input type="text" name="member_email" value="${member.member_email }" placeholder="asdf@naver.com" style="width: 100%;">
									</div>
								</div>


						
								<!-- PhoneNumber -->
								<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 row justify-content-center align-items-center my-4">
									<div class="col-xl-4 col-lg-4 col-md-4 col-sm-4 col-4 row justify-content-center align-items-center px-2">전화번호</div>
									<div class="col-xl-8 col-lg-8 col-md-8 col-sm-8 col-8 row justify-content-start align-items-center px-2">
										<input type="text" name="member_ph" value="${member.member_ph }" style="width: 100%;" placeholder="&nbsp;ex)&nbsp;01095078230">
									</div>
								</div>
								
					             <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 row justify-content-center align-items-center my-4">
									<div class="col-xl-4 col-lg-4 col-md-4 col-sm-4 col-4 row justify-content-center align-items-center px-2">사진</div>
									<div class="col-xl-8 col-lg-8 col-md-8 col-sm-8 col-8 row justify-content-start align-items-center px-2">
										<input type="file" name="photofile"  value="${member.member_photo }" id="input_img1">
									</div>
									
									<div class="img_wrap1">
									  <img id="img1" src="${pageContext.request.contextPath }/uploadfile/memberphoto/member.png" width="280" height="260"/>
									
									</div>
									
									
								</div>


								<div class="form-group">
									<div class="col-xl-12ss">
										<button type="submit" class="btn btn-primary p-3"
											style="background-color: #01D1FE; color: white; border: none; width: 100%; font-size: 20px;">수정</button>
									</div>
								</div>
								
								

							</form>

						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
						</div>
					</div>

				</div>
			</div>

		</div>
		
		

</body>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script>
	window.jQuery
			|| document
					.write('<script src="${pageContext.request.contextPath}/resources/bootstrap/assets/vendor/jquery-slim.min.js"><\/script>')
</script>
<script
	src="${pageContext.request.contextPath}/resources/bootstrap/assets/vendor/popper.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/bootstrap/dist/js/bootstrap.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/bootstrap/assets/vendor/holder.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/bootstrap/offcanvas.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/script/cody_park.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/script/cody_kim.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/script/cody_seo1.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/script/cody_jeong.js"></script>
	
<script
	 src="${pageContext.request.contextPath}/resources/script/cody_lim.js"></script>

<script>
	var elements = document.getElementsByTagName("div");
	// 모든 영역 접기
	for (var i = 0; i < elements.length; i++) {
		if (elements[i].className == "elements") {
			elements[i].style.display = "none";
		} else if (elements[i].className == "label") {
			elements[i].onclick = switchDisplay;
		}
	}
	// 상태에 따라 접거나 펼치기
	function switchDisplay() {
		var parent = this.parentNode;
		var target = parent.getElementsByTagName("div")[1];
		if (target.style.display == "none") {
			target.style.display = "block";
		} else {
			target.style.display = "none";
		}
		return false;

	}

	$(document).ready(function() {
		$('#cody').click(function() {
			$('#searchbox').attr('placeholder', '코디');
			$('#scarchform').attr('action', '${pageContext.request.contextPath }/codyInfo');
			$('#searchbox').attr('name','keyword2');
		 	$('#searchbox').focus(); 
		 	$()
		 	})

	})

	$(document).ready(function() {
		$('#item').click(function() {
			$('#searchbox').attr('placeholder', '아이템');
			$('#scarchform').attr('action', '${pageContext.request.contextPath }/itemInfo');
			$('#searchbox').attr('name','keyword1');
		    $('#searchbox').focus(); 			
		})
		

	})
	$(document).ready(function() {
		$('#member').click(function() {
			$('#searchbox').attr('placeholder', '회원');
			$('#scarchform').attr('action', '${pageContext.request.contextPath }/memberInfo');
			$('#searchbox').attr('name','keyword3');		
			$('#searchbox').focus();
		})

	})
</script>
<script>
	  $(document).on('click','#idchk',function(){
		var id = $('#memberForm_id').val()
	    $.ajax({
	        url:'idchk',
	        type:'POST',
	        data: {'memberForm_id' : id},
	        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	        dataType : "json",

	        success:function(data){
	            console.log("success")
	            alert(data.msg)
	            if(data.msg == "사용이 가능한 아이디 입니다."){
					$("#dupl").val("ok");
					
				}else{
					$("#dupl").val("no")					
				}


	        },
	        
	        error: function (XMLHttpRequest, textStatus, errorThrown){

	        	alert('서버와의 통신이 원할하지 않습니다.\n다시 시도 해 주십시오.' );
	        	}
	    });
	});
</script>
 <script>
	$(document).ready(function() {

		var re_email = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i; //이메일 요휴성검사
		var re_pw = /^[a-z0-9]{6,18}$/; // 비밀번호 검사식	  
		var re_tel = /^[0-9]{8,11}$/; // 전화번호 검사식

		var re_birth = /^[0-9]{6}$/;
		var re_name = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;

		$("#regForm").submit(function() {
			if (!re_name.test($.trim($("#member_name").val()))) {

				alert("이름을 정확히 입력해주세요");

				$("#member_name").focus();
				return false;
			}

			if (!re_tel.test($.trim($("#member_ph").val()))) {

				alert("전화번호 양식에 맞춰서 입력해주세요");

				$("#member_ph").focus();
				return false;
			}

			if (!re_email.test($.trim($("#member_email").val()))) {

				alert("이메일 양식에 맞춰서 입력해주세요");

				$("#member_email").focus();
				return false;
			}
			if (!re_pw.test($.trim($("#memberForm_pw").val()))) {

				alert("비밀번호 양식에 맞춰서 입력해주세요");

				$("#memberForm_pw").focus();
				return false;
			}
			if (!re_birth.test($.trim($("#member_birth").val()))) {

				alert("생년월일 양식에 맞춰서 입력해주세요");

				$("#member_birth").focus();
				return false;
			}
			if($("#dupl").val()!="ok"){
				alert("아이디 중복확인을 해주세요");
				$("#memberForm_id").focus();
				return false;
			}
		});

	});
</script> 
<script type="text/javascript">

var sel_file;

$(document).ready(function(){
	$("#input_img").on("change", handleImgFileSelect);
});

function handleImgFileSelect(e) {
	var files = e.target.files;
	var filesArr = Array.prototype.slice.call(files);
	
	filesArr.forEach(function(f){
		if(!f.type.match("image.*")){
			alert("확장자는 이미지 확장자만 가능합니다.");
			return;
		}
		
		sel_file = f;
		
		var reader = new FileReader();
		reader.onload = function(e){
			$("#img").attr("src",e.target.result);
		}
		reader.readAsDataURL(f);
		
	});
	
	
	
}
</script>
<script type="text/javascript">

var sel_file1;

$(document).ready(function(){
	$("#input_img1").on("change", handleImgFileSelect1);
});

function handleImgFileSelect1(e) {
	var files = e.target.files;
	var filesArr = Array.prototype.slice.call(files);
	
	filesArr.forEach(function(f){
		if(!f.type.match("image.*")){
			alert("확장자는 이미지 확장자만 가능합니다.");
			return;
		}
		
		sel_file1 = f;
		
		var reader = new FileReader();
		reader.onload = function(e){
			$("#img1").attr("src",e.target.result);
		}
		reader.readAsDataURL(f);
		
	});
	
	
	
}
</script>
<script>
$(document).ready(function(){
		
		// 사용자가 입력하는 데이터의 유효성 검사
		$('#regForm').submit(function(){
			
			var userId = $('#memberForm_id').val();
			var pw = $('#memberForm_pw').val();
			var userName = $('#member_name').val();
			var userbirth = $('#member_birth').val();
			var useremail = $('#member_email').val();
// 			var userph = ${'#member_ph'}.val();
			
	
			
			
			if(userId.length < 1){
				alert('아이디를 입력해주세요.');
				$('#memberForm_id').focus();
				return false;
			}
			if(pw.length < 1){
				alert('비밀번호를 입력해주세요.');
				$('#memberForm_pw').focus();
				return false;
			}
			if(userName.length < 1 ){
				alert('이름을 입력해주세요.');
				$('#member_name').focus();
				return false;
			}
			if(userbirth.length < 1 ){
				alert('생일을 입력해주세요.');
				$('#member_birth').focus();
				return false;
			}
			if(useremail.length < 1 ){
				alert('이메일을 입력해주세요.');
				$('##member_email').focus();
				return false;
			}
			if(userph.length < 1 ){
				alert('전화번호를 입력해주세요.');
				$('#member_ph').focus();
				return false;
			}
			
			
	
	});
		
		
		
	});
	</script>
	<script>
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
				if ($('#memberForm_pw').val() != $('#chpw').val()) {
					$('font[name=check]').text('');
					$('font[name=check]').html("비밀번호가 일치하지 않습니다.");
				} else {
					$('font[name=check]').text('');
					$('font[name=check]').html("");
				}
			}); //#chpass.keyup
		});
	});
	</script>
</html>