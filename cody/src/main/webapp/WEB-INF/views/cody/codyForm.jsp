<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>코디게시</title>
<script>
function previewFile() {
		  var preview = document.querySelector('img');
		  var file    = document.querySelector('input[type=file]').files[0];
		  var reader  = new FileReader();

		  reader.addEventListener("load", function () {
		    preview.src = reader.result;
		  }, false);

		  if (file) {
		    reader.readAsDataURL(file);
		  }
		}

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

    </style>
<style> input:focus, textarea:focus{    resize: none, outline: none; } </style>



    <!--푸터 스타일-->
    <style>
       
    </style>
</head>

<body>
    <h1>코디등록</h1>

    <div id="content">
        <form action="${pageContext.request.contextPath }/codyForm" method="post" enctype="multipart/form-data">
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
                    <div id="image_block"><img id="preview" src="" width="280" height="360"></div>
                    <div id="image_input">
                        <button id="replace">사진 업로드</button>
                        <input id="input_image" type="file" name="photofile" value="파일 업로드" onchange="previewFile()">
                        </div>
                        <div class="sub1"><h6>권장 사이즈 : 가로 500px × 세로 667px</h6></div>
                        <div class="sub2"><h6>용량 : 10MB 이내</h6></div>
                    </div>
                </div>

                <div id="item"><input id="input_item" type="submit" value="+   항목 추가"><a href="itemForm"></a><div id="item_intro"><h6>최대 9 항목까지 추가 할 수 있습니다</h6></div></div>
                <div id="title">
                    <div id="title_name">
                        <h4>코디 제목</h4>
                    </div>
                    <div id="title_input"><input id="input_title" type="text" name="cody_title"></div>
                </div>
                <div id="intro">
                    <div id="intro_name">
                        <h4>코디 소개문</h4>
                    </div>
                    <div id="intro_input"><div id="intro_text"><textarea class="text" style= "resize: none" rows="20" cols="64"></textarea></div><div id="intro_sub"><h6>※ 500 자 이내로 입력하십시오.</h6></div></div>
                </div>
                <div id="gender">
                    <div id="gender_name">
                        <h4>성별※</h4>
                    </div>
                    <div id="gender_input">
                        <label><input type="radio" id="cody_gender" name="cody_gender" value="true">Man</label>
                        <label><input type="radio" id="cody_gender"  name="cody_gender" value="false">Woman</label></div>
                </div>
                <div id="height">
                    <div id="height_name">
                        <h4>신장</h4>
                    </div>
                    <div id="height_input"><input id="input_height" type="text" name="cody_height"></div>
                </div>
                <div id="age">
                    <div id="age_name">
                        <h4>나이</h4>
                    </div>
                    <div id="age_input"><input id="input_age" type="text" name="cody_age"></div>
                </div>
            </div>

            <!--------------------업로드--------------------->
            <div id="input"><div id="upload_input"><input id="input_upload" type="submit" value="Upload"></div></div>

        </form>
    </div>
    <div id="footer">footer</div>
</body>


</html>