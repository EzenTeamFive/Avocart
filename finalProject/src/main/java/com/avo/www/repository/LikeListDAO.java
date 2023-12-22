package com.avo.www.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.avo.www.domain.LikeItemVO;
import com.avo.www.domain.PagingVO;
import com.avo.www.domain.ProductBoardVO;

public interface LikeListDAO {

	int getTotalLikeCount(@Param("pgvo")PagingVO pgvo, @Param("liUserId")String liUserId);

//	List<ProductBoardVO> getMoreLikeList(PagingVO pgvo);

	List<ProductBoardVO> getMoreLikeList(@Param("pgvo") PagingVO pgvo, @Param("liUserId") String liUserId);

	List<LikeItemVO> getLikeList(String liUserId);


}
