var ws;
let messages = document.getElementById("messages");
let getUser;
let chatroom;
let boardTitle;
let checkFirstEnter = true;

// 스크롤을 가장 아래로 내리는 함수
function scrollDown() {
    messages.scrollTop = messages.scrollHeight;
}

// 텀을 두고 scrollDown 함수 호출
function prepareScroll() {
    window.setTimeout(scrollDown, 50);
}

// DB에 채팅 기록 저장
async function insertChatDataForServer(chatData){
    try {
        let url = "/common/chatmsg";
        let config = {
            method : "post",
            headers : {
                'content-type' : 'application/json; charset=UTF-8'
            },
            body : JSON.stringify(chatData)
        }
        const resp = await fetch(url, config);
        const result = await resp.text();
        return result;
    } catch (error) {
        console.log(error);
    }
}

// 채팅 기록 불러오기
async function selectChatMsgForServer(chatroom){
    try {
        const resp = await fetch("/common/chatmsg/"+chatroom);
        const result = await resp.json();
        return result;
    } catch (error) {
        console.log(error);
    }
}

document.addEventListener('click', handleSocketClick);

// 대화방 선택 체크 후 소켓 오픈
async function handleSocketClick(e){
    if(e.target.classList.contains('chatListArea')){
        if(checkFirstEnter == false){
            await closeSocket();
        }
        messages.innerHTML = "";
        console.log('버튼클릭');
        getUser = e.target.children[0].value;
        chatroom = e.target.dataset.chatroom;
        let nickName = document.querySelector('.messageHeader p');
        let BTitle = document.querySelector('.messageHeader small');
        nickName.innerText = e.target.children[1].value;
        BTitle.innerText = e.target.children[2].value;
        await selectChatMsgForServer(chatroom).then(result=>{
            if(result.length > 0){
                for(let re of result){
                    console.log(re);
                    if(re.msgSendUserId != getUser){
                        messages.innerHTML += "<div class='right'><span>"+dateFormater(re.msgRegAt)+"</span><div>"+re.msgContent+"</div></div>";
                    }else{
                        messages.innerHTML += "<div class='left'><div>"+re.msgContent+"</div><span>"+dateFormater(re.msgRegAt)+"</span></div>";
                    }
                }
            }
        });

        openSocket(chatroom);
        prepareScroll();
        if(checkFirstEnter == true){
            checkFirstEnter = false;
            document.querySelector('.waitingPage').style.display = "none";
        }
    }
}

function openSocket(chatRoomId){

    if(ws !== undefined && ws.readyState !== WebSocket.CLOSED ){
        writeResponse("WebSocket is already opened.");
        return;
    }
    //웹소켓 객체 만드는 코드
    ws = new WebSocket("ws://"+window.location.host+"/chat/"+chatRoomId);
    
    ws.onopen = function(event){
        if(event.data === undefined){
      		return;
        }
        console.log(event.data);
    };
    
    ws.onmessage = function(event){
        console.log('writeResponse');
        console.log(event.data)
        writeResponse(event.data);
    };
    
    ws.onclose = function(event){
        console.log('대화 종료');
    }
    
}

function send(){
    // var text = document.getElementById("senderNick").value+" : "+document.getElementById("messageinput").value;
    // ws.send(text);
    // text = "";
    let userId = document.getElementById('senderEmail').value;
    let msg = document.getElementById("messageinput");

    // 날짜 받아오기
    let today = new Date();
    let year = today.getFullYear();
    let month = ('0' + (today.getMonth() + 1)).slice(-2);
    let day = ('0' + today.getDate()).slice(-2);
    let dateString = year + '-' + month  + '-' + day;
    let hours = ('0' + today.getHours()).slice(-2); 
    let minutes = ('0' + today.getMinutes()).slice(-2);
    let seconds = ('0' + today.getSeconds()).slice(-2); 
    let timeString = hours + ':' + minutes  + ':' + seconds;

    console.log(dateString);
    console.log(timeString);

    let date = dateString+" "+timeString;

    let chatData = {
        msgRoomId : chatroom,
        msgSendUserId : userId,
        msgGetUserId: getUser,
        msgContent : msg.value,
        msgRegAt : date
    }
    console.log(chatData);
    if(msg.value != ""){
        insertChatDataForServer(chatData);
        ws.send(JSON.stringify(chatData));
        msg.value = "";
        prepareScroll();
    }
}

function closeSocket(){
    return new Promise((resolve) => {
        if (ws && ws.readyState === WebSocket.OPEN) {
            ws.onclose = function () {
                resolve();
            };
            ws.close();
        } else {
            resolve();
        }
    });
}

function writeResponse(text){
	console.log("전송받은 메시지 : "+text);
    let msgSendUser = text.substring(0,text.indexOf(','));
    let sendMsg = text.substring(text.indexOf(',')+1,text.lastIndexOf(','));
    let sendDate = text.substring(text.lastIndexOf(',')+1);
    let dateFormat = dateFormater(sendDate);

    console.log(msgSendUser);
    if(msgSendUser == document.getElementById('senderEmail').value){
        messages.innerHTML += "<div class='right'><span>"+dateFormat+"</span><div>"+sendMsg+"</div></div>";
    }else{
        messages.innerHTML += "<div class='left'><div>"+sendMsg+"</div></div>";
    }
}

function clearText(){
    console.log(messages.parentNode);
    messages.parentNode.removeChild(messages)
}

function dateFormater(sendDate){
    let date = new Date(sendDate);
    let dateFormat = (date.getMonth()+1)+"/"+date.getDate()+" "
        +(date.getHours() < 12 ? "오전 "+date.getHours() : "오후 "+(date.getHours()-12))+":"+date.getMinutes();
    return dateFormat
}