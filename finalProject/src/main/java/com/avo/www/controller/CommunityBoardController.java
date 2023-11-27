package com.avo.www.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.avo.www.domain.CommunityBoardDTO;
import com.avo.www.domain.CommunityBoardVO;
import com.avo.www.domain.CommunityCmtVO;
import com.avo.www.domain.FileVO;
import com.avo.www.handler.FileHandler;
import com.avo.www.service.CommunityBoardService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/community/*")
@Controller
public class CommunityBoardController {
	
	@Inject
	private CommunityBoardService bsv;
	
	@Inject
	private FileHandler fh;
	
	@GetMapping("/register")
	public void register() {}
	
	@PostMapping("/register")
	public String register(CommunityBoardVO bvo, RedirectAttributes re,
			@RequestParam(name = "files", required = false)MultipartFile[] files) {
		log.info(">>>>> register bvo >>> "+bvo);
		
		List<FileVO> flist = null;
		
		//file upload handler 생성
		if(files[0].getSize() > 0) {
			flist = fh.uploadFiles(files, "community");
		}
		
		CommunityBoardDTO bdto = new CommunityBoardDTO(bvo, flist);
		
		int isUp = bsv.register(bdto);
		log.info(">>>>> board register >>> "+(isUp>0? "성공":"실패"));
		
		return "redirect:/community/list";
	}
	
	@GetMapping("/list")
	public void list(@RequestParam(name = "cmMenu", required = false)String cmMenu, Model m) {
		log.info(">>>>> cmMenu >>> "+cmMenu);
		
		List<CommunityBoardVO> list = null;	
		if("전체".equals(cmMenu) || cmMenu == null) {
			list = bsv.getList();			
		}else {
			list = bsv.getMenuList(cmMenu);
		}
		m.addAttribute("list", list);
		
		List<FileVO> flist = bsv.getFileList();
		
//		String uuid = flist.get(0).getUuid();
//		flist.get(0).setIsThum(bsv.updateThum(uuid));
		
		m.addAttribute("flist", flist);
	}
//	@GetMapping("/list")
//	public void list(Model m) {
//		
//		List<CommunityBoardVO> list = bsv.getList();
//		m.addAttribute("list", list);
//		
//		List<FileVO> flist = bsv.getFileList();
//		m.addAttribute("flist", flist);
//	}
	
	@GetMapping({"/detail", "/modify"})
	public void detail(@RequestParam("cmBno")long cmBno, Model m) {
		
		//좋아요 눌렀는지 확인,표시용
		String cmEmail = "hong@naver.com";
		int checkLike = bsv.checkLike(cmBno, cmEmail);
		if(checkLike > 0) {
			m.addAttribute("checkLike", checkLike);
		}
		
		CommunityBoardDTO bdto = bsv.getDetailFile(cmBno);
		m.addAttribute("bdto", bdto);
	}
	
	@PostMapping("/modify")
	public String modify(CommunityBoardVO bvo, RedirectAttributes re,
			@RequestParam(name = "files", required = false)MultipartFile[] files) {
		log.info(">>>>> modify bvo >>> "+bvo);
		
		List<FileVO> flist = null;
		
		//file upload handler 생성
		if(files[0].getSize() > 0) {
			flist = fh.uploadFiles(files, "community");
		}
		
		CommunityBoardDTO bdto = new CommunityBoardDTO(bvo, flist);
		
		int isMo = bsv.modify(bdto);
		log.info(">>>>> board modify >>> "+(isMo>0? "성공":"실패"));
		return "redirect:/community/detail?cmBno="+bvo.getCmBno();
	}
	
	@GetMapping("/remove")
	public String remove(@RequestParam("cmBno")long cmBno, RedirectAttributes re) {
		int isDel = bsv.remove(cmBno);
		log.info(">>>>> board modify >>> "+(isDel>0? "성공":"실패"));
		
		return "redirect:/community/list";
	}
	
	//좋아요 등록, 삭제
	@PostMapping(value = "/{cmBno}/{cmEmail}", produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> likeInsert(@PathVariable("cmBno")long cmBno, @PathVariable("cmEmail")String cmEmail){
		log.info(">>>>>> like insert >>> "+cmBno+" >>> "+cmEmail);
		int isOk = bsv.likeInsert(cmBno, cmEmail);
		
		return isOk > 0 ? new ResponseEntity<String>("1", HttpStatus.OK) 
				: new ResponseEntity<String>("0", HttpStatus.INTERNAL_SERVER_ERROR);
	}

	//파일 삭제
	@DeleteMapping(value = "/file/{uuid}", produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> removeFile(@PathVariable("uuid")String uuid){
		int isOk = bsv.removeFile(uuid); //DB에서만 삭제. 실제 파일 삭제X
		return isOk > 0 ? new ResponseEntity<String>("1", HttpStatus.OK)
				: new ResponseEntity<String>("0", HttpStatus.INTERNAL_SERVER_ERROR);
	}
}