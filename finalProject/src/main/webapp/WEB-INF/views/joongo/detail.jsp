<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/joongoBoard.css">
</head>
<body>
<jsp:include page="../common/header.jsp" />
	<div class="bodyContainer">
		<section class="floatMenu">
			<!-- 찜 (북마크) -->
			<sec:authorize access="isAnonymous()">
				<button type="button">
					<i class="bi bi-heart-fill no-login"></i>
					<span>찜하기</span>
				</button>
			</sec:authorize>
			<sec:authorize access="isAuthenticated()">
				<button type="button">
					<i class="bi bi-heart${checkLike == 1 ? '-fill' : ''}"></i>
					<span>찜하기</span>
				</button>
			</sec:authorize>
			<!-- 누르면 링크 복사되는 버튼 -->
			<button type="button" onclick="clip()">
				<i class="bi bi-clipboard"></i>
				<span>링크복사</span>
			</button>
		</section>
		<div class="joongoDetailContainer">
			<!-- 상품이미지 여러 개일 경우 슬라이더 -->
			<div id="carouselExampleIndicators" class="carousel slide">
			  <div class="carousel-indicators">
				<c:forEach items="${flist }" var="fvo" varStatus="status">
				    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="${status.index}" class="${status.index == 0 ? 'active' : ''}" aria-label="Slide ${status.index + 1}"></button>
				</c:forEach>
			  </div>
			  <div class="carousel-inner">
				  <c:forEach items="${flist }" var="fvo" varStatus="status">
				    <div class="carousel-item ${status.index == 0 ? 'active' : ''}">
				      <img src="/upload/product/${fn: replace(fvo.saveDir, '\\', '/')}/${fvo.uuid}_${fvo.fileName}" alt="그림 없음">
				    </div>
				  </c:forEach>
			  </div>
			  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
			    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Previous</span>
			  </button>
			  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
			    <span class="carousel-control-next-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Next</span>
			  </button>
			</div>
		<div class="profileArea">
			<c:choose>
				<c:when test="${empty profile}">
					<img src="../resources/image/기본 프로필.png" class="card-img-top" alt="기본 프로필 이미지">			
				</c:when>
				<c:otherwise>
					<img src="/upload/profile/${fn:replace(profile.saveDir,'\\','/')}/${profile.uuid}_th_${profile.fileName}" alt="프로필 이미지">
				</c:otherwise>
			</c:choose>
			<div class="writerInfo">
				<b>${pbvo.proNickName } 님</b>
				<p>${pbvo.proEmd }</p>
			</div>
			<sec:authorize access="isAuthenticated()">
				<sec:authentication property="principal.mvo.memEmail" var="authEmail"/>
				<c:if test="${pbvo.proEmail ne authEmail}">
					<!-- 글 작성자가 아닐 경우에만 띄울 채팅 버튼 -->
					<button type="button" id="chatRoomBtn">채팅 <i class="bi bi-chat-dots"></i></button>					
				</c:if>
			</sec:authorize>
		</div>
		
		<div class="prodArea">
			<h3>${pbvo.proTitle }</h3>
			<span>${pbvo.proMenu }</span><p><!-- 날짜 --></p>
			<h2><!-- 가격란 --></h2>
			<textarea id="dynamicTextarea" cols="30" rows="10" readonly>${pbvo.proContent}</textarea>
			<p id="likeCnt">관심 ${pbvo.proLikeCnt }</p><p>조회 ${pbvo.proReadCnt }</p>
		</div>
		
		<sec:authorize access="isAuthenticated()">
			<c:if test="${pbvo.proEmail eq authEmail}">
				<div class="proBtnArea">
					<!-- 글 작성자에게만 띄울 버튼 -->
					<a href="/joongo/modify?proBno=${pbvo.proBno }"><button type="submit">수정</button></a>
					<a href="/joongo/remove?proBno=${pbvo.proBno }"><button type="button">삭제</button></a>
				</div>
			</c:if>
		</sec:authorize>
		</div>
		
	</div>
<jsp:include page="../common/footer.jsp" />
<script>
const bnoVal = `<c:out value="${pbvo.proBno}" />`;
const writerEmail = `<c:out value="${pbvo.proEmail}" />`;
const userEmail = `<c:out value="${authEmail}" />`;

// 가격 표기 변경
let price = `<c:out value="${pbvo.proPrice}" />`;
price = parseInt(price).toLocaleString('ko-KR');
document.querySelector('.prodArea h2').append(price+'원');

// 날짜 표기 변경
let date = `<c:out value="${pbvo.proReAt}" />`;
date = date.substring(0,10);
document.querySelector('.prodArea p:not(:last-child)').append(date);

</script>
<script src="/resources/js/abjustTextareaRows.js"></script>
<script src="/resources/js/likeItem.js"></script>
<script src="/resources/js/chatRoomCreate.js"></script>
</body>
</html>