// 정렬 할 때 쓸 메뉴값 가져오기 
let likeListcategory = document.getElementById('commuLikeListSelect').value;
console.log(likeListcategory);


// select menu 변경 시 이벤트 처리
document.getElementById('commuLikeListSelect').addEventListener('change', ()=>{
    // 선택된 메뉴 값 가져오기
    likeListcategory = document.getElementById('commuLikeListSelect').value;
    console.log("likeListcategory >> " + likeListcategory);

    spreadLikeListFromServer(1 , likeListcategory);
});

// more 버튼 클릭 시 호출될 함수
async function loadMore() {
    console.log("더보기 클릭");
    console.log(document.getElementById('moreBtn').dataset.page);
    const currentPage = parseInt(document.getElementById('moreBtn').dataset.page);
    console.log("currentPage >> " + currentPage);

    spreadLikeListFromServer(currentPage, likeListcategory);

}


// 서버에서 Like List랑 product List가져오기
async function getLikeListForServer(page, likeListcategory){
    try {
        const resp = await fetch('/myList/likeList/'+page+'/'+likeListcategory);
        const result = await resp.json();
        console.log(result);
        return result;
    } catch (error) {
        console.log(error);
    }
}



// 썸네일 가져오는 함수
async function getThumbnailToServer(proBno){
    try {
        const url = '/myList/likeList/thumb/'+proBno;
        const config = {
            method : 'post'
        };
        const resp = await fetch(url, config);
        const result = await resp.json();
        return result;

    } catch (error) {
        console.log(error);
    }
}

// 숫자를 통화 형식으로 변환하는 함수 (원 표시용)
function formatCurrency(amount) {
    // toLocaleString 메서드를 사용하여 숫자를 통화 형식으로 변환
    return amount.toLocaleString('ko-KR', { style: 'currency', currency: 'KRW' });
    // 통화 기호(₩) 제거
    formattedAmount = formattedAmount.replace('₩', '');
}


// 서버에서 받은 list 뿌리기
async function spreadLikeListFromServer(page = 1, likeListcategory){
    try {
        const result = await getLikeListForServer(page, likeListcategory);
        console.log("result >> " , result);

        // ph객체의 의 리스트에 상품(job)이 있는 경우
        if(result.prodList.length > 0){
            let moreLikeArea = document.getElementById('moreLikeArea');
            if(page == 1) {
                // 1page에서 초기화
                moreLikeArea.innerHTML = "";
            }
            
            for(let like of result.prodList){
                let inner = `<div class="likeListContent">`;
                document.getElementById('likeCnt').innerHTML = `${result.totalCount}`;
                inner += `<a href="/${like.proCategory}`;
                if(like.proCategory == 'store'){
                    inner += `/detail?bno=${like.proBno}">`;
                }else {
                    inner += `/detail?proBno=${like.proBno}">`;
                }
                if (like.proFileCnt > 0) {
                    let thumb = await getThumbnailToServer(like.proBno);
                    inner += `<img alt="job image error" src="../upload/product/${thumb.saveDir.replaceAll('\\','/')}/${thumb.uuid}_${thumb.fileName}">`;
                }else{
                    inner += `<img alt="job image error" src="../resources/image/logoimage.png">`
                }
                inner += `<div class="likeInfoArea">`;
                inner += `<span class="proTitle">${like.proTitle}</span>`;
                inner += `<span><strong class="payment">`;
                if(like.proPayment){
                    inner += `${like.proPayment} `;
                }
                inner += `${formatCurrency(like.proPrice).replace('₩', '')} 원</strong></span>`;
                for (let i = 0; i < result.likeList.length; i++) {
                    if (result.likeList[i].liBno == like.proBno) {
                        const likeTime = new Date(result.likeList[i].liRegAt);
                        const currentTime = new Date();
                        const timeDiffInSeconds = Math.floor((currentTime - likeTime) / 1000); // 차이를 초 단위로 계산

                        let timeAgo;
                        const dateFormatOptions = { year: 'numeric', month: 'long', day: 'numeric' };

                        // liRegAt의 날짜만 가져오기
                        const formattedDate = likeTime.toLocaleDateString('ko-KR', dateFormatOptions);

                        if (timeDiffInSeconds < 60) {
                            timeAgo = `${timeDiffInSeconds}초 전`;
                        } else if (timeDiffInSeconds < 3600) {
                            const minutes = Math.floor(timeDiffInSeconds / 60);
                            timeAgo = `${minutes}분 전`;
                        } else if (timeDiffInSeconds < 86400) {
                            const hours = Math.floor(timeDiffInSeconds / 3600);
                            timeAgo = `${hours}시간 전`;
                        } else {
                            const days = Math.floor(timeDiffInSeconds / 86400);
                            timeAgo = `${days}일 전`;
                        }
                        // 찜한 날짜표시... 일단 생략
                        // inner += `<span>${formattedDate}</span>`;
                        inner += `<span class="proAddr"> ${timeAgo}</span>`;
                    }
                }
   
                inner += `</div>`;
                inner += `<div class="likeInfoAddr">`;
                inner += `<i class="bi bi-geo-alt"></i><span class="d-inline-block text-truncate" style="max-width: 200px;">`;
                if(like.proCategory == 'store'){
                    let lastSpaceIndex = like.proFullAddr.lastIndexOf(' ');
                    if (lastSpaceIndex !== -1) {
                        proFullAddr = like.proFullAddr.substring(0, lastSpaceIndex);
                    }
                    inner += `<span class="proAddr">${proFullAddr}</span>`;
                }else {
                    inner += `<span class="proAddr">${like.proSido} ${like.proSigg} ${like.proEmd}</span>`;
                }
                
                inner += `</div>`;
                inner += `</a>`;
                inner += `<div class="likeHeart">`;
                inner += `<input type="hidden" value="${like.proBno}" class="proBno">`;
                for(let lilist of result.likeList){
                    inner += `<input type="hidden" value="${lilist.liUserId}" class="liUserId">`;
                }
                inner += `<i class="bi bi-heart-fill likeBtn" id="likeBtn"></i><span> ${like.proLikeCnt}</span>`;
                inner += `</div>`;
                inner += `</div>`;

                moreLikeArea.innerHTML += inner;
            }

        }else {
            let inner = `찜 한 게시글이 없습니다.`;
            moreLikeArea.innerHTML = inner;
        }

        let moreBtn = document.getElementById('moreBtn');

        
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

// 찜하기버튼 클릭시 발생
document.addEventListener('click',(e)=>{
    console.log("찜클릭 " ,e.target);

    // 찜버튼 클릭시 state값 -1, 버튼의 class값 바꿔서 빈 하트로 변경
    if (e.target.classList.contains('likeBtn')) {
        let likeBtn = e.target.closest('.likeHeart');
        let proBnoVal = likeBtn.querySelector('.proBno').value;
        let liUserId = likeBtn.querySelector('.liUserId').value;
        console.log(proBnoVal + "/" + liUserId);
        likeToServer(proBnoVal, liUserId, -1); 

        spreadLikeListFromServer();
    }

})


async function likeToServer(proBnoVal, memEmail, state) { 
    try {
        const url = "/job/list/like";
        const config = {
            method: "post",
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({
                liBno: proBnoVal,
                liUserId: memEmail,
                liStatus: state
            })
        };
        const resp = await fetch(url, config);
        const result = await resp.text();
        return result; 
    } catch (err) {
        console.log(err);
    }
}
spreadLikeListFromServer();