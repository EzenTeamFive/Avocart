package com.avo.www.service;

import com.avo.www.domain.LikeItemVO;
import com.avo.www.domain.PagingVO;
import com.avo.www.domain.ProductBoardVO;
import com.avo.www.handler.PagingHandler;

public interface JoongoBoardService {

	int register(ProductBoardVO pbvo);

//	List<ProductBoardVO> getList();

	ProductBoardVO getDetail(long bno);

	int modify(ProductBoardVO pbvo);

	int remove(long bno);

	PagingHandler getListMore(PagingVO pgvo);

	int insertOrUpdate(LikeItemVO livo);

	int checkLikeTF(LikeItemVO livo);


}
