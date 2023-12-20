<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.pContent {
    margin: 0 0 20px;
    line-height: 1.5;
}

.tabmenu {
	/*min-width: 320px; */
   /*  max-width: 1280px; */
    /* padding: 50px; */
    margin: 0 auto;
    background: #ffffff;
 }

.sc {
    display: none;
    padding: 20px 0 0;
    border-top: 1px solid #eee;
}

/*라디오버튼 숨김*/
.inputs {
	display: none;
}

label {
    display: inline-block;
    margin: 0 0 -1px -3.7px;
    /* padding: 15px 20px; */
    height: 50px;
    line-height: 50px;
    text-align: center;
    color: rgb(136, 136, 136);
    border: 1px solid transparent;
    width: 256.7px;
    font-size: 14px;
    background-color: rgba(242, 242, 242, 0.5);
}

label:hover {
	cursor: pointer;
}

/*input 클릭시, label 스타일*/
input:checked + label {
    color: black;
    border: 1px solid #eee;
    border-top: 1px solid #eee;
    border-bottom: 1px solid #ffffff;
    font-weight: 600;
    font-size: 14px;
     background-color: #ffffff;
}

#tab1:checked ~ #tabCon1,
#tab2:checked ~ #tabCon2,
#tab3:checked ~ #tabCon3,
#tab4:checked ~ #tabCon4,
#tab5:checked ~ #tabCon5 {
    display: block;
}
</style>

</head>
<body>
<div class="tabmenu">
    <input class="inputs" id="tab1" type="radio" name="tabs" checked> <!--디폴트 메뉴-->
    <label for="tab1">판매상품</label>

    <input class="inputs" id="tab2" type="radio" name="tabs">
    <label for="tab2">받은후기</label>

    <input class="inputs" id="tab3" type="radio" name="tabs">
    <label for="tab3">구매내역</label>

    <input class="inputs" id="tab4" type="radio" name="tabs">
    <label for="tab4">동네생활</label>
    
    <input class="inputs" id="tab5" type="radio" name="tabs">
    <label for="tab5">관심목록</label>

    <section class="sc" id="tabCon1">
        tab menu1
    </section>

    <section class="sc" id="tabCon2">
        tab menu2
    </section>

    <section class="sc" id="tabCon3">
        tab menu3
    </section>

    <section class="sc" id="tabCon4">
        tab menu4
    </section>
    
	<section class="sc" id="tabCon5">
	    tab menu5
	</section>
</div>    
</body>
</html>