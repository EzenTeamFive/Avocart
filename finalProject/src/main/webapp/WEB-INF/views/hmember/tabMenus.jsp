<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.tabArea{
	margin-bottom: 110px
}
.tabMenu{
	padding: 0;
	margin: 0;
	display: flex;
}
.tabMenu li{
	flex: 1 1 0;
}
.tabMenu li button{
	border: 0;
	background-color: #ededed;
	width: 100%;
	height: 60px;
	border-bottom: 1px solid #cdcdcd;
}
.tabMenu .active button{
	background-color: #fff;
	border: 1px solid #cdcdcd;
	box-sizing: border-box;
	border-bottom: 0;
	font-weight: 700;
}
.tabContents{
	padding-top: 40px;
}
.tabContents > div:not(.on) {
	display: none;
}

.tabContents > div{
	display: flex;
	flex-wrap: wrap;
	gap: 20px;
}
.tabContents > div > .oneList{
	width: 240px;
	border: 1px solid #ededed;
}
.oneList a{
	text-decoration: none;
}
.oneList img{
	width: 100%;
	height: 200px;
	object-fit: cover;
}
.oneList .contentWrap{
	color: #333;
	padding: 12px 15px;
}
.oneList .contentWrap h3{
	font-size: 16px;
}
.oneList .contentWrap b{
	font-size: 18px;
	display: flex;
	justify-content: space-between;
	align-items: flex-end;
}
.oneList .contentWrap small{
	font-size: 12px;
	font-weight: 300;
}
.oneList mark{
	background-color: #fff;
	color: #bbb;
	display: block;
	border-top: 1px solid #ededed;
	line-height: 30px;
	padding: 0 12px;
	font-size: 14px;
}
.oneList mark i{
	color: #93b336;
	margin-right: 3px;
}
</style>

</head>
<body>
<div class="tabArea">
	<ul class="tabMenu">
		<li class="active"><button type="button">판매상품</button></li>
		<li><button type="button">받은후기</button></li>
		<li><button type="button">구매내역</button></li>
		<li><button type="button">동네생활</button></li>
		<li><button type="button">관심목록</button></li>
	</ul>
	<div class="tabContents">
	    <div class="on" id="sellList">
	    	<!-- 판매상품 탭 -->
	    	<div class="oneList">
	    		<img alt="" src="../resources/image/기본 프로필 배경.png">
	    		<div class="contentWrap">
		    		<h3>물건이름</h3>
		    		<b>가격</b>
		    		<small>날짜</small>
	    		</div>
		    	<mark><i class="bi bi-geo-alt"></i>장소</mark>
	    	</div>
	    </div>
	
	    <div>
	    	tab menu2
	    </div>
	
	    <div id="buyList">
	    	<!-- 구매내역 탭 -->
	    	<div class="oneList">
	    		<img alt="" src="../resources/image/기본 프로필 배경.png">
	    		<div class="contentWrap">
		    		<h3>물건이름</h3>
		    		<b>가격</b>
		    		<small>날짜</small>
	    		</div>
	    	</div>
	    </div>
	
	<!-- 1225 미수 추가 -->
	    <div id="commuList">
	    	<jsp:include page="../myList/commuList.jsp" />
	    </div>
	    
		<div id="likeList">
			<jsp:include page="../myList/likeList.jsp" />
		</div>
	<!-- 1225 미수 추가 끝 -->
	</div>
</div>
<script type="text/javascript" src="/resources/js/tabMenuControll.js" ></script>
<script type="text/javascript" src="/resources/js/memberTab.js" ></script>
</body>
</html>