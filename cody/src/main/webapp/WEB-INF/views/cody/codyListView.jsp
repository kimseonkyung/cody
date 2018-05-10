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
	width: 995px;
	margin: 0 auto;
	/*컨텐츠 내부 수평 정렬*/
	overflow: hidden;
	margin-top: 10px;
}

#main {
	height: 1887px;
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
	border: 2px solid skyblue;
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

#content {
	height: 1700px;
	width: 990px;
	border: 2px solid orange;
	position: relative;
}

#left {
	width: 558px;
	height: 1500px;
	float: left;
	position: absolute;
}

#left_div {
	width: 558px;
	height: 1500px;
	border: 2px solid blue;
}

#image {
	width: 556px;
	height: 723px;
}

#funtion {
	width: 556px;
	height: 58px;
	border: 2px solid black;
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
	border: 2px solid black;
}

#reple {
	
}

#right {
	width: 414px;
	float: right;
	position: absolute;
	right: 0;
}

#info {
	width: 414px;
	height: 200px;
	border: 2px solid blue;
}

#item {
	width: 414px;
	height: 300px;
	border: 2px solid blue;
}
</style>
</head>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>

<body>
	<div id="container">
		<div id="main">
			<form action="${pageContext.request.contextPath }/codyListView" method="post" enctype="multipart/form-data">
				<c:forEach var="cody" items="${codys}">
					<div id="main_header">
						<div id="main_header_1">
							<a
								href="${pageContext.request.contextPath }/codyUpdate?cody_idx=${cody.cody_idx }"><input
								id="update_btn" type=button value="수정"></a>
						</div>
						<div id="main_header_2">
							<input id="follow_input" type="button" value="팔로우하기"><a
								href="#"></a>
						</div>
					</div>
					<!--------------------내용--------------------->
					<div id="content">
						<!-- 회원 정보 출력 반복 시작 -->
						<!--------------------왼쪽--------------------->

						<div id="left">
							<div id="left_div">
								<div id="image">
									<c:if test="${cody.cody_image != null}">
										<img
											src="${pageContext.request.contextPath }/uploadfile/codyphoto/${cody.cody_image}"
											width="556" height="723">
									</c:if>
								</div>

								<div id="funtion">
									<div id="bookmark">
										<a
											href="${pageContext.request.contextPath}/bookmark?cody_idx=${bookmark_idx}"><input
											id="bookmark_btn" type="button" value="즐겨찾기"></a>
									</div>
									<div id="like">
										<a href="#"><input id="like_btn" type="button" value="좋아요"></a>
									</div>
									<div id="comment">
										<a href="#"><input id="comment_btn" type="button"
											value="코멘트"></a>
									</div>
								</div>
								<div id="like_list"></div>
								<div id="left3">
									<div id="reple"></div>
								</div>
							</div>
						</div>
						<!--------------------오른쪽--------------------->
						<div id="right">
							<div id="info">

								<div id="content_name">
									<h3>${cody.cody_title}</h3>
								</div>

								${cody.cody_height}
								<c:set var="data" value="${cody.cody_gender}" />
								<c:choose>
									<c:when test="${data eq true}">
                                        Man
                                    </c:when>

									<c:otherwise>
                                        Woman
                                    </c:otherwise>
								</c:choose>
								${cody.cody_age}

								<div id="content_content">${cody.cody_intro}</div>

								<div id="content_date">${cody.board_date}</div>
							</div>
							<div id="item">

								<a
									href="${pageContext.request.contextPath }/codyDelete?cody_idx=${cody.cody_idx}">삭제</a>
								<a href="codyForm">코디등록</a>

							</div>
						</div>
					</div>
				</c:forEach>
			</form>
			<!-- 회원 정보 출력 반복 끝 -->
		</div>
	</div>
</body>

</html>