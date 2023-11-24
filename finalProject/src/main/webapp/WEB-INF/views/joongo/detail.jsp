<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.bodyContainer > img{
	width: 100px;
}

</style>
</head>
<body>
<jsp:include page="../common/header.jsp" />
<div class="bodyContainer">
	<!-- 상품이미지 여러 개일 경우 슬라이더 -->
	<c:forEach items="${flist }" var="fvo">
		<c:choose>
			<c:when test="${fvo.fileType > 0}">
				<img src="/upload/product/${fn: replace(fvo.saveDir, '\\', '/')}/${fvo.uuid}_${fvo.fileName}" alt="그림 없음">
			</c:when>
			<c:otherwise>
				<!-- 그림이 아닐 경우 file 아이콘 모양 넣기 -->
				<img src="../resources/image/logoimage.png" class="card-img-top" alt="...">
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<div class="profile">
		<img src="..." class="card-img-top" alt="프로필 이미지">
		<p>${pbvo.proNickName }</p>
		<p>${pbvo.proSido } ${pbvo.proSigg }</p>
		<p>조회 ${pbvo.proReadCnt }</p>
		<!-- 글 작성자가 아닐 경우에만 띄울 버튼 -->
		<button type="button" class="btn btn-outline-warning">채팅하기</button>
	</div>
	<div class="prodArea">
		<i class="bi bi-heart${checkLike == 1 ? '-fill' : ''}"></i>
		<h3>${pbvo.proTitle }</h3>
		<p>${pbvo.proMenu } * ${pbvo.proRegAt }</p>
		<h3>${pbvo.proPrice }</h3>
		<textarea cols="30" rows="10" readonly>${pbvo.proContent }</textarea>
	</div>
	
	
	<!-- 글 작성자에게만 띄울 버튼 -->
	<a href="/joongo/modify?proBno=${pbvo.proBno }"><button type="submit" class="btn btn-success">수정</button></a>
	<a href="/joongo/remove?proBno=${pbvo.proBno }"><button type="button" class="btn btn-danger">삭제</button></a>
</div>
<jsp:include page="../common/footer.jsp" />
<script>
const bnoVal = `<c:out value="${pbvo.proBno}" />`;
const userEmail = `<c:out value="joongoJY@naver.com" />`; /* 나중에 member 작성 후 수정 */
</script>
<script src="/resources/js/likeItem.js"></script>
</body>
</html>