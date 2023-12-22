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

import com.avo.www.domain.FileVO;
import com.avo.www.domain.LikeItemVO;
import com.avo.www.domain.PagingVO;
import com.avo.www.handler.PagingHandler;
import com.avo.www.service.JobBoardService;
import com.avo.www.service.LikeListService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/likeList/*")
@Controller
public class LikeListController {
	
	@Inject 
	private LikeListService lsv;

	@Inject
	private JobBoardService jbsv;
	
	@GetMapping("likeList")
	public void likeList(Model m) {
		log.info(">>>>> like list page >> ");
		
	}
	
//	리스트 페이징 매핑
	@GetMapping(value = "/likeList/{page}/{category}", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<PagingHandler> spread(@PathVariable("page") int page, 
	        @PathVariable("category") String category, Model m, 
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
	    
	    log.info("ph >>> " + ph);
	    m.addAttribute("ph", ph);
	    
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
}