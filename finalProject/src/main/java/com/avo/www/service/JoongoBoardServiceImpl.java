package com.avo.www.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.avo.www.domain.LikeItemVO;
import com.avo.www.domain.PagingVO;
import com.avo.www.domain.ProductBoardVO;
import com.avo.www.handler.PagingHandler;
import com.avo.www.repository.JoongoBoardDAO;
import com.avo.www.repository.LikeItemDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class JoongoBoardServiceImpl implements JoongoBoardService {

	@Inject
	private JoongoBoardDAO jbdao;
	
	@Inject
	private LikeItemDAO lidao;

	@Override
	public int register(ProductBoardVO pbvo) {
		return jbdao.insert(pbvo);
	}

//	@Override
//	public List<ProductBoardVO> getList() {
//		return jbdao.getList();
//	}

	@Override
	public ProductBoardVO getDetail(long bno) {
		jbdao.setReadCnt(bno,1);
		return jbdao.getDetail(bno);
	}

	@Override
	public int modify(ProductBoardVO pbvo) {
		jbdao.setReadCnt(pbvo.getProBno(),-2);
		return jbdao.update(pbvo);
	}

	@Override
	public int remove(long bno) {
		return jbdao.delete(bno);
	}

	@Transactional
	@Override
	public PagingHandler getListMore(PagingVO pgvo) {
		int totalCount = jbdao.selectJoongoTotal();
		jbdao.setLikeCnt();
		List<ProductBoardVO> list = jbdao.getListMore(pgvo);
		PagingHandler ph = new PagingHandler(pgvo, totalCount, list);
		return ph;
	}

	@Transactional
	@Override
	public int insertOrUpdate(LikeItemVO livo) {
		int check = lidao.checkLikeCnt(livo);
		if(check > 0) { // 찜 기록이 있을 경우
			jbdao.updateLikeCnt(livo, -1);
			return lidao.updateLike(livo);			
		}
		
		// 찜 기록이 없을 경우
		jbdao.updateLikeCnt(livo, 1);
		return lidao.insertLike(livo);
	}

	@Transactional
	@Override
	public int checkLikeTF(LikeItemVO livo) {
		int check = lidao.checkLikeCnt(livo);
		if(check > 0) {
			return lidao.checkLikeTF(livo);			
		}
		return 0;
	}

	
}