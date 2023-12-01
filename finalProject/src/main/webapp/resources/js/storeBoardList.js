// console.log("전체 업체 개수 : " + listLength);
// var remainder = listLength % 2;
// console.log("나머지 : " + remainder);
// //오른쪽 : 줄이기

// if (remainder === 1) {
//     const lastLi = document.querySelector(".listContainer ul li:last-child");
//     lastLi.style.marginRight = "376px";
// }

async function spreadStoreFromServer(page, type){
    try{
        const resp = await fetch('/store/page/'+page+'/'+type);
        const result = await resp.json();
        return result;
    }catch(err){
        console.log(err);
    }
}

//페이지가 처음 로드될 때 전체 업체 표시
function getStoreList(page = 1, type = null) {
    spreadStoreFromServer(page, type).then(result => {
        console.log(result);
        const ul = document.getElementById('ulZone');
        const moreBtn = document.getElementById('moreBtn');

        if (page === 1) {
            ul.innerHTML = "";
        }

        if (result.prodList.length > 0) {
            for (let svo of result.prodList) {
                //파일 리스트
                console.log(result.prodFileList);

                 const matchingFvo = result.prodFileList.find(f => f.bno === svo.proBno);

                 let imgSrc = "";
                 if (matchingFvo) {
                     //matchingFvo가 존재할 경우 이미지 경로 설정
                     imgSrc = `/upload/product/${matchingFvo.saveDir.replace('\\', '/')}/${matchingFvo.uuid}_${matchingFvo.fileName}`;
                 }

                //li 생성
                const li = document.createElement('li');
                li.innerHTML = `
                    <a href="/store/detail?bno=${svo.proBno}">
                        <div>
                            <div>
                                <img class="profile" src="${imgSrc}" onerror="this.onerror=null; this.src='../resources/image/logoimage.png';">
                            </div>
                        </div>
                        <div>
                            <div>
                                <span class="title">${svo.proTitle}</span>
                                <span class="gray">${svo.proEmd }</span>
                            </div>
                            <span class="content">${svo.proContent}</span>
                            <span class="gray">${svo.proMenu}</span>
                        </div>
                    </a>
                `;
                //li 추가
                ul.appendChild(li);
            }

            if (result.pgvo.pageNo < result.endPage) {
                moreBtn.style.visibility = 'visible';
                moreBtn.dataset.page = page + 1;
            } else {
                moreBtn.style.visibility = 'hidden';
            }
        } else {
            //result.prodList가 비어있는 경우
            const noResultMessage = document.createElement('div');
            noResultMessage.innerText = '결과가 없습니다.';
            ul.appendChild(noResultMessage);
            moreBtn.style.visibility = 'hidden';
        }
    });
}

let type = null;

document.addEventListener('click', (e) => {
    const targetId = e.target.id;
    if (targetId === 'all' || targetId === 'lesson' || targetId === 'pet' || targetId === 'hospital' || targetId === 'beauty' || targetId === 'laundry' || targetId === 'repair' || targetId === 'sports' || targetId === 'infant' || targetId === 'eatery' || targetId === 'move' || targetId === 'interior' || targetId === 'cleaning' || targetId === 'hobby' || targetId === 'dessert') {
        type = e.target.value;
        getStoreList(1, type);
    }
    
    if (targetId === 'moreBtn') {
        getStoreList(parseInt(e.target.dataset.page), type);
    } 

});