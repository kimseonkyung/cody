<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>사이드 메뉴</title>
<style>
	#aside ul {
		list-style: none;
		padding: 0;
	}
	
	#aside {
	color: #222;
	}

	#aside a{
	color: #222;
	}
	
	#aside a:focus {
	font-weight: bolder;
	}
	
	#aside > div {
	border-bottom: 1px solid #ccc;
	}

</style>

</head>
<body>

<div id="aside" class="col-md-2 order-md-1 mb-4">
		<div class="my-3 p-3 bg-white rounded box-shadow">
			<h4>List</h4>
			<ul>
				<li><a href="${pageContext.request.contextPath}/codyTimeList"><i class="fas fa-camera" style="font-size: 21px; margin: 4px;"></i>&nbsp;&nbsp;&nbsp;Cody</a></li>
				<li><a href="${pageContext.request.contextPath}/itemList"><i class="fas fa-tshirt" style="font-size: 17px; margin: 4px;"></i>&nbsp;&nbsp;&nbsp;Item</a></li>
				<li><a href="${pageContext.request.contextPath}/itemInfo"><i class="fas fa-user-alt" style="font-size: 21px; margin: 4px;"></i>&nbsp;&nbsp;&nbsp;User</a></li>
			</ul>
		</div>
        <div class="my-3 p-3 bg-white rounded box-shadow">
			<h4>Category</h4>
			<ul>
				<li><a href="${pageContext.request.contextPath}/codyList">Top</a><br>
				<li><a href="${pageContext.request.contextPath}/itemList">Out</a><br> 
				<li><a href="${pageContext.request.contextPath}/codyTimeList">Pants</a><br>
				<li><a href="${pageContext.request.contextPath}/codyTimeList">Hat</a><br>
				<li><a href="${pageContext.request.contextPath}/codyTimeList">Foot</a><br>
				<li><a href="${pageContext.request.contextPath}/codyTimeList">Acc</a><br>
			</ul>
		</div>     
    <div class="my-3 p-3 bg-white rounded box-shadow">
			<h4>Notice</h4>
			<ul>
			<li><a href="${pageContext.request.contextPath}/boardList">Board</a><br> 
		</ul>		
	</div>
	</div>
</body>
</html>