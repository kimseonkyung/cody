<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상세보기</title>
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

<style>
#content {
	min-height: 1500px;
	max-width: 1140px;
	margin: 0 auto;
	/*컨텐츠 내부 수평 정렬*/
	overflow: hidden;
	margin-top: 10px;
}



#main_header {
	height: 150px;
	width: 990px;
	border: 2px solid darkgray;
}

#main_header_1 {
	
}

#update_btn {
	width: 80px;
	height: 35px;
	border-radius: 3px;
	font-weight: 600;
	border-color: transparent;
	font-size: 10px;
	background: blue;
	color: #fff;
	cursor: pointer;
}

#follow_input {
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

#main_content {
	height: 1540px;
	width: 990px;

}

#left_content {
	max-width: 558px;
	height: 1500px;

	
}

#left_div {
	width: 558px;
	min-height: 1000px;
}

#image {
	max-width:556px; 
	max-height:724px;
	overflow: hidden;
}

#funtion {
	max-width: 556px;
	max-height: 58px;
	border: 2px solid darkgray;
}

#bookmark {
	position: absolute;
	margin-top: 14px;
	margin-left: 20px;
}

#bookmark {
	width: 80px;
	height: 30px;
	border-radius: 3px;
	font-weight: 600;
	border-color: transparent;
	font-size: 10px;
	background: blue;
	color: #fff;
	cursor: pointer;
}

#clickLike {
	position: absolute;
	right: 0;
	margin-top: 14px;
	margin-right: 80px;
}

#clickLike {
	width: 50px;
	height: 30px;
	border-radius: 3px;
	font-weight: 600;
	border-color: transparent;
	font-size: 10px;
	background: blue;
	color: #fff;
	cursor: pointer;
}

#comment {
	position: absolute;
	right: 0;
	margin-top: 14px;
	margin-right: 20px;
}

#comment_btn {
	width: 50px;
	height: 30px;
	border-radius: 3px;
	font-weight: 600;
	border-color: transparent;
	font-size: 10px;
	background: blue;
	color: #fff;
	cursor: pointer;
}
#funtion{
max-width: 556px;
	min-height: 58px;
	border: 2px solid darkgray;
}

#like_list {
	max-width: 556px;
	min-height: 58px;
	border: 2px solid darkgray;
}

#reple {
	
}

#right_content {
	width: 414px;
	border: 1px solid darkgray;

}

#info {
	width: 414px;
	margin: 0 auto;
}

#content_container{
width: 402px;

margin: 0 auto;
}

#content_1{
border: 2px solid darkgray;
max-width: 445px;
margin: 0 auto;
}

#content_name{
max-width: 400px;
font-size: 18px;
margin: 0 auto;
line-height: 180%;
margin-top: 20px;
}

#content_sub{
max-width: 400px;
margin: 0 auto;
margin-top: 10px;
}

#content_intro1{
max-width: 400px;
line-height: 180%;
margin: 0 auto;
line-height: 180%;
margin-top: 20px;
}

#content_date1{
max-width: 400px;
min-height: 30px;
margin: 0 auto;
}

#item {
width: 402px;
min-height: 120px;
}

#item_name{
width: 380px;
min-height: 30px;
margin: 0 auto;
margin-top: 5px;
}

#item_main{
width: 380px;
min-height: 120px;
margin: 0 auto;
}

.repleDiv {
	max-width:440px; 
	margin-top: 10px;
	border: 1px solid #aaa; 
	border-radius: 10px;
}

.repleCon {
	width: 300px;
	margin: 10px 10px 10px 30px;
	padding: 10px;
}

.repleId {
	display:inline-block; 
	color: #555;
}

.repleImg {
	width:40px; 
	height: 40px;
	margin-left: 10px; 
}

.saveBtn {
	width: 70px;
	height: 113px;
	text-align: center;
	border: 1px solid #aaa;
	margin-left: 5px;
}

#reple img {
	border-radius: 50%;
	width: 40px;
	height: 40px;
	vertical-align: bottom;
	
}

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
		
	
	
	<div class="row">
		<div class="row mb-2 col-md-12 order-md-1">
		<div class="col-md-3 mr-auto">
		<img class="rounded-circle" src="${pageContext.request.contextPath }/uploadfile/memberphoto/${member.member_photo}" width="45" height="45"> ${member.member_id} ${cody.cody_height}cm
		</div>
		
					<c:if test="${loginInfo.member_idx eq item.member_idx }">
					<div class="col-md-3">
					<div style="float: right;">
					<a href="${pageContext.request.contextPath }/itemUpdate?cody_idx=${item.item_idx}"><input class="btn btn-primary" type="button" value="수정"></a>
					<a href="${pageContext.request.contextPath }/itemDelete?cody_idx=${item.item_idx}"><input class="btn btn-primary" type="button" value="삭제"></a>
					</div>
					</div>
					</c:if>
			
		
		</div>
			
						<!--------------------왼쪽--------------------->
                       <div class="col-md-7 order-md-2 mr-auto" style="margin-bottom: 20px; margin-top: 20px">
                       <div id="image">
									<c:if test="${item.item_image != null}">
										<img src="${item.item_image}"style="width: 100%; object-fit: contain; border:2px solid darkgray;">
									</c:if>
								</div>

								<div id="funtion">									
									
										
										
									</div>
										
									
								<div id="like_list">
								</div>	
								
								
								</div>		
						
						
						<!--------------------오른쪽--------------------->
						<div class="col-md-5 order-md-3" style="margin-bottom: 20px; margin-top: 20px">
						<div id= content_1>
							<div>브랜드 : ${item.item_brand }</div>
							<div id=content_name><h4>${item.item_name}</h4></div>											
								<div id="content_sub">
								<h1>${item.item_brand }원</h1>
								<h2>${item.item_category } / ${item.item_color }</h2>
							</div>
							<button style="" onclick="location.href='${item.item_link }'">구입</button>
								
						</div>
								
						</div>

                     </div>

	</main>
	<!-- 인클루드 footer -->
	<%@ include file="../bottom/footer.jsp" %>
</body>

<script	src="${pageContext.request.contextPath}/resources/script/cody_kim.js"></script>

</html>