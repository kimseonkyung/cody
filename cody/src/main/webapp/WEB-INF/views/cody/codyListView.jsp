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
	margin-right: 50px;
}

#bookmark {
	border-radius: 3px;	
	border-color: transparent;
	background: #007bff;
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
	width: 50px;
	height: 50px;
	border: 1px solid #aaa;
	margin-left: 5px;
}

#reple {
	margin: 20px 0;
}

#reple img {
	border-radius: 50%;
	width: 40px;
	height: 40px;
	vertical-align: bottom;
	
}

#reple textarea {
	width: 300px;
	margin: 0 20px;
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
		
					<c:choose>
					<c:when test="${loginInfo.member_idx eq cody.member_idx }">
					<div class="col-md-3">
					<div style="float: right;">
					<a href="${pageContext.request.contextPath }/codyUpdate?cody_idx=${cody.cody_idx}"><input class="btn btn-primary" type="button" value="수정"></a>
					<a href="${pageContext.request.contextPath }/codyDelete?cody_idx=${cody.cody_idx}"><input class="btn btn-primary" type="button" value="삭제"></a>
					</div>
					</div>
					</c:when>
					<c:when test="${loginInfo ne null }">
					<div class="col-md-3"><a href="#"><input class="btn btn-primary" type="button" value="팔로우하기" style="float:right;"></a>	</div>
					</c:when>
					</c:choose>
			
		
		</div>
			
						<!--------------------왼쪽--------------------->
                       <div class="col-md-7 order-md-2 mr-auto" style="margin-bottom: 20px; margin-top: 20px">
                       <div id="image">
									<c:if test="${cody.cody_image != null}">
										<img src="${pageContext.request.contextPath }/uploadfile/codyphoto/${cody.cody_image}"style="width: 100%; object-fit: contain; border:2px solid darkgray;">
									</c:if>
								</div>

								<div id="funtion">									
										
										<a href="${pageContext.request.contextPath }/bookmark?cody_idx=${cody.cody_idx}&member_idx=${cody.member_idx}&cody_image=${cody.cody_image}">									
										<button id="bookmark" class="btn btn-primary" style="right: 140px;margin-top: 8px;margin-right: 57px;">
										스크랩</button></a>
										
										
										<button id="repleShow" class="btn btn-primary" style="float:right;margin-top: 8px;margin-right: 12px;"">코멘트</button>		
										
									</div>
										
									
								<div id="like_list">
								</div>	
								
								
								
								<div class="bg-white rounded box-shadow" id="left3" style="max-width: 556px; border: 2px solid darkgray;">
								<div>
						
												<!------------------------ 답글 리스트 ---------------------------->
		<div id="repleList">
			<c:forEach var="repleList" items="${repleList }">
				<div id="repleView" style="margin-left: ${40*repleList.redepth}px;">
					<div class="repleDiv">
					<img class="rounded-circle repleImg" src="${pageContext.request.contextPath }/uploadfile/memberphoto/${repleList.member_photo }">
					&emsp;<p class="h3 repleId">${repleList.member_id }</p> &emsp;&emsp;${repleList.reple_date }
					
					<c:choose>
					<c:when test="${loginInfo.member_idx eq repleList.member_idx }">
					<button class="ml-3" id="repleDelete${repleList.reple_idx }" onclick="repleDelete(${repleList.reple_idx })">삭제</button><br>
					</c:when>
					<c:when test="${loginInfo ne null }">
					<button class="ml-3" onclick="re_repleShow(${repleList.reple_idx })">답글</button>
					</c:when>
					</c:choose>
					
					<div class="repleCon">${repleList.reple_contents}</div>
					</div>
					
					<div class="re_reple" id="re_reple${repleList.reple_idx }" style="display: none; margin-top: 5px;">
					<form id="re_repleForm${repleList.reple_idx }" style="display: inline-block;">
						<input type="hidden" name="cody_idx" value="${cody.cody_idx }"> 
						<input type="hidden" name="regroup" value="${repleList.regroup }">
						<input type="hidden" name="reparent" value=${repleList.reple_idx }>
						<input type="hidden" name="redepth" value="${repleList.redepth }">
						<input type="hidden" name="reorder" value="${repleList.reorder }">
						<textarea class="border border-secondary rounded" name="reple_contents" rows="3" maxlength="450" style="width:100%;"></textarea>
					</form>
						<button id="re_repleSave"  onclick="re_repleSave(${repleList.reple_idx })">저장</button>
					</div>
					
				</div>
			</c:forEach>
		</div>

		<div id="reple">
		<table  style="margin: 10px auto;">
		<tr>
		<td><img src="${pageContext.request.contextPath }/uploadfile/memberphoto/${loginInfo.member_photo }"></td>
		<td>
			<input type="hidden" name="reple_cody_idx" value="${cody.cody_idx }">
			<input type="hidden" name="reple_member_idx" value="${loginInfo.member_idx }">
			<input type="hidden" name="reple_member_id" value="${loginInfo.member_id }">
			<input type="hidden" name="reple_member_photo" value="${loginInfo.member_photo }">
			<textarea class="border border-secondary rounded" id="reple_contents" name="reple_contents"></textarea>
		</td>
		<td><button class="btn-outline-dark saveBtn border-secondary rounded" type="button" id="repleSave">저장</button></td>
		</tr>
		</table>
		</div>

								</div>
								</div>
								</div>		
						
						
						<!--------------------오른쪽--------------------->
						<div class="col-md-5 order-md-3" style="margin-bottom: 20px; margin-top: 20px">
						<div id= content_1>
							<div id=content_name><h4>${cody.cody_title}</h4></div>											
								<div id="content_sub">
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
								</div>
								
								<div id="content_intro1"><p>${cody.cody_intro}</p></div>
								<div id="content_date1"><p><fmt:formatDate value="${cody.board_date}" pattern="yyyy-MM-dd HH:mm"/></p></div>
						</div>
	
			
						<div class="bg-white rounded box-shadow" style="max-width: 445px;margin-top:20px;border: 2px solid darkgray;overflow: hidden;margin:  0 auto;">
							<div id="item_name"><h2>착용아이템( ${itemSize } )</h2></div>
							
							<ul style="list-style: none;">
							<c:forEach var="item" items="${items }">
							<li style="clear: both; margin: 10px; display: block;">
							<img src="${item.item_image }" style="margin-left:20px; width: 120px; border-radius: 3px; float:left;">
							<p style="width: 270px; float:right;">
							${item.item_name }<br>
							${item.item_category }( ${item_color } )<br>
							${item.item_price }<br>
							<button class="btn btn-dark" onclick="location.href='${item.item_link}'">구입</button>
							</p>
							</li>
							
							
							</c:forEach>
							
							</ul>
							
								
								
								
						</div>
								
								
						</div>

                     </div>

	</main>
	<!-- 인클루드 footer -->
	<%@ include file="../bottom/footer.jsp" %>
</body>

<script	src="${pageContext.request.contextPath}/resources/script/cody_kim.js"></script>

</html>