<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ List</title>
<style type="text/css">
	@font-face {
	    font-family: 'SUIT-Regular';
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
	.innerContainer{
		width: 700px;
	}
	
	/* 젤 위에 라인 */
	.topLine{
		margin-top: 60px;
		width: 100%;
		text-align: center;
		border-bottom: 1px solid black;
	}
	.pageName{
		font-size: 24px;	    
		font-weight: 800;
	}
	
	/* 검색라인 */
	.searchLine{
		width: 100%;
		display: flex;
		justify-content: center;
		flex-wrap: wrap;
	}
	.searchLine form{
		width: 100%;
	}
	.faqT{
		width: 100%;
		margin: 20px 0;
	    font-size: 24px;
	    font-weight: 800;
	}
	.searchBox{
		display: inline-block;
	    width: 100%;
	    height: 40px;
	    border-radius: 5px;
	    background-color: #f1f4f6;
	}
	.searchIcon{
		padding: 0 3px 0 15px;
	    font-size: 13px;
	    color: gray;
	}
	.searchInput{
		width: 600px;
		border: none;
		background: none;
	    font-size: 14px;
	    line-height: 40px;
	}
	.searchBtn{
	    border: none;
	    background: none;
	    color: #a2a2a2;
	    position: absolute;
	    margin-top: 7px;
	    margin-left: -35px;
    }
	
	/* 카테고리 라인 */
	.faqCategory{
		margin: 30px 0;
		width: 100%;
		display: flex;
		justify-content: center;
	    position: sticky;
	    top: 20px;
	    background-color: white;
	}
	.category{
		text-decoration: none;
    	color: #909090;
		border: 1px solid #d3d3d3;
	    border-radius: 100px;
	    padding: 5px 10px;
	    margin: 0 10px;
	    font-size: 15px;
	}
	.category:hover{
		background-color: #d3d3d3;
	}
	.faqActive{
		background-color: #d3d3d3;
		color: white;
	}
	
	/* faq 게시글 라인 */
	.faqBoardLine{
		width: 100%;
		display: flex;
		justify-content: center;
	}
	.faqBoards{
		margin: 0;
		padding: 0;
		width: 100%;
		font-size: 0;
	}
	.faqLi{
		font-size: 14px;
	}
	.questionBtn{
		width: 100%;
    	height: 70px;
    	display: flex;
    	justify-content: space-between;
    	border: none;
    	border-bottom: 1px solid lightgrey;
    	padding: 16px 20px;
    	align-items: center;
    	background: none;
	}
	.qLeft p{
		margin: 0;
	}
	.qTitle{
		font-size: 14px;
		text-align: left;
	}
	.qCategory{
		font-size: 13px;
	    text-align: left;
	    color: gray;
	}
	.answerArea{
		width: 100%;
	    background-color: #f1f4f6;
	    resize: none;
	    border: none;
	    padding: 20px;
	    font-size: 14px;
	}
	.answerArea:focus{
		outline: none;
	}
	
	/* 검색 결과 없을 때 */
	.noBoard{
	    font-size: 17px;
	    text-align: center;
	    height: 300px;
	    line-height: 300px;
	}
	
	/* 문의버튼 라인 */
	.csButtons{
		margin: 30px 0 30px 0;
		width: 100%;
		display: flex;
		justify-content: space-between;
	}
	.csBtn1, .csBtn2{
	    width: 350px;
	    height: 45px;
	    background: none;
	    border: 1px solid #d3d3d3;
	    border-radius: 5px;
	    font-size: 15px;
	}
	.csBtn1{
		margin-right: 3px;
	}
	.csBtn2{
		margin-left: 3px;
	}
	
	/* 고정 nav */
	.faqWriteBtn{
		position: fixed;
		right: 0;
		bottom: 0;
	}
</style>
</head>
<body>
<jsp:include page="../common/header.jsp" />
	
<div class="bodyContainer">
<div class="innerContainer">

<div class="topLine">
	<p class="pageName">고객센터</p>
</div>

<div class="searchLine">
	<p class="faqT">자주 묻는 질문 FAQ</p>	
	<form action="/faq/list" method="get">
		<input type="hidden" name="type" value="tc">
		<label for="searchBox" class="searchBox">
			<i class="bi bi-search searchIcon"></i>
			<input type="text" name="keyword" id="searchBox" class="searchInput" placeholder="궁금하신 점을 검색해 주세요.">
		</label> 
			
		<button type="submit" class="searchBtn" style="display:none"></button>
	</form>
</div>
	
<div class="faqCategory">
	<a href="/faq/list" class="category faqActive">전체</a>
	<a href="/faq/list?faqCategory=이용문의" class="category">이용문의</a>
	<a href="/faq/list?faqCategory=거래문의" class="category">거래문의</a>
	<a href="/faq/list?faqCategory=회원/계정" class="category">회원/계정</a>
	<a href="/faq/list?faqCategory=운영정책" class="category">운영정책</a>
	<a href="/faq/list?faqCategory=기타" class="category">기타</a>
</div>
 
<div class="faqBoardLine">
	<ul class="faqBoards">
		<c:forEach items="${list }" var="bvo" varStatus="status">
			<li class="faqLi" id="${status.index }">
				<button class="questionBtn">
					<div class="qLeft">
						<p class="qTitle">${bvo.faqTitle }</p>
						<p class="qCategory">${bvo.faqCategory }</p>
					</div>
					<i class="bi bi-chevron-up qRight" id="up-${status.index }"></i>
				</button>
				<textarea class="answerArea" readonly="readonly" style="display:none" id="text-${status.index }">${bvo.faqContent }</textarea>
			</li>
		</c:forEach>
		<c:if test="${list.size() == 0 }">
			<li class="faqLi-no">
				<p class="noBoard">검색 결과가 없습니다.</p>
			</li>
		</c:if>
	</ul>
</div>

<sec:authorize access="isAuthenticated()">
<sec:authentication property="principal.mvo.memEmail" var="authEmail" />
	<div class="csButtons">
		<a href="/cs/register">
			<button type="button" class="csBtn1">1:1 문의</button>
		</a>
		<a href="/cs/list?csEmail=${authEmail }">
			<button type="button" class="csBtn2">문의내역</button>
		</a>
	</div>
</sec:authorize>
<sec:authorize access="isAnonymous()">
	<div class="csButtons">
		<a href="/member/login">
			<button type="button" class="csBtn1">1:1 문의</button>
		</a>
		<a href="/member/login">
			<button type="button" class="csBtn2">문의내역</button>
		</a>
	</div>
</sec:authorize>
</div>	
</div>
<!-- 여기까지 bodyContainer -->
<div class="faqWriteBtn">
	<a href="/faq/register">
		<button type="button">faq 글쓰기</button>
	</a>
	<a href="/faq/adminList">
		<button type="button">관리자 faq list</button>
	</a>
</div>

<jsp:include page="../common/footer.jsp" />
<script type="text/javascript" src="/resources/js/faqBoardList.js"></script>
</body>
</html>