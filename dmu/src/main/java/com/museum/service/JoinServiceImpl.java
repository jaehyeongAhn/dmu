package com.museum.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.museum.dao.DmuMemberDAO;
import com.museum.vo.DmuMemberVO;

@Service
public class JoinServiceImpl implements JoinService {
	
	@Autowired
	private DmuMemberDAO memberDao;
	
	//회원 가입
	@Override
	public int join(DmuMemberVO vo) {
		return memberDao.insert(vo);
	}
	
	//아이디 중복확인
	@Override
	public int idCheck(String mid) {
		return memberDao.idCheck(mid);
	}

}
