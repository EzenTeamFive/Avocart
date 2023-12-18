package com.avo.www.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.avo.www.domain.ChatRoomVO;
import com.avo.www.security.AuthMember;
import com.avo.www.service.ChatingService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/common/*")
public class ChatingController {

	@Autowired
	private ChatingService chatsv;
	
	@GetMapping("/chating")
	public void getPage(Model m) {
		String userId = "";
		//사용자 객체 가져오기
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null && authentication.getPrincipal() instanceof UserDetails) {        	
        	//Principal => AuthMember 변환
        	AuthMember member = (AuthMember) authentication.getPrincipal();
        	log.info(">>>>>> member 확인 >>>>> "+member.getMvo());
        	//주소 추출
        	userId = member.getMvo().getMemEmail();
        }
		List<ChatRoomVO> chatList = chatsv.getChatingList(userId);
		m.addAttribute("chatList", chatList);
	}
	
	@PostMapping("/chating")
	public void insertChat(@RequestBody ChatRoomVO roomvo) {
		log.info(">>>>> chatRoomData >>> "+roomvo);
		int isOk = chatsv.createChatRoom(roomvo);
		log.info("채팅방 생성 "+(isOk > 0 ? "OK" : "Fail"));
	}
}
