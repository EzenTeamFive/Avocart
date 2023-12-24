package com.avo.www.domain;

import java.util.List;

import com.avo.www.security.MemberVO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class ChatRoomDTO {
	
	private String msgSendUserId;
	private String msgGetUserNick;
	private String msgGetUserEmail;
	private ChatRoomVO crvo;
	private List<ChatMessageVO> msgList;
	private FileVO profileImage;

}
