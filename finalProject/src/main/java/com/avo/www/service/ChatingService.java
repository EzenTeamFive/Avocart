package com.avo.www.service;

import java.util.List;

import com.avo.www.domain.ChatRoomVO;

public interface ChatingService {

	List<ChatRoomVO> getChatingList(String userId);

	int createChatRoom(ChatRoomVO roomvo);

}
