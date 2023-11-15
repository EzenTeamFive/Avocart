<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Community Register</title>
</head>
<body>
<jsp:include page="../common/header.jsp" />

<form action="/community/register" method="post">
	<input type="hidden" name="cmEmail" value="kang@naver.com">
	<input type="hidden" name="cmNickName" value="kang">
	
	<select name="cmMenu">
	    <option value="일상">일상</option>
	    <option value="모임">모임</option>
	    <option value="동네소식">동네소식</option>
	    <option value="동네질문">동네질문</option>
	    <option value="생활정보">생활정보</option>
	    <option value="해주세요">해주세요</option>
	    <option value="동네사진전">동네사진전</option>
	    <option value="분실/실종센터">분실/실종센터</option>
    </select>
	<input type="text" name="title" placeholder="제목을 입력하세요">
	<textarea rows="3" cols="30" placeholder="근처 이웃과 동네에서의 소소한 일상, 정보를 공유해보세요"></textarea>
	
	<button type="submit">등록</button>
</form>

<jsp:include page="../common/footer.jsp" />
</body>
</html>