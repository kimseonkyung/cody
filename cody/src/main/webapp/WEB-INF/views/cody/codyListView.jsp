<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#container {
	height: 1907px;
	width: 999px;
	margin: 0 auto;
	/*컨텐츠 내부 수평 정렬*/
	overflow: hidden;
	margin-top: 10px;
}

#main {
	height: 1750px;
	width: 995px;
	position: relative;
	/*중앙정렬*/
	margin: 0 auto;
	/*컨텐츠 내부 수평 정렬*/
	overflow: hidden;
	margin-top: 30px;
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

#main_content {
	height: 1540px;
	width: 990px;
	position: relative;
}

#left_content {
	width: 558px;
	height: 1500px;
	float: left;
	position: absolute;
}

#left_div {
	width: 558px;
	height: 1500px;
}

#image {
	width: 556px;
	height: 723px;
}

#funtion {
	width: 556px;
	height: 58px;
	border: 2px solid darkgray;
}

#bookmark {
	position: absolute;
	margin-top: 14px;
	margin-left: 20px;
}

#bookmark_btn {
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

#like {
	position: absolute;
	right: 0;
	margin-top: 14px;
	margin-right: 80px;
}

#like_btn {
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

#like_list {
	width: 556px;
	height: 62px;
	border: 2px solid darkgray;
}

#reple {
	
}

#right_content {
	width: 414px;
	float: right;
	position: absolute;
	right: 0;

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
width: 380px;
margin: 0 auto;
}

#content_name{
width: 380px;
font-size: 18px;

}

#content_sub{
width: 402px;
margin: 0 auto;
}

#content_sub1{
width: 380px;

}

#content_intro{
width: 402px;
margin: 0 auto;
}

#content_intro1{
width: 380px;
line-height: 180%;
margin: 0 auto;
}

#content_date{
width: 402px;
margin: 0 auto;
}

#content_date1{
width: 380px;
min-height: 30px;
margin: 0 auto;
}

#item {
width: 402px;
min-height: 120px;
margin: 0 auto;
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

</style>
</head>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>

<body>
	<div id="container">
	<div id= "main">
	<form method="post" enctype="multipart/form-data">
				
					<header id="main_header">
						<div id="main_header_1">
							<a href="${pageContext.request.contextPath }/codyUpdate?cody_idx=${cody.cody_idx }">
							<input id="update_btn" type=button value="수정"></a>
						</div>
						<div id="main_header_2">
							<input id="follow_input" type="button" value="팔로우하기"><a href="#"></a>
						</div>
					</header>
					<!--------------------내용--------------------->
					<div id="main_content">
						<!-- 회원 정보 출력 반복 시작 -->
						<!--------------------왼쪽--------------------->

						<div id="left_content">
							<div id="left_div">
								<div id="image">
									<c:if test="${cody.cody_image != null}">
										<img src="${pageContext.request.contextPath }/uploadfile/codyphoto/${cody.cody_image}" width="556" height="723">
									</c:if>
								</div>

								<div id="funtion">
									
									<div id="like">
										<a href="#"><input id="like_btn" type="button" value="좋아요"></a>
									</div>
									<div id="comment">
										<a href="#"><input id="comment_btn" type="button" value="코멘트"></a>
									</div>
								</div>
								<div id="like_list"></div>
								<div id="left3">
									<div id="reple"></div>
								</div>
							</div>
						</div>
						<!--------------------오른쪽--------------------->
						<div id="right_content">
							<div id="info">
							<div id="content_container">
								<div id="content_1">
								<div id=content_name><h4>${cody.cody_title}</h4></div>											
								<div id="content_sub"><div id="content_sub1">
								모델정보:${cody.cody_height}cm
								<c:set var="data" value="${cody.cody_gender}" />
								<c:choose>
									<c:when test="${data eq true}">
                                        Man
                                    </c:when>

									<c:otherwise>
                                        Woman
                                    </c:otherwise>
								</c:choose>
								${cody.cody_age}세
								</div></div>
								</div>
								<div id="content_intro"><div id="content_intro1"><p>${cody.cody_intro}</p></div></div>
								<div id="content_date"><div id="content_date1"><p>${cody.board_date}</p></div></div>
							</div>
							</div>
							
							<div id="item">
							<div id="item_name">착용아이템</div>
							<div id="item_main"><a href="${pageContext.request.contextPath }/codyDelete?cody_idx=${cody.cody_idx}">삭제</a>
								<a href="codyForm">코디등록</a></div>
								
							</div>


						</div>



					</div>
				
			</form>
	</div>
	</div>
</body>

</html>