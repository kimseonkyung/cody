<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html class="no-js" lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>CODY 공지사항</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" />
</head>
<body>
	
	<!-- 게시물 리스트 보여주기 -->
	<div class="container">
		<table class="table table-board">
			<colgroup>
				<col width="7%">	<!-- 글 번호 -->
				<col width="*">		<!--  제목   -->
				<col width="15%">	<!-- 작성자 -->
				<col width="10%">	<!-- 작성일 -->
				<col width="7%">	<!-- 조회수 -->
			</colgroup>
			<thead>
				<tr>
					<th style="text-align:center;">글 번호</th>
					<th style="text-align:center;">제목</th>
					<th style="text-align:center;">작성자</th>
					<th style="text-align:center;">작성일</th>
					<th style="text-align:center;">조회수</th>
				</tr>
				
			
				<c:forEach var="infopage" items="${page}"> <!-- Controller에 선언된 infopage를 사용하겠다 -->
				<tr>
					<td class="text-center">${infopage.board_idx}</td>
					<td><a href="${pageContext.request.contextPath}/boardListView?board_idx=${infopage.board_idx}&board_click=${infopage.board_click}">${infopage.board_title}</a></td>
					<td class="text-center">관리자</td>
					<td class="text-center"><fmt:formatDate value="${infopage.board_date}" pattern="YYYY-MM-dd" /></td>
					<td class="text-center">${infopage.board_click}</td>
				</tr>
				</c:forEach>
			</thead>	
		</table>
		
		<!-- 로그인 한 사용자만 보이는 쓰기버튼 -->
		<%-- <c:if test="${sessionScope.id ne null}"> --%>
			<dt>
				<a href="${pageContext.request.contextPath}/boardForm"><div class="huge-top"></div><button class="btn btn-normal pull-right">쓰기</button></a>
			</dt>
		<%-- </c:if> --%>
		
		<!-- 페이징  -->
		<c:choose>
		<c:when test="${paging.numberOfRecords ne NULL and paging.numberOfRecords ne '' and paging.numberOfRecords ne 0}">
		<div class="text-center marg-top">
			<ul class="pagination">
				<c:if test="${paging.currentPageNo gt 5}">  											  <!-- 현재 페이지가 5보다 크다면(즉, 6페이지 이상이라면) -->
					<li><a href="javascript:gopage(${paging.prevPageNo}, ${paging.maxPost})">이전</a></li> <!-- 이전페이지 표시 -->
				</c:if>
				<!-- 다른 페이지를 클릭하였을 시, 그 페이지의 내용 및 하단의 페이징 버튼을 생성하는 조건문-->
					<c:forEach var="i" begin="${paging.startPageNo}" end="${paging.endPageNo}" step="1"> <!-- 변수선언 (var="i"), 조건식, 증감식 -->
		            <c:choose>
		                <c:when test="${i eq paging.currentPageNo}"> 
		                      <li class="active"><a href="javascript:gopage(${i}, ${paging.maxPost})">${i}</a></li> <!-- 1페이지부터 10개씩 뽑아내고, 1,2,3페이지순으로 나타내라-->
		                </c:when>
		                	<c:otherwise>
		                    <li><a href="javascript:gopage(${i}, ${paging.maxPost})">${i}</a></li> 
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<!-- begin에 의해서 변수 i는 1이기 때문에, 처음에는 c:when이 수행된다. 그 후 페이징의 숫자 2를 클릭하면 ${i}는 2로변하고, 현재는 ${i}는 1이므로 otherwise를 수행한다
					         그래서 otherwise에 있는 함수를 수행하여 2페이지의 게시물이 나타나고, 반복문 실행으로 다시 forEach를 수행한다. 이제는 i도 2이고, currentPageNo도 2이기 때문에
					     active에 의해서 페이징부분의 2에 대해서만 파란색으로 나타난다. 그리고 나머지 1,3,4,5,이전,다음을 표시하기위해 다시 c:otherwise를 수행하여 페이징도 나타나게한다.-->
				<!-- // 다른 페이지를 클릭하였을 시, 그 페이지의 내용 및 하단의 페이징 버튼을 생성하는 조건문-->
										
				<!-- 소수점 제거 =>-->
				<fmt:parseNumber var="currentpage" integerOnly="true" value="${(paging.currentPageNo-1)/5}"/>
				<fmt:parseNumber var="finalpage" integerOnly="true" value="${(paging.finalPageNo-1)/5}"/>
					
				<c:if test="${currentpage < finalpage}"> <!-- 현재 페이지가 마지막 페이지보다 작으면 '다음'을 표시한다. -->
					<li><a href="javascript:gopage(${paging.nextPageNo}, ${paging.maxPost})">다음</a></li>
				</c:if> 
			</ul>
		</div>
		</c:when>
		</c:choose>
	</div>
<script>
function gopage(pages, lines) {
    location.href = '?' + "pages=" + pages;
}
</script>
</body>
</html>