package com.avo.www.repository;

import java.util.List;

import com.avo.www.domain.ChatRoomVO;

public interface ChatingDAO {

	int selectRoomCnt(ChatRoomVO roomvo);

	int insertChatRoom(ChatRoomVO roomvo);

	List<ChatRoomVO> selectUserChatRoom(String userId);

}
