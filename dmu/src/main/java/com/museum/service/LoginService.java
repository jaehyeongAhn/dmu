package com.museum.service;

import com.museum.vo.DmuMemberVO;

public interface LoginService {

	/**
	 * emailCheck(email,name) : 이름 및 이메일 체크
	 */
	public int emailCheckId(String email, String name);
	
	//loginUpdate(DmuMemberVO vo) : 비밀번호 업데이트
	public int loginUpdate(DmuMemberVO vo);
	
	//비밀번호 찾기 페이지의 계정 존재 여부 확인
	public int emailCheckPass(String email, String name, String did);

	//아이디 반환
	public String findId(DmuMemberVO vo);
	
	//로그인 체크
	public int login(DmuMemberVO vo);
}
