package com.museum.service;

import com.museum.dao.DmuMemberDAO;
import com.museum.vo.DmuMemberVO;

public class LoginServiceImpl implements LoginService{
	
	@Override
	public int emailCheckId(String email, String name) {
		DmuMemberDAO dao = new DmuMemberDAO();
		
		int result = dao.emailCheckId(email, name);
		
		return result;
	}
	
	//loginUpdate(DmuMemberVO vo) : 비밀번호 업데이트
	@Override
	public int loginUpdate(DmuMemberVO vo) {
		DmuMemberDAO dao = new DmuMemberDAO();
		int result = dao.login_update(vo);
		
		return result;
	}
	
	//비밀번호 찾기 페이지의 계정 존재 여부 확인
	@Override
	public int emailCheckPass(String email, String name, String did) {
		DmuMemberDAO dao = new DmuMemberDAO();
		int result = dao.emailCheckPass(email, name, did);
		
		return result;
	};

	//아이디 반환
	@Override
	public String findId(DmuMemberVO vo) {
		DmuMemberDAO dao = new DmuMemberDAO();
		String result = dao.selectId(vo);
		
		return result;
	}
	
	//로그인 체크
	@Override
	public int login(DmuMemberVO vo) {
		DmuMemberDAO dao = new DmuMemberDAO();
		int result = dao.login(vo);
		
		return result;
	}
}
