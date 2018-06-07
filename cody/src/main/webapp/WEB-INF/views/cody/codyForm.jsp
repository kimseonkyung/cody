<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>



<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>코디게시</title>

<!--초기화 코드-->
<style>
* {
	margin: 0;
	padding: 0;
	border: 0;
}

body {
	font-family: 'Times New Roman', serif;
}

li {
	list-style: none;
}

a {
	text-decoration: none;
}
</style>
<!--웹폰트 추가 : 구글 폰트-->
<link href="https://fonts.googleapis.com/css?family=Nanum+Brush+Script"
	rel="stylesheet">
<!-- CODY CSS -->
<link href="${pageContext.request.contextPath}/resources/css/cody.css" type="text/css" rel="stylesheet">



<!--본문 내용 속성-->
<style>
#content {
	border: 2px solid darkgray;
	border-radius: 5px 5px 5px 5px;
	max-width: 920px;
	display: flex;
	/*border: 1px solid gray;*/
	/*중앙정렬*/
	margin: 0 auto;
	/*컨텐츠 내부 수평 정렬*/
	overflow: hidden;
	margin-top: 10px;
}

#image {
	width: 920px;
	height: 460px;

}

.side1 {
	margin-top: 45px;
	margin-left: 90px;
	position: relative;
	float: left;
}

#image_main{
    width: 610px;
    height: 460px;
    position: relative;
	float: right;

}

#image_frame {
	width: 610px;
	height: 460px;
	position: absolute;
}

#image_block {
	width: 284px;
	height: 364px;
	border: 2px solid darkgray;
	position: absolute;
	left: 20px;
	margin-top: 45px;
	border-radius: 5px 5px 5px 5px;
}

#image_input {
	width: 160px;
	height: 38px;
	position: absolute;
	right: 61px;
	margin-top: 180px;
	margin-left: 50px;
}

.sub1 {
	margin-top: 226px;
	position: absolute;
	right: 24px;
}

.sub2 {
	margin-top: 251px;
	position: absolute;
	right: 82px;
}
#item_container{
    width: 920px;
	diplay: flex;
}
#item {
	width: 610px;
	min-height: 100px;
	float:right;
	position:relative;
	margin-left: 80px;
}
.side2 {
	margin-top: 20px;
	margin-left: 84px;
	float: left;
	position: relative;

}
#input_item {
	margin-left: 20px;
	margin-top: 20px;
	height: 38px;
	width: 160px;
	vertical-align: middle;
	font-size: 15px;
	font-weight: 600;
	border-color: transparent;
	background: blue;
	border-radius: 3px;
	color: #fff;
	cursor: pointer;
}

#item_intro {
	margin-left: 20px;
	margin-top: 8px;
}

#main {
	width: 920px;
	display: flex;
}
#main_container {
	width: 610px;
    position: relative;
	float: right;
	margin-left: 70px;

}
.side3 {
	margin-top: 40px;
	margin-left: 135px;
	float: left;
	position: relative;
}

#replace {
	/*button tag 에 원하는 스타일 적용*/
	position: absolute;
	width: 160px;
	height: 38px;
	font-weight: 600;
	border-color: transparent;
	font-size: 16px;
	background: blue;
	color: #fff;
	cursor: pointer;
}

#input_image {
	width: 160px;
	height: 38px;
	vertical-align: middle;
	font-size: 16px;
	border-color: transparent;
	opacity: 0;
	/*input type="file" tag 투명하게 처리*/
	position: relative;
	cursor: pointer;
}

#modal-dialog {
	width: 400px;
	height: 300px;
}
#title {
	width: 550px;
	height: 100px;
}

#title_name {
	margin-left: 20px;
	margin-top: 16px;
}

#title_input {
	margin-left: 20px;
	margin-top: 10px;
}

#input_title {
	border: 2px solid darkgray;
	height: 25px;
	width: 462px;
	border-radius: 5px 5px 5px 5px;
}

#intro {
	width: 550px;
	height: 400px;
	left: 0;
	overflow: hidden;
	position: relative;
}

#intro_name {
	margin-left: 20px;
	margin-top: 10px;
}

#intro_input {
	margin-left: 20px;
	margin-top: 10px;
}

#intro_text {
	border: 2px solid darkgray;
	width: 462px;
	height: 316px;
	border-radius: 3px 3px 3px 3px;
	margin-left: 2px;
}

#text {
	margin: 0 auto;
}

#intro_sub {
	margin-left: 2px;
	margin-top: 10px;
}

#gender {
	width: 550px;
	height: 80px;
	left: 0;
	overflow: hidden;
	position: relative;
}

#gender_name {
	margin-left: 20px;
	margin-top: 10px;
}

#gender_input {
	margin-left: 20px;
	margin-top: 10px;
}

#height {
	width: 550px;
	height: 80px;
	left: 0;
	overflow: hidden;
	position: relative;
}

