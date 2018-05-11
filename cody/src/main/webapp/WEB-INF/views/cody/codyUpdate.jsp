<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
</style>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
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

$(document).ready(function(){

	var cody_gender = ${cody.cody_gender};

	  if(cody_gender > 0 ) {
		  $('#cody_gender').attr("checked","checked"); 
	  } else {
		  $('#cody_gender2').attr("checked","checked"); 
	  }

	});
	

$(document).ready(function(){

	  $('#cody_height option').each(function(){

	    if($(this).val()=="${cody.cody_height}"){

	      $(this).attr("selected","selected"); 

	    }

	  });

	});

$(document).ready(function(){

	  $('#cody_age option').each(function(){

	    if($(this).val()=="${cody.cody_age}"){

	      $(this).attr("selected","selected"); 

	    }

	  });

	});
	
	
</script>
<script src="//html5shiv.googlecode.com/svn/trunk/html5.js"></script>
    
    <!--헤더 스타일-->
    
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

</head>
<body>
<div id="content">
        <form action="${pageContext.request.contextPath }/codyUpdate" method="post" enctype="multipart/form-data">
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
                    <div id="image_block">
                    <c:forEach var="cody" items="${codys}">
                    <c:if test="${cody_image != null}">
							<img src="${pageContext.request.contextPath }/uploadfile/codyphoto/${cody_image}" width="280" height="360">
						</c:if>
						</c:forEach>
						<img id="preview" src="" width="280" height="360"></div>
                    <div id="image_input">
                        <button id="replace">사진 업로드</button>
                        <input id="input_image" type="file" name="photofile" value="파일 업로드" onchange="previewFile()">
                        
                        </div>
                        <div class="sub1"><h6>권장 사이즈 : 가로 500px × 세로 667px</h6></div>
                        <div class="sub2"><h6>용량 : 10MB 이내</h6></div>
                    </div>
                </div>
			 <div id="title">
                    <div id="title_name">
                        <h4>코디 제목</h4>
                    </div>
                    <div id="title_input"><input id="input_title" type="text" name="cody_title" value="${cody.cody_title}"></div>
                </div>
				 <div id="intro">
                    <div id="intro_name">
                        <h4>코디 소개문</h4>
                    </div>
                    <div id="intro_input"><div id="intro_text"><textarea class="text" style= "resize: none" rows="20" cols="64" name="cody_intro" id="cody_intro">${cody.cody_intro}</textarea></div><div id="intro_sub"><h6>※ 500 자 이내로 입력하십시오.</h6></div></div>
                </div>
			<div id="gender">
                    <div id="gender_name">
                        <h4>성별※</h4>
                    </div>
                    <div id="gender_input">
                        <label><input type="radio" id="cody_gender" name="cody_gender" value="true">Man</label>
                        <label><input type="radio" id="cody_gender2"  name="cody_gender" value="false">Woman</label></div>
                </div>
			 <div id="height">
                    <div id="height_name">
                        <h4>신장</h4>
                    </div>
                    <div id="height_input"><select id="cody_height" name="cody_height">
                    <option value='0'>선택해주세요</option>
                    <option value='130'>130cm</option>
                    <option value='131'>131cm</option>
                    <option value='132'>132cm</option>
                    <option value='133'>133cm</option>
                    <option value='134'>134cm</option>
                    <option value='135'>135cm</option>
                    <option value='136'>136cm</option>
                    <option value='137'>137cm</option>
                    <option value='138'>138cm</option>
                    <option value='139'>139cm</option>
                    <option value='140'>140cm</option>
                    <option value='141'>141cm</option>
                    <option value='142'>142cm</option>
                    <option value='143'>143cm</option>
                    <option value='144'>144cm</option>
                    <option value='145'>145cm</option>
                    <option value='146'>146cm</option>
                    <option value='147'>147cm</option>
                    <option value='148'>148cm</option>
                    <option value='149'>149cm</option>
                    <option value='150'>150cm</option>
                    <option value='151'>151cm</option>
                    <option value='152'>152cm</option>
                    <option value='153'>153cm</option>
                    <option value='154'>154cm</option>
                    <option value='155'>155cm</option>
                    <option value='156'>156cm</option>
                    <option value='157'>157cm</option>
                    <option value='158'>158cm</option>
                    <option value='159'>159cm</option>
                    <option value='160'>160cm</option>
                    <option value='161'>161cm</option>
                    <option value='162'>162cm</option>
                    <option value='163'>163cm</option>
                    <option value='164'>164cm</option>
                    <option value='165'>165cm</option>
                    <option value='166'>166cm</option>
                    <option value='167'>167cm</option>
                    <option value='168'>168cm</option>
                    <option value='169'>169cm</option>
                    <option value='170'>170cm</option>
                    <option value='171'>171cm</option>
                    <option value='172'>172cm</option>
                    <option value='173'>173cm</option>
                    <option value='174'>174cm</option>
                    <option value='175'>175cm</option>
                    <option value='176'>176cm</option>
                    <option value='177'>177cm</option>
                    <option value='178'>178cm</option>
                    <option value='179'>179cm</option>
                    <option value='180'>180cm</option>
                    <option value='181'>181cm</option>
                    <option value='182'>182cm</option>
                    <option value='183'>183cm</option>
                    <option value='184'>184cm</option>
                    <option value='185'>185cm</option>
                    <option value='186'>186cm</option>
                    <option value='187'>187cm</option>
                    <option value='188'>188cm</option>
                    <option value='189'>189cm</option>
                    <option value='190'>190cm</option>
                    <option value='191'>191cm</option>
                    <option value='192'>192cm</option>
                    <option value='193'>193cm</option>
                    <option value='194'>194cm</option>
                    <option value='195'>195cm</option>
                    <option value='196'>196cm</option>
                    <option value='197'>197cm</option>
                    <option value='198'>198cm</option>
                    <option value='199'>199cm</option>
                    <option value='200'>200cm</option>
                    </select>
                    </div>
					</div>
					
			<div id="age">
                    <div id="age_name">
                        <h4>나이</h4>
                    </div>
                    <div id="age_input"><select id="cody_age" name="cody_age">
                  <option value='0'>선택해주세요</option>
                    <option value='8'>8세</option>
                    <option value='9'>9세</option>
                    <option value='10'>10세</option>
                    <option value='11'>11세</option>
                    <option value='12'>12세</option>
                    <option value='13'>13세</option>
                    <option value='14'>14세</option>
                    <option value='15'>15세</option>
                    <option value='16'>16세</option>
                    <option value='17'>17세</option>
                    <option value='18'>18세</option>
                    <option value='19'>19세</option>
                    <option value='20'>20세</option>
                    <option value='21'>21세</option>
                    <option value='22'>22세</option>
                    <option value='23'>23세</option>
                    <option value='24'>24세</option>
                    <option value='25'>25세</option>
                    <option value='26'>26세</option>
                    <option value='27'>27세</option>
                    <option value='28'>28세</option>
                    <option value='29'>29세</option>
                    <option value='30'>30세</option>
                    <option value='31'>31세</option>
                    <option value='32'>32세</option>
                    <option value='33'>33세</option>
                    <option value='34'>34세</option>
                    <option value='35'>35세</option>
                    <option value='36'>36세</option>
                    <option value='37'>37세</option>
                    <option value='38'>38세</option>
                    <option value='39'>39세</option>
                    <option value='40'>40세</option>
                    <option value='41'>41세</option>
                    <option value='42'>42세</option>
                    <option value='43'>43세</option>
                    <option value='44'>44세</option>
                    <option value='45'>45세</option>
                    <option value='46'>46세</option>
                    <option value='47'>47세</option>
                    <option value='48'>48세</option>
                    <option value='49'>49세</option>
                    <option value='50'>50세</option>
                    </select>
                </div>
            </div>
            <input type="text" name="cody_idx" value="${cody.cody_idx }">
         
   			</div>
   			
			 <!--------------------업로드--------------------->
            <div id="input"><div id="upload_input"><input id="input_upload" type="submit" value="Upload"></div></div>
	</form>
</div>

</body>


</html>
	

