// 정렬 할 때 쓸 메뉴값 가져오기 
let commuListcategory ='commuWriterList';
console.log(commuListcategory);


// select menu 변경 시 이벤트 처리
document.getElementById('commuListSelect').addEventListener('change', ()=>{
    // 선택된 메뉴 값 가져오기
    commuListcategory = document.getElementById('commuListSelect').value;
    console.log("commuListcategory edit >> " + commuListcategory);

    spreadCommuListFromServer(1 , commuListcategory);
});

// more 버튼 클릭 시 호출될 함수
async function loadMore() {
    console.log("더보기 클릭");
    console.log(document.getElementById('commuList').dataset.page);
    const currentPage = parseInt(document.getElementById('commuList').dataset.page);
    console.log("currentPage >> " + currentPage);

    spreadCommuListFromServer(currentPage, commuListcategory);
}


// 서버에서 community Like List랑 community write List가져오기
async function getCommuListForServer(page, commuListcategory){
    try {
        const resp = await fetch('/myList/commuList/'+page+'/'+commuListcategory);
        const result = await resp.json();
        console.log(result);
        return result;
    } catch (error) {
        console.log(error);
    }
}


// // 썸네일 가져오는 함수
// async function getThumbnailToServer(proBno){
//     try {
//         const url = '/myList/likeList/thumb/'+proBno;
//         const config = {
//             method : 'post'
//         };
//         const resp = await fetch(url, config);
//         const result = await resp.json();
//         return result;

//     } catch (error) {
//         console.log(error);
//     }
// }


// 서버에서 받은 list 뿌리기
async function spreadCommuListFromServer(page = 1, commuListcategory){
    try {
        const result = await getCommuListForServer(page, commuListcategory);
        console.log(" commuListForServer >> result >> " , result);

        // ph객체의 의 리스트에 상품(job)이 있는 경우
        if(result.cmList.length > 0){
            let moreCommuListArea = document.getElementById('moreCommuListArea');
            console.log(result.cmList.length);
            if(page == 1) {
                // 1page에서 초기화
                moreCommuListArea.innerHTML = "";
            }
            let inner = ""; // 변경된 부분

            for(let cm of result.cmList){
                console.log("타입 " + result.pgvo.type + "으로 진입");
                inner += `<div class="commuListContent">`;
                document.getElementById('commuListCnt').innerText = `${result.totalCount}`;
                inner += `<img alt="" src="../resources/image/기본 프로필 배경.png">`;
                inner += `<div class="contentWrap">`;
                inner += `<h3>${cm.cmTitle}</h3>`;
                inner += `<b>${cm.cmContent}</b>`;
                inner += `<small>날짜</small>`;
                inner += `</div>`;
                inner += `<mark><i class="bi bi-geo-alt"></i>장소</mark>`;
                inner += `</div>`;

                moreCommuListArea.innerHTML = inner;
            }

        }else {
            if(commuListcategory='commuLikeList'){
                let inner = `좋아요 한 게시글이 없습니다.`;
                moreCommuListArea.innerHTML = inner;
            } else {
                let inner = `작성 한 게시글이 없습니다.`;
                moreCommuListArea.innerHTML = inner;
            }
        }

        let moreBtn = document.getElementById('commuListmoreBtn');

        
        if (result.pgvo.pageNo < result.endPage) {
            moreBtn.style.visibility = 'visible';
            moreBtn.dataset.page = page + 1;
        } else {
            moreBtn.style.visibility = 'hidden';
        }

    } catch (error) {
        console.log(error);
        
    }
}

// // 찜하기버튼 클릭시 발생
// document.addEventListener('click',(e)=>{
//     console.log("찜클릭 " ,e.target);

//     // 찜버튼 클릭시 state값 -1, 버튼의 class값 바꿔서 빈 하트로 변경
//     if (e.target.classList.contains('likeBtn')) {
//         let likeBtn = e.target.closest('.likeHeart');
//         let proBnoVal = likeBtn.querySelector('.proBno').value;
//         let liUserId = likeBtn.querySelector('.liUserId').value;
//         console.log(proBnoVal + "/" + liUserId);
//         likeToServer(proBnoVal, liUserId, -1); 

//         spreadCommuListFromServer();
//     }

// })


// async function likeToServer(proBnoVal, memEmail, state) { 
//     try {
//         const url = "/job/list/like";
//         const config = {
//             method: "post",
//             headers: {
//                 'Content-Type': 'application/json',
//             },
//             body: JSON.stringify({
//                 liBno: proBnoVal,
//                 liUserId: memEmail,
//                 liStatus: state
//             })
//         };
//         const resp = await fetch(url, config);
//         const result = await resp.text();
//         return result; 
//     } catch (err) {
//         console.log(err);
//     }
// }
spreadCommuListFromServer();

