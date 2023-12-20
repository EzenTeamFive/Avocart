<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
<meta charset="UTF-8">
<title>Avocart</title>
<link rel="stylesheet" href="../resources/css/index.css">
</head>
<body>
<jsp:include page="./common/header.jsp" />

<div class="bodyContainer">

<!-- 배너 -->
<div id="carouselExample" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="/resources/image/bannerTest1.jpg" class="d-block w-100 bannerImgs" alt="...">
    </div>
    <div class="carousel-item">
      <img src="/resources/image/bannerTest2.png" class="d-block w-100 bannerImgs" alt="...">
    </div>
    <div class="carousel-item">
      <img src="/resources/image/bannerTest3.png" class="d-block w-100 bannerImgs" alt="...">
    </div>
  </div>
  <button class="carousel-control-prev" id="bannerPrevBtn" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" id="bannerNextBtn" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>

<!-- 로딩페이지 -->
<div id="loading"></div>

<!-- 중고라인 -->
<div class="boardListLine">
	<div class="ListLineTop">
		<p>방금 등록된 상품</p>
		<a href="/joongo/list">더보기</a>
	</div>
	<div class="ListLineMiddle" id="joongoMiddle">
		<div class="joongo_item">
			<a href="#">
				<img alt="" src="">
				<div class="joongo_item_detail">
					<p>폴로 반팔 티셔츠</p>
					<p>9,000원</p>
					<p>구월동 | 2023-12-19</p>
				</div>
			</a>
		</div>
		<div class="joongo_item">
			<a href="#">
				<img alt="" src="">
				<div class="joongo_item_detail">
					
				</div>
			</a>
		</div>
		<div class="joongo_item">
			<a href="#">
				<img alt="" src="">
				<div class="joongo_item_detail">
					
				</div>
			</a>
		</div>
		<div class="joongo_item">
			<a href="#">
				<img alt="" src="">
				<div class="joongo_item_detail">
					
				</div>
			</a>
		</div>
		<div class="joongo_item">
			<a href="#">
				<img alt="" src="">
				<div class="joongo_item_detail">
					
				</div>
			</a>
		</div>
	</div>
</div>

<div class="boardListLine">
	<div class="ListLineTop">
		<p>실시간 인기 상품</p>
		<a href="/joongo/list">더보기</a>
	</div>
	<div class="ListLineMiddle" id="joongoLikeMiddle">
		<div class="joongo_item">
			<a href="#">
				<img alt="" src="">
				<div class="joongo_item_detail">
					<p>폴로 반팔 티셔츠</p>
					<p>9,000원</p>
					<p>구월동 | 2023-12-19</p>
				</div>
			</a>
		</div>
		<div class="joongo_item">
			<a href="#">
				<img alt="" src="">
				<div class="joongo_item_detail">
					
				</div>
			</a>
		</div>
		<div class="joongo_item">
			<a href="#">
				<img alt="" src="">
				<div class="joongo_item_detail">
					
				</div>
			</a>
		</div>
		<div class="joongo_item">
			<a href="#">
				<img alt="" src="">
				<div class="joongo_item_detail">
					
				</div>
			</a>
		</div>
		<div class="joongo_item">
			<a href="#">
				<img alt="" src="">
				<div class="joongo_item_detail">
					
				</div>
			</a>
		</div>
	</div>
</div>

<!-- 동네업체 라인 -->
<div class="boardListLine">
	<div class="ListLineTop">
		<p>우리 동네 인기 업체</p>
		<a href="/store/list">더보기</a>
	</div>
	<div class="ListLineMiddle" id="storeMiddle">
		<div class="store_item">
			<a href="#">
				<div class="store_item_img">
					<img alt="" src="">
				</div>
				<div class="store_item_detail">
					<p>멍이네</p>
					<p>강아지 미용합니다!</p>
					<p>구월동 | 반려동물 | 후기 3개</p>
				</div>
			</a>
		</div>
		<div class="store_item">
			<a href="#">
				<div class="store_item_img">
					<img alt="" src="">
				</div>
				<div class="store_item_detail">
				
				</div>
			</a>
		</div>
		<div class="store_item">
			<a href="#">
				<div class="store_item_img">
					<img alt="" src="">
				</div>
				<div class="store_item_detail">
				
				</div>
			</a>
		</div>
		<div class="store_item">
			<a href="#">
				<div class="store_item_img">
					<img alt="" src="">
				</div>
				<div class="store_item_detail">
				
				</div>
			</a>
		</div>
		<div class="store_item">
			<a href="#">
				<div class="store_item_img">
					<img alt="" src="">
				</div>
				<div class="store_item_detail">
				
				</div>
			</a>
		</div>
		<div class="store_item">
			<a href="#">
				<div class="store_item_img">
					<img alt="" src="">
				</div>
				<div class="store_item_detail">
				
				</div>
			</a>
		</div>
	</div>
</div>

