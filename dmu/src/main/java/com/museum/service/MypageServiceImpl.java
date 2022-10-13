package com.museum.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.museum.dao.DmuMypageDAO;
import com.museum.vo.DmuMemberVO;

public class MypageServiceImpl implements MypageService {
	
	@Autowired
	private DmuMypageDAO mypageDao;
	
	//회원 정보 상세 조회
	@Override
	public DmuMemberVO memberContent(String mid) {
		return mypageDao.memberContent(mid);
	}
	
	//회원 탈퇴 신청
	@Override
	public int memberUnregister(String mid) {
		return mypageDao.memberUnregister(mid);
	}
}
