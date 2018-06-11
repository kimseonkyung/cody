<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
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


<style>
#ranking{
width: 25px;
height: 25px;
border-radius: 18px 18px 18px 18px;
background-color: black;
position: absolute;
top: 10px;
left: 10px;
text-align: center;
}

</style>
 <style>
.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
.map_wrap {position:relative;width:100%;height:500px;}
#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
.bg_white {background:#fff;}
#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
#menu_wrap .option{text-align: center;}
#menu_wrap .option p {margin:10px 0;}  
#menu_wrap .option button {margin-left:5px;}
#placesList li {list-style: none;}
#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
#placesList .item span {display: block;margin-top:4px;}
#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList .item .info{padding:10px 0 10px 55px;}
#placesList .info .gray {color:#8a8a8a;}
#placesList .info .jibun {padding-left:26px;background:url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info .tel {color:#009900;}
#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
#placesList .item .marker_1 {background-position: 0 -10px;}
#placesList .item .marker_2 {background-position: 0 -56px;}
#placesList .item .marker_3 {background-position: 0 -102px}
#placesList .item .marker_4 {background-position: 0 -148px;}
#placesList .item .marker_5 {background-position: 0 -194px;}
#placesList .item .marker_6 {background-position: 0 -240px;}
#placesList .item .marker_7 {background-position: 0 -286px;}
#placesList .item .marker_8 {background-position: 0 -332px;}
#placesList .item .marker_9 {background-position: 0 -378px;}
#placesList .item .marker_10 {background-position: 0 -423px;}
#placesList .item .marker_11 {background-position: 0 -470px;}
#placesList .item .marker_12 {background-position: 0 -516px;}
#placesList .item .marker_13 {background-position: 0 -562px;}
#placesList .item .marker_14 {background-position: 0 -608px;}
#placesList .item .marker_15 {background-position: 0 -654px;}
#pagination {margin:10px auto;text-align: center;}
#pagination a {display:inline-block;margin-right:10px;}
#pagination .on {font-weight: bold; cursor: default;color:#777;}
iframe {
   width: 100%!important;
   height: 50px!important;
   
}
</style>
</head>


<body class="bg-light">
	
	<!-- 인클루드 header -->
	<%@ include file="./top/header.jsp" %>

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
	
	<div class="nav-scroller bg-white">
	<div class="container">
		<nav class="nav nav-underline">
			<a class="nav-link col-4 mr-auto" href="#">men</a> 
			<a class="nav-link col-4 mr-auto" href="#">women</a>
			<a class="nav-link col-4 mr-auto" href="boardList">공지사항</a>
		</nav>
	</div>
</div>
<div class="row">
     <!--------------------- 메인 사이드 ----------------------->

	<%@ include file="./top/aside.jsp" %>

    <!--------------------- 메인 내용1 ----------------------->
<div class="col-md-10 order-md-2">
	 <div class="my-3 p-3 bg-white rounded box-shadow">
		<div class="border-bottom border-gray pb-2 mb-0" style="vertical-align: inherit;font-size:30px; text-align: center;">랭킹 리스트</div>
	<!------------------ 랭킹리스트 반복 출력 ----------------------->			
			<ol class="card-item-ol" >
			<c:forEach var="cody" items="${arr }" begin="0" end="2" step="1" varStatus="status">		
				<li class="card card-item-li" id="ranking${status.index }">
					<a href="${pageContext.request.contextPath}/codyListView?cody_idx=${cody.cody_idx}">
					<div id="ranking">
					<c:choose>
					<c:when test="${status.index eq 0}">
					<font style="vertical-align: inherit; color: gold;">${status.index+1 }</font>
					</c:when>
					<c:when test="${status.index eq 1}">
					<font style="vertical-align: inherit; color: silver;">${status.index+1 }</font>
					</c:when>
					<c:otherwise>
					<font style="vertical-align: inherit; color: #CD7F32;">${status.index+1 }</font>
					</c:otherwise>
					</c:choose>
					</div>
					<img class="card-img-top card-item" src="${pageContext.request.contextPath }/uploadfile/codyphoto/${cody.cody_image}" alt="Card image cap">
					<c:set var="ranking" value="${status.index }"/>
					
					</a>
						<div class="card-body" style="overflow: hidden;position: relative;padding-top: 10px;padding-bottom: 10px;padding-left: 10px;padding-right: 10px;height: 65px;;">
						
						<div class="card-main" style="float:left;height: 40px;">
						<c:choose>
			<c:when test="${not empty cody.member_photo}" >
		<img class="rounded-circle" src="${pageContext.request.contextPath }/uploadfile/memberphoto/${cody.member_photo }" style="width:40px; height: 40px;">
		</c:when>
		<c:otherwise>
		<img class="rounded-circle" src="${pageContext.request.contextPath }/uploadfile/member.png" width="40" height="40"> 
		
		</c:otherwise>
		</c:choose>
						
						 
						 <div style="float:right; padding-left: 15px;">
						 <div><p style="vertical-align: inherit;margin-bottom: 0px;height: 20px;">${cody.member_id}</p></div>
							
					     <div><p style="vertical-align: inherit;margin-bottom: 0px;height: 20px; font-size:5px">${cody.cody_height}cm ${cody.cody_age}세</p></div>
					    </div>
					    </div>
			<c:choose>
			<c:when test="${loginInfo.member_idx eq cody.member_idx}" >
						<a href="${pageContext.request.contextPath }/codyUpdate?cody_idx=${cody.cody_idx}" class="btn btn-info" style="float:right;">수정</a>						
			</c:when>
			<c:otherwise>
						<a href="${pageContext.request.contextPath }/bookmark?cody_idx=${cody.cody_idx}&member_idx=${cody.member_idx}" class="btn btn-info" style="float:right;">팔로우</a>
			</c:otherwise>
			</c:choose>			
						</div>
				</li>
            </c:forEach>
			</ol>		
	<!------------------ 전체 리스트 반복 출력 ----------------------->			
			<p class="border-bottom border-gray pb-2 mb-0" style="vertical-align: inherit;font-size:30px; text-align: center;">전체 리스트</p>
			<ol class="card-item-ol" >
					<c:forEach var="irr" items="${irr}">

						<li class="card card-item-li" style="margin-bottom: 50px;display: inline-block;"><a
							href="${pageContext.request.contextPath}/codyListView?cody_idx=${irr.codyidx}"><img
								class="card-img-top card-item"
								src="${pageContext.request.contextPath}/uploadfile/codyphoto/${irr.codyimage}"
								alt="Card image cap"></a>
							
							<div class="card-body" style="overflow: hidden;position: relative;padding-top: 10px;padding-bottom: 10px;padding-left: 10px;padding-right: 10px;height: 65px;;">
						
						<div class="card-main" style="float:left;height: 40px;">
						<c:choose>
			<c:when test="${not empty irr.photo}" >
		<img class="rounded-circle" src="${pageContext.request.contextPath }/uploadfile/memberphoto/${irr.photo }" style="width:40px; height: 40px;">
		</c:when>
		<c:otherwise>
		<img class="rounded-circle" src="${pageContext.request.contextPath }/uploadfile/member.png" width="40" height="40"> 
		
		</c:otherwise>
		</c:choose>
				
						 
						 <div style="float:right; padding-left: 15px;">
						 <div><p style="vertical-align: inherit;margin-bottom: 0px;height: 20px;">${irr.id}</p></div>
							
					     <div><p style="vertical-align: inherit;margin-bottom: 0px;height: 20px; font-size:5px">${irr.codyheight}cm ${irr.codyage}세</p></div>
					    </div>
					    </div>
					    
				<c:choose>
			<c:when test="${loginInfo.member_idx eq irr.memberidx}" >
						<a href="${pageContext.request.contextPath }/codyUpdate?cody_idx=${irr.codyidx}" class="btn btn-info" style="float:right;">수정</a>						
			</c:when>
			<c:otherwise>
						<a href="${pageContext.request.contextPath }/bookmark?cody_idx=${irr.codyidx}&member_idx=${irr.memberidx}" class="btn btn-info" style="float:right;">팔로우</a>
			</c:otherwise>
			</c:choose>			
						</div>
				</li>
            </c:forEach>
			</ol>
						
		</div>
	<small class="d-block text-right mt-3"> <a href="#">All updates</a></small>
	
	  <!--------------------- 메인 내용2 ----------------------->

			
				<div class="map_wrap">
    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
    <div id="menu_wrap" class="bg_white">
        <div class="option">
            <div>
                <form onsubmit="searchPlaces(); return false;">
                    키워드 : <input type="text" id="keyword" size="17"> 
                    <button type="submit">검색하기</button> 
                </form>
            </div>
        </div>
        <hr>
        <ul id="placesList"></ul>
        <div id="pagination"></div>
    </div>
</div>
	
	

	
	
</div>

	</main>

	<!-- 인클루드 footer -->
	<%@ include file="./bottom/footer.jsp" %>
	
</body>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cf07583f54f2c24af21a8eca095b6fb2&libraries=services"></script>
<script>
//마커를 담을 배열입니다
var markers = [];
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 2 // 지도의 확대 레벨
    };  
