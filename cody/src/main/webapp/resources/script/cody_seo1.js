/**
 * 
 */
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
		if(f.size>5242880){
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