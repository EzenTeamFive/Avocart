<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.form-floating > textarea.form-control{
	height: 250px;
}

</style>
</head>
<body>
<jsp:include page="../common/header.jsp" />
<div class="bodyContainer">
	<h2> 중고거래 </h2>
	<p> 기본 정보 </p>
	<form action="/joongo/register" method="post">
		<input type="hidden" name="proEmail" value="joongoEmail@email">
		<input type="hidden" name="proNickName" value="joongoJY">
		<input type="hidden" name="proCategory" value="joongo">
		<div class="form-floating">
			<input type="text" class="form-control" id="title" name="proTitle" required="required">
			<label for="title">Title</label>
		</div>
		<div class="input-group mb-3">
		  <span class="input-group-text">&#8361;</span>
		  <div class="form-floating">
		    <input type="number" class="form-control" id="price" name="proPrice" placeholder="price" required="required">
		    <label for="price">Price</label>
		  </div>
		</div>
		<div class="form-floating">
			<jsp:include page="menuSelect.jsp"/>
			<label for="menu">카테고리</label>
	    </div>
		<div class="form-floating">
			<textarea class="form-control" id="content" name="proContent" required="required"></textarea>
			<label for="content">Content</label>
		</div>
		<button type="submit" class="btn btn-success">등록</button>
	</form>
</div>
<jsp:include page="../common/footer.jsp" />
</body>
</html>