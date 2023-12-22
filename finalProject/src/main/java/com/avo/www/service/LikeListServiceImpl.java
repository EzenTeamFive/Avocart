package com.avo.www.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.avo.www.domain.LikeItemVO;
import com.avo.www.domain.PagingVO;
import com.avo.www.domain.ProductBoardVO;
import com.avo.www.repository.LikeListDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class LikeListServiceImpl implements LikeListService{
	@Inject
	private LikeListDAO ldao;

	@Override
	public int getTotalCount(PagingVO pgvo, String liUserId) {
		return ldao.getTotalLikeCount(pgvo,liUserId);
	}
	
//	@Override
//	public List<ProductBoardVO> getMoreList(PagingVO pgvo) {
//		List<ProductBoardVO> list = ldao.getMoreLikeList(pgvo);
//		return list;
//	}

	@Override
	public List<ProductBoardVO> getMoreList(PagingVO pgvo, String liUserId) {
		List<ProductBoardVO> list = ldao.getMoreLikeList(pgvo, liUserId);
		return list;
	}

	@Override
	public List<LikeItemVO> getLikeList(String liUserId) {
		return ldao.getLikeList(liUserId);
	}

	

}
