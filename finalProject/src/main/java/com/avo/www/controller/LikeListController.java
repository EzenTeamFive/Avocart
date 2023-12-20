package com.avo.www.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.avo.www.domain.CommunityBoardVO;
import com.avo.www.domain.FileVO;
import com.avo.www.domain.ProductBoardVO;
import com.avo.www.handler.FileHandler;
import com.avo.www.security.AuthMember;
import com.avo.www.security.MemberVO;
import com.avo.www.service.HmemberService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/likeList/*")
@Controller
public class LikeListController {
	@Inject 
	private HmemberService hsv;

	@Inject
	private BCryptPasswordEncoder bcEncoder;

	@Inject
	private FileHandler fh;
	
	@GetMapping("likeList")
	public void likeList(Model m) {
//		List<ProductBoardVO> liList= hsv.getLikeList();
//		List<CommunityBoardVO> liComuList= hsv.getLikeComuList(email);
		
	}
	
	/*
	 * public void detail(Model m, @RequestParam("memEmail") String email) { FileVO
	 * fvo = hsv.getProfile(email); String backSrc = null; String mainSrc = null;
	 * if(fvo!=null) { backSrc = "/upload/profile/" + fvo.getSaveDir().replace('\\',
	 * '/') + "/" + fvo.getUuid() + "_" + fvo.getFileName(); mainSrc =
	 * "/upload/profile/" + fvo.getSaveDir().replace('\\', '/') + "/" +
	 * fvo.getUuid() + "_" + fvo.getFileName(); } else { backSrc =
	 * "../resources/image/기본 프로필 배경.png"; mainSrc =
	 * "../resources/image/기본 프로필.png"; } m.addAttribute("mvo",
	 * hsv.getDetail(email)); m.addAttribute("backSrc", backSrc);
	 * m.addAttribute("mainSrc", mainSrc); }
	 */
	

}