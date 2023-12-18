var ws;
var messages = document.getElementById("messages");

function openSocket(chatRoomId){
    if(ws !== undefined && ws.readyState !== WebSocket.CLOSED ){
        writeResponse("WebSocket is already opened.");
        return;
    }
    //웹소켓 객체 만드는 코드
    ws = new WebSocket("ws://localhost:8088/chat/"+chatRoomId);
    
    ws.onopen = function(event){
        if(event.data === undefined){
      		return;
        }
        writeResponse(event.data);
    };
    
    ws.onmessage = function(event){
        console.log('writeResponse');
        console.log(event.data)
        writeResponse(event.data);
    };
    
    ws.onclose = function(event){
        writeResponse("대화 종료");
    }
    
}

function send(){
    var text = document.getElementById("senderNick").value+" : "+document.getElementById("messageinput").value;
    ws.send(text);
    text = "";
}

function closeSocket(){
    ws.close();
}

function writeResponse(text){
    messages.innerHTML += "<br/>"+text;
}

function clearText(){
    console.log(messages.parentNode);
    messages.parentNode.removeChild(messages)
}