#height_name {
	margin-left: 20px;
	margin-top: 10px;
}

#height_input {
	margin-left: 20px;
	margin-top: 10px;
}

#input_height {
	border: 2px solid darkgray;
	height: 21px;
	width: 180px;
	border-radius: 5px 5px 5px 5px;
}

#age {
	width: 550px;
	height: 80px;
	left: 0;
	overflow: hidden;
	position: relative;
}

#age_name {
	margin-left: 20px;
	margin-top: 10px;
}

#age_input {
	margin-left: 20px;
	margin-top: 10px;
}

#input_age {
	border: 2px solid darkgray;
	height: 21px;
	width: 180px;
	border-radius: 5px 5px 5px 5px;
}

#input {
	bottom: 0;
	left: 35%;
	height: 80px;
}

#upload_input {
	width: 240px;
	height: 48px;
	margin: 0 auto;
	margin-top: 14px;
}

#input_upload {
	width: 240px;
	height: 48px;
	border-radius: 3px;
	font-weight: 600;
	border-color: transparent;
	font-size: 20px;
	background: blue;
	color: #fff;
	cursor: pointer;
}

.modal {
	text-align: center;
}

@media screen and (min-width: 768px) {
	.modal:before {
		display: inline-block;
		vertical-align: middle;
		content: " ";
		height: 100%;
	}
}

.modal-dialog {
	display: inline-block;
	text-align: left;
	vertical-align: middle;
}

input:focus, textarea:focus {
	resize: none, outline: none;
}

.checkedItem {
	 border: 1px solid blue!important;
}

.itemTable td {
	padding: 3px 0 3px 25px;
}

.itemTable img {
	width: 150px;
}

</style>



<!--푸터 스타일-->
<style>
</style>
</head>

<body class="bg-light">

	<!-- 인클루드 header -->
	<%@ include file="../top/header.jsp" %>
	

	
	<main role="main" class="container">
	<!--------------------- 메인 배너 ----------------------->
	<div
		class="d-flex align-items-center p-3 my-3 text-white-50 rounded box-shadow" 
		style="
		background-image: url('/cody/uploadfile/cody.png');
		background-repeat:no-repeat;
		background-size: contain;">
		<div class="lh-100">
			<h5 class="mb-0 text-white lh-100">CODY</h5><small>bitcamp 2018</small>
		</div>
	</div>

	
	<div id="content">
		<form  role="codyForm" enctype="multipart/form-data" onkeydown="return capturekey(event)">
			
			
			
			<!--------------------메인--------------------->

				<div class="row">
				<div class="col-md-12 order-md-1">
				
				<div id="image">
					 <div class="side1">
							<h4>코디 이미지※</h4>
						</div>
						<div id=image_main>
					<div id="image_frame">
						<div id="image_block">
							<img id="preview" src="#" width="280" height="360">
						</div>
						<div id="image_input">
										<button id="replace">사진 업로드</button>
										<input id="input_image" type="file" name="photofile" accept="image/*">
									</div>
									<div class="sub1">
										<h6>권장 사이즈 : 가로 500 × 세로 667</h6>
									</div>
									<div class="sub2">
										<h6>용량 : 5MB 이내</h6>
									</div>
								</div>
							</div>
							</div>
							

				
				<div id="item_container">
				        <div class="side2">
							<h4>착용 아이템※</h4>
						</div>
				  <div id="item">
				  				<!-- 항목 추가 아이템 테이블 -->
								<div>
									<table id="codyTable" class="itemTable">
									</table>
								</div>
								
					<div class="dropdown">
						<button id="input_item" type="button" data-toggle="dropdown">+   항목 추가</button>
						<ul class="dropdown-menu">
						<li><a>항목 추가</a></li>
						<li class="divider">
						<li><button type="button" data-toggle="modal" data-target="#ClosetModal">옷장에서 선택</button></li>
						<li><button type="button" data-toggle="modal" data-target="#SearchModal">상품 검색</button></li>
						<li><button type="button" data-toggle="modal" data-target="#NewitemModal">신규 아이템 등록</button></li>
						<li><button type="button" data-toggle="modal" data-target="#NaveritemModal">네이버 검색</button></li>
						</ul>
					</div>			
				
				<div id="item_intro">
								<h6>최대 9 항목까지 추가 할 수 있습니다</h6>
								
							</div>
						</div>
						</div>
						
						

    <div id="main">
    <div class="side3">
         <h4>코디 상세</h4>
    </div>
    
    <div id="main_container">
