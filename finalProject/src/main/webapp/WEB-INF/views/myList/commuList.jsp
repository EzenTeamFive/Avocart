<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Community List page</title>
<link rel="stylesheet" href="/resources/css/page.css">
</head>
<body>
	<div class="titleLine">
		<h4>동네 생활 <span style="color: red" id="commuListCnt"></span></h4>

		<section>
			<div class="commuListMenu">
				<select id="commuListSelect" class="commuListSelect" name="commuListSelect">
					<option value="commuWriterList">작성글</option>
					<option value="commuLikeList" >관심글</option>
				</select>
			</div>
		</section>
	</div>

	<div class="moreCommuListArea" id="moreCommuListArea">
		<div class="commuListContent">
	    	<!-- 판매상품 탭 -->
	    		<img alt="" src="../resources/image/기본 프로필 배경.png">
	    		<div class="contentWrap">
		    		<h3>물건이름</h3>
		    		<b>가격</b>
		    		<small>날짜</small>
	    		</div>
		    	<mark><i class="bi bi-geo-alt"></i>장소</mark>
	    </div>
	</div>
	
	<button type="button" id="commuListmoreBtn" data-page="1" style="visibility: hidden"><i class="bi bi-plus-circle-fill"></i> 게시글 더 보기</button>
	

<script type="text/javascript" src="/resources/js/commuList.js"></script>

</body>
</html>