// 지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption); 
// 장소 검색 객체를 생성합니다
var ps = new daum.maps.services.Places();  
// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new daum.maps.InfoWindow({zIndex:1});
// 키워드로 장소를 검색합니다
searchPlaces();
// 키워드 검색을 요청하는 함수입니다
function searchPlaces() {
    var keyword = document.getElementById('keyword').value;
    if (!keyword.replace(/^\s+|\s+$/g, '')) {
 
        return false;
    }
    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    ps.keywordSearch( keyword, placesSearchCB); 
}
// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
    if (status === daum.maps.services.Status.OK) {
        // 정상적으로 검색이 완료됐으면
        // 검색 목록과 마커를 표출합니다
        displayPlaces(data);
        // 페이지 번호를 표출합니다
        displayPagination(pagination);
    } else if (status === daum.maps.services.Status.ZERO_RESULT) {
        alert('검색 결과가 존재하지 않습니다.');
        return;
    } else if (status === daum.maps.services.Status.ERROR) {
        alert('검색 결과 중 오류가 발생했습니다.');
        return;
    }
}
// 검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(places) {
    var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    bounds = new daum.maps.LatLngBounds(), 
    listStr = '';
    
    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);
    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    for ( var i=0; i<places.length; i++ ) {
        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new daum.maps.LatLng(places[i].y, places[i].x),
            marker = addMarker(placePosition, i), 
            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다
        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);
        // 마커와 검색결과 항목에 mouseover 했을때
        // 해당 장소에 인포윈도우에 장소명을 표시합니다
        // mouseout 했을 때는 인포윈도우를 닫습니다
        (function(marker, title) {
            daum.maps.event.addListener(marker, 'mouseover', function() {
                displayInfowindow(marker, title);
            });
            daum.maps.event.addListener(marker, 'mouseout', function() {
                infowindow.close();
            });
            itemEl.onmouseover =  function () {
                displayInfowindow(marker, title);
            };
            itemEl.onmouseout =  function () {
                infowindow.close();
            };
        })(marker, places[i].place_name);
        fragment.appendChild(itemEl);
    }
    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;
    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    map.setBounds(bounds);
}
// 검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, places) {
    var el = document.createElement('li'),
    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                '<div class="info">' +
                '   <h5>' + places.place_name + '</h5>';
    if (places.road_address_name) {
        itemStr += '    <span>' + places.road_address_name + '</span>' +
                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
    } else {
        itemStr += '    <span>' +  places.address_name  + '</span>'; 
    }
                 
      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                '</div>';           
    el.innerHTML = itemStr;
    el.className = 'item';
    return el;
}
// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, title) {
    var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new daum.maps.Size(36, 37),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new daum.maps.Size(36, 691), // 스프라이트 이미지의 크기
            spriteOrigin : new daum.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new daum.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new daum.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });
    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다
    return marker;
}
// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}
// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
function displayPagination(pagination) {
    var paginationEl = document.getElementById('pagination'),
        fragment = document.createDocumentFragment(),
        i; 
    // 기존에 추가된 페이지번호를 삭제합니다
    while (paginationEl.hasChildNodes()) {
        paginationEl.removeChild (paginationEl.lastChild);
    }
    for (i=1; i<=pagination.last; i++) {
        var el = document.createElement('a');
        el.href = "#";
        el.innerHTML = i;
        if (i===pagination.current) {
            el.className = 'on';
        } else {
            el.onclick = (function(i) {
                return function() {
                    pagination.gotoPage(i);
                }
            })(i);
        }
        fragment.appendChild(el);
    }
    paginationEl.appendChild(fragment);
}
// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
// 인포윈도우에 장소명을 표시합니다
function displayInfowindow(marker, title) {
    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';
    infowindow.setContent(content);
    infowindow.open(map, marker);
}
 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
};

