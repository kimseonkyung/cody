<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"><meta name="viewport"	content="width=device-width, initial-scale=1, shrink-to-fit=no">
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

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.0.0/css/font-awesome.min.css">


<style>

</style>
</head>
<body>

<header class="mb_auto">
	<div class="codyHeaderBar fixed-top bg-dark">
	<nav class="navbar navbar-expand-lg navbar-dark">
		<form class="form-inline my-2 my-lg-0">
			<input class="form-control mr-sm-2" type="text" placeholder="Search"
				aria-label="Search">
			<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
		</form>
		<a class="navbar-brand mr-auto mr-lg-0" href="#">Cody</a>
		<button class="navbar-toggler p-0 border-0" type="button"
			data-toggle="offcanvas">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="navbar-collapse offcanvas-collapse"
			id="navbarsExampleDefault">
			<ul class="navbar-nav mr-auto">
		
			<c:choose>
			<c:when test="${not empty sessionScope.loginInfo}" >
			     <li class="nav-item dropdown">
			     <a	class="nav-link dropdown-toggle" href="http://example.com" id="dropdown01" data-toggle="dropdown" 
			     aria-haspopup="true" aria-expanded="false">아이디</a>
				<div class="dropdown-menu" aria-labelledby="dropdown01">
					<a class="dropdown-item" href="${pageContext.request.contextPath}/myPage">마이페이지</a>
					<a class="dropdown-item" href="#">Another action</a>
					<a class="dropdown-item btn btn-default btn-logiut" href="memberlogout"><span class="glyphicon glyphicon-log-out">로그아웃</span></a>
				</div>
				</li>
				<li class="nav-item">
				<div>
					<form action="${pageContext.request.contextPath}/noticeList" method="post">
					<input type="hidden" value="sk">
					<input type="submit" value="알림">
					</form>
				</div>
				<li class="nav-item">
					<div id="ok" style="font-size:2em;">
  					<i class="fa fa-bell-o" aria-hidden="true"></i>
					</div>
				</li>
			      
			      
				</c:when>
				
				<c:otherwise>
				 <li class="nav-item"><a class="nav-link" data-toggle="modal" data-target="#registerModal">회원가입<span class="sr-only">(current)</span></a></li>
				<li class="nav-item"><a class="nav-link" href="home" data-toggle="modal" data-target="#loginModal">로그인</a></li>
			 </c:otherwise>
				</c:choose>
					
			</ul>
		</div>
	</nav>
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

							<form action="member/memberReg" method="post" id="regForm" enctype="multipart/form-data" >
                      
								<!-- Email -->
								<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 row justify-content-center align-items-center my-4">
									<div class="col-xl-4 col-lg-4 col-md-4 col-sm-4 col-4 row justify-content-center align-items-center px-2">아이디</div>
									<div class="col-xl-8 col-lg-8 col-md-8 col-sm-8 col-8 row justify-content-between align-items-center px-2">
										<div class="col-xl-8 col-lg-8 col-md-8 col-sm-8 col-8 row justify-content-start align-items-center">
											<input type="text" name="member_id" id="member_id" placeholder="&nbsp;Please enter a valid email" style="width: 100%;">
										</div>
										<div class="col-xl-4 col-lg-4 col-md-4 col-sm-4 col-4 row justify-content-start align-items-center pl-2">
											<a id="authenticate" class="row justify-content-center align-items-center" style="background-color: #01D1FE; color: white; cursor: pointer; height: 27px; width: 100%;">Check</a>
										</div>
										<input type = "text" style = "display:none" id = "dupl">
									</div>
								</div>
								
								<!-- Password -->
								<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 row justify-content-center align-items-center my-4">
									<div class="col-xl-4 col-lg-4 col-md-4 col-sm-4 col-4 row justify-content-center align-items-center px-2">Password</div>
									<div class="col-xl-8 col-lg-8 col-md-8 col-sm-8 col-8 row justify-content-start align-items-center px-2">
										<input type="password" name="member_pw" id="member_pw" style="width: 100%;">
									</div>
								</div>

								<!--  Confirm Password 
								<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 row justify-content-center align-items-center my-4">
									<div class="col-xl-4 col-lg-4 col-md-4 col-sm-4 col-4 row justify-content-center align-items-center px-2">
										<p style="text-align: center;">
											Confirm <br> Password
										</p>
									</div>
									<div class="col-xl-8 col-lg-8 col-md-8 col-sm-8 col-8 row justify-content-start align-items-center px-2 ">
										<input type="password" id="chpw" style="width: 100%;">
										<font name="check" size="2" color="red"></font>
									</div>
								</div> -->

								<!-- Name -->
								<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 row justify-content-center align-items-center my-4">
									<div class="col-xl-4 col-lg-4 col-md-4 col-sm-4 col-4 row justify-content-center align-items-center px-2">Name</div>
									<div class="col-xl-8 col-lg-8 col-md-8 col-sm-8 col-8 row justify-content-start align-items-center px-2">
										<input type="text" name="member_name" id="member_name" style="width: 100%;">
									</div>
								</div>

                                <!-- Email -->
                                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 row justify-content-center align-items-center my-4">
									<div class="col-xl-4 col-lg-4 col-md-4 col-sm-4 col-4 row justify-content-center align-items-center px-2">Email</div>
									<div class="col-xl-8 col-lg-8 col-md-8 col-sm-8 col-8 row justify-content-start align-items-center px-2">
										<input type="text" name="member_email" id="member_email" style="width: 100%;">
									</div>
								</div>


								<!-- Birth -->
								<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 row justify-content-center align-items-center my-4">
									<div class="col-xl-4 col-lg-4 col-md-4 col-sm-4 col-4 row justify-content-center align-items-center px-2">Date of birth</div>
									<div class="col-xl-8 col-lg-8 col-md-8 col-sm-8 col-8 row justify-content-start align-items-center px-2">
										<input type="text" name="member_birth" id="member_birth" placeholder="&nbsp;ex)&nbsp;910425" style="width: 100%;">
									</div>
								</div>
								<!-- PhoneNumber -->
								<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 row justify-content-center align-items-center my-4">
									<div class="col-xl-4 col-lg-4 col-md-4 col-sm-4 col-4 row justify-content-center align-items-center px-2">PhoneNumber</div>
									<div class="col-xl-8 col-lg-8 col-md-8 col-sm-8 col-8 row justify-content-start align-items-center px-2">
										<input type="text" name="member_ph" id="member_ph" style="width: 100%;" placeholder="&nbsp;ex)&nbsp;01095078230">
									</div>
								</div>
								<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 row justify-content-center align-items-center my-4">
									<div class="col-xl-4 col-lg-4 col-md-4 col-sm-4 col-4 row justify-content-center align-items-center px-2">사진</div>
									<div class="col-xl-8 col-lg-8 col-md-8 col-sm-8 col-8 row justify-content-start align-items-center px-2">
										<input type="file" name="photofile" placeholder="&nbsp;ex)&nbsp;910425" style="width: 100%;">
									</div>
								</div>
					
								
								
								
								

								<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 row justify-content-center align-items-center my-5">
									<input class="p-3" id="joinBtn" type="submit" value="Submit">
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

							<form class="form-horizontal" action="member/login" id="#loginForm"
								method="post">
								<div class="form-group">
									<label for="inputEmail3" class="col-xl-sm-2 control-label">Email</label>
									<div class="col-xl-12">
										<input type="text" class="form-control" id="memberForm_id"
											placeholder="Email" name="member_id" style="width: 100%">
									</div>
								</div>
								<div class="form-group">
									<label for="inputPassword3" class="col-xl-sm-2 control-label">Password</label>
									<div class="col-xl-12">
										<input type="password" class="form-control"
											id="memberForm_pw" placeholder="Password"
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

							<div
								class="col-xl-12 row justify-content-center align-items-center my-3">
								<a href="/user/findId">아이디 찾기&nbsp;</a>&nbsp; / &nbsp;&nbsp;
								<a href="/user/findPw">비밀번호 찾기</a>
							</div>
							
							<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 row justify-content-center align-items-center my-2">
							<div
								class="col-xl-10 col-lg-10 col-md-10 col-sm-10 col-10 row justify-content-center align-items-center">
								<div
									class="col-xl-2 col-lg-2 col-md-2 col-sm-2 col-2 row justify-content-center align-items-center p-2">
									<form action="/connect/facebook" method="post"
										id="facebook-form">
										<input type="hidden" name="scope"
											value="public_profile, email" /> 
										<button type="submit" style="border:none;" class="row">
											<!-- <img src="../../resources/icon/facebook.svg"
											class="img-fluid row justify-content-center align-items-center col-12"> -->
										</button>
									</form>
								</div>
								<div
									class="col-xl-2 col-lg-2 col-md-2 col-sm-2 col-2 row justify-content-center align-items-center p-2">
									<form method="get" id="naver-form">
										<a href="/user/naverLogin"> 
										<!-- <img
											src="../../resources/icon/naver.svg"
											class="img-fluid row justify-content-center align-items-center col-12">	 -->										>
										</a>
									</form>
								</div>
							

							
								<div class="col-xl-2 col-lg-2 col-md-2 col-sm-2 col-2 row justify-content-center align-items-center p-2">
									<a
										href="https://kauth.kakao.com/oauth/authorize?client_id=275295f3722f04cd3c3715b26c3651b7&redirect_uri=http://almom.kr/user/kakaologin&response_type=code">
										<!-- <img src="../../resources/icon/kakao.svg"
										class="img-fluid row justify-content-center align-items-center col-12"> -->
									</a>
								</div>
								<div
									class="col-xl-2 col-lg-2 col-md-2 col-sm-2 col-2 row justify-content-center align-items-center p-2">
									<form action="/user/googleLogin" method="post" id="google-form">
										<button type="submit" style="border:none;" class="row"> 
										<!-- <img
											src="../../resources/icon/google.svg"
											class="img-fluid row justify-content-center align-items-center col-12"> -->
										</button>
									</form>
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
	
</body>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.10.2.js"></script>
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
	<script	src="${pageContext.request.contextPath}/resources/script/cody_park.js"></script>
	<script	src="${pageContext.request.contextPath}/resources/script/cody_kim.js"></script>
	
	
	
</html>