<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<title>마이페이지</title>

<!--웹폰트 추가 : 구글 폰트-->
<link href="https://fonts.googleapis.com/css?family=Nanum+Brush+Script"
	rel="stylesheet">
<!-- CODY CSS -->
<link href="resources/css/cody.css" type="text/css" rel="stylesheet">
<link href="resources/css/codyform.css" type="text/css" rel="stylesheet">
<style>
input:focus, textarea:focus {
	resize: none, outline: none;
}
</style>

<style>
	#bar1 {
	height: 55px;
	border: 1px solid #007bff;
	border-radius: 15px;
	}

	#card1{
	
	border: 1px solid #007bff;
	}
	#card2{
	
	border: 1px solid #007bff;
	}
	#card3{
	
	border: 1px solid #007bff;
	}
	#card4{
	border: 1px solid #007bff;
	}
	
	#button2{
	margin: 0 auto;
	width: 300px;
	}
	
</style>


</head>
<body>

	<!-- 인클루드 header -->
	<%@ include file="../top/header.jsp" %>
	

<main role="main" class="container">
	<div
		class="d-flex align-items-center p-3 my-3 text-white-50 bg-purple rounded box-shadow">
		<img class="mr-3"
			src="https://getbootstrap.com/assets/brand/bootstrap-outline.svg"
			alt="" width="48" height="48">
		<div class="lh-100">
			<h6 class="mb-0 text-white lh-100">Bootstrap</h6>
			<small>Since 2011</small>
		</div>
	</div>
	
	
	<div class="my-3 p-3 bg-white rounded box-shadow">
          <img src="${pageContext.request.contextPath }/uploadfile/memberphoto/${member.member_photo}" width="220" height="300">
          <button type="button" class="btn btn-primary" data-target="#registerModal" data-toggle="modal">프로필변경</button>
        </div>
     		
		<div class="my-3 p-3 bg-white rounded box-shadow">
         <div class="row">
                <div class="col" id="bar1"><a href="#"><font style="vertical-align:inherit">코디</font></a></div>
               <div class="col" id="bar1"><a href="#"><font style="vertical-align:inherit">옷장</font></a></div>
               <div class="col" id="bar1"><a href="#"><font style="vertical-align:inherit">좋아요</font></a></div>
                <div class="col" id="bar1"><a href="#"><font style="vertical-align:inherit">팔로우</font></a></div>           
		</div>
		</div>
		
		<div class="my-3 p-3 bg-white rounded box-shadow">
         <div class="row">
		<button id="button2" type="button" class="btn btn-primary btn-lg" data-target="#codyFormModal" data-toggle="modal">코디등록</button>
		</div>		
		</div>
		
		<div class="my-3 p-3 bg-white rounded box-shadow">
		<div class="row">
		<div class="col">
		<div class="card" id="card1" style="width: 240px; height: 373px; float: left;"><img
						class="card-img-top"
						src="${pageContext.request.contextPath }/uploadfile/codyphoto/${cody.cody_image}"
						alt="Card image cap" style="height: 300px;">
						<div class="card-body">
							<a href="#" class="btn btn-primary"
								style="position: absolute; left: 20px;">좋아요</a>
							<a href="#" class="btn btn-primary"
								style="position: absolute; right: 20px;">팔로우</a>
						</div></div></div>
		
		<div class="col">
		<div class="card" id="card2" style="width: 240px; height: 373px; float: left;"><img
						class="card-img-top"
						src="${pageContext.request.contextPath }/uploadfile/codyphoto/${cody.cody_image}"
						alt="Card image cap" style="height: 300px;">
						<div class="card-body">
							<a href="#" class="btn btn-primary"
								style="position: absolute; left: 20px;">좋아요</a>
							<a href="#" class="btn btn-primary"
								style="position: absolute; right: 20px;">팔로우</a>
						</div></div></div>				
		
		<div class="col">
		<div class="card" id="card3" style="width: 240px; height: 373px; float: left;"><img
						class="card-img-top"
						src="${pageContext.request.contextPath }/uploadfile/codyphoto/${cody.cody_image}"
						alt="Card image cap" style="height: 300px;">
						<div class="card-body">
							<a href="#" class="btn btn-primary"
								style="position: absolute; left: 20px;">좋아요</a>
							<a href="#" class="btn btn-primary"
								style="position: absolute; right: 20px;">팔로우</a>
						</div></div></div>
		
		<div class="col">
		<div class="card" id="card4" style="width: 240px; height: 373px; float: left;"><img
						class="card-img-top"
						src="${pageContext.request.contextPath }/uploadfile/codyphoto/${cody.cody_image}"
						alt="Card image cap" style="height: 300px;">
						<div class="card-body">
							<a href="#" class="btn btn-primary"
								style="position: absolute; left: 20px;">좋아요</a>
							<a href="#" class="btn btn-primary"
								style="position: absolute; right: 20px;">팔로우</a>
						</div></div></div>
		</div>
		</div>
	
