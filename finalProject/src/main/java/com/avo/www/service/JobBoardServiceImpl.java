package com.avo.www.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.avo.www.domain.ProductBoardVO;
import com.avo.www.repository.JobBoardDAO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class JobBoardServiceImpl implements JobBoardService {
	@Inject
	private JobBoardDAO jdao;
	
	@Override
	@Transactional
	public int post(ProductBoardVO pbvo) {
		return jdao.post(pbvo);
	}

	@Override
	public ProductBoardVO getDetail(long pbno) {
		return jdao.detail(pbno);
	}

	@Override
	public List<ProductBoardVO> getList() {
		return jdao.getList();
	}
	
	
	
	

}
