package com.avo.www.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.avo.www.domain.CommunityBoardVO;

public interface CommunityBoardDAO {

	int insert(CommunityBoardVO bvo);

	List<CommunityBoardVO> getList();

	CommunityBoardVO getDetail(long cmBno);

	int update(CommunityBoardVO bvo);

	int delete(long cmBno);

	void readCount(@Param("cmBno")long cmBno,@Param("cnt")int cnt);

	int updateCommentCount();

	int updateLikeCnt(@Param("cmBno")long cmBno, @Param("cnt")int cnt);

	int checkLike(long cmBno, String cmEmail);

	long getFlistBno();

	List<CommunityBoardVO> getMenuList(String cmMenu);

}
