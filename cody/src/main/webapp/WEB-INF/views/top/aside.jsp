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
			<h4>리스트</h4>
			<ul>
				<li><a href="${pageContext.request.contextPath}/codyTimeList">코디</a></li>
				<li><a href="${pageContext.request.contextPath}/itemList">아이템</a></li>
				<li><a href="${pageContext.request.contextPath}/itemInfo">사용자</a></li>
			</ul>
		</div>
        <div class="my-3 p-3 bg-white rounded box-shadow">
			<h4>카테고리</h4>
			<ul>
				<li><a href="${pageContext.request.contextPath}/codyList">상의</a><br>
				<li><a href="${pageContext.request.contextPath}/itemList">아우터</a><br> 
				<li><a href="${pageContext.request.contextPath}/codyTimeList">하의</a><br>
				<li><a href="${pageContext.request.contextPath}/codyTimeList">모자</a><br>
				<li><a href="${pageContext.request.contextPath}/codyTimeList">신발</a><br>
				<li><a href="${pageContext.request.contextPath}/codyTimeList">악세사리</a><br>
			</ul>
		</div>
        <div class="my-3 p-3 bg-white rounded box-shadow">
			<h4>카테고리</h4>
			<ul>
				<li><a href="${pageContext.request.contextPath}/codyList">상의</a><br>
				<li><a href="${pageContext.request.contextPath}/itemList">아우터</a><br> 
				<li><a href="${pageContext.request.contextPath}/codyTimeList">하의</a><br>
				<li><a href="${pageContext.request.contextPath}/codyTimeList">모자</a><br>
				<li><a href="${pageContext.request.contextPath}/codyTimeList">신발</a><br>
				<li><a href="${pageContext.request.contextPath}/codyTimeList">악세사리</a><br>
			</ul>
		</div>
</div>

</body>
</html>