</main>
 
 <footer class="my-5 pt-5 text-muted text-center text-small">
    <p class="mb-1">Bitcamp 2018 Project for <a href="${pageContext.request.contextPath }">Cody</a> by <a href="https://twitter.com/mdo">Drop the table</a>.</p>
      <p>
       <ul class="list-inline">
          <li class="list-inline-item"><a href="#">Privacy</a></li>
          <li class="list-inline-item"><a href="#">Terms</a></li>
          <li class="list-inline-item"><a href="#">Support</a></li>
        </ul>
        <a href="#">Back to top</a>
      </p>
    </footer>
    
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
		
		<div class="container" style="float: left">

			<div class="modal fade" id="codyFormModal" role="dialog">
				<div class="modal-dialog modal-lg">
					<!-- Modal content-->
					<div class="modal-content modal-lg">
						<div class="modal-header">
							<h4 class="modal-title">코디등록</h4>
							<button type="button" class="close" data-dismiss="modal">&times;</button>

						</div>
						<div class="modal-body">
						<div id="content">
		<form action="${pageContext.request.contextPath }/codyForm"
			method="post" enctype="multipart/form-data"
			onkeydown="return capturekey(event)">
			<!--------------------사이드--------------------->
			<div id="side">
				<div class="side1">
					<h4>코디 이미지※</h4>
				</div>
				<div class="side2">
					<h4>착용 아이템※</h4>
				</div>
				<div class="side3">
					<h4>코디 상세</h4>
				</div>
			</div>

			<!--------------------메인--------------------->
			<div id="main">
				<div id="image">
					<div id="image_frame">
						<div id="image_block">
							<img id="preview" src="" width="280" height="360">
						</div>
						<div id="image_input">
							<button id="replace">사진 업로드</button>
							<input id="input_image" type="file" name="photofile"
								value="파일 업로드" accept='image/*'>
						</div>
						<div class="sub1">
							<h6>권장 사이즈 : 가로 500px × 세로 667px</h6>
						</div>
						<div class="sub2">
							<h6>용량 : 5MB 이내</h6>
						</div>
					</div>
				</div>

				<div id="item">
					<div class="dropdown">
						<button id="input_item" type="button" data-toggle="dropdown">+   항목 추가</button>
						<ul class="dropdown-menu">
						<li><a>항목 추가</a></li>
						<li class="divider">
						<li><button data-role="button" data-toggle="modal" data-target="#ClosetModal">옷장에서 선택</button></li>
						<li><button data-role="button" data-toggle="modal" data-target="#SearchModal">상품 검색</button></li>
						<li><button type="button" data-toggle="modal" data-target="#NewitemModal">신규 아이템 등록</button></li>
						</ul>
					</div>		
					</div>	
		<div id="item_intro">
		<h6>최대 9 항목까지 추가 할 수 있습니다</h6>
	</div>

	<div id="title">
		<div id="title_name">
			<h4>코디 제목</h4>
		</div>
		<div id="title_input">
			<input id="input_title" type="text" name="cody_title"
				onkeyup="limit1(this)">
		</div>
	</div>
	<div id="intro">
		<div id="intro_name">
			<h4>코디 소개문</h4>
		</div>
		<div id="intro_input">
			<div id="intro_text">
				<textarea class="text" style="resize: none" rows="20" cols="64"
					name="cody_intro" onkeyup="limit2(this)"></textarea>
			</div>
			<div id="intro_sub">
				<h6>※ 500 자 이내로 입력하십시오.</h6>
			</div>
		</div>
	</div>
	<div id="gender">
		<div id="gender_name">
			<h4>성별※</h4>
		</div>
		<div id="gender_input">
			<label><input type="radio" id="cody_gender"
				name="cody_gender" value="true">Man</label> <label><input
				type="radio" id="cody_gender" name="cody_gender" value="false">Woman</label>
		</div>
	</div>
	<div id="height">
		<div id="height_name">
			<h4>신장</h4>
		</div>
		<div id="height_input">
			<select id="input_height" name="cody_height">
				<option value='0'>선택해주세요</option>
				<option value='130'>130cm</option>
				<option value='131'>131cm</option>
				<option value='132'>132cm</option>
				<option value='133'>133cm</option>
				<option value='134'>134cm</option>
				<option value='135'>135cm</option>
				<option value='136'>136cm</option>
				<option value='137'>137cm</option>
				<option value='138'>138cm</option>
				<option value='139'>139cm</option>
				<option value='140'>140cm</option>
				<option value='141'>141cm</option>
				<option value='142'>142cm</option>
				<option value='143'>143cm</option>
				<option value='144'>144cm</option>
				<option value='145'>145cm</option>
				<option value='146'>146cm</option>
				<option value='147'>147cm</option>
				<option value='148'>148cm</option>
				<option value='149'>149cm</option>
				<option value='150'>150cm</option>
				<option value='151'>151cm</option>
				<option value='152'>152cm</option>
				<option value='153'>153cm</option>
				<option value='154'>154cm</option>
				<option value='155'>155cm</option>
				<option value='156'>156cm</option>
				<option value='157'>157cm</option>
				<option value='158'>158cm</option>
				<option value='159'>159cm</option>
				<option value='160'>160cm</option>
				<option value='161'>161cm</option>
				<option value='162'>162cm</option>
				<option value='163'>163cm</option>
				<option value='164'>164cm</option>
				<option value='165'>165cm</option>
				<option value='166'>166cm</option>
				<option value='167'>167cm</option>
				<option value='168'>168cm</option>
				<option value='169'>169cm</option>
				<option value='170'>170cm</option>
				<option value='171'>171cm</option>
				<option value='172'>172cm</option>
				<option value='173'>173cm</option>
				<option value='174'>174cm</option>
				<option value='175'>175cm</option>
				<option value='176'>176cm</option>
				<option value='177'>177cm</option>
				<option value='178'>178cm</option>
				<option value='179'>179cm</option>
				<option value='180'>180cm</option>
				<option value='181'>181cm</option>
				<option value='182'>182cm</option>
				<option value='183'>183cm</option>
				<option value='184'>184cm</option>
				<option value='185'>185cm</option>
				<option value='186'>186cm</option>
				<option value='187'>187cm</option>
				<option value='188'>188cm</option>
				<option value='189'>189cm</option>
				<option value='190'>190cm</option>
				<option value='191'>191cm</option>
				<option value='192'>192cm</option>
				<option value='193'>193cm</option>
				<option value='194'>194cm</option>
				<option value='195'>195cm</option>
				<option value='196'>196cm</option>
				<option value='197'>197cm</option>
				<option value='198'>198cm</option>
				<option value='199'>199cm</option>
				<option value='200'>200cm</option>
			</select>
		</div>
	</div>
	<div id="age">
		<div id="age_name">
			<h4>나이</h4>
		</div>
		<div id="age_input">
			<select id="input_age" name="cody_age">
				<option value='0'>선택해주세요</option>
				<option value='8'>8세</option>
				<option value='9'>9세</option>
				<option value='10'>10세</option>
				<option value='11'>11세</option>
				<option value='12'>12세</option>
				<option value='13'>13세</option>
				<option value='14'>14세</option>
				<option value='15'>15세</option>
				<option value='16'>16세</option>
				<option value='17'>17세</option>
				<option value='18'>18세</option>
				<option value='19'>19세</option>
				<option value='20'>20세</option>
				<option value='21'>21세</option>
				<option value='22'>22세</option>
				<option value='23'>23세</option>
				<option value='24'>24세</option>
				<option value='25'>25세</option>
				<option value='26'>26세</option>
				<option value='27'>27세</option>
				<option value='28'>28세</option>
				<option value='29'>29세</option>
				<option value='30'>30세</option>
				<option value='31'>31세</option>
				<option value='32'>32세</option>
				<option value='33'>33세</option>
				<option value='34'>34세</option>
				<option value='35'>35세</option>
				<option value='36'>36세</option>
				<option value='37'>37세</option>
				<option value='38'>38세</option>
				<option value='39'>39세</option>
				<option value='40'>40세</option>
				<option value='41'>41세</option>
				<option value='42'>42세</option>
				<option value='43'>43세</option>
				<option value='44'>44세</option>
				<option value='45'>45세</option>
				<option value='46'>46세</option>
				<option value='47'>47세</option>
				<option value='48'>48세</option>
				<option value='49'>49세</option>
				<option value='50'>50세</option>
			</select>
		</div>
	</div>
	</div>

	<!--------------------업로드--------------------->
	<div id="input">
		<div id="upload_input">
			<input id="input_upload" type="submit" value="Upload">
		</div>
	</div>

	</form>
	</div>

	<!--------------------옷장--------------------->
	<div class="container" style="float: left">
		<div class="modal fade" id="ClosetModal" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">옷장에서 선택</h4>
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body"></div>
					<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Close</button>
									</div>
				</div>
			</div>
		</div>
	</div>

	<!--------------------상품검색--------------------->
	<div class="container" style="float: left">
		<div class="modal fade" id="SearchModal" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">상품 검색</h4>
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body">
					<form action="${pageContext.request.contextPath }/shoppingList">
			<input type="text" name="keyword"> <button type="submit">검색</button>
		</form>

	<table class="table">
  <thead class="thead-dark">
    <tr>
      <th scope="col">사진</th>
      <th scope="col">제목</th>
      <th scope="col">가격</th>
      <th scope="col">판매mall</th>
    </tr>
  </thead>
  <tbody>
 
    <tr>
      <th scope="row"><a href="${naver_link}"><img src="${naver_image}" width="100px"
					height="100px"></a></th>
      <td><a href="${naver_link}">${naver_title}</a></td>
      <td>${naver_lprice}</td>
      <td>${naver_mallName}</td>
    </tr>

    </tbody>
    
    </table>
					</div>
					<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Close</button>
									</div>
				</div>
			</div>
		</div>
	</div>

	<!--------------------신규 아이템--------------------->
	<div class="container" style="float: left">
		<div class="modal fade" id="NewitemModal" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">신규 아이템 등록</h4>
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body">
						<form action="${pageContext.request.contextPath }/itemForm"
							method="post" enctype="multipart/form-data"
							onkeydown="return capturekey(event)">
							<div>
								이미지 : <input type="file" name="photofile">
							</div>
							<div>
								이름 : <input type="text" name="item_name">
							</div>
							<div>
								브랜드 : <input type="text" name="item_brand">
							</div>
							<div>
								가격 : <input type="text" name="item_price">
							</div>
							<div>
								카테고리 : <select id="input_category" name="item_category">
									<option>선택해주세요</option>
									<option value='모자'>모자</option>
									<option value='상의'>상의</option>
									<option value='하의'>하의</option>
									<option value='아우터'>아우터</option>
									<option value='신발'>신발</option>
									<option value='악세사리'>악세사리</option>
								</select>
							</div>
							<div>
								색상 : <select id="input_color" name="item_idx">
									<option>선택해주세요</option>
									<option value='흰색'>흰색</option>
									<option value='검은색'>검은색</option>
									<option value='빨간색'>빨간색</option>
									<option value='주황색'>주황색</option>
									<option value='노랑색'>노랑색</option>
									<option value='초록색'>초록색</option>
									<option value='파랑색'>파랑색</option>
									<option value='남색'>남색</option>
									<option value='보라색'>보라색</option>
								</select>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Close</button>
								<button type="submit" class="btn btn-primary">Upload</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>



	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script
		src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
	<script src="http://googledrive.com/host/0B-QKv6rUoIcGREtrRTljTlQ3OTg"></script>
	<!-- ie10-viewport-bug-workaround.js -->
	<script src="http://googledrive.com/host/0B-QKv6rUoIcGeHd6VV9JczlHUjg"></script>
	<!-- holder.js -->

<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script src="${pageContext.request.contextPath}/resources/script/cody_seo1.js"></script>
<script src="//html5shiv.googlecode.com/svn/trunk/html5.js"></script>
						</div>
						</div>
						</div>
						</div>
						</div>

	
</body>



</html>