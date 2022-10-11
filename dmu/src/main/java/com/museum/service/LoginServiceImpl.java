package com.museum.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.museum.dao.DmuMemberDAO;
import com.museum.vo.DmuMemberVO;
import com.museum.vo.DmuSessionVO;

@Service
public class LoginServiceImpl implements LoginService{
	
	@Autowired
	private DmuMemberDAO memberDao;
	
	@Override
	public int emailCheckId(String email, String name) {
		return memberDao.emailCheckId(email, name);
	}
	
	//loginUpdate(DmuMemberVO vo) : 비밀번호 업데이트
	@Override
	public int loginUpdate(DmuMemberVO vo) {
		return memberDao.login_update(vo);
	}
	
	//비밀번호 찾기 페이지의 계정 존재 여부 확인
	@Override
	public int emailCheckPass(String email, String name, String mid) {
		return memberDao.emailCheckPass(email, name, mid);
	};

	//아이디 반환
	@Override
	public String findId(DmuMemberVO vo) {
		return memberDao.selectId(vo);
	}
	
	//로그인 체크
	@Override
	public DmuSessionVO login(DmuMemberVO vo) {
		return memberDao.login(vo);
	}
}
