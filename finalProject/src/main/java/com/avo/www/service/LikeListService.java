package com.avo.www.service;

import java.util.List;

import com.avo.www.domain.LikeItemVO;
import com.avo.www.domain.PagingVO;
import com.avo.www.domain.ProductBoardVO;

public interface LikeListService {

	int getTotalCount(PagingVO pgvo, String liUserId);

	List<ProductBoardVO> getMoreList(PagingVO pgvo, String liUserId);

	List<LikeItemVO> getLikeList(String liUserId);

//	List<ProductBoardVO> getMoreList(PagingVO pgvo);



}
