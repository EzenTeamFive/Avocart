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
.tabContents > div:not(.on) {
	display: none;
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
	    	tab menu1
	    </div>
	
	    <div>
	    	tab menu2
	    </div>
	
	    <div id="buyList">
	    	<!-- 구매내역 탭 -->
	    	tab menu3
	    </div>
	
	    <div>
	    	tab menu4
	    </div>
	    
		<div>
			tab menu5
		</div>
	</div>
</div>
<script type="text/javascript" src="/resources/js/tabMenuControll.js" ></script>
<script type="text/javascript" src="/resources/js/memberTab.js" ></script>
</body>
</html>