</script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
	 <script>
   //<![CDATA[
   // 사용할 앱의 JavaScript 키를 설정해 주세요.
   Kakao.init('25e3cdf97fe0c1f3efadeb6d1cbf3671');
   // 카카오 로그인 버튼을 생성합니다.
   Kakao.Auth.createLoginButton({
     container: '#kakao-login-btn',
     size:'large',
         success: function(authObj) {
           // 로그인 성공시, API를 호출합니다.
           Kakao.API.request({
             url: '/v1/user/me',
             success: function(res) {
            	 var jsonval = JSON.parse(JSON.stringify(res));
              /*  alert(JSON.stringify(res));
               
               alert(jsonval);
               alert(jsonval.kaccount_email);
               alert(jsonval.properties.thumbnail_image);
               alert(jsonval.properties.nickname);  */  
               
               
               // 내부 서버로 데이터를 넘겨 세션을 만들어준다. 내부서버에는 해당 데이터들을 받아 처리할 controller 필요.
              $.ajax({
                type : "POST",
                data : 
                	
                "kakaoEmail="+jsonval.kaccount_email+
                "&kaccount_email_verified="+jsonval.kaccount_email_verified+
                "&id="+jsonval.id+
                "&profile_image="+jsonval.properties.profile_image+
                "&nickname="+jsonval.properties.nickname+
                "&thumbnail_image="+jsonval.properties.thumbnail_image,
                
                
                url : "kakaologin",
                success : function(){
                 alert("카카오 로그인에 성공하였습니다.");
                 window.location.href = "http://localhost:8080/cody/";
                 }
                });
             },
             fail: function(error) {
               alert(JSON.stringify(error));
             }
           });  
     
    },
    fail : function(err) {
     alert(JSON.stringify(err));
    }
   });
   //]]>
  </script>
</html>