package com.avo.www.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.avo.www.domain.ChatRoomVO;
import com.avo.www.repository.ChatingDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ChatingServiceImpl implements ChatingService {
	
	@Inject
	private ChatingDAO chatdao;
	
	@Override
	public List<ChatRoomVO> getChatingList(String userId) {
		return chatdao.selectUserChatRoom(userId);
	}

	@Override
	public int createChatRoom(ChatRoomVO roomvo) {
		int cntRoom = chatdao.selectRoomCnt(roomvo);
		if(cntRoom > 0) {
			return 0;
		}else {
			return chatdao.insertChatRoom(roomvo);
		}
	}
	

}
