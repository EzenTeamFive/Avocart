// 페이지가 다 로드되면 로딩화면 삭제
window.onload = function() {
    setTimeout(()=> document.getElementById('loading').style.display = 'none', 200);
};

//특정 게시글 thumbnail 가져오는 함수
async function getThumbnailToServer(bno){
    try {
        const resp = await fetch('/thumb/'+bno);
        const result = await resp.json();
        return result;
    } catch (error) {
        console.log(error);
    }
}

//중고거래 최신순
async function getBoardListFromJoongo(){
    try {
        const resp = await fetch('/joongoList');
        const result = await resp.json();
        return result;
    } catch (error) {
        console.log(error);
    }
}
async function spreadJoongoList() {
    try {
        const result = await getBoardListFromJoongo();
        console.log(result);

        if (result.length > 0) {
            let joongoMiddle = document.getElementById('joongoMiddle');
            
            joongoMiddle.innerHTML = "";

            for (let bvo of result) {
                let price = bvo.proPrice.toLocaleString('ko-KR');
                let upDate = bvo.proReAt.substring(0,10);

                let str = `<div class="joongo_item">`;
                str += `<a href="/joongo/detail?proBno=${bvo.proBno}">`;
                if (bvo.proFileCnt > 0) {
                    let thumb = await getThumbnailToServer(bvo.proBno);
                    str += `<img src="/upload/product/${thumb.saveDir.replaceAll('\\','/')}/${thumb.uuid}_${thumb.fileName}"  alt="...">`;
                }else {
                    str += `<img src="../resources/image/logoimage.png" alt="사진 없을 때 띄우는 아보카도">`;
                }

                str += `<div class="joongo_item_detail">`;
                str += `<p>${bvo.proTitle}</p>`;
                str += `<p>${price}원</p>`;
                str += `<p>${bvo.proEmd} | ${upDate}</p>`;

                str += `</div></a></div>`;

                joongoMiddle.innerHTML += str;
            }
        } else {
            let str = `<div class="noBoard">게시글이 존재하지 않습니다.</div>`;
            joongoMiddle.innerHTML = str;
        }

    } catch (error) {
        console.error(error);
    }
}
spreadJoongoList();

//중고거래 인기순
async function getBoardLikeListFromJoongo(){
    try {
        const resp = await fetch('/joongoLikeList');
        const result = await resp.json();
        return result;
    } catch (error) {
        console.log(error);
    }
}
async function spreadJoongoLikeList() {
    try {
        const result = await getBoardLikeListFromJoongo();
        console.log(result);

        if (result.length > 0) {
            let joongoMiddle = document.getElementById('joongoLikeMiddle');
            
            joongoMiddle.innerHTML = "";

            for (let bvo of result) {
                let price = bvo.proPrice.toLocaleString('ko-KR');
                let upDate = bvo.proReAt.substring(0,10);

                let str = `<div class="joongo_item">`;
                str += `<a href="/joongo/detail?proBno=${bvo.proBno}">`;
                if (bvo.proFileCnt > 0) {
                    let thumb = await getThumbnailToServer(bvo.proBno);
                    str += `<img src="/upload/product/${thumb.saveDir.replaceAll('\\','/')}/${thumb.uuid}_${thumb.fileName}"  alt="...">`;
                }else {
                    str += `<img src="../resources/image/logoimage.png" alt="사진 없을 때 띄우는 아보카도">`;
                }

                str += `<div class="joongo_item_detail">`;
                str += `<p>${bvo.proTitle}</p>`;
                str += `<p>${price}원</p>`;
                str += `<p>${bvo.proEmd} | ${upDate}</p>`;

                str += `</div></a></div>`;

                joongoMiddle.innerHTML += str;
            }
        } else {
            let str = `<div class="noBoard">게시글이 존재하지 않습니다.</div>`;
            joongoMiddle.innerHTML = str;
        }

    } catch (error) {
        console.error(error);
    }
}
spreadJoongoLikeList();

