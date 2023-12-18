<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.chatingSec{
		background-color: #f6f6f6;
		display: flex;
		justify-content: center;
	}
	.chatingSec > div{
		background-color: #fff;
		width: 520px;
		height: calc(100vh - 200px);
		box-shadow: 0px 0px 1px rgba(80,80,80,0.2);
		overflow: auto;
		position: relative;
	}
	.chatingSec .messages{
		overflow: auto;
		height: calc(100% - 40px);
	}
	.chatingSec .inputArea{
		position: absolute;
		bottom: 0;
		width: 100%;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<jsp:include page="../common/header.jsp" />
<body>
<div class="chatingSec">
	<div>
		<h2>채팅 목록</h2>
		<c:if test="${!empty chatList}">
			<c:forEach items="${chatList}" var="list">
		        <button type="button" onclick="openSocket(${list.chatRoomId});">${list.chatRoomId} 대화방 참여</button>				
			</c:forEach>
		</c:if>
        <button type="button" onclick="closeSocket();">대회방 나가기</button>
  		
    </div>
    <div>
	    <div id="messages" class="messages">
	    	메세지
	    </div>
	    <div class="inputArea">
			<sec:authorize access="isAuthenticated()">
				<sec:authentication property="principal.mvo.memEmail" var="authEmail"/>
				<sec:authentication property="principal.mvo.memNickName" var="authNickName"/>
		        <input type="text" id="senderEmail" value="${authEmail}" style="display: none;">
		        <input type="text" id="senderNick" value="${authNickName}" style="display: none;">
	        </sec:authorize>
	        <input type="text" id="messageinput">
	        <button type="button" onclick="send();">메세지 전송</button>
	        <button type="button" onclick="javascript:clearText();">대화내용 지우기</button>
	    </div>
    </div>
</div>
</body>
<jsp:include page="../common/footer.jsp" />
<script type="text/javascript" src="/resources/js/chating.js"></script>
</html>