<!-- 알바구인 라인 -->
<div class="boardListLine">
	<div class="ListLineTop">
		<p>우리 동네 인기 알바</p>
		<a href="/job/list">더보기</a>
	</div>
	<div class="ListLineMiddle" id="jobMiddle">
		<div class="store_item">
			<a href="#">
				<div class="store_item_img">
					<img alt="" src="">
				</div>
				<div class="store_item_detail">
					<p>멍이네</p>
					<p>강아지 미용합니다!</p>
					<p>구월동 | 반려동물 | 후기 3개</p>
				</div>
			</a>
		</div>
		<div class="store_item">
			<a href="#">
				<div class="store_item_img">
					<img alt="" src="">
				</div>
				<div class="store_item_detail">
				
				</div>
			</a>
		</div>
		<div class="store_item">
			<a href="#">
				<div class="store_item_img">
					<img alt="" src="">
				</div>
				<div class="store_item_detail">
				
				</div>
			</a>
		</div>
		<div class="store_item">
			<a href="#">
				<div class="store_item_img">
					<img alt="" src="">
				</div>
				<div class="store_item_detail">
				
				</div>
			</a>
		</div>
		<div class="store_item">
			<a href="#">
				<div class="store_item_img">
					<img alt="" src="">
				</div>
				<div class="store_item_detail">
				
				</div>
			</a>
		</div>
		<div class="store_item">
			<a href="#">
				<div class="store_item_img">
					<img alt="" src="">
				</div>
				<div class="store_item_detail">
				
				</div>
			</a>
		</div>
	</div>
</div>

<!-- 동네소식 -->
<div class="boardListLine">
	<div class="ListLineTop">
		<p>최신 동네 소식</p>
		<a href="/community/list">더보기</a>
	</div>
	<div class="ListLineMiddle" id="communityMiddle">
		<div class="community_list">
			<a href="#">
				<div class="cm_first">
					<span>질문</span>
					<p>호떡차 어디에서 오는지 아시나요?</p>
				</div>
				<div class="cm_second">
					<span>구월동</span>
					<i class="bi bi-heart"></i>
					<span>5 </span>
					<i class="bi bi-chat-right-dots"></i>
					<span>10</span>
				</div>
			</a>
		</div>
		<div class="community_list">
			<a href="#">
				<div class="cm_first">
					<span>모임</span>
					<p>같이 달리실 분 모집합니다!</p>
				</div>
				<div class="cm_second">
					<span>아라동</span>
					<i class="bi bi-heart"></i>
					<span>5 </span>
					<i class="bi bi-chat-right-dots"></i>
					<span>10</span>
				</div>
			</a>
		</div>
		<div class="community_list">
			<a href="#">
				<div class="cm_first">
					<span>질문</span>
					<p>호떡차 어디에서 오는지 아시나요?</p>
				</div>
				<div class="cm_second">
					<span>구월동</span>
					<i class="bi bi-heart"></i>
					<span>5 </span>
					<i class="bi bi-chat-right-dots"></i>
					<span>10</span>
				</div>
			</a>
		</div>
		<div class="community_list">
			<a href="#">
				<div class="cm_first">
					<span>모임</span>
					<p>같이 달리실 분 모집합니다!</p>
				</div>
				<div class="cm_second">
					<span>구월동</span>
					<i class="bi bi-heart"></i>
					<span>5 </span>
					<i class="bi bi-chat-right-dots"></i>
					<span>10</span>
				</div>
			</a>
		</div>
	</div>
</div>
<div class="boardListLine cmLikeListLine">
	<div class="ListLineTop">
		<p>지금 뜨는 인기글</p>
		<a href="/community/list">더보기</a>
	</div>
	<div class="ListLineMiddle" id="communityLikeMiddle">
		<div class="community_list">
			<a href="#">
				<div class="cm_first">
					<span>질문</span>
					<p>호떡차 어디에서 오는지 아시나요?</p>
				</div>
				<div class="cm_second">
					<span>구월동</span>
					<i class="bi bi-heart"></i>
					<span>5 </span>
					<i class="bi bi-chat-right-dots"></i>
					<span>10</span>
				</div>
			</a>
		</div>
		<div class="community_list">
			<a href="#">
				<div class="cm_first">
					<span>모임</span>
					<p>같이 달리실 분 모집합니다!</p>
				</div>
				<div class="cm_second">
					<span>아라동</span>
					<i class="bi bi-heart"></i>
					<span>5 </span>
					<i class="bi bi-chat-right-dots"></i>
					<span>10</span>
				</div>
			</a>
		</div>
		<div class="community_list">
			<a href="#">
				<div class="cm_first">
					<span>질문</span>
					<p>호떡차 어디에서 오는지 아시나요?</p>
				</div>
				<div class="cm_second">
					<span>구월동</span>
					<i class="bi bi-heart"></i>
					<span>5 </span>
					<i class="bi bi-chat-right-dots"></i>
					<span>10</span>
				</div>
			</a>
		</div>
		<div class="community_list">
			<a href="#">
				<div class="cm_first">
					<span>모임</span>
					<p>같이 달리실 분 모집합니다!</p>
				</div>
				<div class="cm_second">
					<span>구월동</span>
					<i class="bi bi-heart"></i>
					<span>5 </span>
					<i class="bi bi-chat-right-dots"></i>
					<span>10</span>
				</div>
			</a>
		</div>
	</div>
</div>

<div class="appStoreLine">
	<div class="appStoreInner">
		<p>당신 근처의 <br> 지역 생활 커뮤니티 </p>
		<p>동네라서 가능한 모든 것<br> 아보카트에서 가까운 이웃과 함께해요.</p>
		<a href="#">
			<button type="button"><i class="bi bi-google-play"></i> Google Play</button>
		</a>
		<a href="#">
			<button type="button"><i class="bi bi-apple"></i> App Store</button>
		</a>
	</div>
</div>

</div>
<!-- 여기까지 bodyContainer -->
<jsp:include page="./common/footer.jsp" />

<script type="text/javascript" src="/resources/js/index.js"></script>
</body>
</html>
