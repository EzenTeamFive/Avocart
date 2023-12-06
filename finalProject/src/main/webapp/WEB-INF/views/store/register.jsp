<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Store Register</title>
</head>
<body class="bodyContainer">
<jsp:include page="../common/header.jsp" />
<form action="/store/register" method="post" enctype="multipart/form-data">
<input type="hidden" name="proCategory" value="store">
<select name="proMenu" id="proMenu">
	<option value="unselect" disabled="disabled" selected="selected">선택</option>
	<option value="과외/클래스">과외/클래스</option>
	<option value="반려동물">반려동물</option>
	<option value="병원/약국">병원/약국</option>
	<option value="뷰티샵">뷰티샵</option>
	<option value="세탁소">세탁소</option>
	<option value="수리">수리</option>
	<option value="운동">운동</option>
	<option value="육아">육아</option>
	<option value="음식점">음식점</option>
	<option value="이사/용달">이사/용달</option>
	<option value="인테리어 시공">인테리어 시공</option>
	<option value="청소">청소</option>
	<option value="취미">취미</option>
	<option value="카페/디저트">카페/디저트</option>
</select>
<input type="text" name="proTitle" id="title" placeholder="업체명">
<textarea placeholder="내용" class="form-control" name="proContent" id="content" rows="20"></textarea>

<div id="menuContainer">
업체의 메뉴를 등록해주세요
<button type="button" id="addMenu">추가</button>
<ul id="menuList">
</ul>
</div>

<div id="menuZone">
<!-- 메뉴 보기 -->
</div>

<input type="file" name="files" id="files" accept="image/*" style="display:none;" multiple="multiple">
<button type="button" id="trigger">사진 첨부</button>
<div id="fileZone">
<!-- 이미지 미리보기 -->
</div>
<button type="submit" id="regBtn">등록</button>
</form>
<script type="text/javascript" src="/resources/js/storeBoardRegister.js"></script>
<jsp:include page="../common/footer.jsp" />
</body>
</html>