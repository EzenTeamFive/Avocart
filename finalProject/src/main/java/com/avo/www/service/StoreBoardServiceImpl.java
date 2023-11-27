package com.avo.www.service;

import java.util.List;
import java.util.stream.Collectors;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.avo.www.domain.FileVO;
import com.avo.www.domain.PagingVO;
import com.avo.www.domain.ProductBoardVO;
import com.avo.www.domain.StoreBoardDTO;
import com.avo.www.domain.StoreMenuVO;
import com.avo.www.handler.PagingHandler;
import com.avo.www.repository.StoreFileDAO;
import com.avo.www.repository.StoreMenuDAO;
import com.avo.www.repository.StoreBoardDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class StoreBoardServiceImpl implements StoreBoardService {
	@Inject
	private StoreBoardDAO sdao;
	
	@Inject
	private StoreFileDAO fdao;
	
	@Inject
	private StoreMenuDAO mdao;

	@Transactional
	@Override
	public int insert(StoreBoardDTO sdto) {
		sdto.getPvo().setProEmail("email");
		sdto.getPvo().setProNickName("nickname");	
		int isOk = sdao.insert(sdto.getPvo());
		
		//파일
		if(isOk>0 && sdto.getFlist().size()>0) {
			long bno = sdao.selectOneBno(); 
			
			for(FileVO fvo : sdto.getFlist()) {
				fvo.setBno(bno);
				isOk*= fdao.insertFile(fvo);
			}
		}
		
		//메뉴				
		if(isOk>0 && sdto.getMlist().size()>0) {
			long bno = sdao.selectOneBno(); 
	
			for(StoreMenuVO svo : sdto.getMlist()) {
				svo.setStrBno(bno);
				isOk*= mdao.insertMenu(svo);
			}
		}
		return isOk;
	}
	
	@Transactional
	@Override
	public StoreBoardDTO getDetail(long bno) {
		sdao.readCount(bno, 1);
		StoreBoardDTO sdto = new StoreBoardDTO(sdao.getDetail(bno), 
				fdao.getFileList(bno), mdao.getMenuList(bno));
		return sdto;
	}
	
	@Transactional
	@Override
	public int modify(StoreBoardDTO sdto) {
		sdao.readCount(sdto.getPvo().getProBno(), -2);
		int isOk = sdao.update(sdto.getPvo());
		
		//파일
		if(isOk>0 && sdto.getFlist().size()>0) {
			long bno = sdto.getPvo().getProBno();
			
			for(FileVO fvo : sdto.getFlist()) {
				fvo.setBno(bno);
				isOk *= fdao.insertFile(fvo);
			}
		}
		
		//메뉴
		if(isOk>0 && sdto.getMlist().size()>0) {
			long bno = sdto.getPvo().getProBno();
	
			for(StoreMenuVO svo : sdto.getMlist()) {
				svo.setStrBno(bno);
				isOk*= mdao.insertMenu(svo);
			}
		}	
		return isOk;		
	}

	@Transactional
	@Override
	public int remove(long bno) {
		//파일 삭제
		int isOk = fdao.removeFileAll(bno);
		isOk *= mdao.removeMenuAll(bno);
		isOk *= sdao.delete(bno);
		return isOk;
	}

	@Transactional
	@Override
	public PagingHandler getList(PagingVO pgvo) {
		int totalCount = sdao.getTotalCount(pgvo);
		List<ProductBoardVO> list = sdao.SelectListPaging(pgvo);
		
		//list에서 proBno 값 추출
	    List<Long> bnoList = list.stream()
                .map(ProductBoardVO::getProBno)
                .collect(Collectors.toList());
	    
	    //proBnoList로 file 테이블에서 파일 데이터 가져오기
	    List<FileVO> fileList = fdao.getAllFileList(bnoList);
	    
		PagingHandler ph = new PagingHandler(pgvo, totalCount, list, fileList);
		return ph;
	}

	@Override
	public int getTotalCount(PagingVO pgvo) {
		return sdao.getTotalCount(pgvo);
	}

	@Override
	public int repost(long bno) {
		int isOk = sdao.repost(bno);
		return 0;
	}

	@Override
	public int removeFile(String uuid) {
		return fdao.removeFile(uuid);
	}

	@Override
	public int removeMenu(long id) {
		return mdao.removeMenu(id);
	}

	@Override
	public int removeBeforeMenu(long bno) {
		return mdao.removeMenuAll(bno);
	}
}
