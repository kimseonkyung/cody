<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
/* #layerPopup{
  padding:20px; 
  border:4px solid #ddd; 
  position:absolute; 
  left:700px; 
  top:300px; 
  background:#fff;
}

#layerPopup button{
  cursor:pointer;
} */
</style>

<script src="https://code.jquery.com/jquery-1.10.2.js"></script>

</head>
<body>
<%-- 
<div id="repleList" >
<c:forEach var="list" items="${list_r }">
	<div style="border:1px solid gray; width: 500px; margin-left: ${20*list.redepth}px;">
		<c:out value="${list.reple_contents}"/> <c:out value="${list.relpe_date}"/>
	</div>
</c:forEach>
</div> --%>

<div id="test" style="border: 1px solid gray; width: 500px; height: 50px;"></div>

<!-- <div id="contents">
  		<a href="#layerPopup">답글</a>
  			<div id="layerPopup">
  			  <a href="#">저장</a>
  			  <button type="button">닫기</button>
  			</div>
		</div> -->


<br><br>
<hr>
<div style="border: 1px solid gray; width: 500px;">
        <input type="hidden" id="cody_idx" value="1"> 
        <input type="hidden" id="member_idx" value="1"> 
        <textarea id="reple_contents" rows="3" cols="60" maxlength="500"></textarea>
		<button id="replySave">저장</button>
</div>

<script>

/* $(document).ready(function(){
	  $('#layerPopup').hide();
	  $('#contents > a').click(function(){
	    $('#contents > a').blur();
	    $('#layerPopup').show();
	    $('#layerPopup a').focus();
	    return false;
	  });
	  
	  
	  $('#layerPopup button').click(function(){
	    $('#contents > a').focus();
	    $('#layerPopup').hide();
	  });
	});
 */

 
/* 	$('#replySave').click(function() {
		 
		var cody_idx =  $('#cody_idx').val();
		var member_idx =  $('#member_idx').val();
		var reple_contents =  $('#reple_contents').val();
		
		$.ajax({
			type : 'post',
			url : '${pageContext.request.contextPath}/repleInsert',
			dataType: 'text',
		    data : {
		    	cody_idx : cody_idx,
				member_idx : member_idx,
				reple_contents : reple_contents
		    },
			success : function(data) {
				$('#test'),append('<h1>' + reple_contents + ' : ' + member_idx + '</h1>');
			}
		});
	}); */
 
	
</script>


</body>
</html>
