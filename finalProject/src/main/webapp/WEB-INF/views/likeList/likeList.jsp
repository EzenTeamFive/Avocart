<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>h member Like List</title>
<link rel="stylesheet" href="/resources/css/page.css">
<link rel="stylesheet" href="/resources/css/likeList.css">
</head>
<body>
<jsp:include page="../common/header.jsp" />

<!-- 규격 표시 임시 div -->
<div class="cover" style="width: 1280px; border: 2px solid green; margin: 50px; padding: 315px; box-sizing: border-box;">

	<select id="menuSelect" class="menuSelect" name="menuSelect">
				    <option value="joongo" >중고거래</option>
				    <option value="store">동네업체</option>
				    <option value="job">알바구인</option>
	</select>
	
	
	<hr> 
	<div class="likeListContainer">
	
		<div class="likeListArea">
		<!-- like list 출력 공간 -->
			<div class="likeImgArea">
				<img alt="likeImgArea error" src="../resources/image/avocartLogo.png">
			</div>
			<div class="likeInfoArea">
				<div class="likeInfoText">
					<strong><span>누룽지</span></strong>
					<span>남동구 구월동</span>
					<strong><span>50,000원</span></strong>
				</div>
				<div class="likeInfoHeart">
					<span><i class="bi bi-heart-fill" id="likeBtn"></i></span>
					<span><i class="bi bi-heart-fill" id="likeBtn"></i></span>
				</div>
			</div>
		</div>
		
		<button type="button" id="moreBtn" onclick="loadMore()">더 보기</button>
		
	</div>


</div>
 <jsp:include page="../common/footer.jsp" />
 <script src=""></script>
 
</body>
</html>