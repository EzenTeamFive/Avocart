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
<link rel="stylesheet" href="/resources/css/likeList.css">
</head>
<body>
<jsp:include page="../common/header.jsp" />

<!-- 규격 표시 임시 div -->
<div class="cover" style="width: 1280px; border: 2px solid green; margin: 50px; box-sizing: border-box;">
	<div class="titleLine">
		<h4>동네 생활 <span style="color: red" id="likeCnt"></span></h4>


		<section>
			<div class="commuListTypeArea">
				<a href="/myList/commuList?type=작성글" class="menu">작성글</a>
				<a href="/myList/commuList?type=관심글" class="menu">관심글</a>
			</div>
			
		</section>
	</div>

	<div class="brdListArea" id="moreListArea">
		<!-- ... -->
	</div>
	
	<button type="button" id="moreBtn" data-page="1" style="visiblity:hidden"><i class="bi bi-plus-circle-fill"></i> 게시글 더 보기</button>
</div>


<jsp:include page="../common/footer.jsp" />
<script type="text/javascript" src="/resources/js/commuList.js"></script>
<script type="text/javascript">
	let type = `<c:out value="${type}"/>`;
	getMoreBoard(1, type);
</script>
</body>
</html>