//동네업체
async function getBoardListFromStore(){
    try {
        const resp = await fetch('/storeList');
        const result = await resp.json();
        return result;
    } catch (error) {
        console.log(error);
    }
}
async function spreadStoreList() {
    try {
        const result = await getBoardListFromStore();
        console.log(result);

        if (result.length > 0) {
            let storeMiddle = document.getElementById('storeMiddle');
            
            storeMiddle.innerHTML = "";

            for (let bvo of result) {
                let upDate = bvo.proReAt.substring(0,10);

                let str = `<div class="store_item">`;
                str += `<a href="/store/detail?bno=${bvo.proBno}">`;
                str += `<div class="store_item_img">`;
                if (bvo.proFileCnt > 0) {
                    let thumb = await getThumbnailToServer(bvo.proBno);
                    str += `<img src="/upload/product/${thumb.saveDir.replaceAll('\\','/')}/${thumb.uuid}_${thumb.fileName}"  alt="...">`;
                }else {
                    str += `<img src="../resources/image/logoimage.png" alt="사진 없을 때 띄우는 아보카도">`;
                }

                str += `</div>`;
                str += `<div class="store_item_detail">`;
                str += `<p>${bvo.proTitle}</p>`;
                str += `<p>${bvo.proContent}</p>`;
                str += `<p>${bvo.proEmd} | ${bvo.proMenu} | 후기 3개</p>`;

                str += `</div></a></div>`;

                storeMiddle.innerHTML += str;
            }
        } else {
            let str = `<div class="noBoard">게시글이 존재하지 않습니다.</div>`;
            storeMiddle.innerHTML = str;
        }

    } catch (error) {
        console.error(error);
    }
}
spreadStoreList();

//동네소식 최신순
async function getBoardListFromCommunity(){
    try {
        const resp = await fetch('/communityList');
        const result = await resp.json();
        return result;
    } catch (error) {
        console.log(error);
    }
}
async function spreadCommunityList() {
    try {
        const result = await getBoardListFromCommunity();
        console.log(result);

        if (result.length > 0) {
            let communityMiddle = document.getElementById('communityMiddle');
            
            communityMiddle.innerHTML = "";

            for (let bvo of result) {
                //제목 글자수 제한
                let title = bvo.cmTitle;
                if (title.length > 18) {
                    title = title.substring(0, 18) + ' ...';
                  } else {
                    title = title;
                  }

                let str = `<div class="community_list">`;
                str += `<a href="/community/detail?cmBno=${bvo.cmBno}">`;
                str += `<div class="cm_first">`;
                str += `<span>${bvo.cmMenu} |</span>`;
                str += `<p>${title}</p>`;
                str += `</div>`;
                str += `<div class="cm_second">`;
                str += `<span>${bvo.cmEmd}</span>`;
                str += `<i class="bi bi-heart"></i>`;
                str += `<span>${bvo.cmLikeCnt} </span>`;
                str += `<i class="bi bi-chat-right-dots"></i>`;
                str += `<span>${bvo.cmCmtCnt} </span>`;

                str += `</div></a></div>`;

                communityMiddle.innerHTML += str;
            }
        } else {
            let str = `<div class="noBoard">게시글이 존재하지 않습니다.</div>`;
            communityMiddle.innerHTML = str;
        }

    } catch (error) {
        console.error(error);
    }
}
spreadCommunityList();

//동네소식 인기순
async function getBoardLikeListFromCommunity(){
    try {
        const resp = await fetch('/communityLikeList');
        const result = await resp.json();
        return result;
    } catch (error) {
        console.log(error);
    }
}
async function spreadCommunityLikeList() {
    try {
        const result = await getBoardLikeListFromCommunity();
        console.log(result);

        if (result.length > 0) {
            let communityMiddle = document.getElementById('communityLikeMiddle');
            
            communityMiddle.innerHTML = "";

            for (let bvo of result) {
                //제목 글자수 제한
                let title = bvo.cmTitle;
                if (title.length > 18) {
                    title = title.substring(0, 18) + ' ...';
                  } else {
                    title = title;
                  }

                let str = `<div class="community_list">`;
                str += `<a href="/community/detail?cmBno=${bvo.cmBno}">`;
                str += `<div class="cm_first">`;
                str += `<span>${bvo.cmMenu} |</span>`;
                str += `<p>${title}</p>`;
                str += `</div>`;
                str += `<div class="cm_second">`;
                str += `<span>${bvo.cmEmd}</span>`;
                str += `<i class="bi bi-heart"></i>`;
                str += `<span>${bvo.cmLikeCnt} </span>`;
                str += `<i class="bi bi-chat-right-dots"></i>`;
                str += `<span>${bvo.cmCmtCnt} </span>`;

                str += `</div></a></div>`;

                communityMiddle.innerHTML += str;
            }
        } else {
            let str = `<div class="noBoard">게시글이 존재하지 않습니다.</div>`;
            communityMiddle.innerHTML = str;
        }

    } catch (error) {
        console.error(error);
    }
}
spreadCommunityLikeList();
