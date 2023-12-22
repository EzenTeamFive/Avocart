// 정렬 할 때 쓸 메뉴값 가져오기 
let category = document.getElementById('menuSelect').value;
console.log(category);


// select menu 변경 시 이벤트 처리
document.getElementById('menuSelect').addEventListener('change', ()=>{
    // 선택된 메뉴 값 가져오기
    category = document.getElementById('menuSelect').value;
    console.log("category >> " + category);

    spreadLikeListFromServer(1 , category);
});

// more 버튼 클릭 시 호출될 함수
async function loadMore() {
    console.log("더보기 클릭");
    console.log(document.getElementById('moreBtn').dataset.page);
    const currentPage = parseInt(document.getElementById('moreBtn').dataset.page);
    console.log("currentPage >> " + currentPage);

    spreadLikeListFromServer(currentPage, category);

}


// 서버에서 Like List랑 product List가져오기
async function getLikeListForServer(page, category){
    try {
        const resp = await fetch('/likeList/likeList/'+page+'/'+category);
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
        const url = '/likeList/likeList/thumb/'+proBno;
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
async function spreadLikeListFromServer(page = 1, category){
    try {
        const result = await getLikeListForServer(page, category);
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
                inner += `<span>${like.proTitle}</span>`;
                inner += `<span>`;
                if(like.proPayment){
                    inner += `${like.proPayment} `;
                }
                inner += `<strong>${formatCurrency(like.proPrice).replace('₩', '')} </strong>원</span>`;
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

                        inner += `<span>${formattedDate}</span>`;
                        inner += `<span> ${timeAgo}</span>`;
                    }
                }
   
                inner += `</div>`;
                inner += `<div class="likeInfoAddr">`;
                inner += `<i class="bi bi-geo-alt-fill"></i><span class="d-inline-block text-truncate" style="max-width: 200px;">`;
                if(like.proCategory == 'store'){
                    let lastSpaceIndex = like.proFullAddr.lastIndexOf(' ');
                    if (lastSpaceIndex !== -1) {
                        proFullAddr = like.proFullAddr.substring(0, lastSpaceIndex);
                    }
                    inner += `${proFullAddr}</span>`;
                }else {
                    inner += `${like.proSido} ${like.proSigg} ${like.proEmd}</span>`;
                }
                
                inner += `</div>`;
                inner += `</a>`;
                inner += `<div class="likeHeart">`;
                inner += `<input type="hidden" value="${like.proBno}" class="proBno">`;
                inner += `<input type="hidden" value="${like.proEmail}" class="proEmail">`;
                inner += `<i class="bi bi-heart-fill" id="likeBtn"></i><span> ${like.proLikeCnt}</span>`;
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
    console.log(e.target);
    //like 여부 지정하는 변수
    let state = 1;

    // 찜버튼 클릭시 state값 -1, 버튼의 class값 바꿔서 빈 하트로 변경
    if (e.target.classList.contains('bi-heart-fill')) {
        let likeBtn = e.target.closest('.likeHeart');
        let proBnoVal = likeBtn.querySelector('.proBno').value;
        let memEmail = likeBtn.querySelector('.proEmail').value;
        state = -1;
        likeBtn.querySelector('i').classList.replace('bi-heart-fill', 'bi-heart');
        likeToServer(proBnoVal, memEmail, state); 

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