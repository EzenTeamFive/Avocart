package com.avo.www.controller;

import java.util.ArrayList;
import java.util.List;

import javax.websocket.RemoteEndpoint.Basic;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@ServerEndpoint(value = "/chat/{bno}")
public class SocketController {
	
	private static final List<Session> sessionList = new ArrayList<Session>();
	
	public SocketController() {
		System.out.println("create socket");
	}
	
	@OnOpen // socket 연결 시
	public void onOpen(Session session, @PathParam("bno") long bno) { // @PathParam 은 웹소켓에서 사용하는 @PathVariables
		
		System.out.println("bno : "+bno);
		System.out.println("open session : " + session.getId());
		try {
			final Basic basic = session.getBasicRemote();
			basic.sendText("연결 완료");
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		sessionList.add(session);
	}
	
	@OnMessage
	public void onMessage(Session session, String message) {
		try {
			// 메세지 보낸 사람에게 표시
			final Basic basic = session.getBasicRemote();
			basic.sendText("전송했습니다. >>");
			basic.sendText(message);
			
			// 한 사람에게 메세지 보내기
//			sendMsg(session, message);
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		// 다른 사람에게 메세지 보내기
		sendAllSessionToMessage(session, message);
		
	}
	
	@OnError
	public void onError(Throwable e, Session session) {
		System.out.println(e.getMessage() + "by session : " + session.getId());
	}
	
	@OnClose
	public void onClose(Session session) {
		System.out.println("Session : "+ session.getId() + " closed");
		sessionList.remove(session);
	}
	
	private void sendAllSessionToMessage(Session self, String msg) { // 연결된 모든 사용자에게 메세지 전달
		try {
			for(Session s : SocketController.sessionList) {
				if(!self.getId().equals(s.getId())) {
					s.getBasicRemote().sendText(msg);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
//	//한명에게 메시지 전달
//    private void sendMsg(Session senderSession, String msg) {
//        try {
//        	String userId = (String) senderSession.getUserProperties().get("userId");
//        	for(Session s : sessionList) {
//        		if(userId.equals(s.getUserProperties().get("userId"))) {
//        			s.getBasicRemote().sendText(msg);
//        			break;
//        		}
//        	}
//        } catch (Exception e) {    
//            e.printStackTrace();
//        }
//    }
//    
}
