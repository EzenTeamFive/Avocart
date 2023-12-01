<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Community Modify</title>
</head>
<body>
<jsp:include page="../common/header.jsp" />
<c:set value="${bdto.bvo}" var="bvo" />
<sec:authentication property="principal.mvo.memEmail" var="authEmail" />
<sec:authentication property="principal.mvo.memNickName" var="authNick" />

<div class="bodyContainer">
<form action="/community/modify" method="post" enctype="multipart/form-data">
	<input type="hidden" name="cmEmail" value="${authEmail }">
	<input type="hidden" name="cmNickName" value="${authNick }">
	<input type="hidden" name="cmBno" value="${bvo.cmBno }">
	
	<select name="cmMenu">
	    <option value="일상" ${bvo.cmMenu eq '일상' ? 'selected' : '' }>일상</option>
	    <option value="모임" ${bvo.cmMenu eq '모임' ? 'selected' : '' }>모임</option>
	    <option value="질문" ${bvo.cmMenu eq '질문' ? 'selected' : '' }>질문</option>
	    <option value="동네생활정보" ${bvo.cmMenu eq '동네생활정보' ? 'selected' : '' }>동네생활정보</option>
	    <option value="찾습니다" ${bvo.cmMenu eq '찾습니다' ? 'selected' : '' }>찾습니다</option>
	    <option value="해주세요" ${bvo.cmMenu eq '해주세요' ? 'selected' : '' }>해주세요</option>
	    <option value="동네사진전" ${bvo.cmMenu eq '동네사진전' ? 'selected' : '' }>동네사진전</option>
    </select>
    <div class="mb-3">
		<input type="text" name="cmTitle" class="form-control" value="${bvo.cmTitle }">
	</div>
	<div class="mb-3">
		<textarea rows="3" cols="30" name="cmContent" class="form-control">${bvo.cmContent }</textarea>
	</div>
	
	<!-- 파일 띄우고 지우기 버튼 추가 -->
	<c:set value="${bdto.flist }" var="flist" />
	<c:if test="${flist.size() > 0 }">
		<c:forEach items="${flist }" var="fvo">
			<c:choose>
				<c:when test="${fvo.fileType > 0 }">
					<div>
						<img alt="그림없음" src="/upload/community/${fn:replace(fvo.saveDir,'\\','/')}/${fvo.uuid}_th_${fvo.fileName}">
						<button type="button" class="btn btn-danger fileDel" data-uuid="${fvo.uuid }">X</button>
					</div>					
				</c:when>
			</c:choose>
		</c:forEach>
	</c:if>
	
	<!-- 파일 다시 추가 -->
	<div class="mb-3">
		<input type="file" class="form-control" name="files" id="files" multiple="multiple" style="display:none;">
		<button type="button" id="trigger" class="btn btn-success">new file</button>
	</div>
	<!-- 첨부파일 표시 영역 -->
	<div class="mb-3" id="fileZone">
	
	</div>
	
	<button type="submit" class="btn btn-secondary" id="regBtn">등록</button>
</form>
</div>

<script type="text/javascript" src="/resources/js/communityBoardRegister.js"></script>
<script type="text/javascript" src="/resources/js/communityBoardModify.js"></script>
<jsp:include page="../common/footer.jsp" />
</body>
</html>