>
    
                   
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
				<textarea class="text" style="resize: none" rows="13" cols="63"
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
			<label><input type="radio" id="gender1" name="cody_gender" value="true">Man</label> <label>
				<input type="radio" id="gender2" name="cody_gender" value="false">Woman</label>
		</div>
		</div>
		

	
	<div id="height">
		<div id="height_name">
			<h4>신장</h4>
		</div>
		<div id="height_input">
			<select id="cody_height" name="cody_height">
				<option value='0'>선택해주세요</option>
			<c:forEach var="i" begin="50" end="200" step="1">
			<option value='${i}'>${i}cm</option>
			</c:forEach>
			</select>
		</div>
	</div>
	

	
	<div id="age">
		<div id="age_name">
			<h4>나이</h4>
		</div>
		<div id="age_input">
			<select id="cody_age" name="cody_age">
			<option value='0'>선택해주세요</option>
			<c:forEach var="i" begin="1" end="80" step="1">
			<option value='${i}'>${i}세</option>
			</c:forEach>
			</select>
		</div>
	</div>
	</div>
	</div>
	


	<!--------------------업로드--------------------->
	<div class="col-md-12 order-md-2">
	
	<div id="input">
		<div id="upload_input">
			<input id="input_upload" type="submit" onclick="codyInsert()" value="등록">
		</div>
	</div>
	</div>
			
		
		</div>
		</div>
		</form>
		</div>
	
		</main>
	<!--------------------- 푸터 ----------------------->
     <!-- 인클루드 footer -->
	<%@ include file="../bottom/footer.jsp" %>
	
	
	<!--------------------옷장--------------------->
	<div class="container" style="float: left">
		<div class="modal fade" id="ClosetModal" role="dialog">
			<div class="modal-dialog modal-lg" >
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">옷장에서 선택</h4>
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					
					<div class="modal-body">
				
						<div class="bg-white rounded box-shadow">
				
						<section class="ItemButtons">
				
				
						<!-- 옷장 리스트 반복 출력 -->
							<c:forEach var="item" items="${items }">
							
								<input id="chItem${item.item_idx }" type="radio" name="chItem" value="${item.item_idx }" style="display: none;">
							
								<div id="card${item.item_idx }" class="card" style="width: 9rem; display: inline-block;">
								<label for="chItem${item.item_idx }">
								<img class="card-img-top" src="${item.item_image }" style="height: 150px; " alt="Card image cap">
								</label>
								<div class="card-body" style="height: 70px; ">
  											<c:set var="myItemName" value="${item.item_name }" />
  											<c:set var="nameL"  value="${fn:length(myItemName)}" />
  											<c:if test="${nameL > 8 }">
  												<c:set var="myItemName" value="${fn:substring(myItemName, 0, 7)} ..." />
  											</c:if>
   											 <p class="card-text"><small>${myItemName }</small></p>
  								</div>
								</div>
								<input type="hidden" id="myitem_image${item.item_idx }" value="${item.item_image }">
								<input type="hidden" id="myitem_name${item.item_idx }" value="${item.item_name }">
								<input type="hidden" id="myitem_brand${item.item_idx }" value="${item.item_brand }">
								<input type="hidden" id="myitem_category${item.item_idx }" value="${item.item_category }">
								<input type="hidden" id="myitem_color${item.item_idx }" value="${item.item_color }">
								<input type="hidden" id="myitem_price${item.item_idx }" value="${item.item_price }">
							</c:forEach>
						</section>
						</div>
						
					</div>
					<div class="modal-footer">
					<button id="myItemOk" class="btn btn-primary">확인</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
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
								이름 : <input type="text" id="item_name" name="item_name">
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
								색상 : <select id="item_color" name="item_color">
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


	<!--------------------네이버 아이템--------------------->
	<div class="container" style="float: left">
		<div class="modal fade" id="NaveritemModal" role="dialog">
			<div class="modal-dialog modal-lg">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">아이템 검색</h4>
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body">
						<form id="naverSearchOk" enctype="multipart/form-data"
							onkeydown="return capturekey(event)">
							
							
						<div>				
           					 <input type="text" id="keyword" name="keyword" >
           					 <input type="button" value="검색" onclick="naverSearch()">
     					</div>
    
   					 	<div class="container mt-3">
							<table class="table text-center table-bordered">
									<thead class="thead-dark">
										<tr>
											<th scope="col">사진</th>
											<th scope="col">이름</th>
											<th scope="col">가격</th>
											<th scope="col">선택</th>
										</tr>
									</thead>
									<tbody id="naverTable">
									</tbody>
							</table>
						</div>
						
						</form>
						<div class="modal-footer">
						<button class="btn btn-primary" onclick="naverSearchOk()">확인</button>
							<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	

</body>

<!-- 	<script src="http://googledrive.com/host/0B-QKv6rUoIcGREtrRTljTlQ3OTg"></script>
	ie10-viewport-bug-workaround.js
	<script src="http://googledrive.com/host/0B-QKv6rUoIcGeHd6VV9JczlHUjg"></script>
	<script src="//html5shiv.googlecode.com/svn/trunk/html5.js"></script> -->
	
	<!-- holder.js -->
	<script src="${pageContext.request.contextPath}/resources/script/cody_seo1.js"></script>	
	<script src="${pageContext.request.contextPath}/resources/script/cody_kim.js"></script>


</html>