<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member Detail</title>
<style>
.star-ratings {
  color: #eee; 
  position: relative;
  unicode-bidi: bidi-override;
  width: max-content;
  -webkit-text-stroke-width: 1.3px;
}
 
.fill {
  color: gold;
  padding: 0;
  position: absolute;
  z-index: 1;
  display: flex;
  top: 0;
  left: 0;
  overflow: hidden;
}
 
.base {
  z-index: 0;
  padding: 0;
}

.star-container {
    display: flex;
}

.star {
    font-size: 20px; /* 스타일링에 따라 조절하세요. */
    margin-right: 2px; /* 각 별 사이의 간격을 조절하세요. */
}

.yellow {
    color: gold; /* 노란 별의 색상을 조절하세요. */
}

.grey {
    color: grey; /* 회색 별의 색상을 조절하세요. */
}
</style>
</head>
<body>
<!-- 카테고리 -->
<div>
	<select>
		<option value="joongo">중고거래</option>
		<option value="store">동네업체</option>
		<option value="job">알바구인</option>
	</select>
</div>

<h3>후기 0개</h3>
<div class="star-ratings">
	<div class="fill"  id="fillStars">
		 <span>★★★★★</span>
	</div>
	<div class="base">
		 <span>★★★★★</span>
	</div>
</div>

<div class="reviewContainer">
	후기
	<ul class="ulZone">
	</ul>
</div>
</body>
<script src="/resources/js/reviewTab.js"></script>
<script type="text/javascript">
getReviewList();
</script>
</html>