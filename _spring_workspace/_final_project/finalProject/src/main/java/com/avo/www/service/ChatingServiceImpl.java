package com.avo.www.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.avo.www.domain.ChatMessageVO;
import com.avo.www.domain.ChatRoomDTO;
import com.avo.www.domain.ChatRoomVO;
import com.avo.www.domain.FileVO;
import com.avo.www.repository.ChatingDAO;
import com.avo.www.repository.JoongoBoardDAO;
import com.avo.www.repository.MemberDAO;
import com.avo.www.repository.ProfileFileDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ChatingServiceImpl implements ChatingService {
	
	@Inject
	private ChatingDAO chatdao;
	
	@Inject
	private MemberDAO mdao;
	
	@Inject
	private JoongoBoardDAO jbdao;
	
	@Inject
	private ProfileFileDAO fdao;

	@Override
	public int createChatRoom(ChatRoomVO roomvo) {
		int cntRoom = chatdao.selectRoomCnt(roomvo);
		if(cntRoom > 0) {
			return 0;
		}else {
			return chatdao.insertChatRoom(roomvo);
		}
	}

	@Override
	public int insertChatMsg(ChatMessageVO msgvo) {
		return chatdao.insertChatMsg(msgvo);
	}

	@Transactional
	@Override
	public ChatRoomDTO getChatRoomDTO(ChatRoomVO crvo, String userId) {
		ChatRoomDTO chatdto = new ChatRoomDTO();
		chatdto.setMsgSendUserId(userId);
		
		// 글 제목
		String boardTitle = jbdao.getDetail(crvo.getChatBno()).getProTitle();
		chatdto.setBoardTitle(boardTitle);
		
		// 채팅방 번호
		long chatBno = chatdao.selectChatRoomBno(crvo.getChatBno());
		log.info(">>>>>>>>>>> ChatRoomDTO chatBno >>>>>> "+chatBno);
		// 마지막 메시지 세팅
		chatdto.setLastMsg(chatdao.getLastMsg(chatBno));
			
		// 메시지 받는 유저 정보
		String msgGetUserEmail = chatdao.selectEmailFromBno(chatBno);
		if(msgGetUserEmail.equals(userId)) {
			msgGetUserEmail = chatdao.selectOtherEmailFromBno(chatBno);
		}
		chatdto.setMsgGetUserEmail(msgGetUserEmail);
			
		String msgGetNick = mdao.getNickFromEmail(msgGetUserEmail);
		chatdto.setMsgGetUserNick(msgGetNick);
		
		// 유저 프로필 이미지
		FileVO userProfile = fdao.getProfile(msgGetUserEmail);
		log.info(">>>>>>>> userProfile >>>>> "+userProfile);
		chatdto.setProfileImage(userProfile);
		
		return chatdto;
	}
	
	@Override
	public List<ChatRoomVO> getChatList(String userId) {
		return chatdao.getChatingList(userId);
	}

	@Override
	public List<ChatMessageVO> selectChatMsg(long bno) {
		return chatdao.getMsgList(bno);
	}
	

}
