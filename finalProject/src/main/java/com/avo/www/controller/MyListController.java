package com.avo.www.controller;

import java.security.Principal;
import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.avo.www.domain.CommunityBoardVO;
import com.avo.www.domain.FileVO;
import com.avo.www.domain.LikeItemVO;
import com.avo.www.domain.PagingVO;
import com.avo.www.handler.PagingHandler;
import com.avo.www.service.JobBoardService;
import com.avo.www.service.MyListService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/myList/*")
@Controller
public class MyListController {
	
	@Inject 
	private MyListService lsv;

	@Inject
	private JobBoardService jbsv;
	
	@GetMapping("/likeList")
	public void likeList() {
		log.info(">>>>> like list page >> ");
	}
	
//	관심목록 리스트 페이징 매핑
	@GetMapping(value = "/likeList/{page}/{likeListcategory}", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<PagingHandler> spread(@PathVariable("page") int page, 
	        @PathVariable("likeListcategory") String category, Model m, 
	        Principal principal) {
	    log.info("page >> " + page + "/ category >> " + category );
	    String liUserId = principal.getName();
	    log.info("liUserId >> " + liUserId);
	    
	    // pgvo 생성하여 page, qty(보여줄 게시글 수) 설정
	    PagingVO pgvo = new PagingVO(page, 8);
	    pgvo.setType(category);
	    // 페이징 할 전체 게시글 수
	    int totalCount = lsv.getTotalCount(pgvo, liUserId);
	    log.info("totalCount >>> " + totalCount);
	    // 타입, 정렬 설정
	    
	    // like정보 담을 vo
	    List<LikeItemVO> likeList = lsv.getLikeList(liUserId);
	    		
	    // pgvo,전체 게시글수, qty 담은 ph객체 생성
	    PagingHandler ph = new PagingHandler(pgvo , totalCount, 8, likeList);
	    
//	    ph.setProdList(lsv.getMoreList(pgvo));
	    ph.setProdList(lsv.getMoreList(pgvo, liUserId));
	    
//	    log.info("ph >>> " + ph);
//	    m.addAttribute("ph", ph);
	    
	    return new ResponseEntity<PagingHandler>(ph, HttpStatus.OK);
	}
	
//	리스트 썸네일
	@PostMapping(value = "/likeList/thumb/{proBno}", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<FileVO> getThumb(@PathVariable("proBno")long proBno){
		
		//썸네일 가져와서 flist에 담기
		List<FileVO> flist = jbsv.getThumb(proBno);
		log.info("thumbnail >>  flist >> "+flist);
		
		return new ResponseEntity<FileVO>(flist.get(0), HttpStatus.OK);
	}
	
	
//	동네생활
	@GetMapping("/commuList")
	public void commuList(@RequestParam(name = "type", required = false)String type, Model m) {
		log.info(">>>>> type >>> "+type);
	
		if(type == null) {
			m.addAttribute("type", "작성글");
		}else {
			m.addAttribute("type", type);
		}
	}
	
//	동네생활 리스트 페이징 매핑 
	@GetMapping(value = "/commuList/{page}/{commuListcategory}", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<PagingHandler> spreadCommu(@PathVariable("page") int page, 
	        @PathVariable("commuListcategory") String type, Model m, 
	        Principal principal) {
	    log.info("page >> " + page + "/ type >> " + type );
	    
	    // 로그인 한 유저 id 저장하여 해당 id와 관련 된 값만 가져오기
	    String liUserId = principal.getName();
	    log.info("liUserId >> " + liUserId);
	    
	    // pgvo 생성하여 page, qty(보여줄 게시글 수) 설정
	    PagingVO pgvo = new PagingVO(page, 8);
	    pgvo.setType(type);
	    
	    // 페이징 할 전체 게시글 수
	    int totalCount = lsv.getCommuTotalCount(pgvo, liUserId);
	    log.info("totalCount >>> " + totalCount);
	    // 타입, 정렬 설정
	    
	    // like정보 담을 vo
	    List<LikeItemVO> likeList = lsv.getCommuLikeList(liUserId);
	    log.info("likeList >>> " + likeList);
	    
	    // pgvo,전체 게시글수, qty 담은 ph객체 생성
	    PagingHandler ph = new PagingHandler(pgvo , totalCount, 8, likeList);
	    
	    ph.setCmList(lsv.getMoreCommuList(pgvo, liUserId));
	    
	    log.info("ph >>> " + ph);
	    m.addAttribute("ph", ph);
	    
	    return new ResponseEntity<PagingHandler>(ph, HttpStatus.OK);
	}
	
	
	
	
	
	
	
}