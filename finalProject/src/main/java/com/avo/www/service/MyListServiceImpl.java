package com.avo.www.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.avo.www.domain.CommunityBoardVO;
import com.avo.www.domain.LikeItemVO;
import com.avo.www.domain.PagingVO;
import com.avo.www.domain.ProductBoardVO;
import com.avo.www.repository.MyListDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MyListServiceImpl implements MyListService{
	@Inject
	private MyListDAO ldao;

	@Override
	public int getTotalCount(PagingVO pgvo, String liUserId) {
		return ldao.getTotalLikeCount(pgvo,liUserId);
	}
	
	@Override
	public List<ProductBoardVO> getMoreList(PagingVO pgvo, String liUserId) {
		List<ProductBoardVO> list = ldao.getMoreLikeList(pgvo, liUserId);
		return list;
	}

	@Override
	public List<LikeItemVO> getLikeList(String liUserId) {
		return ldao.getLikeList(liUserId);
	}

	@Override
	public int getCommuTotalCount(PagingVO pgvo, String liUserId) {
		return ldao.getCommuTotalCount(pgvo,liUserId);
	}

	@Override
	public List<LikeItemVO> getCommuLikeList(String liUserId) {
		log.info("getCommuLikeList 진입 >> " );
		log.info("liUserId >> " + liUserId);
		return ldao.getCommuLikeList(liUserId);
	}

	@Override
	public List<CommunityBoardVO> getMoreCommuList(PagingVO pgvo, String liUserId) {
		log.info("getMoreCommuList 진입 >> " );
		List<CommunityBoardVO> list = ldao.getMoreCommuList(pgvo, liUserId);
		log.info("list >> " , list);
		return list;
	}


	

}
