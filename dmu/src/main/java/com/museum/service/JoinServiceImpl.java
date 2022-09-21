package com.museum.service;

import com.museum.dao.DmuMemberDAO;
import com.museum.vo.DmuMemberVO;

public class JoinServiceImpl {
	//회원 가입
	public int join(DmuMemberVO vo) {
		DmuMemberDAO dao = new DmuMemberDAO();
		int result = dao.insert(vo);
		
		return result;
	}
	
	//아이디 중복확인
	public int idCheck(String did) {
		DmuMemberDAO dao = new DmuMemberDAO();
		int result = dao.idCheck(did);
		
		return result;
	}

}
