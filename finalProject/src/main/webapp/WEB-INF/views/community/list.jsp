<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Community List</title>
<style type="text/css">
	.user_profile>*, .item-info>*, .item-info>div>p{
		display: inline;
	}
</style>
</head>
<body>
<jsp:include page="../common/header.jsp" />

<div class="bodyContainer">

<div class="CommunityCategory">
	<a href="/community/list?cmMenu=전체" class="menu">전체</a>
	<a href="/community/list?cmMenu=일상" class="menu">일상</a>
	<a href="/community/list?cmMenu=모임" class="menu">모임</a>
	<a href="/community/list?cmMenu=질문" class="menu">질문</a>
	<a href="/community/list?cmMenu=동네생활정보" class="menu">동네생활정보</a>
	<a href="/community/list?cmMenu=찾습니다" class="menu">찾습니다</a>
	<a href="/community/list?cmMenu=해주세요" class="menu">해주세요</a>
	<a href="/community/list?cmMenu=동네사진전" class="menu">동네사진전</a>
</div>
<c:set value="${flist }" var="flist" />

<c:if test="${list[0] eq null }">
	<div>게시물이 존재하지 않습니다.</div>
</c:if>
<c:forEach items="${list }" var="bvo">
<div class="cmBoard">
	<%-- <p>${bvo.cmMenu }</p> --%>
	<div class="user_profile">
		<i class="bi bi-person-circle"></i>
		<b>${bvo.cmNickName}</b>
		<p>${bvo.cmRegAt }</p>
		<p>구월동</p>
	</div>
	<a class="communityContentLine" href="/community/detail?cmBno=${bvo.cmBno }">
		<p>${bvo.cmTitle }</p>
		<!-- 썸네일 -->
		<c:forEach items="${flist }" var="fvo" varStatus="loop">
			<c:if test="${fvo.bno eq bvo.cmBno }">
				<img alt="그림없음" src="/upload/community/${fn:replace(fvo.saveDir,'\\','/')}/${fvo.uuid}_th_${fvo.fileName}">
			</c:if>
		</c:forEach>
	</a>
	<div class="item-info">
		<div>
			<i class="bi bi-eye"></i>
			<span>${bvo.cmReadCnt }</span>
			<i class="bi bi-heart"></i>
			<span>${bvo.cmLikeCnt } </span>
		</div>
		<div>
			<i class="bi bi-chat-right-dots"></i>
			<span class="readCount">${bvo.cmCmtCnt }</span>
		</div>
	</div>
</div>
</c:forEach>

<a href="/community/register">
	<button type="button" class="btn btn-success">등록</button>
</a>
</div>

<jsp:include page="../common/footer.jsp" />
</body>
</html>