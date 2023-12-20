<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Store Detail</title>
<style type="text/css">
@font-face {
    font-family: 'suit';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_suit@1.0/SUIT-Regular.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}

.bodyContainer{
    font-family: 'SUIT-Regular';
    display: flex;
	justify-content: center;
	flex-wrap: wrap;
}

.formLine {
	margin: 40px 0;
	width: 720px;
		border: 1px solid black;
}
.bi-heart:hover {
	color: red;
}

.bi-heart-fill {
	color: red;
}

.etcContainer div{
	display: inline-block;
}
</style>
</head>
<body>
<jsp:include page="../common/header.jsp" />
<c:set value="${sdto.pvo }" var="svo"></c:set>
<c:set value="${email }" var="email"></c:set>
<div class="bodyContainer">
<div class="formLine">
<div>
	<div>${svo.proTitle}</div>
	<div>${svo.proNickName} · ${svo.proEmd} · ${svo.proMenu} · 조회수 : ${svo.proReadCnt}</div>
</div>

<!-- 사진 -->
 <c:set value="${sdto.flist }" var="flist"></c:set>
 <div>
 	<ul>
 		<c:forEach items="${flist }" var="fvo">
 			<li>
 				<c:choose>
 					<c:when test="${fvo.fileType > 0 }">
 						<div>
 							<img alt="없음." src="/upload/product/${fn:replace(fvo.saveDir,'\\','/')}/${fvo.uuid}_${fvo.fileName}">
 						</div>
 					</c:when>
 					<c:otherwise>
  					</c:otherwise>
 				</c:choose>
 			</li>
 		</c:forEach>
 	</ul>
 </div>

<!-- 내용 -->
<div>
<h4>정보</h4>
<div style="white-space:pre;">${svo.proContent}</div>
</div>

<!-- 메뉴 -->
<c:set value="${sdto.mlist }" var="mlist"></c:set>
<c:if test="${not empty mlist}">
<h4>메뉴</h4>
<div>
    <ul>
        <c:forEach items="${mlist}" var="mvo">
            <li>
               <span>메뉴 : ${mvo.strMenu}</span>
               <span>가격: ${mvo.strPrice}</span>
               <span>설명: ${mvo.strExplain}</span>
            </li>
        </c:forEach>
    </ul>
</div>
</c:if>

<!-- 지도 -->
<c:set value="${svo.proFullAddr }" var="adr1"></c:set>
<c:set value="${svo.proDetailAddr }" var="adr2"></c:set>
<c:if test="${not empty adr1}">
<div class="form">
<c:set value="${svo.proFullAddr }" var="adr1"></c:set>
<c:set value="${svo.proDetailAddr }" var="adr2"></c:set>
<p class="label">주소</p>
<p><i class="bi bi-geo-alt"></i>${adr1} ${adr2}</p>
<div id="map" style="width:100%;height:250px;"></div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d0bcf962e4604f2fbb0f443f01d101a4&libraries=services"></script>
<script>
let adr1 = '<c:out value="${adr1}" />';
let adr2 = '<c:out value="${adr2}" />';

var mapContainer = document.getElementById('map'); //지도를 표시할 div ㅋ
var mapOption = {
    center: new kakao.maps.LatLng(37.450292, 126.702921), //지도의 중심좌표
    level: 3 //지도의 확대 레벨
};  

//지도 생성
var map = new kakao.maps.Map(mapContainer, mapOption); 

//기본 마커 변경
var imageSrc = '/resources/image/marker.png';
var imageSize = new kakao.maps.Size(50, 55);
var imageOption = {offset: new kakao.maps.Point(23, 55)};

//마커 이미지 생성
var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
    markerPosition = new kakao.maps.LatLng(37.450292, 126.702921); //마커 표시 위치(기본 위치)

//마커 생성
var marker = new kakao.maps.Marker({
    position: markerPosition, 
    image: markerImage //마커이미지 설정 
});
//지도 위 마커 표시
marker.setMap(map);  

//입력 주소-좌표 변환 객체 생성
var geocoder = new kakao.maps.services.Geocoder();

    //주소로 좌표 검색
    geocoder.addressSearch(adr1, function (result, status) {
        //정상적으로 검색 완료됐으면
        if (status === kakao.maps.services.Status.OK) {
            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

            //결과값으로 받은 위치를 마커로 표시
            var marker = new kakao.maps.Marker({
                map: map,
                position: coords,
                image: markerImage
            });

            //지도의 중심을 결과값으로 받은 위치로 이동
            map.setCenter(coords);
        }
    });

</script>
</div>
</c:if>

<div class="etcContainer">
<!-- 좋아요 -->
<div id="likeContainer">
<i id="like" class="bi bi-heart"></i>
<span id="likeCount">${svo.proLikeCnt}</span>
</div>

<!-- 끌올 수정 삭제 -->
<div>
<c:if test="${email == svo.proEmail}">
<a href="/store/repost?bno=${svo.proBno }">끌올</a>
<a href="/store/modify?bno=${svo.proBno }">수정</a>
<a href="/store/remove?bno=${svo.proBno }" id="delBtn">삭제</a>
</c:if>
</div>
</div>


</div>
</div>
<jsp:include page="../common/footer.jsp" />
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
let user = `<c:out value="${email}"/>`;
let bno = `<c:out value="${svo.proBno}"/>`;
let likeCnt = `<c:out value="${svo.proLikeCnt}"/>`;
</script>
<script type="text/javascript" src="/resources/js/storeBoardDetail.js">
</script>
<script type="text/javascript">
checkLike(user, bno);
</script>
</body>
</html>