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
     font-family: 'suit';
    margin: 0 auto;
    width: 1440px;
}

.formLine {
    width: 700px;
    margin: 70px auto 90px;
    position: relative;
}

.profileContainer{
    border-top: 1px solid #efefef;
    border-bottom: 1px solid #efefef;
    padding: 20px 0;
    display: flex;
    flex-wrap: wrap;
    align-items: center;
    height: 92px;
}

.profileContainer > img {
    width: 50px;
    height: 50px;
    margin-right: 20px;
    border: 1px solid #d3d3d3;
    object-fit: cover;
    border-radius: 25px;
}

.menuUl{
	margin: 0;
	padding: 0;
}

.menuContainer{
	position: relative;
}

.menu {
	font-size: 18px;
}
.forMenuLine{
    position: absolute;
    top: 12px;
    left: 34px;
    right: 0;
    border-top: 1px dashed #efefef;
}

.explain {
	position: absolute;
	 top: 0;
	left: 670px;
	font-size: 18px;
	font-weight: bold;
}

.gray {
	color: #606060;
}

.mapContainer {
	position: relative;
}

.zoomIn {
	position: absolute;
	top: 130px;
	z-index: 1;
	border: 1px solid black;
	border-bottom: 1px solid gray;
} 

.zoomOut {
	position: absolute;
	top: 158px;
	z-index: 1;
	border: 1px solid black;
	border-top: none;
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
<c:set value="${mainSrc }" var="mainSrc"></c:set>
<div class="bodyContainer">
<div class="formLine">
<div class="profileContainer">
	<img alt="프사" src="${mainSrc}">
	<div class="writerInfo">
	<b>${svo.proNickName} 님</b>
	<p> ${svo.proEmd}</p>
	<%-- ${svo.proTitle}${svo.proMenu} --%>
	</div>
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
<h4>${svo.proTitle}</h4>
<div>${svo.proMenu}</div>
<div style="white-space:pre;">${svo.proContent}</div>
</div>

<!-- 메뉴 -->
<c:set value="${sdto.mlist }" var="mlist"></c:set>
<c:if test="${not empty mlist}">
<h4>가격</h4>
<div>
    <ul class="menuUl">
        <c:forEach items="${mlist}" var="mvo">
            <li>
            	<div class="menuContainer">
				<span class="menu">${mvo.strMenu}</span>
               		
				<div>
				<span class="forMenuLine"></span>
				<span class="gray">${mvo.strExplain}</span>
				</div>
	               
				<p class="explain">${mvo.strPrice}</p>
            	</div>
            </li>
        </c:forEach>
    </ul>
</div>
</c:if>

<!-- 지도 -->
<c:set value="${svo.proFullAddr }" var="adr1"></c:set>
<c:set value="${svo.proDetailAddr }" var="adr2"></c:set>
<c:if test="${not empty adr1}">
<div class="form mapContainer">
<c:set value="${svo.proFullAddr }" var="adr1"></c:set>
<c:set value="${svo.proDetailAddr }" var="adr2"></c:set>
<p class="label">주소</p>
<p><i class="bi bi-geo-alt"></i>${adr1} ${adr2}</p>
<p id="roadAdr"></p>
<div id="map" style="width:100%;height:250px;"></div>
<img alt="+" src="../resources/image/zoomIn.png" width="28" height="28" class="zoomIn" id="zoomIn">
<img alt="-" src="../resources/image/zoomOut.png" width="28" height="28" class="zoomOut" id="zoomOut"> 
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d0bcf962e4604f2fbb0f443f01d101a4&libraries=services"></script>
<script>
let adr1 = '<c:out value="${adr1}" />';
let adr2 = '<c:out value="${adr2}" />';

var mapContainer = document.getElementById('map'); //지도를 표시할 div 
var mapOption = {
    center: new kakao.maps.LatLng(37.450292, 126.702921), //지도의 중심좌표
    level: 3 //지도의 확대 레벨
};  

//지도 생성
var map = new kakao.maps.Map(mapContainer, mapOption); 

//지도 확대, 축소
var zoomIn = document.getElementById('zoomIn');
var zoomOut = document.getElementById('zoomOut');

zoomIn.addEventListener('click', function () {
    map.setLevel(map.getLevel() - 1);
    map.setLevel(level, { anchor: map.getCenter() });
});

zoomOut.addEventListener('click', function () {
    map.setLevel(map.getLevel() + 1);
    map.setLevel(level, { anchor: map.getCenter() });
});

kakao.maps.event.addListener(map, 'zoom_changed', function () {
    var level = map.getLevel();
});

//기본 마커 변경
var imageSrc = '/resources/image/marker.png';
var imageSize = new kakao.maps.Size(50, 55);
var imageOption = {offset: new kakao.maps.Point(23, 55)};

//마커 이미지 생성
var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);

//입력 주소-좌표 변환 객체 생성
var geocoder = new kakao.maps.services.Geocoder();

    //주소로 좌표 검색
    geocoder.addressSearch(adr1, function (result, status) {
        //정상적으로 검색 완료됐으면
        if (status === kakao.maps.services.Status.OK) {
        	//도로명 주소 => 지번 주소 
        	document.getElementById('roadAdr').innerText = result[0].address.address_name + ' ' + adr2;

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
<span id="likeCount">${svo.proLikeCnt} 조회 ${svo.proReadCnt}</span>
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
let readCnt = `<c:out value="${svo.proReadCnt}"/>`;

var menuLines = document.querySelectorAll('.forMenuLine');
var explains = document.querySelectorAll('.explain');
var menus = document.querySelectorAll('.menu');

//JavaScript 코드 일부
if (menuLines.length === explains.length && menuLines.length === menus.length) {
    for (var i = 0; i < menuLines.length; i++) {
        var explainWidth = explains[i].offsetWidth;
        var menuWidth = menus[i].offsetWidth;

        //forMenuLine의 left 속성 동적 조절
        menuLines[i].style.left = menuWidth + 'px';
        
        //forMenuLine의 width 속성 동적 조절
        menuLines[i].style.width = menuLines[i].offsetWidth - explainWidth - menuWidth + 'px';
        
        //explain의 left 속성 동적 조절
        explains[i].style.left = menuLines[i].offsetWidth + menus[i].offsetWidth + 'px';
    }
}


</script>
<script type="text/javascript" src="/resources/js/storeBoardDetail.js"></script>
<script type="text/javascript">
checkLike(user, bno);
</script>
</body>
</html>