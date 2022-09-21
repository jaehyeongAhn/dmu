package com.museum.service;

import com.museum.vo.DmuMemberVO;

public interface JoinService {
	//회원 가입
	public int join(DmuMemberVO vo);
	
	//아이디 중복확인
	public int idCheck(String did);

}
