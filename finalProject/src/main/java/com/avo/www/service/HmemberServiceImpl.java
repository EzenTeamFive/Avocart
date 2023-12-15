package com.avo.www.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.avo.www.domain.FileVO;
import com.avo.www.repository.HmemberDAO;
import com.avo.www.repository.ProfileFileDAO;
import com.avo.www.security.MemberVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class HmemberServiceImpl implements HmemberService {
	@Inject
	private HmemberDAO hdao;
	
	@Inject
    private PasswordEncoder passwordEncoder;
	
	@Inject
	private ProfileFileDAO pdao;
	 
	@Override
	public MemberVO getDetail(String email) {
		MemberVO mvo = hdao.getDeail(email);
		return mvo;
	}

	@Override
	public String getPw(String email) {
		return hdao.getPw(email);
	}

	@Override
	public boolean isPasswordCorrect(String email, String pw) {
	    MemberVO mvo = hdao.getDeail(email);
    
	    if (mvo!=null) {
	        String storedPassword = mvo.getMemPw();
	        boolean passwordMatches = passwordEncoder.matches(pw, storedPassword);
	        
	        return passwordMatches;
	    } else {
	        return false;
	    }
	}

	@Override
	public int modifyPwEmpty(MemberVO mvo) {
		int isOk = hdao.modifyPwEmpty(mvo);
		
		//중고, 알바, 업체 게시글 닉네임 변경
		hdao.jjsModify(mvo);
		//동네 게시글 닉네임 변경
		hdao.cmModify(mvo);
		//동네 댓글 닉네임 변경
		hdao.cmCmtModify(mvo);
		//동네 대댓글 닉네임 변경
		hdao.cmReCmtModify(mvo);

		return isOk;
	}

	@Override
	public int modify(MemberVO mvo) {
		int isOk =  hdao.modify(mvo);
		//중고, 알바, 업체 게시글 닉네임 변경
		hdao.jjsModify(mvo);
		//동네 게시글 닉네임 변경
		hdao.cmModify(mvo);
		//동네 댓글 닉네임 변경
		hdao.cmCmtModify(mvo);
		//동네 대댓글 닉네임 변경
		hdao.cmReCmtModify(mvo);
		
		return isOk;
	}

	@Override
	public int proInsert(String email, List<FileVO> flist) {
		//기존 프로필 삭제
		int isOk = pdao.proDelete(email);
		if(flist.size() > 0) {
			for(FileVO fvo : flist) {
				fvo.setPrEmail(email);
				isOk = pdao.proInsert(fvo);
			}
		}
		return isOk;
	}

	@Override
	public FileVO getProfile(String email) {
		return pdao.getProfile(email);
	}

	@Override
	public int proDelete(String email) {
		return pdao.proDelete(email);
	}

	@Override
	public int memDelete(String email) {
		//중고, 알바, 업체 게시글 삭제
		int isDel = hdao.jjsDelete(email);
		//동네 게시글 삭제
		isDel = hdao.cmDelete(email);
		//권한 삭제
		isDel = hdao.amDelte(email);
		//멤버 삭제
		isDel = hdao.mbDelete(email);
		return isDel;
	}

}