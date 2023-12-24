<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Like List page</title>
<link rel="stylesheet" href="/resources/css/page.css">
<link rel="stylesheet" href="/resources/css/likeList.css">
</head>
<body>
<jsp:include page="../common/header.jsp" />

<!-- 규격 표시 임시 div -->
<div class="cover" style="width: 1280px; border: 2px solid green; margin: 50px; box-sizing: border-box;">
	<div class="titleLine">
		<h4>찜 <span style="color: red" id="likeCnt"></span></h4>


		<section>
			<div class="allMenu">
				<select id="menuSelect" class="menuSelect" name="menuSelect">
					<option >전체</option>
					<option value="job">알바구인</option>
					<option value="joongo" >중고거래</option>
					<option value="store">동네업체</option>
				</select>
			</div>
		</section> 
	</div>

	<div class="brdListArea" id="moreLikeArea">
		<!-- ... -->
	</div>
	
	<hr> 
	
	<button type="button" id="moreBtn" onclick="loadMore()"><i class="bi bi-plus-circle-fill"></i> 찜 더 보기</button>
</div>


<jsp:include page="../common/footer.jsp" />
<script type="text/javascript" src="/resources/js/likeList.js"></script>

</body>
</html>
