let like = document.getElementsByClassName('bi-heart');
let likeBtn = document.getElementById('likeBtn');


//like 여부 지정하는 변수
let state = 0;

async function likeOrDislike(proBnoVal, memEmail) {
    let likeData = {
        liBno : proBnoVal,
        liUserId : memEmail
    };
    
    try {
        const result = await updateLike(likeData);
        const likeCount = document.getElementById('likeCount');
        likeCount.innerHTML =  `관심 ${result }`;
        
    } catch (err) {
        console.error(err);
    }
}

// 찜하기
likeBtn.addEventListener('click', () => {
    let checkLikeCntElement = document.getElementById('checkLikeCnt');
    let checkLikeCnt = parseInt(checkLikeCntElement.innerText); // 또는 innerHTML
    
    console.log("checkLikeCnt>>" + checkLikeCnt);
    
    console.log("memEmail>>" + "'" + memEmail+"'");

    if (memEmail == null && memEmail == undefined || memEmail == '') {
        alert("로그인 해주세요.");
    }

    if(memEmail){
        // 찜 클릭시 상황에 따라 아이콘 toggle 및 state값 설정
        if (likeBtn.classList.contains('bi-heart-fill')) {
            // 찜취소
            // 취소 시 status -1 변경
            state = -1;
            document.getElementById('likeBtn').classList.replace('bi-heart-fill', 'bi-heart');

        } else {
            state = 1;
            document.getElementById('likeBtn').classList.replace('bi-heart', 'bi-heart-fill');
        }
        
        // 보여지는 cnt 숫자조정
        checkLikeCnt = checkLikeCnt+state;
        if(checkLikeCnt > 0){
            document.getElementById('checkLikeCnt').innerText = checkLikeCnt ;
        }
         
        likeToServer(proBnoVal, memEmail, state);
        console.log("proBnoVal>>" + proBnoVal + "/ memEmail>>" + memEmail + "/ state>>" + state);

    }
});



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
