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
	}
	.chatingSec > div{
		background-color: #fff;
		width: 500px;
		height: calc(100vh - 200px);
		box-shadow: 0px 0px 1px rgba(80,80,80,0.2);
		overflow: auto;
		position: relative;
	}
	.chatRoomList{
		padding-top: 20px;
	}
	.chatRoomList h2{
		font-weight: 700;
		margin-left: 15px;
	}
	.chatRoomList > div{
		width: 100%;
		height: 80px;
		padding: 15px 15px;
	}
	.chatRoomList > div:hover{
		background-color: #f9f9f9;
	}
	.chatRoomList > div img{
		width: 50px;
		height: 50px;
		border-radius: 25px;
		margin-right: 10px;
		object-fit: cover;
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
		height: calc(100% - 120px);
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
		height: 50px;
		width: 100%;
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
		        <div class="chatListArea" data-getuser="${list.msgGetUserEmail }" data-chatroom="${list.crvo.chatRoomId}">
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
		        	
		        </div>			
			</c:forEach>
		</c:if>
  		
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
	        <input type="text" id="messageinput">
	        <button type="submit" onclick="send();">메세지 전송</button>
	    </div>
    </div>
</div>
</body>
<jsp:include page="../common/footer.jsp" />
<script type="text/javascript" src="/resources/js/chating.js"></script>
</html>