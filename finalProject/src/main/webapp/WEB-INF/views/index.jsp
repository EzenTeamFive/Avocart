<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
<meta charset="UTF-8">
<title>Avocart</title>
<style type="text/css">
	.bodyContainer{
		display: flex;
		justify-content: center;
	}
	.bannerContainer{
		width: 80%;
		margin: 40px 0;
		display: flex;
		justify-content: center;
	}
	.bannerImg{
		width: 1280px;
		height: 250px;
	}
</style>
</head>
<body>
<jsp:include page="./common/header.jsp" />

<div class="bodyContainer">

<div class="bannerContainer">
	<img class="bannerImg" alt="" src="/resources/image/bannerTest1.jpg">
</div>

</div>

<jsp:include page="./common/footer.jsp" />
</body>
</html>
