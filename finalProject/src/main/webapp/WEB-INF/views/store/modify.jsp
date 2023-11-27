<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Store Modify</title>
</head>
<body class="bodyContainer">
<jsp:include page="../common/header.jsp" />
<c:set value="${sdto.pvo }" var="svo" />
<form action="/store/modify" method="post" enctype="multipart/form-data">
<input type="hidden" name="proBno" value="${svo.proBno }">
<input type="hidden" name="proCategory" value="store">
<select name="proMenu" id="proMenu">
	<option value="unselect" disabled="disabled" selected="selected">선택</option>
	<option value="과외/클래스" ${svo.proMenu eq '과외/클래스' ? 'selected' : '' }>과외/클래스</option>
	<option value="반려동물" ${svo.proMenu eq '반려동물' ? 'selected' : '' }>반려동물</option>
	<option value="병원/약국" ${svo.proMenu eq '병원/약국' ? 'selected' : '' }>병원/약국</option>
	<option value="뷰티샵" ${svo.proMenu eq '뷰티샵' ? 'selected' : '' }>뷰티샵</option>
	<option value="세탁소" ${svo.proMenu eq '세탁소' ? 'selected' : '' }>세탁소</option>
	<option value="수리" ${svo.proMenu eq '수리' ? 'selected' : '' }>수리</option>
	<option value="운동" ${svo.proMenu eq '운동' ? 'selected' : '' }>운동</option>
	<option value="육아" ${svo.proMenu eq '육아' ? 'selected' : '' }>육아</option>
	<option value="음식점" ${svo.proMenu eq '음식점' ? 'selected' : '' }>음식점</option>
	<option value="이사/용달" ${svo.proMenu eq '이사/용달' ? 'selected' : '' }>이사/용달</option>
	<option value="인테리어 시공" ${svo.proMenu eq '인테리어 시공' ? 'selected' : '' }>인테리어 시공</option>
	<option value="청소" ${svo.proMenu eq '청소' ? 'selected' : '' }>청소</option>
	<option value="취미" ${svo.proMenu eq '취미' ? 'selected' : '' }>취미</option>
	<option value="카페/디저트" ${svo.proMenu eq '카페/디저트' ? 'selected' : '' }>카페/디저트</option>
</select>
<input type="text" name="proTitle" id ="title" value="${svo.proTitle }">
<textarea class="form-control" name="proContent" id="content" rows="20">
${svo.proContent }
</textarea>

<div id="menuContainer">
업체의 메뉴를 등록해주세요
<button type="button" id="addMenu">추가</button>
<ul id="menuList">
	<c:set value="${sdto.mlist }" var="mlist"></c:set>
	<c:if test="${not empty mlist}">
		<c:forEach items="${mlist}" var="mvo">
            <li>
               	메뉴 : <input type="text" name="menus" value="${mvo.strMenu}">
       			가격 : <input type="text" name="prices" value="${mvo.strPrice}">
       			설명 : <input type="text" name="explains" value="${mvo.strExplain}">
       			<button type="button" id="delMenu" data-id="${mvo.strMenuId}" class="menu-x">삭제</button>
            </li>
        </c:forEach>
	</c:if>
</ul>
</div>

<!-- 파일 표시란 -->
 <c:set value="${sdto.flist }" var="flist"></c:set>
 <div>
 	<ul>
 		<c:forEach items="${flist }" var="fvo">
 			<li >
 				<c:choose>
 					<c:when test="${fvo.fileType > 0 }">
 						<div>
 							<img alt="" src="/upload/product/${fn:replace(fvo.saveDir,'\\','/')}/${fvo.uuid}_th_${fvo.fileName}">
 						</div>
 					</c:when>
 				</c:choose>
 				<div>
 					<button type="button" data-uuid="${fvo.uuid }" class="file-x">X</button>
 				</div>
 			</li>
 		</c:forEach>
 	</ul>
 </div>

<input type="file" name="files" id="files" accept="image/*" style="display:none;" multiple="multiple">
<button type="button" id="trigger">사진 첨부</button>
<div id="fileZone">
<!-- 이미지 미리보기 -->
</div>
<button type="submit" id="regBtn">수정</button>
</form>
<script type="text/javascript" src="/resources/js/storeBoardRegister.js"></script>
<script type="text/javascript" src="/resources/js/storeBoardModify.js"></script>
<jsp:include page="../common/footer.jsp" />
</body>
</html>