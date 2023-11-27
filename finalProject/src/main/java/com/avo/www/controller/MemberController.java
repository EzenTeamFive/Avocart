package com.avo.www.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.avo.www.domain.CommunityCmtVO;
import com.avo.www.security.MemberVO;
import com.avo.www.service.MemberService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/member/*")
@Controller
public class MemberController {

	@Inject
	private BCryptPasswordEncoder bcEncoder;
	
	@Inject
	private MemberService msv;
	
	@GetMapping("/register")
	public void register() {}
	
	@PostMapping("/register")
	public String register(MemberVO mvo, Model m) {
		log.info(">>>>> register mvo >> "+mvo);
		
		mvo.setMemPw(bcEncoder.encode(mvo.getMemPw())); //받은 비밀번호 암호화
		int isJoin = msv.register(mvo);
		log.info(">>>>> member register >> "+(isJoin>0? "성공":"실패"));
		
		return "index";
	}
	
	@GetMapping("/login")
	public void login() {}
	
	@PostMapping("/login")
	public String login(HttpServletRequest request, RedirectAttributes re) {
		//로그인 실패시 다시 로그인 페이지로 돌아와 오류 메시지 전송
		//다시 로그인 유도
		re.addAttribute("email", request.getAttribute("email")); //큰 의미없
		re.addAttribute("errMsg", request.getAttribute("errMsg"));
		
		return "redirect:/member/login";
	}
	
	//이메일 존재여부 확인
	@GetMapping(value = "/email/{memEmail}", produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> hasEmail(@PathVariable("memEmail")String memEmail){
		log.info(">>>>> memEmail >>> "+memEmail);
		int isOk = msv.hasEmail(memEmail);
		
		return isOk > 0 ? new ResponseEntity<String>("1", HttpStatus.OK) 
				: new ResponseEntity<String>("0", HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	//닉네임 존재여부 확인
	@GetMapping(value = "/nick/{memNickName}", produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> hasNick(@PathVariable("memNickName")String memNickName){
		log.info(">>>>> memNickName >>> "+memNickName);
		int isOk = msv.hasNick(memNickName);
		
		return isOk > 0 ? new ResponseEntity<String>("1", HttpStatus.OK) 
				: new ResponseEntity<String>("0", HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
