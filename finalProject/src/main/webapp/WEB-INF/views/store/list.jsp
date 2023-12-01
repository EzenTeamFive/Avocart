<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Store List</title>
<link rel="stylesheet" href="../resources/css/page.css">
<link rel="stylesheet" href="../resources/css/storeBoardList.css">
</head>
<body class="bodyContainer">
<jsp:include page="../common/header.jsp" />
<a href="/store/register">register</a>

<!-- 카테고리 버튼 -->
<button type="button" id="all" value="null">전체</button>
<button type="button" id="lesson" value="lesson">과외/클래스</button>
<button type="button" id="pet" value="pet">반려동물</button>
<button type="button" id="hospital" value="hospital">병원/약국</button>
<button type="button" id="beauty" value="beauty">뷰티샵</button>
<button type="button" id="laundry" value="laundry">세탁소</button>
<button type="button" id="repair" value="repair">수리</button>
<button type="button" id="sports" value="sports">운동</button>
<button type="button" id="infant" value="infant">육아</button>
<button type="button" id="eatery" value="eatery">음식점</button>
<button type="button" id="move" value="move">이사/용달</button>
<button type="button" id="interior" value="interior">인테리어 시공</button>
<button type="button" id="cleaning" value="cleaning">청소</button>
<button type="button" id="hobby" value="hobby">취미</button>
<button type="button" id="dessert" value="dessert">카페/디저트</button>

<!-- list 시작 -->
<div class="listContainer">
   <ul id="ulZone">
       <c:forEach items="${list}" var="pvo">
           <li id="liZone">
               <a href="/store/detail?bno=${pvo.proBno }">
                  <div>
                     <div>
                        <img class="thumbnail">
                     </div>
                  </div>
                  <div>
                     <div>
                         <span class="title">${pvo.proTitle }</span>
                         <span class="gray">${pvo.proEmd }</span>
                  </div>
                      <span class="content">${pvo.proContent }</span>
                      <span class="gray">${pvo.proMenu }</span>
                   </div>
               </a>
           </li>
       </c:forEach>
   </ul>
</div>

<!-- 페이징 더보기 버튼 -->
<div class="commentContainer">
   <div>
      <div>
         <button type="button" id="moreBtn" data-page="1" style="visibility:hidden;">더보기</button>
      </div>
   </div>
</div>
<script src="/resources/js/storeBoardList.js"></script>
<script type="text/javascript">
getStoreList();
</script>
<jsp:include page="../common/footer.jsp"  />
</body>
</html>