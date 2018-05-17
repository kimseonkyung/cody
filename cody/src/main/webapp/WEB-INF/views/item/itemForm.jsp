<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>아이템 등록</title>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script>
var cody_image;
$(document).ready(function(){
	$("#input_image").on("change", handleImgFileSelect);
});
function handleImgFileSelect(e){
	var files = e.target.files;
	var filesArr = Array.prototype.slice.call(files);
	
	filesArr.forEach(function(f){
		if(!f.type.match("image.*")){
			alert("이미지 파일만 업로드 가능합니다.");
			return;
			}
		cody_image = f;
		
		var reader = new FileReader();
		if(f.size>1000000){
	        alert("5MB 미만 파일만 업로드 해주세요.");
	        $("#preview").attr("src","blank");
	        $('#input_image').wrap('<form>').closest('form').get(0).reset();
	        $('#input_image').unwrap(); 
	        return false;
	    }
		reader.onload = function(e){
			$("#preview").attr("src", e.target.result);
		}
		reader.readAsDataURL(f);
	});
}

function capturekey(e) { 
    if(e.keyCode==13 && e.srcElement.type != 'textarea') 
    return false; 
} 

function limit1(obj) {
    var maxByte = 60; //최대 입력 바이트 수
    var str = obj.value;
    var str_len = str.length;
 
    var rbyte = 0;
    var rlen = 0;
    var one_char = "";
    var str2 = "";
 
    for (var i = 0; i < str_len; i++) {
        one_char = str.charAt(i);
 
        if (escape(one_char).length > 4) {
            rbyte += 2; //한글2Byte
        } else {
            rbyte++; //영문 등 나머지 1Byte
        }
 
        if (rbyte <= maxByte) {
            rlen = i + 1; //return할 문자열 갯수
        }
    }
 
    if (rbyte > maxByte) {
        alert("한글 " + (maxByte / 2) + "자 / 영문 " + maxByte + "자를 초과 입력할 수 없습니다.");
        str2 = str.substr(0, rlen); //문자열 자르기
        obj.value = str2;
        limit(obj, maxByte);
    } else {
        document.getElementById('byteInfo').innerText = rbyte;
    }
};

function limit2(obj) {
    var maxByte = 1000; //최대 입력 바이트 수
    var str = obj.value;
    var str_len = str.length;
 
    var rbyte = 0;
    var rlen = 0;
    var one_char = "";
    var str2 = "";
 
    for (var i = 0; i < str_len; i++) {
        one_char = str.charAt(i);
 
        if (escape(one_char).length > 4) {
            rbyte += 2; //한글2Byte
        } else {
            rbyte++; //영문 등 나머지 1Byte
        }
 
        if (rbyte <= maxByte) {
            rlen = i + 1; //return할 문자열 갯수
        }
    }
 
    if (rbyte > maxByte) {
        alert("한글 " + (maxByte / 2) + "자 / 영문 " + maxByte + "자를 초과 입력할 수 없습니다.");
        str2 = str.substr(0, rlen); //문자열 자르기
        obj.value = str2;
        limit(obj, maxByte);
    } else {
        document.getElementById('byteInfo').innerText = rbyte;
    }
};

</script>



<script src="//html5shiv.googlecode.com/svn/trunk/html5.js"></script>

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
    <link href="https://fonts.googleapis.com/css?family=Nanum+Brush+Script" rel="stylesheet">
    <!-- CODY CSS -->
    <link href="resources/css/cody.css" type="text/css" rel="stylesheet">



    <!--본문 내용 속성-->
    <style>
        #content {
            border: 2px solid darkgray;
            border-radius: 5px 5px 5px 5px;
            width: 842px;
            height: 1400px;
            position: relative;
            /*border: 1px solid gray;*/
            /*중앙정렬*/
            margin: 0 auto;

            /*컨텐츠 내부 수평 정렬*/
            overflow: hidden;
            margin-top: 10px;

        }

        #form {
            width: 842px;
            height: 1360px;
            

        }

        #side {
            width: 280px;
            height: 1312px;
            left: 0;
            position: absolute;
        }
        
        .side1 {
            margin-top: 45px;
            margin-left: 90px;
        }
        
        .side2 {
            margin-top: 420px;
            margin-left: 90px;
        }
        
        .side3 {
            margin-top: 75px;
            margin-left: 115px;
        }

        #main {
            width: 550px;
            height: 1312px;
            right: 0;
            position: absolute;
        }


        #image {

            width: 550px;
            height: 460px;
        }
        
        #image_frame{
            width: 550px;
            height: 460px;
            position: absolute;
            
        }

        #image_block {
            
            width: 280px;
            height: 360px;
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
            right: 40px;
            margin-top: 180px;
            margin-left: 50px;
           
        }
        
        .sub1{
            margin-top: 230px;
            position: absolute;
            right: 18px;
        }
        
        .sub2{
            margin-top: 253px;
            position: absolute;
            right: 115px;
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


        #item {
            width: 550px;
            height: 100px;
            left: 0;
            

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
        
        #item_intro{
            margin-left: 20px;
            margin-top: 8px;
        }
        
        #modal-dialog{
            width: 400px;
            height: 300px;        
        }

        #title {
            width: 550px;
            height: 100px;
           
        }
        
        #title_name{
            margin-left: 20px;
            margin-top: 16px;            
        }
        
        #title_input{
            margin-left: 20px;
            margin-top: 10px;
        }

        #input_title {
            border: 2px solid darkgray;
            height: 25px;
            width: 460px;
            border-radius: 5px 5px 5px 5px;
        }

        #intro {
            width: 550px;
            height: 400px;
            left: 0;
            overflow: hidden;
            position: relative;
        }
               
        #intro_name{
            margin-left: 20px;
            margin-top: 10px;
        }
        
        #intro_input{
            margin-left: 20px;
            margin-top: 10px;
            
        }
        
        #intro_text{
            border: 2px solid darkgray;
            width: 466px;
            height: 303px;
            border-radius: 3px 3px 3px 3px;
            margin-left: 2px;
        }
        
        #text{
            margin: 0 auto;
        }
        
        #intro_sub{
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
        
        #gender_name{
            margin-left: 20px;
            margin-top: 10px;
        }
        
        #gender_input{
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
        
        #height_name{
            margin-left: 20px;
            margin-top: 10px;
        }
        
        #height_input{
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
        
        #age_name{
            margin-left: 20px;
            margin-top: 10px;
        }
        
        #age_input{
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
            width: 842px;
            height: 80px;
            overflow: hidden;
            position: absolute;
            bottom: 0;

        }
        
        #upload_input{
            width: 240px;
            height: 48px;
            margin: 0 auto;
            margin-top: 14px;
        }

        #input_upload {
            position: absolute;
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

    </style>
<style> input:focus, textarea:focus{    resize: none, outline: none; } </style>



    <!--푸터 스타일-->
    <style>
       
    </style>
</head>

<body>
    <h1>신규 아이템 등록</h1>

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

</body>
</html>