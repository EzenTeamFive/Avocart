<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Find Email</title>
<style type="text/css">
	.bodyContainer{
		display: flex;
		justify-content: center;
		padding: 100px 0 150px 0;
	}
	.innerContainer{
		width: 400px;
	}
	
	.pageName{
	    font-weight: 800;
	    text-align: center;
	    border-bottom: 1px solid black;
	    font-size: 28px;
	    padding: 30px;
	}
	.pageContent{
		font-size: 14px;
	    padding: 10px 0;
	}
	.inputDiv{
		width: 100%;
	}
	.phoneLabel{
	    display: block;
	    font-size: 13px;
	    font-weight: 800;
	}
	.phoneInput{
		border: none;
	    border-bottom: 1px solid #c8c8c8;
	    width: 100%;
	    font-size: 15px;
	    padding: 8px 0;
	}
	.phoneInput::placeholder{
		color: #c8c8c8;
	}
	
	.findBtn{
		width: 100%;
	    height: 50px;
	    color: white;
	    background-color: #5a5a5a;
	    border: none;
	    border-radius: 5px;
	    margin-top: 60px;
	    font-size: 14px;
	}
</style>
</head>
<body>
<jsp:include page="../common/header.jsp" />
<div class="bodyContainer">

<div class="innerContainer">
	<p class="pageName">이메일 찾기</p>
	<p class="pageContent">가입 시 등록한 휴대폰 번호를 입력하면 <br>
						   이메일 주소의 일부를 알려드립니다.</p>
						   
	<div class="inputDiv">
		<label for="phoneNum" class="phoneLabel">휴대폰 번호</label>
		<input id="phoneNum" class="phoneInput" placeholder="가입하신 휴대폰 번호">
	</div>					   

	<button type="button" class="findBtn">이메일 찾기</button>
</div>

</div>
<jsp:include page="../common/footer.jsp" />
<script type="text/javascript" src="/resources/js/findEmail.js"></script>
</body>
</html>