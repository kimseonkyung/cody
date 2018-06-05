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
	width: 300px;
	}
	.card-item-ol {
		overflow: hidden;
		
	}
	
	.card-item-li {
		width: 240px; 
		float: left;
		margin: 0 10px 10px 10px;
	}

	.card-item {
		height: 300px;
	}
	
	.myBtn-secondary {
 		color: #000;
  		background-color: #fff;
	}

	.myBtn-secondary:hover {
 		color: #fff;
  		background-color: #5a6268;
	}

	.myBtn-secondary:focus, .myBtn-secondary.focus {
 		box-shadow: 0 0 0 0.2rem rgba(108, 117, 125, 0.5);
	}

	.myBtn-secondary.disabled, .myBtn-secondary:disabled {
  		color: #fff;
  		background-color: #5a6268;
	}

	.myBtn-secondary:not(:disabled):not(.disabled):active, .myBtn-secondary:not(:disabled):not(.disabled).active,
	.show > .myBtn-secondary.dropdown-toggle {
  		color: #fff;
 		background-color: #545b62;
	}

	.myBtn-secondary:not(:disabled):not(.disabled):active:focus, .myBtn-secondary:not(:disabled):not(.disabled).active:focus,
	.show > .myBtn-secondary.dropdown-toggle:focus {
  		box-shadow: 0 0 0 0.2rem rgba(108, 117, 125, 0.5);
	}

	.btn-group-myPage > .btn {
	 	padding: 0.5rem 5rem;
  		font-size: 1rem;
  		line-height: 1.5;
  		border-radius: 0.3rem;
	}
	
	.myBtnClick {
		color: #fff;
  		background-color: #5a6268;
  	}
	
	.myCard {
		width: 240px; 
		display: inline-table; 
		margin: 10px;
  		background-color: #fff;
  		border: 1px solid rgba(0, 0, 0, 0.125);
  		border-radius: 0.25rem;
  		
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
	
	<div class="nav-scroller bg-white">
	<div class="container">
		<nav class="nav nav-underline">
			<a class="nav-link col-4 mr-auto" href="#">all</a> 
			<a class="nav-link col-4 mr-auto" href="#">men</a>
			<a class="nav-link col-4 mr-auto" href="#">women</a>
		</nav>
	</div>
</div>
	
	
	<div class="p-3 bg-white rounded box-shadow">
          <img src="${pageContext.request.contextPath }/uploadfile/memberphoto/${loginInfo.member_photo}" width="220" height="300">
          <button type="button" class="btn btn-primary" data-target="#registerModal" data-toggle="modal">프로필변경</button>
        </div>
     		
		<div class="p-3 bg-white rounded box-shadow" style="margin: 0" >
		<div class="btn-group btn-group-myPage" role="group" style="display:table; margin-left: auto; margin-right: auto;">
    			<button type="button" class="btn myBtn-secondary" id="gCody" style="border: 1px solid #ccc; margin: 0;"> <strong>코디</strong><br>${codyCount }</button>
    			<button type="button" class="btn myBtn-secondary" id="gCloset" style="border: 1px solid #ccc; margin: 0;"> <strong>옷장</strong><br>${itemCount }</button>
    			<button type="button" class="btn myBtn-secondary" id="gLike" style="border: 1px solid #ccc; margin: 0;"> <strong>좋아요</strong><br>d</button>
    			<button type="button" class="btn myBtn-secondary" id="gFollower" style="border: 1px solid #ccc; margin: 0;"> <strong>팔로워</strong><br>d</button>
    			<button type="button" class="btn myBtn-secondary" id="gFollow" style="border: 1px solid #ccc; margin: 0;"> <strong>팔로우</strong><br>d</button>
		</div>
		</div>

		
		
		<div class="p-3 bg-white rounded box-shadow">
         <div class="row">
        <form action="${pageContext.request.contextPath }/codyForm" method="get" style="margin: 0 auto;">
		<button id="button2" type="submit" class="btn btn-primary btn-lg">코디등록</button>
        </form>
		</div>		
		</div>
		
		<div class="my-3 p-3 bg-white rounded box-shadow">
		<div class="row">
		
		<div id="main_section" style="width: 100%">
			<div id="myPageList" class="my-3 p-3 bg-white rounded box-shadow">
				<div style="width: 500px; margin: 0 auto; padding-top: 20px; border: 1px solid red; text-align: center;">hello 마이페이지!!</div>
				
				
			</div>
		</div>
		
				
<script>


$('.myBtn-secondary').click(function () {
	$('.myBtn-secondary').removeClass('myBtnClick');
	$(this).addClass('myBtnClick');
}) 

/* 코디 클릭시 ajax처리 */
$('#gCody').click(function () {
	
	$.ajax({
		type : 'post',
		url : '/cody/myCodyList',
		dataType : 'json',
		data : {}
 		})
 		.done(function(data) {
	 		$('#myPageList').empty();
		
			$.each(data, function(i, e) {
				$('#myPageList').append('<div class="myCard">'
						+ '<a href="/cody/codyListView?cody_idx='+ e.cody_idx +'"><img class="card-img-top" src="/cody/uploadfile/codyphoto/'+ e.cody_image +'" style="height: 250px;" alt="Card image cap"></a>'
						+ '<div class="card-body" style="height: 100%">'
						+ e.cody_title
						+ '</div>'
						+ '</div>');
			});
		})
		.fail(function(err) { // 실패
			console.log(err);
		});
}) 

/* 옷장 클릭시 ajax처리 */
$('#gCloset').click(function () {
	
	 $.ajax({
			type : 'post',
			url : '/cody/myItemList',
			dataType : 'json',
			data : {}
	 		})
	 		.done(function(data) {
		 		$('#myPageList').empty();
			
				$.each(data, function(i, e) {
					$('#myPageList').append('<div class="myCard">'
							+ '<a href="/cody/itemListView?item_idx='+ e.item_idx +'"><img class="card-img-top" src="'+ e.item_image +'" style="height: 250px;" alt="Card image cap"></a>'
							+ '<div class="card-body" style="height: 100%">'
							+ e.item_name
							+ '</div>'
							+ '</div>');
				});
			})
			.fail(function(err) { // 실패
				console.log(err);
			});
	 
}) 

$('#gLike').click(function () {
	
	
}) 

$('#gFollower').click(function () {
	
}) 

$('#gFollow').click(function () {
	
})  

	
	
	

/* $('.btn-group-myPage').click(function() {
	$(this).button('toggle');
}) {
	
}

$("input[name='gCody']").click(function() {
	alert('gCody');
})
$("input[name='gCloset']").click(function() {
	alert('gCloset');
})
 */
 
		/* $(document).ready(function() {
			$('.btn-group-myPage').mouseup(function(event) {
				
				myBtn = $("input[name='gCody']").val();
				alert(myBtn);
				
				 
				if ( myBtn == 'gCody') {
					
				    }
				
				if ( myBtn == 'gCloset') {
				       
				       $.ajax({
							type : 'post',
							url : '/cody/myItemList',
							dataType : 'json',
							data : {},
							success : function(data) {
								alert('ds');
							},
							error : function(xhr,status,error) {
								alert("error\nxhr : " + xhr + ", status : " + status + ", error : " + error);                 
							} 
						}); 
				       
				    }
				
				if ( myBtn == 'gLike') {
					alert('gLike');
				    }
				
				if ( myBtn == 'gFollower') {
					alert('gFollower');
				    }
				
				if ( myBtn == 'gFollow') {
					alert('gFollow');
				    } 
				
			});
	    });  */




</script>
		
		</div>
		</div>
	
</main>
 
<!-- 인클루드 footer -->
	<%@ include file="../bottom/footer.jsp" %>
</body>

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




</html>