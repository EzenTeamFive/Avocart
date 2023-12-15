package com.avo.www.repository;

import com.avo.www.security.MemberVO;

public interface HmemberDAO {

	MemberVO getDeail(String email);

	String getPw(String email);
	
	//수정 관련
	int jjsModify(MemberVO mvo);
	
	int cmModify(MemberVO mvo);
	
	int cmCmtModify(MemberVO mvo);
	
	int cmReCmtModify(MemberVO mvo);

	int modifyPwEmpty(MemberVO mvo);

	int modify(MemberVO mvo);

	//탈퇴 관련
	int jjsDelete(String email);

	int cmDelete(String email);

	int amDelte(String email);

	int mbDelete(String email);	

}