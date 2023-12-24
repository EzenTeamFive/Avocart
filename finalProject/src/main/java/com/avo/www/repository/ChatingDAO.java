package com.avo.www.repository;

import java.util.List;

import com.avo.www.domain.ChatMessageVO;
import com.avo.www.domain.ChatRoomVO;
import com.avo.www.domain.FileVO;

public interface ChatingDAO {

	int selectRoomCnt(ChatRoomVO roomvo);

	int insertChatRoom(ChatRoomVO roomvo);

	int insertChatMsg(ChatMessageVO msgvo);

	List<ChatRoomVO> getChatingList(String userId);

	List<ChatMessageVO> getMsgList(long chatBno);

	String selectEmailFromBno(long chatBno);

	String selectOtherEmailFromBno(long chatBno);

	long selectChatRoomBno(long chatBno);

	List<ChatMessageVO> selectChatMsg(long bno);

}
