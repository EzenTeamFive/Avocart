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


//특정 게시글 thumbnail 가져오는 함수
async function getCommuThumbnailToServer(bno){
    try {
        const resp = await fetch('/community/thumb/'+bno);
        const result = await resp.json();
        return result;
    } catch (error) {
        console.log(error);
    }
}

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
            let inner = "";

            for(let cm of result.cmList){
                // cmRegAt 날짜만 가져오기
                let upDate = cm.cmRegAt.substring(0,10);
                console.log("타입 " + result.pgvo.type + "으로 진입");
                inner += `<a href="/community/detail?cmBno=${cm.cmBno}">`;
                inner += `<div class="commuListContent">`;
                document.getElementById('commuListCnt').innerText = `${result.totalCount}`;

                let cmBno = cm.cmBno;
                if (cm.cmFileCnt > 0) {
                    let thumb = await getCommuThumbnailToServer(cmBno);
                    inner += `<img class="thumbImg" src="/upload/community/${thumb.saveDir.replaceAll('\\','/')}/${thumb.uuid}_${thumb.fileName}"  alt="...">`;
                }else{
                     inner += `<img alt="commuList image error" src="../resources/image/logoimage.png">`
                }
                inner += `<div class="contentWrap">`;
                inner += `<h3>${cm.cmTitle}</h3>`;
                inner += `<b>${cm.cmContent}</b>`;
                inner += `<small>${upDate}</small>`;
                inner += `</div>`;
                inner += `<mark><i class="bi bi-geo-alt"></i>${cm.cmSido}${cm.cmSigg}${cm.cmEmd}</mark>`;
                inner += `<input type="hidden" value="${cm.proBno}" class="proBno">`;
                inner += `<input type="hidden" value="${cm.cmEmail}" class="cmUserId">`;
                // inner += `<div>`;
                // inner += `<p id="cmLikeCnt">${bvo.cmLikeCnt }</p>`;
                // inner += `<i class="bi bi${checkLike > 0 ? '-heart-fill' : '-heart' }" id="likeBtn"></i><span> ${like.proLikeCnt}</span>`;
                // inner += `</div>`;
                inner += `</div>`;
                inner += `</a>`;


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

// //좋아요 버튼 클릭시
// document.getElementById('likeBtn').addEventListener('click', ()=>{
// 	let currentLikeCount = parseInt(document.getElementById('cmLikeCnt').innerText);
//     let bnoVal = likeBtn.querySelector('.proBno').value;
//     let userEmail = likeBtn.querySelector('.liUserId').value;
//     console.log(bnoVal + "/" + userEmail);

// 	if(!(userEmail)){
// 		alert('로그인을 해주세요.');
// 	}

// 	if(userEmail){
// 	    if(document.getElementById('likeBtn').classList.contains('bi-heart')){ //안 누른 상태면
// 	        console.log("좋아요 등록");
// 	        document.getElementById('likeBtn').classList.replace('bi-heart', 'bi-heart-fill');
// 			document.getElementById('cmLikeCnt').innerText = currentLikeCount + 1;
// 	        likeToServer(bnoVal, userEmail);
// 	    }else if(document.getElementById('likeBtn').classList.contains('bi-heart-fill')){ //이미 누른 상태면
// 	        console.log("좋아요 취소"); 
// 	        document.getElementById('likeBtn').classList.replace('bi-heart-fill', 'bi-heart');
// 			document.getElementById('cmLikeCnt').innerText = currentLikeCount - 1;
// 	        likeToServer(bnoVal, userEmail);

// 	    }
// 	}    
// })

//좋아요 정보 보내주기
async function likeToServer(bno, email){ 
    try{
        const url = '/community/'+bno+'/'+email;
        const config = {
            method : "post"
        };
        const resp = await fetch(url, config);
        const result = await resp.text();
        return result; 
        
    }catch(err){
        console.log(err);
    }
}

spreadCommuListFromServer();

