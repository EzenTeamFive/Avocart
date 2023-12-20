package com.avo.www.service;

import java.util.List;

import com.avo.www.domain.ChatMessageVO;
import com.avo.www.domain.ChatRoomDTO;
import com.avo.www.domain.ChatRoomVO;

public interface ChatingService {

	int createChatRoom(ChatRoomVO roomvo);

	int insertChatMsg(ChatMessageVO msgvo);

	ChatRoomDTO getChatRoomDTO(ChatRoomVO crvo, String userId);

	List<ChatRoomVO> getChatList(String userId);

	List<ChatMessageVO> selectChatMsg(long bno);

}
