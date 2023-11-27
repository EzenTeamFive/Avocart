package com.avo.www.service;

import java.util.List;

import com.avo.www.domain.CommunityBoardDTO;
import com.avo.www.domain.CommunityBoardVO;
import com.avo.www.domain.FileVO;

public interface CommunityBoardService {

	int register(CommunityBoardDTO bdto);

	List<CommunityBoardVO> getList();

	CommunityBoardDTO getDetailFile(long cmBno);

	int modify(CommunityBoardDTO bdto);

	int remove(long cmBno);

	int likeInsert(long cmBno, String cmEmail);

	int checkLike(long cmBno, String cmEmail);

	int removeFile(String uuid);

	List<CommunityBoardVO> getMenuList(String cmMenu);

	List<FileVO> getFileList();

}