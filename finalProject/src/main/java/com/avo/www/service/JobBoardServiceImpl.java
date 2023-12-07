package com.avo.www.service;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.avo.www.domain.FileVO;
import com.avo.www.domain.JobBoardDTO;
import com.avo.www.domain.LikeItemVO;
import com.avo.www.domain.ProductBoardVO;
import com.avo.www.repository.JobFileDAO;
import com.avo.www.repository.JobLikeDAO;
import com.avo.www.repository.JobBoardDAO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class JobBoardServiceImpl implements JobBoardService {
	@Inject
	private JobBoardDAO jdao;
	@Inject
	private JobFileDAO fdao;
	@Inject
	private JobLikeDAO Ldao;
	
//	@Override
//	@Transactional
//	public int post(ProductBoardVO pbvo) {
//		return jdao.post(pbvo);
//	}

	@Override
	public JobBoardDTO getDetail(long proBno) {
		log.info("proBno>>"+proBno);
		jdao.readCount(proBno,1);
		JobBoardDTO jbdto = new JobBoardDTO(jdao.detail(proBno),fdao.getFileList(proBno));
		return jbdto;
	}
	
	@Transactional
	@Override
	public List<JobBoardDTO> getList() {
	    List<ProductBoardVO> list = jdao.getList();
	    List<FileVO> flist = allFlieList();
	    
	    List<JobBoardDTO> allList = new ArrayList<>();

	    // productList의 각 항목에 대해 JobBoardDTO를 생성하고 fileList에서 매칭되는 FileVO를 찾아 추가
	    for (ProductBoardVO product : list) {
	        JobBoardDTO jbdto = new JobBoardDTO();
	        jbdto.setPbvo(product);
	        
	        // fileList를 담을 리스트를 초기화
	        List<FileVO> matchingFiles = new ArrayList<>();
	        
	        // productList의 proBno와 fileList의 bno가 일치하는 경우에만 추가
	        for (FileVO file : flist) {
	            if (file.getBno() == product.getProBno()) {
	                matchingFiles.add(file);
	                log.info("matchingFile >> " + matchingFiles);
	                break;
	            }
	        }
	        
	        // JobBoardDTO에 fileList 설정
	        jbdto.setFlist(matchingFiles);

	        allList.add(jbdto);
	    }

	    return allList;
	}

	@Transactional
	@Override
	public ProductBoardVO jobLike(long proBno) {
		log.info("proBno>>"+proBno);
		return jdao.jobLike(proBno);
	}

	
	@Transactional
	@Override
	public int modify(JobBoardDTO jbdto) {
//		수정시 1개씩 조회올라가는거 방지
		jdao.readCount(jbdto.getPbvo().getProBno(),-2);
		
		int isOk = jdao.modify(jbdto.getPbvo());
		if(jbdto.getFlist() == null) {
			isOk *= 1;
			return isOk;
		}
		
		if(isOk > 0 && jbdto.getFlist().size() > 0) {
			long proBno = jbdto.getPbvo().getProBno();
			for(FileVO fvo : jbdto.getFlist()) {
				fvo.setBno(proBno);
				isOk *= fdao.insertFile(fvo);
			}
		}
		
		return isOk;
	}
	
	
	@Transactional
	@Override
	public int post(JobBoardDTO jbdto) {
		//jbdto에 담긴 pbvo, flist 각자 db에 저장
		
		// post는 pbvo
		int isUp = jdao.post(jbdto.getPbvo());
		
		// fileUpload는 flist
		// 파일이 없을 경우 생략
		if(jbdto.getFlist() == null) {
			isUp *= 1;
			return isUp;
		}
		// 파일이 있는 경우 조건 확인 후 insertFile
		if(isUp > 0 && jbdto.getFlist().size() > 0) {
			long bno = jdao.selectOneBno(); // 가장 마지막에 등록된 bno 가져오기
			log.info("getFlist >> max bno>> " + bno);
			
			for(FileVO fvo : jbdto.getFlist()) {
				fvo.setBno(bno);
				isUp *= fdao.insertFile(fvo);
			}
		}
		
		
		return isUp;
	}

	@Transactional
	@Override
	public int remove(long proBno) {
		int isOk = fdao.removeFileAll(proBno);
		return (isOk > 0)? jdao.delete(proBno) : 0;
	}


	@Override
	public List<FileVO> allFlieList() {
		return fdao.allFlieList();
	}

	@Override
	public int insertLike(LikeItemVO livo) {
		return Ldao.insertLike(livo);
	}

	@Override
	public int updateLike(LikeItemVO livo) {
		return Ldao.updateLike(livo);
	}

	@Override
	public int checkLike(long proBno, String memEmail) {
		return Ldao.checkLike(proBno,memEmail);
	}



}
