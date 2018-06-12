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
	margin-bottom: 10px;
	border-radius: 0.25rem;
	border:1px solid darkgray;
	
}

#bookmark {
	position: absolute;
	margin-top: 14px;
	margin-right: 50px;
}

#bookmark {
	border-radius: 3px;	
	border-color: transparent;
	background: #17a2b8;
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
	min-height: 80px;
	border: 1px solid darkgray;
	margin-bottom: 10px;
	border-radius: 0.25rem
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
border: 1px solid darkgray;
max-width: 556px;
margin: 0 auto;
margin-bottom: 50px;
border-radius: 0.25rem
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
width: 400px;
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
	margin-top: 20px;
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
	height: 112px;
	text-align: center;
	width: 50px;
	height: 50px;
 	border: 1px solid #aaa;
 	vertical-align: top;
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

.codyLike {
	width: 190px;
	height: 46px;
	text-align: center;
	color: #888;
	font-weight: bold;
	border: 1px solid #999;
	float: left;
	margin: 15px 0 15px 20px;
}

.codyLike > div {
	display: inline-block;
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
		<c:choose>
			<c:when test="${not empty member.member_photo}" >
		<img class="rounded-circle" src="${pageContext.request.contextPath }/uploadfile/memberphoto/${member.member_photo}" width="45" height="45">
		</c:when>
		<c:otherwise>
		<img class="rounded-circle" src="${pageContext.request.contextPath }/uploadfile/member.png" width="45" height="45"> 
		
		</c:otherwise>
		</c:choose>
		&emsp;${member.member_id}&emsp; ${cody.cody_height}cm
		</div>
		
					<c:choose>
					<c:when test="${loginInfo.member_idx eq cody.member_idx }">
					<div class="col-md-3">
					<div style="float: right;">
					<a href="${pageContext.request.contextPath }/codyUpdate?cody_idx=${cody.cody_idx}"><button class="btn btn-info" type="button" >수정</button></a>
					<a href="${pageContext.request.contextPath }/codyDelete?cody_idx=${cody.cody_idx}"><button class="btn btn-info" type="button" >삭제</button></a>
					</div>
					</div>
					</c:when>
					<c:when test="${loginInfo ne null }">
					<div class="col-md-3"><a href="#"><button class="btn btn-info" type="button" style="float:right;">팔로우</button></a></div>
					</c:when>
					</c:choose>
			
		
		</div>
			
						<!--------------------왼쪽--------------------->
                       <div class="col-md-7 order-md-2 mr-auto" style="margin-bottom: 20px; margin-top: 20px">
                       <div id="image">
									<c:if test="${cody.cody_image != null}">
										<img src="${pageContext.request.contextPath }/uploadfile/codyphoto/${cody.cody_image}"style="width: 100%; object-fit: contain;">
									</c:if>
								</div>
								<div id="funtion" class="bg-white">
									<div class="codyLike">
									<div style="padding: 10px 15px 10px 15px;">즐겨찾기( ${bookmarkCount } )</div>
									<div style="padding: 10px 10px 10px 15px; border-left: 1px solid #999;">
									<c:if test="${loginInfo ne null }">
										<c:if test="${bookmark ne null}">
											<a href="javascript:bookmarkDel(${bookmark.bookmark_idx })">삭제</a>
										</c:if>
										<c:if test="${bookmark eq null}">
											<a href="javascript:bookmarkIns(${loginInfo.member_idx}, ${cody.cody_idx})"><i class="fas fa-plus" style="color: #444;"></i></a>
										</c:if>
									</c:if>
									</div>
									</div>		
										
									
										
										
										<button id="repleShow" class="btn btn-info" style="float:right;margin-top: 8px;margin-right: 12px;">코멘트</button>		
									</div>
										
								
								
								
								<div class="bg-white rounded box-shadow" id="left3" style="max-width: 556px; border: 1px solid darkgray;border-radius: 0.25rem">
								<div>
						
												<!------------------------ 답글 리스트 ---------------------------->
		<div id="repleList" class="bg-white">
			<c:forEach var="repleList" items="${repleList }">
				
				<div id="repleView" style="margin-left: ${50*repleList.redepth}px;">
					<div class="repleDiv">
					<c:set var="photo" value="${repleList.member_photo }"/>
			        <c:if test="${photo eq null }">
			        <c:set var="photo" value="member.png"/>
			        </c:if>
					<img class="rounded-circle repleImg" src="${pageContext.request.contextPath }/uploadfile/memberphoto/${photo }">					
					&emsp;<p class="h3 repleId">${repleList.member_id }</p> &emsp;&emsp;${repleList.reple_date }
					
					<c:choose>
					<c:when test="${loginInfo.member_idx eq repleList.member_idx }">
					<a href="javascript:repleDelete(${repleList.reple_idx })"><i style="font-size: 20px; color: #444; margin-left: 10px;" class="far fa-trash-alt"></i></a>
					</c:when>
					<c:when test="${loginInfo ne null }">
					<a href="javascript:re_repleShow(${repleList.reple_idx })" style="font-size: 15px; color: #444; margin-left: 10px;"><i class="fas fa-reply"></i>답글</a>
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
						<textarea class="border border-secondary rounded" name="reple_contents" maxlength="450" style="width:380px; height: 100px;"></textarea>
					</form>
						<button class="btn-outline-dark saveBtn border-secondary rounded" id="re_repleSave" style="height: 100px;" onclick="re_repleSave(${repleList.reple_idx })">저장</button>
					</div>
					
				</div>
			</c:forEach>
		</div>

		<div id="reple" class="bg-white">
		<table  style="margin: 50px auto 30px auto;">
		<tr>
		<td>
		<c:choose>
			<c:when test="${not empty loginInfo.member_photo}" >
		<img src="${pageContext.request.contextPath }/uploadfile/memberphoto/${loginInfo.member_photo }">
		</c:when>
		<c:otherwise>
		<img src="${pageContext.request.contextPath }/uploadfile/member.png"> 		
		</c:otherwise>
		</c:choose>
        </td>
		<td>
			<input type="hidden" name="reple_cody_idx" value="${cody.cody_idx }">
			<input type="hidden" name="reple_member_idx" value="${loginInfo.member_idx }">
			<input type="hidden" name="reple_member_id" value="${loginInfo.member_id }">
			<input type="hidden" name="reple_member_photo" value="${loginInfo.member_photo }">
			<textarea class="border border-secondary rounded" id="reple_contents" name="reple_contents" style="vertical-align: bottom; width: 360px;"></textarea>
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
						<div id= "content_1" class="bg-white">
							<div id=content_name><h4>${cody.cody_title}</h4></div>											
								<div id="content_sub">
								모델정보:&ensp;${cody.cody_height}cm
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
	
			
						<div class="bg-white rounded box-shadow" style="max-width: 556px;margin-top:20px;border: 1px solid darkgray;overflow: hidden;margin:  0 auto;border-radius: 0.25rem">
							<div id="item_name"><h4>착용아이템( ${itemSize } )</h4></div>
							
							<ul style="list-style: none;">
							<c:forEach var="item" items="${items }">
							<li style="clear: both; margin: 10px; display: block;">
							<img src="${item.item_image }" style="margin-left:20px; width: 120px; border-radius: 3px; float:left;">
							<p style="width: 270px; float:right;">
							${item.item_name }<br>
							${item.item_category }( ${item_color } )<br>
							${item.item_price }<br>
							<button class="btn btn-info" onclick="location.href='${item.item_link}'" style="float:  right; width: 100px;">구입</button>
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