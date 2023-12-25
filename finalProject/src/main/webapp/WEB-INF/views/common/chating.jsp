<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.chatingSec{
		font-family: 'suit';
		background-color: #f6f6f6;
		display: flex;
		justify-content: center;
		position: relative;
	}
	.chatingSec > div:not(:nth-child(2)){
		background-color: #fff;
		width: 500px;
		height: calc(100vh - 200px);
		box-shadow: 0px 0px 1px rgba(80,80,80,0.2);
		overflow: auto;
		position: relative;
	}
	.chatRoomList{
		padding-top: 25px;
	}
	.chatRoomList h2{
		font-weight: 700;
		margin-left: 20px;
	}
	.chatListArea{
		width: 100%;
		height: 80px;
		padding: 15px 15px;
	    display: grid;
	    justify-content: start;
	}
	.chatListArea:hover{
		background-color: #f9f9f9;
	}
	.chatListArea img{
		width: 50px;
		height: 50px;
		border-radius: 25px;
		margin-right: 10px;
		object-fit: cover;
		grid-row: 1/3;
	}
	.chatListArea b{
    	grid-column: 2;
    }
	.chatListArea p{
	    margin: 0;
	    color: #ccc;
	    font-size: 14px;
    }
	.waitingPage{
		position: absolute;
	    display: flex;
	    flex-direction: column;
	    justify-content: center;
	    align-items: center;
	    width: 500px;
	    height: 100%;
	    z-index: 10;
	    left: 50%;
	    background-color: #fff;
	}
	.waitingPage img{
		opacity: 0.2;
	}
	.messageHeader{
		height: 70px;
		border-bottom: 1px solid #efefef;
		padding: 10px 15px;
	}
	.messageHeader p{
		margin-bottom: 0;
	}
	.messages{
		overflow: auto;
		height: calc(100% - 130px);
		padding: 15px;
	}
	.messages > div > div{
		display: inline-block;
		padding: 10px;
		box-sizing: border-box;
		margin-bottom: 10px;
		border-radius: 5px;
	}
	.messages .left div{
		margin-right: 50px;
		box-shadow: 0 0 2px rgba(80,80,80,0.5);
	}
	.messages .right{
		text-align: right;
	}
	.messages .right div{
		background-color: #d3d3d3;
		margin-left: 50px;
		text-align: left;
	}
	.inputArea{
		position: absolute;
	    bottom: 0;
	    height: 60px;
	    width: 100%;
	    display: flex;
	    align-content: center;
	    flex-wrap: wrap;
	    border-top: 1px solid #f5f5f5;
	    justify-content: center;
	}
	.inputArea > input{
		width: 480px;
	    height: 50px;
	    border-radius: 25px;
	    border: 0;
	    background-color: #fafafa;
	    font-size: 14px;
	    padding: 0 15px;
	    box-sizing: border-box;
	}
	.inputArea > button{
		position: absolute;
	    right: 15px;
	    top: 10px;
		width: 40px;
		height: 40px;
		border: 0;
	    border-radius: 20px;
	    background-color: #93b336;
	    color: #fff;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<jsp:include page="../common/header.jsp" />
<body>
<div class="chatingSec">
	<div class="chatRoomList">
		<h2>채팅 목록</h2>
		<c:if test="${!empty chatdtoList}">
			<c:forEach items="${chatdtoList}" var="list">
		        <div class="chatListArea" data-chatroom="${list.crvo.chatRoomId}">
		        	<input type="hidden" value="${list.msgGetUserEmail}">
		        	<input type="hidden" value="${list.msgGetUserNick}">
		        	<input type="hidden" value="${list.boardTitle}">
		        	<!-- 프로필 이미지 -->
		        	<c:choose>
		        	<c:when test="${list.profileImage eq null}">
		        		<img alt="기본 이미지" src="../resources/image/기본 프로필.png">
		        	</c:when>
		        	<c:otherwise>
		        		<img src="/upload/profile/${fn: replace(list.profileImage.saveDir, '\\', '/')}/${list.profileImage.uuid}_${list.profileImage.fileName}" alt="프로필 이미지">
		        	</c:otherwise>
		        	</c:choose>
		        	<b>${list.msgGetUserNick}</b>
		        	<p>${list.lastMsg }</p>
		        </div>
			</c:forEach>
		</c:if>
    </div>
    <div class="waitingPage">
		<img alt="채팅이미지" src="../resources/image/chat_icon.png">
		<p>여기에서 채팅을 시작해보세요</p>
    </div>
    <div>
    	<div class="messageHeader">
    		<p>닉네임</p>
    		<small>글 제목</small>
    	</div>
	    <div id="messages" class="messages">
	    </div>
	    <div class="inputArea">
			<sec:authorize access="isAuthenticated()">
				<sec:authentication property="principal.mvo.memEmail" var="authEmail"/>
				<sec:authentication property="principal.mvo.memNickName" var="authNickName"/>
		        <input type="text" id="senderEmail" value="${authEmail}" style="display: none;">
		        <input type="text" id="senderNick" value="${authNickName}" style="display: none;">
	        </sec:authorize>
	        <input type="text" id="messageinput" placeholder="메시지를 입력하세요" onkeyup="if(event.keyCode==13){send();}" required="required">
	        <button type="button" onclick="send();"><i class="bi bi-send"></i></button>
	    </div>
    </div>
</div>
</body>
<jsp:include page="../common/footer.jsp" />
<script type="text/javascript" src="/resources/js/chating.js"></script>
</html>