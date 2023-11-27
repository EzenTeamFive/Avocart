let url = window.location.pathname;
let category = url.substring(url.indexOf('/')+1,url.lastIndexOf('/'));
console.log("카테고리 : "+category);
console.log("bno : "+bnoVal);
console.log("user id : "+userEmail);

// 카테고리와 찜 정보를 서버에 전송
async function likeItemToServer(category, likeData){
    try {
        let url = "/"+category+"/like";
        let config = {
            method : "post",
            headers : {
                "content-type" : "application/json; charset=UTF-8"
            },
            body : JSON.stringify(likeData)
        }

        const resp = await fetch(url, config);
        const result = await resp.text();
        return result;

    } catch (error) {
        console.log(error);
    }
}

// status : 찜했을 경우 1 / 취소했을 경우 0
function likeItem(bnoVal, userEmail, status){
    let likeData = {
        liBno : bnoVal,
        liUserId : userEmail,
        liStatus : status
    }
    console.log(likeData);
    likeItemToServer(category, likeData);
}

// 찜 등록 취소 여부 판단
document.addEventListener('click', (e)=>{
    console.log(e.target);
    if(e.target.classList.contains('bi-heart')){
        console.log('찜했습니다.');
        e.target.classList.replace('bi-heart','bi-heart-fill');
        likeItem(bnoVal, userEmail, 1);
    }else if(e.target.classList.contains('bi-heart-fill')){
        console.log('찜을 취소했습니다.');
        e.target.classList.replace('bi-heart-fill','bi-heart');
        likeItem(bnoVal, userEmail, 0);
    }
})