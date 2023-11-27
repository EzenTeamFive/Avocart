<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Community Register</title>
</head>
<body>        
<sec:authentication property="principal.mvo.memEmail" var="authEmail" />
<sec:authentication property="principal.mvo.memNickName" var="authNick" />
<jsp:include page="../common/header.jsp" />

<div class="bodyContainer">
<form action="/community/register" method="post" enctype="multipart/form-data">
	<input type="hidden" name="cmEmail" value="${authEmail }">
	<input type="hidden" name="cmNickName" value="${authNick }">
	
	<select name="cmMenu">
	    <option value="일상">일상</option>
	    <option value="모임">모임</option>
	    <option value="질문">질문</option>
	    <option value="동네생활정보">동네생활정보</option>
	    <option value="찾습니다">찾습니다</option>
	    <option value="해주세요">해주세요</option>
	    <option value="동네사진전">동네사진전</option>
    </select>
    <div class="mb-3">
	<input type="text" name="cmTitle" class="form-control" placeholder="제목을 입력하세요." required="required">
	</div>
	<div class="mb-3">
	<textarea rows="3" cols="30" name="cmContent" class="form-control" placeholder="근처 이웃과 동네에서의 소소한 일상, 정보를 공유해보세요."  required="required"></textarea>
	</div>
	
	<!-- 파일 -->
	<div class="mb-3">
		<input type="file" class="form-control" name="files" id="files" multiple="multiple" style="display:none;">
		<button type="button" id="trigger" class="btn btn-success">FileUpload</button>
	</div>
	<!-- 첨부파일 표시 영역 -->
	<div class="mb-3" id="fileZone">
	
	</div>
	
	<button type="submit" class="btn btn-secondary" id="regBtn">등록</button>
</form>
</div>

<jsp:include page="../common/footer.jsp" />
<script type="text/javascript" src="/resources/js/communityBoardRegister.js"></script>
</body>
</html>