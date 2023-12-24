document.addEventListener('click',(e)=>{
    // 메뉴 클릭시
    if (e.target.classList.contains("menu")) {
        console.log("메뉴 클릭");
        // 모든 메뉴 버튼에서 'choiceMenu' 클래스를 제거
        document.querySelectorAll('.menu').forEach(type => {
            type.classList.remove('choiceMenu');
        });

        // 클릭된 메뉴 버튼에 'choiceMenu' 클래스 추가
        e.target.classList.add('choiceMenu');

        // 나머지 코드는 그대로 유지
        type = e.target.textContent;
        getMoreBoard(1, type);
    }
    //더보기 버튼 클릭시
    if(e.target.id == 'moreBtn'){
        getMoreBoard(parseInt(e.target.dataset.page), type);
    }

})

//서버에 board 데이터 요청
async function getMoreBoardForServer(page, type){
try {
    const resp = await fetch('/myList/commuList/'+page+'/'+type);
    const result = await resp.json();
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


//서버에 요청한 데이터로 board 출력
async function getMoreBoard(page = 1, type) {
try {
    const result = await getMoreBoardForServer(page, type);
    console.log(result);

    console.log("타입 >> " + result.pgvo.type);

    if(result.cmList.length > 0) {
        let moreListArea = document.getElementById('moreListArea'); 
        if(page == 1) {
            // 1page에서 초기화
            moreListArea.innerHTML = "";
        }

        for(let cm of result.cmList){
            let inner = `<div class="likeListContent">`;
            document.getElementById('likeCnt').innerText = `${result.totalCount}`;
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
                inner += `${cm.cmSido} ${cm.cmSigg} ${cm.cmEmd}</span>`;
            }
            
            inner += `</div>`;
            inner += `</a>`;
            inner += `<div class="likeHeart">`;
            inner += `<input type="hidden" value="${cm.cmBno}" class="proBno">`;
            inner += `<input type="hidden" value="${cm.cmEmail}" class="proEmail">`;
            inner += `<i class="bi bi-heart-fill" id="likeBtn"></i><span> ${cm.cmLikeCnt}</span>`;
            inner += `</div>`;
            inner += `</div>`;

            moreListArea.innerHTML += inner;
        }

    }else {
        
        if(result.pgvo.type == '관심글') {
            let inner = `찜 한 게시글이 없습니다.`;
        }
        if(result.pgvo.type == '작성글') {
            let inner = `작성 한 게시글이 없습니다.`;
        }
        moreListArea.innerHTML = inner;
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

// 찜하기정보 서버로 보내기
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