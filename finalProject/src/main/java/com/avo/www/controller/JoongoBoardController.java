package com.avo.www.controller;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.avo.www.domain.LikeItemVO;
import com.avo.www.domain.PagingVO;
import com.avo.www.domain.ProductBoardVO;
import com.avo.www.handler.PagingHandler;
import com.avo.www.service.JoongoBoardService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/joongo/**")
public class JoongoBoardController {

	@Inject
	private JoongoBoardService jbsv;
	
	@GetMapping("/list")
	public void list(Model m) {
	}
	
	@GetMapping("/register")
	public void getReg() {
	}
	
	@PostMapping("/register")
	public String postReg(ProductBoardVO pbvo) {
		log.info(">>>>>>> pbvo >>> "+pbvo);
		int isOk = jbsv.register(pbvo);
		log.info("등록 "+(isOk > 0 ? "성공" : "실패"));
		
		return "redirect:/joongo/list";
	}
	
	@GetMapping("/detail")
	public void detail(@RequestParam("proBno")long bno, Model m) {
		log.info(">>>>>>>>>> proBno >>>>>>"+bno);
		ProductBoardVO pbvo = jbsv.getDetail(bno);
		LikeItemVO livo = new LikeItemVO();
		livo.setLiBno(bno);
		livo.setLiUserId("joongoJY@naver.com");
		int checkLike = jbsv.checkLikeTF(livo);
		if(checkLike > 0) {
			m.addAttribute("checkLike", checkLike);
		}
		m.addAttribute("pbvo", pbvo);
		
	}
	
	@GetMapping("/modify")
	public void modify(@RequestParam("proBno")long bno, Model m) {
		ProductBoardVO pbvo = jbsv.getDetail(bno);
		m.addAttribute("pbvo", pbvo);
	}
	
	@PostMapping("/modify")
	public String postMod(ProductBoardVO pbvo) {
		log.info("수정 >>>>>>> pbvo >>>>> "+pbvo);
		int isMod = jbsv.modify(pbvo);
		log.info("수정 "+(isMod > 0 ? "성공" : "실패"));
		
		return "redirect:/joongo/detail?proBno="+pbvo.getProBno();
	}
	
	@GetMapping("/remove")
	public String remove(@RequestParam("proBno")long bno) {
		int isDel = jbsv.remove(bno);
		log.info("삭제 "+(isDel > 0 ? "성공" : "실패"));
		
		return "redirect:/joongo/list";
	}
	
	@GetMapping(value = "/{page}", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<PagingHandler> moreBtn(@PathVariable("page")int page, Model m){
		log.info(">>>>>>>>>> page >>>>>>> "+page);
		PagingVO pgvo = new PagingVO(page, 8);
		
		return new ResponseEntity<PagingHandler>(jbsv.getListMore(pgvo),HttpStatus.OK);
	}
	
	@PostMapping(value = "/like", consumes = "application/json", produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> likeBtn(@RequestBody LikeItemVO livo){
		log.info(">>>>>>>> livo >>>>>>> "+livo);
		int isOk = jbsv.insertOrUpdate(livo);
		log.info("찜 "+(isOk > 0 ? "성공" : "실패"));
		
		return new ResponseEntity<String>("", HttpStatus.OK);
	}
	
}
